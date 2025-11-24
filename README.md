# 📦 TokoKita Mobile App (Pertemuan 10)

Aplikasi **TokoKita** adalah proyek Flutter yang berfokus pada implementasi UI dengan fitur autentikasi dan manajemen produk (CRUD).  
Nama yang tampil pada AppBar adalah **Prima**.

---

## ⭐ Badge Proyek
![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue?style=flat-square&logo=flutter)
![Dart](https://img.shields.io/badge/Dart-Language-blue?style=flat-square&logo=dart)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)

---

# 📚 Struktur Fitur & Penjelasan Source Code

Berikut penjelasan fungsi setiap modul dan halaman.

---

# 1. 🔑 Modul Autentikasi

## 1.1 Login (`ui/login_page.dart`)

### Menggunakan StatefulWidget  
Karena halaman ini membutuhkan:
- State untuk loading
- State untuk input form

### Komponen Utama
- **GlobalKey<FormState> _formKey**  
  Untuk memvalidasi seluruh Form sekaligus.

- **TextEditingController**  
  - `_emailTextboxController`  
  - `_passwordTextboxController`  
  Digunakan untuk mengambil nilai input.

### Validasi Input  
Dilakukan melalui `validator` pada TextFormField:

```dart
if (value!.isEmpty) return "Tidak boleh kosong";
Fungsi _submit()
Memanggil _formKey.currentState!.validate()

Simulasi API delay menggunakan Future.delayed(Duration(seconds: 2))

Navigasi ke halaman Registrasi menggunakan:

dart
Copy code
Navigator.push(context, MaterialPageRoute(builder: (_) => RegistrasiPage()));
1.2 Registrasi (ui/registrasi_page.dart)
Validasi Email (Regex)
Regex memastikan format email mengandung @ + domain yang valid.

Validasi Password dan Konfirmasi
Konfirmasi password dibandingkan dengan:

dart
Copy code
_passwordTextboxController.text
Jika tidak sama → menampilkan error.

Fungsi _submit()
Menjalankan validasi + save()

Simulasi proses pendaftaran

Pada implementasi sebenarnya, diarahkan kembali ke Login menggunakan:

dart
Copy code
Navigator.pop(context);
2. 🛒 Modul Manajemen Produk
2.1 List Produk (ui/produk_page.dart)
AppBar
mathematica
Copy code
List Produk Prima
ListView
Menampilkan data produk secara scroll.

Logout (Penting)
Menggunakan Navigator.pushReplacement() agar halaman Produk hilang dari stack sehingga user tidak bisa kembali dengan tombol Back.

Interaksi Item
Item dibungkus GestureDetector untuk menavigasi ke detail produk.

2.2 Form Produk (ui/produk_form.dart)
Satu halaman digunakan untuk:

Tambah Produk

Edit Produk

Logika Tambah vs Update
Menggunakan pengecekan:

dart
Copy code
if (widget.produk != null)
Mode Update
AppBar: UBAH PRODUK PRIMA

Tombol: UBAH

Controller otomatis terisi data

Mode Tambah
AppBar: TAMBAH PRODUK PRIMA

Tombol: SIMPAN

Form kosong

Input Harga
Menggunakan keyboard angka:

dart
Copy code
keyboardType: TextInputType.number
2.3 Detail Produk (ui/produk_detail.dart)
Passing Data
Produk dikirim melalui constructor.

Display
Menggunakan interpolasi string seperti:

dart
Copy code
"${widget.produk!.namaProduk}"
Tombol Edit
Mengirim produk kembali ke Form:

dart
Copy code
ProdukForm(produk: widget.produk)
Tombol Hapus
Menggunakan showDialog() agar user memiliki konfirmasi terlebih dahulu sebelum menghapus data (UX yang aman).

🛠️ Instalasi
Pastikan Flutter sudah terinstall.

Jalankan:
sh
Copy code
flutter pub get
flutter run