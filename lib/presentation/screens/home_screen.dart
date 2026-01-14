import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_card.dart';
import '../widgets/skills_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          // Background "Tech" Grid (Simple placeholder for particle animation)
          Positioned.fill(child: CustomPaint(painter: GridPainter())),

          Column(
            children: [
              const NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const HeroSection(),
                      const SizedBox(height: 60),
                      _buildProjectsSection(context),
                      const SizedBox(height: 60),
                      const SkillsSection(),
                      const SizedBox(height: 100),
                      _buildFooter(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Simple responsive grid logic
    int crossAxisCount = 1;
    if (size.width > 1100) {
      crossAxisCount = 3;
    } else if (size.width > 700) {
      crossAxisCount = 2;
    }
    double padding = size.width > 800 ? 100 : 24;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected Projects',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppTheme.textPrimary,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 40),
          GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1.3,
            children: const [
              ProjectCard(
                title: 'Neural Network Viz',
                description:
                    'A 3D visualization tool for neural network architectures using WebGL and Python.',
                tags: ['Python', 'WebGL', 'Three.js'],
                githubUrl: 'https://github.com',
              ),
              ProjectCard(
                title: 'Distributed Chat',
                description:
                    'Scalable real-time chat application built with Go and gRPC, handling 10k+ concurrent connections.',
                tags: ['Go', 'gRPC', 'Redis'],
                githubUrl: 'https://github.com',
                demoUrl: 'https://example.com',
              ),
              ProjectCard(
                title: 'Crypto Trading Bot',
                description:
                    'Automated trading algorithm interacting with multiple exchanges via WebSocket APIs.',
                tags: ['Node.js', 'WebSockets', 'MongoDB'],
                githubUrl: 'https://github.com',
              ),
              ProjectCard(
                title: 'Portfolio V1',
                description:
                    'My previous portfolio site built with React and Tailwind CSS.',
                tags: ['React', 'Tailwind', 'Vercel'],
                githubUrl: 'https://github.com',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      color: AppTheme.surface,
      child: const Center(
        child: Text(
          '© 2026 Joshua. Built with Flutter & Coffee.',
          style: TextStyle(color: AppTheme.textSecondary),
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppTheme.primary.withValues(alpha: 0.05)
      ..strokeWidth = 1;

    const double gridSize = 40;

    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
