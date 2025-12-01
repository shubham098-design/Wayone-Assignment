import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: h * 0.015),

                /// HEADER
                Row(
                  children: [
                    CircleAvatar(
                      radius: w * 0.07,
                      backgroundImage: const AssetImage("assets/images/self.png"),
                    ),
                    SizedBox(width: w * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Welcome !", style: TextStyle(color: Colors.white70, fontSize: 14)),
                        Text("Navdeep", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(w * 0.02),
                      decoration: BoxDecoration(
                          color: Colors.white12, borderRadius: BorderRadius.circular(10)),
                      child: const Icon(Icons.notifications_none, color: Colors.white),
                    )
                  ],
                ),

                SizedBox(height: h * 0.02),

                /// SEARCH BAR
                Container(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  decoration: BoxDecoration(
                      color: Colors.white12, borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.white70),
                      SizedBox(width: w * 0.02),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                            "Discover Brands, Influencers and videographers",
                            hintStyle: TextStyle(color: Colors.white54),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// CHOOSE SERVICE
                const Text("Choose Service",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: h * 0.02),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ServiceIcon(icon: Icons.account_balance_wallet, label: "Wallet", size: w),
                    _ServiceIcon(icon: Icons.videogame_asset, label: "Earn & play", size: w),
                    _ServiceIcon(icon: Icons.people_alt, label: "Creators", size: w),
                  ],
                ),

                SizedBox(height: h * 0.03),

                const Text("Top Creators",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: h * 0.02),

                SizedBox(
                  height: h * 0.32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _CreatorCard(name: "Naksh Sharma", city: "New Delhi", img: "assets/images/naksh.png", w: w, h: h),
                      SizedBox(width: w * 0.04),
                      _CreatorCard(name: "Ishika Gaur", city: "Mumbai", img: "assets/images/ishika.png", w: w, h: h),
                      SizedBox(width: w * 0.04),
                      _CreatorCard(name: "Navya Sharma", city: "Dubai", img: "assets/images/navya.png", w: w, h: h),
                    ],
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// INVITE BANNER
                Container(
                  padding: EdgeInsets.all(w * 0.04),
                  decoration: BoxDecoration(
                      color: Colors.white12, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Earn 1000 Coins",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text(
                              "Invite friends and get benefits via our referral system",
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.04, vertical: w * 0.025),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text("Invite Now",
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),

                SizedBox(height: h * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final double size;

  const _ServiceIcon({required this.icon, required this.label, required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(size * 0.045),
          decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, color: Colors.white, size: size * 0.07),
        ),
        SizedBox(height: size * 0.02),
        Text(label, style: const TextStyle(color: Colors.white70))
      ],
    );
  }
}

class _CreatorCard extends StatelessWidget {
  final String name;
  final String city;
  final String img;
  final double w;
  final double h;

  const _CreatorCard({required this.name, required this.city, required this.img, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w * 0.35,
      height: h *0.45,
      decoration: BoxDecoration(color: const Color(0xFF0F111A), borderRadius: BorderRadius.circular(18)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Image.asset(img, height: h * 0.45, width: w * 0.35, fit: BoxFit.fitWidth),
          ),

          Positioned(
            right: w * 0.02,
            top: w * 0.03,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.045,
                vertical: w * 0.013,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF2DE2C1),
                    Color(0xFF16C4A3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                "View",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8,
                ),
              ),
            ),
          ),

          Positioned(
            left: w * 0.03,
            bottom: h * 0.015,
            right: w * 0.03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: h * 0.008),

                Row(
                  children: const [
                    Icon(Icons.camera_alt, color: Colors.pinkAccent, size: 16),
                    SizedBox(width: 4),
                    Text("6.5M", style: TextStyle(color: Colors.white, fontSize: 12)),
                    SizedBox(width: 14),
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text("5.0", style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),

                SizedBox(height: h * 0.008),
                const Text("Versatile Model", style: TextStyle(color: Colors.white70, fontSize: 13)),
                Text(city, style: const TextStyle(color: Colors.white70, fontSize: 13)),
              ],
            ),
          )
        ],
      ),
    );
  }
}