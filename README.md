# 📦 TokoKita Mobile App  
**Proyek UI Dasar Flutter – Pertemuan 10**  
**Nama Panggilan pada AppBar: _Prima_**

Aplikasi **TokoKita** merupakan implementasi antarmuka pengguna (UI) menggunakan Flutter.  
Proyek ini berfokus pada modul **Autentikasi** dan **Manajemen Produk**, dengan seluruh AppBar dikustomisasi menggunakan nama **Prima**.

---

# 🔑 1. Modul Autentikasi  
Mencakup halaman **Login** dan **Registrasi**, dilengkapi validasi dan navigasi dasar.

---

## 1.1. Halaman Login  
_File: `ui/login_page.dart`_

Halaman pertama saat aplikasi dibuka.

### 🧩 Penjelasan Source Code

#### **AppBar Title**
```dart
appBar: AppBar(
  title: const Text("Login"),
),


State Management
final _formKey = GlobalKey<FormState>();
bool _isLoading = false;

_formKey → validasi seluruh form
_isLoading → mengontrol tombol saat loading

Form Input
TextFormField(
  controller: _emailController,
  validator: (value) => value!.isEmpty ? "Email wajib diisi" : null,
)

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
      MaterialPageRoute(builder: (_) => RegistrasiPage()),
    );
  },
)


Klik teks “Registrasi” → pindah ke halaman registrasi.

1.2. Halaman Registrasi

File: ui/registrasi_page.dart

Digunakan untuk membuat akun baru.

🧩 Penjelasan Source Code
AppBar Title
AppBar(title: const Text("Registrasi"))

Validasi Nama
validator: (value) {
  if (value!.length < 3) return "Nama minimal 3 karakter";
  return null;
},

Validasi Email
validator: (value) {
  String pattern = r"...regex email...";
  if (!RegExp(pattern).hasMatch(value!)) return "Format email tidak valid";
  return null;
},

Validasi Password
if (value!.length < 6) return "Minimal 6 karakter";


Konfirmasi password harus sama dengan password utama.

Aksi Registrasi
if (_formKey.currentState!.validate()) {
  await Future.delayed(const Duration(seconds: 2));
  Navigator.pop(context); // kembali ke login
}

🛒 2. Modul Manajemen Produk (Prima)

Modul inti aplikasi. Semua AppBar menggunakan nama Prima.

2.1. List Produk

File: ui/produk_page.dart

Menampilkan daftar produk dalam bentuk ListView.

🧩 Penjelasan Source Code
AppBar Title
AppBar(
  title: const Text("List Produk Prima"),
)

Tombol Tambah Produk
GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProdukForm()),
    );
  },
  child: const Icon(Icons.add),
)


Menavigasi ke form Tambah Produk.

Fitur Logout
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (_) => LoginPage()),
);


Menghapus halaman dari stack → tidak bisa kembali ke produk setelah logout.

Menampilkan Data Produk
ItemProduk(
  produk: produkList[index],
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProdukDetail(produk)),
    );
  },
)

2.2. Form Produk (Tambah & Ubah)

File: ui/produk_form.dart

Digunakan untuk membuat maupun mengubah produk.

🧩 Penjelasan Source Code
Logika Mode Tambah/Ubah
bool isUpdate() => widget.produk != null;


Jika widget.produk != null → mode Ubah.

Controller otomatis terisi data lama saat mode Ubah.

AppBar Title Dinamis
AppBar(title: Text(judul))


Judul:

"TAMBAH PRODUK PRIMA"

"UBAH PRODUK PRIMA"

Input Fields + Validator
validator: (value) => value!.isEmpty ? "Wajib diisi" : null,


Harga menggunakan:

keyboardType: TextInputType.number

Tombol Submit
ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      // proses Create/Update API
    }
  },
  child: Text(tombolSubmit),
)

2.3. Detail Produk

File: ui/produk_detail.dart

Menampilkan detail lengkap satu produk dengan opsi Edit & Hapus.

🧩 Penjelasan Source Code
AppBar Title
AppBar(title: const Text("Detail Produk Prima"))

Tampilan Data Produk
Text("Kode : ${produk.kode}"),
Text("Nama : ${produk.nama}"),
Text("Harga : ${produk.harga}"),

Tombol Edit & Delete
Row(
  children: [
    ElevatedButton(onPressed: _edit, child: Text("EDIT")),
    ElevatedButton(onPressed: _hapus, child: Text("DELETE")),
  ],
)


EDIT → buka Form Produk (mode ubah)

DELETE → dialog konfirmasi

Dialog Konfirmasi Hapus
showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text("Hapus Produk"),
    actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: Text("Tidak")),
      TextButton(
        onPressed: () {
          Navigator.pop(context); // tutup dialog
          Navigator.pop(context); // kembali ke halaman produk
        },
        child: Text("Ya"),
      ),
    ],
  ),
);
