import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  double maxWidth(BuildContext context) {
    return MediaQuery.of(context).size.width > 1100
        ? 1100
        : MediaQuery.of(context).size.width * 0.9;
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff4facfe), Color(0xff00f2fe)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Container(
          width: maxWidth(context),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 25,
                offset: const Offset(0, 15),
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Title
              const Text(
                "Let's Work Together",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
                  .animate()
                  .fadeIn(duration: 500.ms)
                  .slideY(begin: 0.2),

              const SizedBox(height: 10),

              const Text(
                "Feel free to reach out for opportunities or collaborations",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 500.ms),

              const SizedBox(height: 30),

              /// Contact Items
              _contactItem(
                Icons.email,
                "abhiyadav5242@gmail.com",
                0,
              ),
              _contactItem(
                Icons.code,
                "github.com/abhigithub0027",
                1,
              ),
              _contactItem(
                Icons.work,
                "linkedin.com/in/abhisheky",
                2,
              ),
            ],
          ),
        )
        // Card Animation
            .animate()
            .fadeIn(duration: 700.ms)
            .scale(begin: const Offset(0.9, 0.9)),
      ),
    );
  }

  Widget _contactItem(IconData icon, String text, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    )
    // Stagger animation
        .animate(delay: (index * 150).ms)
        .fadeIn(duration: 500.ms)
        .slideX(begin: 0.2);
  }
}
