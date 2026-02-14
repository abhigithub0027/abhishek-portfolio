import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'UI/about.dart';
import 'UI/contact.dart';
import 'UI/experince.dart';
import 'UI/hero.dart';
import 'UI/projects.dart';
import 'UI/skills.dart';

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

      // Modern Developer Theme
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xff00E5FF),
        scaffoldBackgroundColor: const Color(0xff0D1117),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),

      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: const [
          Breakpoint(start: 0, end: 600, name: MOBILE),
          Breakpoint(start: 601, end: 1100, name: TABLET),
          Breakpoint(start: 1101, end: 1920, name: DESKTOP),
        ],
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
      body: Stack(
        children: [
          /// Animated Tech Background
          const AnimatedBackground(),

          /// Page Content
          SingleChildScrollView(
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
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
/// Animated Gradient + Tech Particles Background
//////////////////////////////////////////////////////////////

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 10))
      ..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [
                Color(0xff0D1117),
                Color(0xff0A192F),
                Color(0xff020617),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                controller.value,
                controller.value + 0.2,
                controller.value + 0.4,
              ],
            ),
          ),
          child: const TechParticles(),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

//////////////////////////////////////////////////////////////
/// Floating Tech Particles (Coding style effect)
//////////////////////////////////////////////////////////////

class TechParticles extends StatelessWidget {
  const TechParticles({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: List.generate(
          20,
              (index) => Positioned(
            left: (index * 70) % MediaQuery.of(context).size.width,
            top: (index * 120) % MediaQuery.of(context).size.height,
            child: Text(
              _symbols[index % _symbols.length],
              style: TextStyle(
                color: Colors.white.withOpacity(0.05),
                fontSize: 40,
                fontFamily: 'monospace',
              ),
            )
                .animate(onPlay: (c) => c.repeat())
                .moveY(
              duration: (5 + index).seconds,
              begin: 0,
              end: -100,
            ),
          ),
        ),
      ),
    );
  }

  static const _symbols = [
    "{ }",
    "</>",
    "Flutter",
    "Dart",
    "AI",
    "class",
    "async",
    "API",
    "Git",
  ];
}

//////////////////////////////////////////////////////////////
/// Shared Layout Helpers
//////////////////////////////////////////////////////////////

double maxWidth(BuildContext context) {
  return MediaQuery.of(context).size.width > 1200
      ? 1200
      : MediaQuery.of(context).size.width * 0.9;
}

Widget sectionContainer(
    BuildContext context, {
      required String title,
      required Widget child,
    }) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 80),
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
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xff00E5FF),
              ),
            )
                .animate()
                .fadeIn(duration: 500.ms)
                .slideX(begin: -0.2),
            const SizedBox(height: 30),
            child.animate().fadeIn(duration: 600.ms).slideY(begin: 0.1),
          ],
        ),
      ),
    ),
  );
}
