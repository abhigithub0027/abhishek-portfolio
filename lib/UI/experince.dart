import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800;

    return sectionContainer(
      context,
      title: "Experience",
      child: Center(
        child: Container(
          width: isMobile ? double.infinity : 900,
          child: Column(
            children: [
              _experienceCard(
                title: "Jr SDE – Simpel Techlabs",
                duration: "2025 – Present",
                points: const [
                  "Improved API performance by 35%",
                  "Built scalable apps for 10k+ users",
                  "Firebase, CI/CD, Play Store releases",
                ],
                index: 0,
              ),
              const SizedBox(height: 20),
              _experienceCard(
                title: "Flutter Developer Intern – Techsaga",
                duration: "2023",
                points: const [
                  "Developed cross-platform apps",
                  "Provider state management",
                  "Reduced crashes by 25%",
                ],
                index: 1,
              ),
            ],
          ),
        )
        // Section Animation
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2),
      ),
    );
  }

  Widget _experienceCard({
    required String title,
    required String duration,
    required List<String> points,
    required int index,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Gradient Timeline Bar
          Container(
            width: 6,
            height: 140,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(16),
              ),
            ),
          ),

          /// Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title + Duration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        duration,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// Points
                  ...points.map(
                        (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Text(
                        "• $e",
                        style: const TextStyle(height: 1.4,color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    )
    // Stagger animation per card
        .animate(delay: (index * 200).ms)
        .fadeIn(duration: 500.ms)
        .slideX(begin: 0.2);
  }
}
