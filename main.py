# import module flask ke dalam project
import os
import uuid
from flask import Flask
from flask import render_template, request, redirect, url_for, flash, session
from flask_mysqldb import MySQL
from werkzeug.security import check_password_hash, generate_password_hash
from werkzeug.utils import secure_filename
from functools import wraps
from flask import session, redirect, url_for, flash
from MySQLdb.cursors import DictCursor
from collections import defaultdict

# membuat variabel sebagai instance flask
app = Flask(__name__)

# koneksi
app.secret_key = 'mauwisuda'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'prediksi_rating'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'  # Ini yang benar
mysql = MySQL(app)


def role_required(allowed_roles):
    def wrapper(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if 'role' not in session or session['role'] not in allowed_roles:
                flash("Anda tidak memiliki akses ke halaman ini.", "danger")
                return redirect(url_for('index'))  # arahkan ke index jika tidak punya akses
            return f(*args, **kwargs)
        return decorated_function
    return wrapper

def log_aktivitas(id_admin, aktivitas, id_produk=None, deskripsi=None):
    id_aktivitas = str(uuid.uuid4())  # Generate UUID untuk primary key

    if id_produk is None or id_produk == '':
        print(f"Warning: ID Produk kosong untuk aktivitas: {aktivitas}")  # Debug log

    cursor = mysql.connection.cursor()
    cursor.execute('''
        INSERT INTO log_aktivitas (id_aktivitas, id_admin, aktivitas, id_produk, deskripsi, created_at)
        VALUES (%s, %s, %s, %s, %s, NOW())
    ''', (id_aktivitas, id_admin, aktivitas, id_produk or None, deskripsi))
    mysql.connection.commit()
    cursor.close()

# Tentukan folder tempat upload
UPLOAD_FOLDER = 'static/uploads'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# membuat routing
@app.route('/')
def index():
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    cursor = mysql.connection.cursor()

    cursor.execute("SELECT COUNT(*) AS total FROM produk")
    total_produk = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM admin")
    total_admin = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(DISTINCT id_brand) AS total FROM produk")
    total_brand = cursor.fetchone()['total']

    cursor.execute("SELECT COUNT(*) AS total FROM ulasan")
    total_ulasan = cursor.fetchone()['total']
    
    # Query jumlah ulasan berdasarkan status_rating
    cursor.execute("""
        SELECT status_rating, COUNT(*) AS jumlah
        FROM ulasan
        GROUP BY status_rating
    """)
    pie_data_raw = cursor.fetchall()

    # Ubah tuple ke list of dict
    pie_data = [{'status_rating': row['status_rating'], 'jumlah': row['jumlah']} for row in pie_data_raw]

    # Urutan custom (opsional)
    order = {'Manual': 0, 'Model': 1}
    pie_data.sort(key=lambda x: order.get(x['status_rating'], 99))

    # Siapkan data untuk chart
    pie_labels = [row['status_rating'] for row in pie_data]
    pie_counts = [row['jumlah'] for row in pie_data]

    # Query jumlah ulasan berdasarkan status_rating
    cursor.execute("""
        SELECT SUM(CASE WHEN u.rating_sentimen = 1 THEN 1 ELSE 0 END) AS rating_1,
        SUM(CASE WHEN u.rating_sentimen = 2 THEN 1 ELSE 0 END) AS rating_2,
        SUM(CASE WHEN u.rating_sentimen = 3 THEN 1 ELSE 0 END) AS rating_3,
        SUM(CASE WHEN u.rating_sentimen = 4 THEN 1 ELSE 0 END) AS rating_4,
        SUM(CASE WHEN u.rating_sentimen = 5 THEN 1 ELSE 0 END) AS rating_5 
        FROM ulasan u
    """)
    bar_data = cursor.fetchone()
    
    # Persiapkan data untuk chart
    bar_labels = ['1', '2', '3', '4', '5']
    bar_counts = [
        int(bar_data['rating_1']),
        int(bar_data['rating_2']),
        int(bar_data['rating_3']),
        int(bar_data['rating_4']),
        int(bar_data['rating_5'])
    ]
    cursor.close()

    return render_template('index.html',
                           show_search=False,
                           total_produk=total_produk,
                           total_admin=total_admin,
                           total_brand=total_brand,
                           total_ulasan=total_ulasan,  
                           pie_labels=pie_labels,
                           pie_counts=pie_counts,
                           bar_labels=bar_labels, 
                           bar_counts=bar_counts)

@app.route('/login/', methods=('GET', 'POST'))
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        # cek data email
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM admin WHERE email=%s', (email, ))
        akun = cursor.fetchone()
        
        if akun is None:
            flash('Login Gagal, Cek Email Anda', 'danger')
        elif not check_password_hash(akun['password'], password):
            flash('Login Gagal, Cek Password Anda', 'danger')
        else:
            session['loggedin'] = True
            session['id_admin'] = akun['id_admin']
            session['username'] = akun['username']
            session['role'] = akun['role']
            return redirect(url_for('index'))
    return render_template('login.html')

# logout
@app.route('/logout')
def logout():
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    session.pop('loggedin', None)
    session.pop('username', None)
    return redirect(url_for('login'))

# halaman kelola data produk
@app.route('/produk')
def produk():
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    search_query = request.args.get('search', '')  # Mendapatkan kata kunci pencarian
    page = request.args.get('page', 1, type=int)
    per_page = 5
    offset = (page - 1) * per_page
    
    cursor = mysql.connection.cursor()
    
    if search_query:
        # Jika ada pencarian, filter berdasarkan nama produk
        like_query = '%' + search_query + '%'
        cursor.execute("""
            SELECT COUNT(*)
            FROM produk p
            LEFT JOIN jenis_produk jp ON p.id_jenis = jp.id_jenis
            LEFT JOIN brand b ON p.id_brand = b.id_brand
            WHERE p.nama_produk LIKE %s OR jp.nama_jenis LIKE %s OR b.nama_brand LIKE %s
        """, (like_query, like_query, like_query))

    else:
        # Jika tidak ada pencarian, hitung semua produk
        cursor.execute("""
            SELECT COUNT(*) 
            FROM produk p
            LEFT JOIN jenis_produk jp ON p.id_jenis = jp.id_jenis
            LEFT JOIN brand b ON p.id_brand = b.id_brand
        """)
        
    total_produk = cursor.fetchone()['COUNT(*)']
    
    if search_query:
        # Jika ada pencarian, ambil produk yang sesuai dengan kata kunci
        cursor.execute('''
            SELECT p.*, jp.nama_jenis, b.nama_brand, COALESCE(ROUND(AVG(u.rating_sentimen), 1), 0) AS rata_rata_rating, COALESCE(COUNT(u.id_ulasan), 0) AS jumlah_ulasan
            FROM produk p
            LEFT JOIN jenis_produk jp ON p.id_jenis = jp.id_jenis
            LEFT JOIN brand b ON p.id_brand = b.id_brand
            LEFT JOIN ulasan u ON u.id_produk = p.id_produk
            WHERE p.nama_produk LIKE %s OR jp.nama_jenis LIKE %s OR b.nama_brand LIKE %s
            GROUP BY p.id_produk
            ORDER BY p.updated_at DESC
            LIMIT %s OFFSET %s
            ''', (like_query, like_query, like_query, per_page, offset))
    else:
        # Jika tidak ada pencarian, ambil semua produk
        cursor.execute('''
            SELECT p.*, jp.nama_jenis, b.nama_brand, COALESCE(ROUND(AVG(u.rating_sentimen), 1), 0) AS rata_rata_rating, COALESCE(COUNT(u.id_ulasan), 0) AS jumlah_ulasan
            FROM produk p
            LEFT JOIN jenis_produk jp ON p.id_jenis = jp.id_jenis
            LEFT JOIN brand b ON p.id_brand = b.id_brand
            LEFT JOIN ulasan u ON u.id_produk = p.id_produk
            GROUP BY p.id_produk
            ORDER BY p.updated_at DESC
            LIMIT %s OFFSET %s
        ''', (per_page, offset))
    
    produk = cursor.fetchall()
    
    cursor.close()
    
    total_pages = (total_produk + per_page - 1) // per_page

    return render_template('produk.html', show_search=True, produk=produk, page=page, total_pages=total_pages, search=search_query)

@app.route('/produk/tambah_produk', methods=['GET', 'POST'])
def tambah_produk():
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    # Ambil semua jenis produk dari tabel jenis_produk untuk dropdown
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM jenis_produk")
    jenis_produk_list = cursor.fetchall()
    cursor.close()
    
    # Ambil semua brand produk dari tabel brand untuk dropdown
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM brand")
    brand_produk_list = cursor.fetchall()
    cursor.close()
    
    if request.method == 'POST':
        id_jenis = request.form['id_jenis']
        id_brand = request.form['id_brand']
        nama_produk = request.form['nama_produk']
        harga = request.form['harga']
        deskripsi = request.form['deskripsi']
        # Ambil file dari input
        if 'foto' not in request.files:
            flash('Tidak ada file foto!', 'danger')
            return redirect(request.url)

        foto = request.files['foto']

        if foto.filename == '':
            flash('File belum dipilih!', 'danger')
            return redirect(request.url)

        # Simpan file ke folder static/uploads
        filename = secure_filename(foto.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        foto.save(filepath)

        # Simpan nama file ke database
        path_foto_produk = f'uploads/{filename}'

        # Simpan ke database
        cursor = mysql.connection.cursor()
        id_produk = str(uuid.uuid4())  # Buat UUID-nya sendiri
        cursor.execute('''
            INSERT INTO produk (id_produk, nama_produk, id_brand, id_jenis, deskripsi, harga, rating_total, path_foto_produk, created_at, updated_at)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, NOW(), NOW())
        ''', (id_produk, nama_produk, id_brand, id_jenis, deskripsi, harga, 0, path_foto_produk))
        mysql.connection.commit()

        flash('Produk berhasil ditambahkan!', 'success')
        
        log_aktivitas(session['id_admin'], 'Tambah Produk', id_produk=id_produk, deskripsi=f'Menambahkan Produk: {nama_produk}')

        return redirect(url_for('produk'))
    return render_template('tambah_produk.html', jenis_produk=jenis_produk_list, brand_produk=brand_produk_list)

@app.route('/produk/edit/<string:id_produk>', methods=['GET', 'POST'])
def edit_produk(id_produk):
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    # Ambil data produk berdasarkan id_produk
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM produk WHERE id_produk = %s", (id_produk,))
    produk = cursor.fetchone()  # Ambil satu data produk berdasarkan ID
    cursor.close()

    if produk is None:
        flash('Produk tidak ditemukan!', 'danger')
        return redirect(url_for('produk'))

    # Ambil semua jenis produk dari tabel jenis_produk untuk dropdown
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM jenis_produk")
    jenis_produk_list = cursor.fetchall()
    cursor.close()
    
    # Ambil semua brand produk dari tabel brand_produk untuk dropdown
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM brand")
    brand_produk_list = cursor.fetchall()
    cursor.close()
    
    if request.method == 'POST':
        id_jenis = request.form['id_jenis']
        id_brand = request.form['id_brand']
        # Ambil data yang diupdate
        nama_produk = request.form['nama_produk']
        harga = request.form['harga']
        deskripsi = request.form['deskripsi']
        foto_baru = request.files['foto']

        # Jika ada file foto baru, simpan foto baru dan path
        if foto_baru.filename != '':
            # Simpan file ke folder static/uploads
            filename = secure_filename(foto_baru.filename)
            filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            foto_baru.save(filepath)
            path_foto_produk = f'uploads/{filename}'
        else:
            path_foto_produk = produk['path_foto_produk']  # Jika tidak ada foto baru, gunakan foto lama

        # Update data produk di database
        cursor = mysql.connection.cursor()
        cursor.execute(''' 
            UPDATE produk
            SET nama_produk = %s, id_brand = %s, id_jenis = %s, deskripsi = %s, harga = %s, path_foto_produk = %s, updated_at = NOW()
            WHERE id_produk = %s
        ''', (nama_produk, id_brand, id_jenis, deskripsi, harga, path_foto_produk, id_produk))
        mysql.connection.commit()
        cursor.close()

        flash('Produk berhasil diperbarui!', 'success')
        log_aktivitas(session['id_admin'], 'Edit Produk', id_produk=id_produk, deskripsi=f'Edit Produk: {nama_produk}')
        return redirect(url_for('produk'))

    # Render form edit dengan data produk yang sudah ada
    return render_template('edit_produk.html', produk=produk, jenis_produk=jenis_produk_list, brand_produk=brand_produk_list)

# hapus produk
@app.route('/produk/hapus/<string:id_produk>', methods=['POST'])
def hapus_produk(id_produk):
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    conn = mysql.connection
    cursor = conn.cursor()
    cursor.execute('SELECT path_foto_produk FROM produk WHERE id_produk = %s', (id_produk,))
    gambar = cursor.fetchone()
    
    if gambar:
        # Hapus gambar dari folder static/uploads
        path = os.path.join('static/uploads', gambar['path_foto_produk'])
        if os.path.exists(path):
            os.remove(path)
    
    cursor.execute('DELETE FROM produk WHERE id_produk = %s', (id_produk,))
    conn.commit()
    cursor.close()
        
    flash('Produk berhasil dihapus!', 'success')
    return redirect(url_for('produk'))
   
@app.route('/petugas')
@role_required(['superadmin'])  # hanya superadmin
def petugas():
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    search_query = request.args.get('search', '')
    
    page = request.args.get('page', 1, type=int)
    per_page = 5
    offset = (page - 1) * per_page
    
    cursor = mysql.connection.cursor()
    
    if search_query:
        like_query = '%' + search_query + '%'
        # Hitung total hasil pencarian
        cursor.execute("""
            SELECT COUNT(*) FROM admin 
            WHERE username LIKE %s OR email LIKE %s OR nama_lengkap LIKE %s OR role LIKE %s
        """, (like_query, like_query, like_query, like_query))
        total_akun = cursor.fetchone()['COUNT(*)']
        
        # Ambil data sesuai pencarian
        cursor.execute("""
            SELECT * FROM admin 
            WHERE username LIKE %s OR email LIKE %s OR nama_lengkap LIKE %s OR role LIKE %s
            LIMIT %s OFFSET %s
        """, (like_query, like_query, like_query, like_query, per_page, offset))
    else:
        # Total seluruh data
        cursor.execute("SELECT COUNT(*) FROM admin")
        total_akun = cursor.fetchone()['COUNT(*)']
        
        # Ambil data normal (tanpa pencarian)
        cursor.execute("SELECT * FROM admin LIMIT %s OFFSET %s", (per_page, offset))
    
    petugas = cursor.fetchall()
    cursor.close()
    
    total_pages = (total_akun + per_page - 1) // per_page
    
    return render_template('petugas.html', show_search=True, petugas=petugas, page=page, total_pages=total_pages, search=search_query)


# halaman buat akun petugas
@app.route('/petugas/buat_akun_petugas/', methods=('GET', 'POST'))
@role_required(['superadmin'])  # hanya superadmin
def buat_akun_petugas():
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        nama_lengkap = request.form['nama_lengkap']
        role = request.form['role']
        
        # Validasi password minimal 6 karakter
        if len(password) < 6:
            flash('Password minimal 6 karakter!', 'danger')
            return render_template('buat_akun_petugas.html')

        # cek username atau email
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM admin  WHERE username=%s OR email=%s', (username, email, ))
        akun = cursor.fetchone()
        
        if akun is None:
            cursor.execute('''INSERT INTO admin (id_admin, username, password, email, nama_lengkap, role, created_at, updated_at) VALUES (UUID(), %s, %s, %s, %s, %s, NOW(), NOW())''', (username, generate_password_hash(password), email, nama_lengkap, role))
            mysql.connection.commit()
            flash('Akun Petugas Berhasil Dibuat', 'success')
            return redirect(url_for('petugas'))
        else:
            flash('Username atau email sudah terdaftar.', 'danger')
    return render_template('buat_akun_petugas.html')

# edit data petugas
@app.route('/petugas/edit_data_petugas/<string:id_petugas>', methods=['GET', 'POST'])
@role_required(['superadmin'])  # hanya superadmin
def edit_data_petugas(id_petugas):
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    # Ambil data produk berdasarkan id_petugas
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM admin WHERE id_admin = %s", (id_petugas,))
    petugas = cursor.fetchone()  # Ambil satu data produk berdasarkan ID
    cursor.close()

    if petugas is None:
        flash('Akun tidak ditemukan!', 'danger')
        return redirect(url_for('petugas'))

    if request.method == 'POST':
        # Ambil data yang diupdate
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        nama_lengkap = request.form['nama_lengkap']
        role = request.form['role']
        
        # Cek username/email duplikat kecuali dirinya sendiri
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM admin WHERE (username=%s OR email=%s) AND id_admin != %s', (username, email, id_petugas))
        akun = cursor.fetchone()
        
        if akun:
            flash('Username atau email sudah digunakan!', 'danger')
            return render_template('edit_petugas.html', petugas=petugas)
        
        # Kalau ada password baru, hash. Kalau tidak, pakai password lama
        if password:
            if len(password) < 6:
                flash('Password minimal 6 karakter!', 'danger')
                return render_template('edit_petugas.html', petugas=petugas)
            password_hashed = generate_password_hash(password)
        else:
            password_hashed = petugas['password']
        
        # Update data petugas di database
        cursor.execute('''
                       UPDATE admin
                       SET username = %s,
                       password = %s,
                       email = %s,
                       nama_lengkap = %s,
                       role = %s,
                       updated_at = NOW()
                       WHERE id_admin = %s
                       ''', (username, password_hashed, email, nama_lengkap, role, id_petugas))
        mysql.connection.commit()
        flash('Data Berhasil Disimpan', 'success')
        return redirect(url_for('petugas'))

    # Render form edit dengan data produk yang sudah ada
    return render_template('edit_petugas.html', petugas=petugas)

# hapus akun petugas
@app.route('/petugas/hapus/<string:id_petugas>', methods=['POST'])
@role_required(['superadmin'])  # hanya superadmin
def hapus_akun(id_petugas):
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    conn = mysql.connection
    cursor = conn.cursor()
    
    cursor.execute('DELETE FROM admin WHERE id_admin = %s', (id_petugas,))
    conn.commit()
    cursor.close()
    conn.close()
    
    flash('Akun berhasil dihapus!', 'success')
    return redirect(url_for('petugas'))

# Setting profile route
@app.route('/profile', methods=['GET', 'POST'])
def setting_profile():
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))

    cursor = mysql.connection.cursor()

    # Ambil username sekarang dari session
    username_session = session['username']

    if request.method == 'POST':
        # Ambil data dari form
        nama_lengkap = request.form.get('nama_lengkap')
        email = request.form.get('email')
        username_baru = request.form.get('username')
        old_password = request.form.get('old_password')
        new_password = request.form.get('new_password')
        
        # Ambil data akun dari database
        cursor.execute('SELECT * FROM admin WHERE username = %s', (username_session,))
        akun = cursor.fetchone()

        if akun is None:
            flash('Akun tidak ditemukan!', 'danger')
            return redirect(url_for('logout'))

        # Cek apakah password lama benar
        password_db = akun['password']  # Ambil password yang ada di database
        if not check_password_hash(password_db, old_password):
            flash('Password lama salah!', 'danger')
            return redirect(url_for('setting_profile'))
        
        # Cek apakah username atau email baru sudah digunakan user lain
        cursor.execute("""
            SELECT * FROM admin 
            WHERE (username = %s OR email = %s) AND username != %s
        """, (username_baru, email, username_session))
        cek_duplikat = cursor.fetchone()

        if cek_duplikat:
            flash('Username atau email sudah digunakan oleh akun lain!', 'danger')
            return redirect(url_for('setting_profile'))

        # Update data
        if new_password:  # Kalau password baru diisi
            if len(new_password) < 6:
                flash('Password minimal 6 karakter.', 'danger')
                return redirect(url_for('setting_profile'))
            password_update = generate_password_hash(new_password)
            cursor.execute("""
                UPDATE admin
                SET nama_lengkap = %s, email = %s, username = %s, password = %s, updated_at = NOW()
                WHERE username = %s
            """, (nama_lengkap, email, username_baru, password_update, username_session))
        else:  # Kalau password kosong, update tanpa ubah password
            cursor.execute("""
                UPDATE admin
                SET nama_lengkap = %s, email = %s, username = %s, updated_at = NOW()
                WHERE username = %s
            """, (nama_lengkap, email, username_baru, username_session))

        mysql.connection.commit()

        # Update session username kalau berubah
        session['username'] = username_baru

        flash('Profile berhasil diperbarui!', 'success')
        return redirect(url_for('setting_profile'))

    else:
        # Method GET, tampilkan data user
        cursor.execute('SELECT * FROM admin WHERE username = %s', (username_session,))
        akun = cursor.fetchone()
        cursor.close()

        if akun is None:
            flash('Akun tidak ditemukan!', 'danger')
            return redirect(url_for('logout'))

        return render_template('setting.html', show_search=False, akun=akun)

# halaman kelola data aktivitas
@app.route('/aktivitas')
@role_required(['superadmin'])  # hanya superadmin
def aktivitas():
    if 'loggedin' not in session:
        flash('Harap Login Dulu', 'danger')
        return redirect(url_for('login'))
    
    search_query = request.args.get('search', '')  # Mendapatkan kata kunci pencarian
    
    page = request.args.get('page', 1, type=int)
    per_page = 5
    offset = (page - 1) * per_page
    
    cursor = mysql.connection.cursor()
    
    # Hitung total data berdasarkan pencarian
    if search_query:
        cursor.execute("""
            SELECT COUNT(*) 
            FROM log_aktivitas la
            LEFT JOIN admin a ON la.id_admin = a.id_admin
            LEFT JOIN produk p ON la.id_produk = p.id_produk
            WHERE a.nama_lengkap LIKE %s OR p.nama_produk LIKE %s
        """, ('%' + search_query + '%', '%' + search_query + '%'))
    else:
        cursor.execute("SELECT COUNT(*) as total FROM log_aktivitas")
        
    total_logs = cursor.fetchone()['total']
    
    # Ambil data log aktivitas dengan filter dan pagination
    if search_query:
        cursor.execute("""
            SELECT 
                la.aktivitas, 
                p.nama_produk, 
                a.nama_lengkap, 
                la.created_at, 
                la.deskripsi
            FROM log_aktivitas la
            LEFT JOIN admin a ON la.id_admin = a.id_admin
            LEFT JOIN produk p ON la.id_produk = p.id_produk
            WHERE a.nama_lengkap LIKE %s OR p.nama_produk LIKE %s
            ORDER BY la.created_at DESC
            LIMIT %s OFFSET %s
        """, ('%' + search_query + '%', '%' + search_query + '%', per_page, offset))
    else:
        cursor.execute("""
            SELECT 
                la.aktivitas, 
                p.nama_produk, 
                a.nama_lengkap, 
                la.created_at, 
                la.deskripsi
            FROM log_aktivitas la
            LEFT JOIN admin a ON la.id_admin = a.id_admin
            LEFT JOIN produk p ON la.id_produk = p.id_produk
            ORDER BY la.created_at DESC
            LIMIT %s OFFSET %s
        """, (per_page, offset))
    
    logs = cursor.fetchall()
    
    # --- CHART DATA ---

    cursor.execute("""
        SELECT 
            a.nama_lengkap,
            la.aktivitas,
            COUNT(*) AS jumlah
        FROM log_aktivitas la
        JOIN admin a ON la.id_admin = a.id_admin
        WHERE la.aktivitas IN ('Tambah Produk', 'Edit Produk')
        GROUP BY a.nama_lengkap, la.aktivitas
    """)
    chart_data_raw = cursor.fetchall()
    cursor.close()

    # Struktur data chart
    chart_data = defaultdict(lambda: {'Tambah Produk': 0, 'Edit Produk': 0})
    for row in chart_data_raw:
        nama_admin = row['nama_lengkap']
        aktivitas = row['aktivitas']
        jumlah = row['jumlah']
        chart_data[nama_admin][aktivitas] = jumlah

    # Debug print to console
    print("=== DEBUG Chart Data ===")
    print(dict(chart_data))

    # Convert to list for Chart.js
    labels = list(chart_data.keys())
    tambah_counts = [chart_data[nama]['Tambah Produk'] for nama in labels]
    edit_counts = [chart_data[nama]['Edit Produk'] for nama in labels]
    
    total_pages = (total_logs + per_page - 1) // per_page

    return render_template('aktivitas.html', show_search=True, logs=logs, labels=labels, tambah_counts=tambah_counts, edit_counts=edit_counts, page=page, total_pages=total_pages,search=search_query)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)


