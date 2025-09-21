import 'package:flutter/material.dart';
import 'package:first_project_flutter/profile.dart';
import '../pages/home_page.dart';
import '../pages/second_page.dart';
import '../pages/about_page.dart';
import '../pages/contact_page.dart';
import '../pages/props_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menu Navigasi',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.blue),
            title: Text('Beranda', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            }
          ),
          ListTile(
              leading: Icon(Icons.shopping_cart, color: Colors.blue),
              title: Text('Keranjang', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              }
            ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.blue),
            title: Text('Profil', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blue),
            title: Text('Tentang Aplikasi', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail, color: Colors.blue),
            title: Text('Kontak Kami', style: TextStyle(color: Colors.black)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add, color: Colors.blue),
            title: Text(
              'Counter Page',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text('Props Page', style: TextStyle(color: Colors.black)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PropsPage(name: "Rizqi", age: 20, isActive: true)),
                );
              }
            ),
        ],
      ),
    );
  }
}
