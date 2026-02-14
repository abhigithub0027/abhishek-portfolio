import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return sectionContainer(
      context,
      title: "About Me",
      child: Center(
        child: Container(
          width: isMobile ? double.infinity : 800,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: const Text(
            "Mobile Application Engineer with 2+ years experience developing high-performance Android and Flutter applications. "
                "Worked on apps serving 10k+ users. Experienced in MVVM, Clean Architecture, Firebase integration and REST APIs.",
            textAlign: TextAlign.center,
            softWrap: true,
            overflow: TextOverflow.visible,
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Colors.black
            ),
          ),
        )
        // Animation
            .animate()
            .fadeIn(duration: 700.ms)
            .slideY(begin: 0.2, duration: 700.ms),
      ),
    );
  }
}
