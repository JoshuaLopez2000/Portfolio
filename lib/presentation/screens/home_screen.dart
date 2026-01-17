import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:untitled/l10n/app_localizations.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';
import 'package:untitled/features/projects/domain/entities/project.dart';
import 'package:untitled/injection_container.dart';

import '../../theme/app_theme.dart';
import '../widgets/hero_section.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_card.dart';
import '../widgets/skills_section.dart';

class HomeScreen extends StatefulWidget {
  final Profile profile;
  const HomeScreen({super.key, required this.profile});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();
  
  List<Project> _projects = [];
  bool _isProjectsLoading = true;

  @override
  void initState() {
    super.initState();
    // I initially load nothing here because I need the context to know the language,
    // so I delegate that responsibility to didChangeDependencies.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Here it is safe to access the context to get the locale and load the projects.
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    // I get the current language code to request projects in the correct language.
    final locale = Localizations.localeOf(context).languageCode;
    final getProjects = sl.getProjects;
    final projects = await getProjects(lang: locale);
    if (mounted) {
      setState(() {
        _projects = projects;
        _isProjectsLoading = false;
      });
    }
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      // I perform a smooth scroll to the selected section.
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
                  '< ${widget.profile.name} />',
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
                name: widget.profile.name,
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
                        name: widget.profile.name,
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
    if (_isProjectsLoading) {
      return const Center(child: CircularProgressIndicator(color: AppTheme.primary));
    }
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context)!;
    
    // I define the logic for a simple responsive grid based on screen width.
    int crossAxisCount = 1;
    if (size.width > 1100) {
      crossAxisCount = 3;
    } else if (size.width > 700) {
      crossAxisCount = 2;
    }

    // I dynamically adjust the lateral padding.
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
            children: _projects.map((project) => ProjectCard(
              title: project.title,
              description: project.description,
              tags: project.tags,
              githubUrl: project.githubUrl,
              demoUrl: project.demoUrl,
            )).toList(),
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
                path: widget.profile.email,
                queryParameters: {'subject': 'Hello ${widget.profile.name}!'},
              );
              if (await canLaunchUrl(emailLaunchUri)) {
                await launchUrl(emailLaunchUri);
              }
            },
            icon: const Icon(Icons.email_outlined),
            label: Text(widget.profile.email, style: GoogleFonts.jetBrainsMono()),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: AppTheme.background,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
          ),
          const SizedBox(height: 48),
          Text(
            l10n.footerText(widget.profile.name),
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