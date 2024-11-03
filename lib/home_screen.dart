import 'package:bankapp/ProfileScreen.dart';
import 'package:bankapp/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildCardSection(),
            _buildMenuGrid(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: const Color(0xFF5A2F8E),
      padding: const EdgeInsets.only(top: 50, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/IMG_7638.jpg'),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Hai, Danu Candra',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                Icon(Icons.notifications, color: Colors.white, size: 30),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Color(0xFF3B49D5), Color(0xFF1F86E6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Danu CS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Uangku Platinum',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                '1234 **** **** 3456',
                style: TextStyle(color: Colors.white, letterSpacing: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                'Rp. 3.469.520',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildMenuItem(Icons.account_balance_wallet, 'Akun dan Kartu'),
          _buildMenuItem(Icons.sync_alt, 'Transfer'),
          _buildMenuItem(Icons.money_off, 'Tarik Tunai'),
          _buildMenuItem(Icons.smartphone, 'Pulsa'),
          _buildMenuItem(Icons.receipt, 'Bayar Tagihan'),
          _buildMenuItem(Icons.savings, 'Tabungan Online'),
          _buildMenuItem(Icons.credit_card, 'Kartu Kredit'),
          _buildMenuItem(Icons.assessment, 'Laporan Transaksi'),
          _buildMenuItem(Icons.people, 'Penerima'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.blue, size: 30),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.mail), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Keluar'),
      ],
      selectedItemColor: const Color(0xFF5A2F8E),
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      onTap: (index) {
        if (index == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
    );
  }
}
