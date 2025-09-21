import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halaman Profil',
      // Mengatur tema warna biru untuk seluruh aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins', // Menggunakan font yang clean (opsional)
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profil Saya'),
        elevation: 0, // Menghilangkan bayangan agar terlihat clean
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Pusatkan konten secara vertikal
            crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan konten secara horizontal
            children: [
              // 1. Foto Profil
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // 2. Nama Pengguna
              const Text(
                'Rizqi Rifa Amarulloh',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // 3. Email atau Jabatan
              Text(
                'rizqirifa@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 32),

              // 4. Menu Opsi
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    _buildProfileOption(
                      icon: Icons.edit,
                      title: 'Edit Profil',
                      onTap: () {
                        // Aksi saat Edit Profil ditekan
                        print('Tombol Edit Profil ditekan');
                      },
                    ),
                    const Divider(height: 0),
                    _buildProfileOption(
                      icon: Icons.settings,
                      title: 'Pengaturan',
                      onTap: () {
                        // Aksi saat Pengaturan ditekan
                        print('Tombol Pengaturan ditekan');
                      },
                    ),
                    const Divider(height: 0),
                    // 5. Opsi Logout
                    _buildProfileOption(
                      icon: Icons.logout,
                      title: 'Logout',
                      isLogout: true, // Menandakan ini tombol logout
                      onTap: () {
                        _showLogoutDialog(context);
                      },
                    ),
                  ],
                ),
              ),
              const Spacer(), // Mendorong footer ke bawah
              
              // Footer (opsional)
              const Text(
                'App Version 1.0.0',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk membuat baris opsi agar tidak duplikat kode
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    final color = isLogout ? Colors.red : Colors.black87;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
      ),
      trailing: isLogout ? null : const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi saat logout
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi Logout'),
          content: const Text('Apakah Anda yakin ingin keluar?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
            ),
            TextButton(
              child: const Text('Logout', style: TextStyle(color: Colors.red)),
              onPressed: () {
                // Tambahkan logika logout Anda di sini
                print('User berhasil logout');
                Navigator.of(context).pop(); // Tutup dialog setelah logout
                // Contoh: Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }
}