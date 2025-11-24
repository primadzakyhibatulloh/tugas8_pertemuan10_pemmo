# TokoKita Mobile App (Pertemuan 10)

Aplikasi TokoKita adalah proyek Flutter yang berfokus pada implementasi UI mobile dengan fitur autentikasi dan manajemen produk (CRUD).  
Nama yang digunakan pada AppBar: **Prima**

---

## Modul Autentikasi

### Login (ui/login_page.dart)

**Alasan menggunakan StatefulWidget**
- Membutuhkan state untuk loading.
- Membutuhkan state untuk input form.

**Komponen Utama**
- GlobalKey<FormState> untuk memvalidasi seluruh Form.
- TextEditingController:
  - _emailTextboxController  
  - _passwordTextboxController  
  Digunakan untuk mengambil nilai input.

**Validasi Input**
Dilakukan melalui validator pada TextFormField:

```dart
if (value!.isEmpty) {
  return "Tidak boleh kosong";
}

Fungsi _submit()

Menjalankan validasi dengan _formKey.currentState!.validate().

Menjalankan Future.delayed untuk simulasi loading.

Navigasi ke halaman Registrasi menggunakan:

Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => RegistrasiPage(),
  ),
);

Registrasi (ui/registrasi_page.dart)

Validasi Email (Regex)
Memastikan format email mengandung karakter @ dan domain yang valid.

Validasi Password dan Konfirmasi
Password konfirmasi dibandingkan dengan nilai controller:

_passwordTextboxController.text


Jika tidak sama → menampilkan pesan error.

Fungsi _submit()

Menjalankan validasi dan save().

Simulasi proses pendaftaran.

Pada implementasi sebenarnya, diarahkan kembali ke Login:

Navigator.pop(context);

Modul Manajemen Produk
List Produk (ui/produk_page.dart)

AppBar
Teks statis: List Produk Prima.

ListView
Menampilkan daftar produk secara scroll.

Logout
Menggunakan Navigator.pushReplacement() agar halaman Produk tidak bisa kembali dengan tombol Back.

Interaksi Item
Item dibungkus GestureDetector untuk membuka halaman detail.

Form Produk (ui/produk_form.dart)

Halaman ini digunakan untuk Tambah dan Edit produk.

Logika Tambah vs Edit
Jika widget.produk != null → Mode Edit
Jika widget.produk == null → Mode Tambah

Mode Edit

AppBar: UBAH PRODUK PRIMA

Tombol: UBAH

Controller terisi data produk

Mode Tambah

AppBar: TAMBAH PRODUK PRIMA

Tombol: SIMPAN

Form kosong

Input Harga
Menggunakan keyboard angka:

keyboardType: TextInputType.number

Detail Produk (ui/produk_detail.dart)

Passing Data
Data produk dikirim melalui constructor.

Display Data
Menggunakan interpolasi string:

"${widget.produk!.namaProduk}"


Tombol Edit
Mengirim objek produk ke Form:

ProdukForm(produk: widget.produk)


Tombol Delete
Menggunakan AlertDialog untuk konfirmasi penghapusan agar aman.

Instalasi

Pastikan Flutter sudah terinstall.

Jalankan perintah berikut:

flutter pub get
flutter run