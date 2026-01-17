import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled/l10n/app_localizations.dart';

import '../../theme/app_theme.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_card.dart';
import '../widgets/skills_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppTheme.background,
      endDrawer: Drawer(
        backgroundColor: AppTheme.background,
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppTheme.surface),
              child: Center(
                child: Text(
                  '< Joshua />',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.work_outline, color: AppTheme.primary),
              title: Text(
                l10n.navProjects,
                style: GoogleFonts.jetBrainsMono(color: AppTheme.textPrimary),
              ),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_projectsKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.code, color: AppTheme.primary),
              title: Text(
                l10n.navSkills,
                style: GoogleFonts.jetBrainsMono(color: AppTheme.textPrimary),
              ),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_skillsKey);
              },
            ),
            ListTile(
              leading: const Icon(Icons.mail_outline, color: AppTheme.primary),
              title: Text(
                l10n.navContact,
                style: GoogleFonts.jetBrainsMono(color: AppTheme.textPrimary),
              ),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(_contactKey);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background "Tech" Grid
          Positioned.fill(child: CustomPaint(painter: GridPainter())),

          Column(
            children: [
              NavBar(
                onProjectsTap: () => _scrollToSection(_projectsKey),
                onSkillsTap: () => _scrollToSection(_skillsKey),
                onContactTap: () => _scrollToSection(_contactKey),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HeroSection(
                        onViewProjectsTap: () => _scrollToSection(_projectsKey),
                      ),
                      const SizedBox(height: 60),
                      Container(
                        key: _projectsKey,
                        child: _buildProjectsSection(context),
                      ),
                      const SizedBox(height: 60),
                      Container(key: _skillsKey, child: const SkillsSection()),
                      const SizedBox(height: 100),
                      Container(key: _contactKey, child: _buildFooter(context)),
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
    final l10n = AppLocalizations.of(context)!;
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
            l10n.selectedProjects,
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
            children: [
              ProjectCard(
                title: l10n.projectNeuralTitle,
                description: l10n.projectNeuralDesc,
                tags: const ['Python', 'WebGL', 'Three.js'],
                githubUrl: 'https://github.com',
              ),
              ProjectCard(
                title: l10n.projectChatTitle,
                description: l10n.projectChatDesc,
                tags: const ['Go', 'gRPC', 'Redis'],
                githubUrl: 'https://github.com',
                demoUrl: 'https://example.com',
              ),
              ProjectCard(
                title: l10n.projectBotTitle,
                description: l10n.projectBotDesc,
                tags: const ['Node.js', 'WebSockets', 'MongoDB'],
                githubUrl: 'https://github.com',
              ),
              ProjectCard(
                title: l10n.projectPortfolioTitle,
                description: l10n.projectPortfolioDesc,
                tags: const ['React', 'Tailwind', 'Vercel'],
                githubUrl: 'https://github.com',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      width: double.infinity,
      color: AppTheme.surface,
      child: Column(
        children: [
          Text(
            l10n.navContact,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.contactMsg,
            style: const TextStyle(color: AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'joshua@dev.com',
                queryParameters: {'subject': 'Hello Joshua!'},
              );
              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              }
            },
            icon: const Icon(Icons.email_outlined),
            label: Text('joshua@dev.com', style: GoogleFonts.jetBrainsMono()),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: AppTheme.background,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            l10n.footerText,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
          ),
        ],
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
