import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    double contentWidth = MediaQuery.of(context).size.width > 1100
        ? 1100
        : MediaQuery.of(context).size.width * 0.9;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: contentWidth,
          child: Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              /// LEFT CONTENT
              Expanded(
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hi, I'm",
                      style: TextStyle(fontSize: 22,color: Colors.black87),
                    )
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideX(begin: -0.2),

                    const SizedBox(height: 10),

                    const Text(
                      "Abhishek Yadav",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,color: Colors.black
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms)
                        .slideX(begin: -0.2),

                    const SizedBox(height: 10),

                    const Text(
                      "Flutter & Android Developer",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 700.ms)
                        .slideX(begin: -0.2),

                    const SizedBox(height: 20),

                    SizedBox(
                      width: isMobile ? double.infinity : 420,
                      child: const Text(
                        "2+ years experience building scalable mobile & web apps using Flutter, Jetpack Compose, Firebase and Clean Architecture.",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,

                        style: TextStyle(fontSize: 16, height: 1.5,color: Colors.black),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: 0.2),

                    const SizedBox(height: 30),

                    // ElevatedButton.icon(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.download),
                    //   label: const Text("Download Resume"),
                    //   style: ElevatedButton.styleFrom(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 24, vertical: 14),
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //   ),
                    // )
                    //     .animate()
                    //     .fadeIn(duration: 900.ms)
                    //     .scale(begin: const Offset(0.9, 0.9)),
                  ],
                ),
              ),

              const SizedBox(width: 40, height: 40),

              /// RIGHT IMAGE
              Image.asset(
                'assets/images/abhishekprofile.png',
                width: isMobile ? 200 : 260,
              )
                  .animate()
                  .fadeIn(duration: 800.ms)
                  .slideX(begin: 0.2),
            ],
          ),
        ),
      ),
    );
  }
}
