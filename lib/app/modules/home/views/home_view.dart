import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ daftar menu jadi list biar lebih rapih
    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Icons.countertops,
        "title": "Counter",
        "color": Colors.orange,
        "route": "/counter",
      },
      {
        "icon": Icons.article,
        "title": "Posts",
        "color": Colors.green,
        "route": "/post",
      },
      {
        "icon": Icons.shopping_cart_outlined,
        "title": "Penjualan",
        "color": Colors.purple,
        "route": "/penjualan",
      },
      {
        "icon": Icons.description_outlined,
        "title": "Formulir",
        "color": Colors.red,
        "route": "/formulir",
      },
      {
        "icon": Icons.photo_album_outlined,
        "title": "Album",
        "color": Colors.teal,
        "route": "/album",
      },
    ];

    return Scaffold(
      body: Container(
        // Background gradasi
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF42A5F5), Color(0xFF1E88E5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Selamat Datang 👋",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Silakan pilih menu di bawah untuk melanjutkan:",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 20),
                // ✅ pake GridView.builder
                Expanded(
                  child: GridView.builder(
                    itemCount: menuItems.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 kolom
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      final item = menuItems[index];
                      return _buildMenuCard(
                        icon: item["icon"],
                        title: item["title"],
                        color: item["color"],
                        onTap: () => Get.toNamed(item["route"]),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 6,
        shadowColor: color.withOpacity(0.3),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, size: 26, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
