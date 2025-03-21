# Windows Optimizer CLI

Script ini dirancang untuk mengoptimalkan performa Windows 10 dan versi di atasnya dengan memfokuskan pada:
- Pengurangan service latar belakang
- Peningkatan FPS dalam game
- Pengoptimalan registry
- Pengurangan beban visual
- Pengoptimalan jaringan

## Cara Penggunaan

1. Ekstrak semua file dalam satu folder
2. Pastikan struktur folder sebagai berikut:
   ```
   WOC/
   ├── main.bat
   ├── README.md
   └── scripts/
       ├── service_optimizer.bat
       ├── system_cleanup.bat
       ├── registry_gaming.bat
       ├── network_optimizer.bat
       ├── visual_effects.bat
       └── restore_defaults.bat
   ```
3. Klik kanan pada `main.bat` dan pilih "Run as administrator"
4. Pilih opsi yang diinginkan dari menu utama

## Deskripsi File

- **main.bat**: File utama yang menjalankan menu dan memanggil script lainnya
- **service_optimizer.bat**: Mengoptimalkan dan menonaktifkan service yang tidak perlu
- **system_cleanup.bat**: Membersihkan file temporary dan cache sistem
- **registry_gaming.bat**: Mengoptimalkan registry untuk gaming dan performa tinggi
- **network_optimizer.bat**: Mengoptimalkan pengaturan jaringan
- **visual_effects.bat**: Menonaktifkan efek visual untuk performa lebih baik
- **restore_defaults.bat**: Mengembalikan pengaturan ke kondisi default

## Peringatan

- Gunakan script ini dengan risiko Anda sendiri
- Selalu buat System Restore Point sebelum menjalankan script
- Beberapa program mungkin memerlukan service yang dinonaktifkan, gunakan opsi restore jika ada masalah
- Script ini dirancang untuk Windows 10 dan 11, tidak dijamin berfungsi pada versi Windows lainnya

## Performa yang Diharapkan

- Pengurangan penggunaan RAM saat idle
- Peningkatan FPS dalam game
- Penurunan latensi input
- Pengurangan beban CPU pada task latar belakang
- Peningkatan responsivitas sistem secara keseluruhan

## Pemecahan Masalah

Jika mengalami masalah setelah menjalankan script:
1. Jalankan opsi "Kembalikan Pengaturan Default" dari menu utama
2. Restart komputer
3. Jika masalah berlanjut, gunakan System Restore untuk mengembalikan sistem ke titik sebelum script dijalankan