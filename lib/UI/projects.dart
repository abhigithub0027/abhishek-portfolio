import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      "title": "Bank Management System",
      "description":
      "Secure banking app with JWT authentication, offline support and CI/CD pipeline.",
      "tech": ["Flutter", "Spring Boot", "MongoDB"]
    },
    {
      "title": "Task Manager App",
      "description":
      "Productivity app with Firebase sync, notifications and Clean Architecture.",
      "tech": ["Flutter", "Firebase", "MVVM"]
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 800;

    return sectionContainer(
      context,
      title: "Projects",
      child: Center(
        child: SizedBox(
          width: isMobile ? double.infinity : 1100,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: List.generate(projects.length, (index) {
              final project = projects[index];

              return _projectCard(
                title: project["title"],
                description: project["description"],
                tech: project["tech"],
                width: isMobile ? width : (width / 2.5),
                index: index,
              );
            }),
          ),
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.2),
      ),
    );
  }

  Widget _projectCard({
    required String title,
    required String description,
    required List tech,
    required double width,
    required int index,
  }) {
    return Container(
      width: width > 500 ? 450 : width,
      padding: const EdgeInsets.all(20),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Gradient Header
          Container(
            height: 5,
            width: 50,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),

          const SizedBox(height: 12),

          /// Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          /// Description
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(height: 1.4,color: Colors.black),
          ),

          const SizedBox(height: 12),

          /// Tech Chips
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: tech
                .map(
                  (e) => Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  e,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            )
                .toList(),
          ),
        ],
      ),
    )
    // Stagger Animation
        .animate(delay: (index * 150).ms)
        .fadeIn(duration: 500.ms)
        .slideY(begin: 0.3);
  }
}
