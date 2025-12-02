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

                SizedBox(height: h * 0.03),
                InviteBannerExact(),
                SizedBox(height: h * 0.03),
                CelebrityShoutoutCard(),
                SizedBox(height: h * 0.03),
                LuckyWheelCard(),
                SizedBox(height: h * 0.03),

                SizedBox(
                  height: h * 0.32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _CreatorCard(name: "Armani - Watch", city: "Requirement - Male Model\nNew Delhi", img: "assets/images/watch.png", w: w, h: h),
                      SizedBox(width: w * 0.04),
                      _CreatorCard(name: "Gucci - Sneaker", city: "Requirement - Female Model\nNew Delhi", img: "assets/images/sneaker.png", w: w, h: h),
                      SizedBox(width: w * 0.04),
                      _CreatorCard(name: "Zara - Perfume", city: "Requirement - Unisex Model\nDelhi NCR", img: "assets/images/zara.png", w: w, h: h),
                    ],
                  ),
                ),

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


class InviteBannerExact extends StatelessWidget {
  const InviteBannerExact({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFFE85F4F), // same orange-red shade
            Color(0xFFE87A60), // lighter curved blend
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            // BACKGROUND CURVES
            Positioned(
              right: -40,
              top: -10,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.10),
                ),
              ),
            ),
            Positioned(
              right: -10,
              bottom: -20,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.12),
                ),
              ),
            ),

            // MAIN CONTENT
            Row(
              children: [
                // LEFT IMAGE
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: w * 0.28,
                    height: 150,
                    child: Image.asset(
                      "assets/images/user.png", // Change your path
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // TEXT + BUTTON
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Earn 1000 Coins",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "New",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Invite friends and get benefits\nvia our referral system",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 12),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFF10D5C1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Invite Now",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CelebrityShoutoutCard extends StatelessWidget {
  const CelebrityShoutoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      width: w,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF003329), // deep green/teal like screenshot
            Color(0xFF066953), // lighter teal right side
          ],
        ),
      ),
      child: Row(
        children: [
          // LEFT SECTION
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Celebrity Shoutouts:\nMake Moments Memorable",
                  style: TextStyle(
                    color: Color(0xFFF5D36C), // yellow title
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 12),

                // Bullet Points
                const Text(
                  "• Get personalized shoutouts from top celebrities.\n"
                      "• Celebrate birthdays, anniversaries, or milestones with star power.\n"
                      "• Promote your brand or event with engaging celeb videos.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 16),

                // Button
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0FE4A5),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Get Shoutout",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.arrow_forward,
                          size: 18, color: Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 14),

          // RIGHT IMAGE SECTION
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // LEFT IMAGE (BIGGER)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 95,          // BIGGER WIDTH
                  height: 155,        // BIGGER HEIGHT
                  color: Colors.black12,
                  child: Image.asset(
                    "assets/images/ritik.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              // RIGHT IMAGE (SMALLER)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 75,          // SMALLER WIDTH
                  height: 135,        // SMALLER HEIGHT
                  color: Colors.black12,
                  child: Image.asset(
                    "assets/images/rasmika.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




class LuckyWheelCard extends StatelessWidget {
  const LuckyWheelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF0C1120),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hot Games this Week",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 12),

          // CARD
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFB59833),
                  Color(0xFFEED77C),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              children: [
                // Wheel Image
                SizedBox(
                  width: 130,
                  height: 130,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/wheel.png",
                        fit: BoxFit.contain,
                      ),


                    ],
                  ),
                ),

                const SizedBox(width: 20),

                // Text + Button
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // NEW Badge
                      Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF536DFF),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "New",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),

                      const SizedBox(height: 12),

                      const Text(
                        "Spin the Lucky wheel",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF2C2C2C),
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Win up to 500 bonus coins daily !",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // START NOW BUTTON
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF38E89E),
                              Color(0xFF13C8C3),
                            ],
                          ),
                        ),
                        child: const Text(
                          "Start Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  final String image;
  final String title;
  final String requirement;
  final String ratings;
  final String price;

  const BrandCard({
    super.key,
    required this.image,
    required this.title,
    required this.requirement,
    required this.ratings,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F1F),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          // IMAGE WITH OVERLAY BUTTON
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  image,
                  width: 160,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),

              // VIEW BUTTON
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xFF35E6A8),
                  ),
                  child: const Text(
                    "View",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // TITLE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 5),

          // PRICE + RATING ROW
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Image.asset(
                  "assets/coin.png",
                  width: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),

                const Spacer(),

                // ⭐ RATING
                const Icon(Icons.star, size: 16, color: Color(0xFFFFD66B)),
                const SizedBox(width: 3),
                Text(
                  ratings,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // REQUIREMENT
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              requirement,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 12,
                height: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
