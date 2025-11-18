# h1d023113_tugas7

Nama : Muhammad Fadhel Fausta  
NIM : H1D023113  
Shift : E -> F  

## Alur

Aplikasi dimulai dari main.dart, yang mengatur tema dan mengarahkan ke halaman Login sebagai halaman awal.Pengguna baru bisa mendaftar di RegisterPage dengan username dan password. Data disimpan sebagai list hashed di local storage. Jika berhasil, kembali ke Login. Di LoginPage, pengguna masukkan username dan password. Aplikasi verifikasi dari daftar pengguna di storage (dengan hashing MD5). Jika valid, simpan current user dan navigasi ke Home dengan animasi fade. Jika tidak, tampilkan dialog error. HomePage menampilkan welcome message dengan username, kartu interaktif (misalnya, fitur unggulan dan cuaca simulasi). Drawer (side menu) tersedia untuk navigasi.  
Dari drawer, pengguna bisa:  
Ke Home (refresh halaman).  
Ke Profile (tampilkan info username).  
Ke About (deskripsi aplikasi dengan animasi teks).  
Toggle Dark Mode (ubah tema aplikasi, disimpan di storage).  
Logout (konfirmasi dialog, hapus current user dari storage, kembali ke Login).  


# Penjelasan

### pada file main.dart :  
Mengimpor paket Flutter dan halaman LoginPage untuk navigasi awal.
ValueNotifier<bool> isDarkMode: Variabel global yang mengelola toggle dark mode secara real-time.
main(): Fungsi utama yang menjalankan aplikasi Flutter.
MyApp class: Kelas utama yang membangun UI aplikasi dengan tema dinamis berdasarkan dark mode, dan mendefinisikan routes untuk navigasi antar halaman.  

### Pada file register_page.dart
Mengimpor paket untuk UI, penyimpanan, JSON, dan hashing password.
RegisterPage class: Widget stateful untuk halaman pendaftaran pengguna baru.
_RegisterPageState: Mengelola state dengan controller input, validasi data, penyimpanan hashed password ke storage sebagai list, dan dialog feedback.
build(): Membangun UI dengan form input, tombol register, dan navigasi ke login, ditambah gradien latar untuk estetika.

### pada file login_page.dart
Mengimpor paket untuk UI, penyimpanan, JSON, hashing, dan halaman HomePage.
LoginPage class: Widget stateful untuk halaman login pengguna.
_LoginPageState: Mengelola input, verifikasi kredensial dari storage dengan hashing, penyimpanan user aktif, dan navigasi dengan animasi fade.
build(): Membangun UI dengan form, ikon hero untuk animasi, tombol login, dan link ke registrasi, dengan gradien latar.

### pada file home_page.dart  
Mengimpor paket untuk UI, penyimpanan, dan side menu.
HomePage class: Widget stateful untuk halaman utama setelah login.
_HomePageState: Memuat username dari storage, menampilkan welcome message, dan kartu interaktif dengan dialog saat diklik.
build(): Membangun UI dengan app bar, drawer menu, dan body berisi teks serta kartu untuk fitur kreatif.

### pada file side_menu.dart
Mengimpor paket untuk UI, penyimpanan, dan akses ke dark mode global.
SideMenu class: Widget stateless untuk drawer navigasi samping.
build(): Membangun drawer dengan header, list tile untuk navigasi (home, profile, about), toggle dark mode yang disimpan, dan logout dengan konfirmasi.

### pada file about_page.dart  
import: Mengimpor paket untuk UI dan animasi.
AboutPage class: Widget stateful untuk halaman informasi aplikasi dengan animasi.
_AboutPageState: Mengelola animasi fade-in teks selama 2 detik menggunakan controller.
build(): Membangun UI dengan app bar, ikon, dan teks deskriptif yang muncul bertahap.

### pada file profile_page.dart
import: Mengimpor paket untuk UI dan penyimpanan.
ProfilePage class: Widget stateful untuk halaman profil pengguna.
_ProfilePageState: Memuat username dari storage dan menampilkan info sederhana.
build(): Membangun UI dengan app bar, avatar, dan teks username serta info tambahan simulasi.

# ScreenShot
<img width="1080" height="2400" alt="Screenshot_1763477937" src="https://github.com/user-attachments/assets/8673580b-fa2e-4b66-9f86-175122e22190" />
<img width="1080" height="2400" alt="Screenshot_1763477934" src="https://github.com/user-attachments/assets/c0b3b497-95a0-48e0-a002-28e8652c2ec1" />
<img width="1080" height="2400" alt="Screenshot_1763477931" src="https://github.com/user-attachments/assets/ddc2a8a6-483e-4262-8cd9-ee163f14ef2b" />
<img width="1080" height="2400" alt="Screenshot_1763477928" src="https://github.com/user-attachments/assets/89ac3032-cc01-4785-9d34-31544fe46448" />
<img width="1080" height="2400" alt="Screenshot_1763477904" src="https://github.com/user-attachments/assets/b763ced2-e27b-4d3f-bd11-a23de8749a2d" />
<img width="1080" height="2400" alt="Screenshot_1763477899" src="https://github.com/user-attachments/assets/9c8ed8e8-bde6-422a-86e3-725ded875f41" />

