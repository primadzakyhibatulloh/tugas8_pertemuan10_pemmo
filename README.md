# 📦 TokoKita Mobile App — Flutter UI (Pertemuan 10)

Aplikasi **TokoKita** adalah implementasi antarmuka dasar Flutter yang mencakup:
- 🔐 Modul Autentikasi (Login & Registrasi)
- 🛒 Modul Manajemen Produk  
Semua AppBar telah dikustomisasi dengan nama panggilan: **Prima**.

---

---

# 1️⃣ Modul Autentikasi

Mencakup halaman **Login** dan **Registrasi**, lengkap dengan validasi dan navigasi dasar.

---

## 1.1. Halaman Login  
📁 *File:* `ui/login_page.dart`  

Halaman pertama saat aplikasi dibuka.

### ✅ Penjelasan Source Code

### **AppBar Title**
```dart
appBar: AppBar(
  title: const Text("Login"),
),
Menampilkan judul halaman.


State Management
final _formKey = GlobalKey<FormState>();
bool _isLoading = false;
_formKey → validasi seluruh form
_isLoading → mengontrol tombol saat loading


Form Input
TextFormField(
  controller: _emailController,
  validator: (value) =>
      value!.isEmpty ? "Email wajib diisi" : null,
),
Validator memastikan field tidak boleh kosong.

Aksi Login
if (_formKey.currentState!.validate()) {
  setState(() => _isLoading = true);
  await Future.delayed(const Duration(seconds: 2));
}


Simulasi proses login selama 2 detik.

Navigasi Registrasi
InkWell(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistrasiPage()),
    );
  },
),
Memindahkan pengguna ke halaman registrasi.

1.2. Halaman Registrasi

📁 File: ui/registrasi_page.dart

Digunakan untuk mendaftarkan pengguna baru.

✅ Penjelasan Source Code
Validasi Nama
validator: (value) =>
  value!.length < 3 ? "Minimal 3 karakter" : null,

Validasi Email (Regex)
validator: (value) {
  String pattern =
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  return !RegExp(pattern).hasMatch(value!)
      ? "Format email tidak valid"
      : null;
},

Validasi Password & Konfirmasi
validator: (value) =>
  value!.length < 6 ? "Minimal 6 karakter" : null;


Konfirmasi password:

validator: (value) =>
  value != _passwordTextboxController.text
      ? "Password tidak sama"
      : null;

Aksi Registrasi
if (_formKey.currentState!.validate()) {
  Navigator.pop(context);
}


Setelah registrasi berhasil → kembali ke Login.