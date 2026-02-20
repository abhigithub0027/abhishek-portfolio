import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final List<String> skills = const [
    "C++"
    "OOPs"
    "Flutter",
    "Dart",
    "Kotlin",
    "Java",
    "Jetpack Compose",
    "Firebase",
    "REST APIs",
    "MVVM",
    "Clean Architecture",
    "Git & GitHub",
    "ReactJS",
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return sectionContainer(
      context,
      title: "Skills",
      child: Center(
        child: Container(
          width: isMobile ? double.infinity : 900,
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
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: List.generate(skills.length, (index) {
              return Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Text(
                  skills[index],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              // Stagger Animation
                  .animate(delay: (index * 80).ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.3);
            }),
          ),
        )
        // Section Animation
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2),
      ),
    );
  }
}
