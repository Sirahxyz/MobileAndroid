import 'package:flutter/material.dart';
import 'profil.dart';
import 'detail.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF10192D),
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              'Dashboard',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Apa yang dibutuhkan?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Cari jasa...',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Kebutuhan Teratas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(
                      context,
                      'assets/images/d1.jpeg',
                      'Laundry',
                      'Rp 20.000',
                      '4,9',
                      'Jaminan pakaian bersih, wangi, dan rapi tanpa ribet! Cepat, hemat, dan terpercaya. Cuci, Lipat, Beres!'),
                  _buildGridItem(
                      context,
                      'assets/images/d2.jpeg',
                      'Asisten Rumah Tangga',
                      'Rp 200.000',
                      '4.2',
                      'Kami menyediakan asisten rumah tangga terpercaya, profesional, dan cekatan untuk membantu kebutuhan rumah Anda. Dari bersih-bersih hingga mengurus rumah tangga, kami hadir untuk membuat hidup Anda lebih mudah.'),
                  _buildGridItem(
                      context,
                      'assets/images/d3.jpeg',
                      'Tukang Kebun',
                      'Rp 100.000',
                      '4.8',
                      'Kebun indah, hijau, dan terawat sempurna! Kami siap membantu perawatan taman Anda dengan sentuhan ahli'),
                  _buildGridItem(
                      context,
                      'assets/images/d4.jpeg',
                      'Tukang Masak',
                      'Rp 250.000',
                      '4.1',
                      ' Hidangan lezat langsung dari dapur Anda! Nikmati masakan berkualitas tanpa perlu repot.'),
                  _buildGridItem(
                      context,
                      'assets/images/d5.jpeg',
                      'Servis Elektronik',
                      'Rp 80.000',
                      '4.6',
                      'Solusi cepat untuk elektronik Anda yang bermasalah! Layanan profesional untuk semua kebutuhan perbaikan'),
                  _buildGridItem(
                      context,
                      'assets/images/d6.jpeg',
                      'Servis Kendaraan',
                      'Rp 150.000',
                      '4.3',
                      'Perawatan dan perbaikan kendaraan Anda, cepat dan terpercaya! Jaminan layanan berkualitas untuk perjalanan aman.'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String imagePath,
      String serviceName, String price, String rating, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imagePath: imagePath,
              serviceName: serviceName,
              price: price,
              description: description,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    serviceName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      Text(rating),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
