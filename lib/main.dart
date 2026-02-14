import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Abhishek Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            AboutSection(),
            SkillsSection(),
            ExperienceSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}

double maxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width > 1100 ? 1100 : MediaQuery.of(context).size.width * 0.9;
}

//
// HERO SECTION
//
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: maxWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hi, I'm",
                style: TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 10),
              const Text(
                "Abhishek Yadav",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Flutter & Android Developer",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "2+ years experience building scalable mobile & web apps using Flutter, Jetpack Compose, Firebase and Clean Architecture.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Download Resume"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// ABOUT
//
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionContainer(
      context,
      title: "About Me",
      child: const Text(
        "Mobile Application Engineer with 2+ years experience developing high-performance Android and Flutter applications. "
            "Worked on apps serving 10k+ users. Experienced in MVVM, Clean Architecture, Firebase integration and REST APIs.",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

//
// SKILLS
//
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  final skills = const [
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
    "AWS Basics",
    "ReactJS",
  ];

  @override
  Widget build(BuildContext context) {
    return sectionContainer(
      context,
      title: "Skills",
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: skills
            .map((e) => Chip(
          label: Text(e),
          backgroundColor: Colors.blue.shade50,
        ))
            .toList(),
      ),
    );
  }
}

//
// EXPERIENCE
//
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionContainer(
      context,
      title: "Experience",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Jr SDE – Simpel Techlabs (2025 – Present)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text("• Improved API performance by 35%"),
          Text("• Built scalable apps for 10k+ users"),
          Text("• Firebase, CI/CD, Play Store releases"),
          SizedBox(height: 15),
          Text(
            "Flutter Developer Intern – Techsaga (2023)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text("• Developed cross-platform apps"),
          Text("• Provider state management"),
          Text("• Reduced crashes by 25%"),
        ],
      ),
    );
  }
}

//
// PROJECTS
//
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return sectionContainer(
      context,
      title: "Projects",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Bank Management System",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text("Flutter + Spring Boot + MongoDB"),
          Text("JWT Authentication, Offline support, CI/CD"),
        ],
      ),
    );
  }
}

//
// CONTACT
//
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      width: double.infinity,
      color: Colors.blue,
      child: Center(
        child: SizedBox(
          width: maxWidth(context),
          child: const Column(
            children: [
              Text(
                "Contact",
                style: TextStyle(fontSize: 28, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "abhiyadav5242@gmail.com",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "GitHub: github.com/abhigithub0027",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "LinkedIn: linkedin.com/in/abhisheky",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// COMMON SECTION WIDGET
//
Widget sectionContainer(BuildContext context,
    {required String title, required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 60),
    width: double.infinity,
    child: Center(
      child: SizedBox(
        width: maxWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            child,
          ],
        ),
      ),
    ),
  );
}
