📦 TokoKita Mobile App (Pertemuan 10)
Aplikasi TokoKita adalah implementasi antarmuka pengguna (UI) mobile menggunakan Flutter. Proyek ini mencakup alur autentikasi pengguna dan manajemen data produk (CRUD UI) dengan kustomisasi nama pada AppBar.

Nama Mahasiswa (AppBar): Prima

📱 Struktur Fitur & Penjelasan Teknis Source Code
Berikut adalah rincian mendalam mengenai implementasi kode pada setiap halaman.

1. 🔑 Modul Autentikasi
1.1. Halaman Login (ui/login_page.dart)
Halaman ini menggunakan StatefulWidget karena perlu mengelola state loading dan input form.

GlobalKey<FormState> _formKey: Digunakan untuk memvalidasi seluruh input dalam widget Form sebelum proses submit.

TextEditingController: Variabel _emailTextboxController dan _passwordTextboxController digunakan untuk mengambil nilai teks dari input field.

Validasi Input:

Menggunakan properti validator pada TextFormField

Logika: Jika value!.isEmpty (kosong), maka pesan error dikembalikan

Fungsi _submit():

Memanggil _formKey.currentState!.validate()

Menggunakan Future.delayed selama 2 detik untuk mensimulasikan jeda request API (Loading State)

Navigasi: Menggunakan Navigator.push pada widget InkWell (teks Registrasi) untuk berpindah halaman tanpa menghapus halaman Login dari stack

1.2. Halaman Registrasi (ui/registrasi_page.dart)
Halaman ini memiliki validasi sisi klien yang lebih kompleks.

Validasi Regex (Email):

Menggunakan pola Pattern dan RegExp di dalam validator email

Tujuannya memastikan format email memiliki karakter '@' dan domain yang valid

Validasi Password & Konfirmasi:

Field konfirmasi membandingkan nilai inputnya (value) dengan nilai dari controller password utama (_passwordTextboxController.text)

Jika tidak cocok (!=), return pesan error "Konfirmasi Password tidak sama"

Fungsi _submit():

Serupa dengan Login, fungsi ini menyimpan state form (save()) dan mensimulasikan proses pendaftaran

Note: Pada implementasi nyata, setelah sukses akan memanggil Navigator.pop(context) untuk kembali ke Login

2. 🛒 Modul Manajemen Produk (Prima)
2.1. List Produk (ui/produk_page.dart)
Halaman utama yang menampilkan data dalam bentuk list.

AppBar Kustom: Properti title diisi statis dengan Text('List Produk Prima')

Widget ListView: Digunakan untuk menampilkan daftar produk yang bisa di-scroll

Navigasi Logout (PENTING):

Pada Drawer > ListTile Logout

Menggunakan Navigator.pushReplacement

Alasan: Fungsi ini menghapus halaman saat ini (ProdukPage) dari tumpukan (stack) navigasi dan menggantinya dengan LoginPage. Ini mencegah user kembali ke halaman produk dengan tombol "Back" setelah logout.

Interaksi Item: Setiap ItemProduk dibungkus dengan GestureDetector yang menangani event onTap untuk navigasi ke detail.

2.2. Form Produk (ui/produk_form.dart)
Satu halaman yang menangani dua kondisi: Tambah (Create) dan Ubah (Update).

Logika initState & isUpdate:

Saat halaman dimuat, fungsi ini mengecek parameter widget.produk

Jika widget.produk != null (Mode Edit):

Judul AppBar diubah menjadi "UBAH PRODUK PRIMA"

Tombol menjadi "UBAH"

Semua TextEditingController diisi nilai dari objek produk tersebut

Jika widget.produk == null (Mode Tambah):

Judul AppBar menjadi "TAMBAH PRODUK PRIMA"

Tombol "SIMPAN"

Form dibiarkan kosong

Input Harga: Menggunakan TextInputType.number pada TextFormField agar keyboard yang muncul khusus angka.

2.3. Detail Produk (ui/produk_detail.dart)
Halaman read-only yang menyediakan akses ke aksi Edit dan Delete.

Passing Data: Halaman ini menerima objek Produk melalui constructor

Display Data: Menggunakan interpolasi string (contoh: "${widget.produk!.namaProduk}") untuk menampilkan data di widget Text

Tombol Edit:

Menggunakan Navigator.push menuju ProdukForm

Penting: Objek produk dikirim sebagai parameter (produk: widget.produk), sehingga Form otomatis mendeteksi mode "Ubah"

Tombol Delete:

Menggunakan fungsi showDialog untuk memunculkan AlertDialog

Ini adalah praktik UX yang baik untuk mencegah penghapusan data yang tidak disengaja

🛠️ Instalasi & Menjalankan Aplikasi
Pastikan Flutter SDK sudah terinstall

Clone repository ini

Jalankan perintah di terminal:

flutter pub get
flutter run