import 'dart:async';

import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';
import 'package:untitled/features/projects/domain/entities/project.dart';
import 'package:untitled/injection_container.dart';
import 'package:untitled/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_icons.dart';
import '../../theme/app_theme.dart';
import '../widgets/experience_section.dart';
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
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  List<Project> _projects = [];
  bool _isProjectsLoading = true;
  bool _footerEmailCopied = false;
  Timer? _copiedTimer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
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
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _launchExternal(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: widget.profile.email,
      queryParameters: {'subject': 'Hello ${widget.profile.name}!'},
    );
    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  Future<void> _openCv(BuildContext context) async {
    final locale = Localizations.localeOf(context).languageCode;
    final cvPath = widget.profile.cvPathForLocale(locale);
    if (cvPath == null) return;
    final uri = Uri.base.resolve(cvPath);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _copyEmail() async {
    final l10n = AppLocalizations.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    await Clipboard.setData(ClipboardData(text: widget.profile.email));
    if (!mounted) return;
    _copiedTimer?.cancel();
    setState(() => _footerEmailCopied = true);
    _copiedTimer = Timer(const Duration(seconds: 2), () {
      if (mounted) setState(() => _footerEmailCopied = false);
    });
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${l10n.emailCopied}: ${widget.profile.email}'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppTheme.surfaceElevated,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  void dispose() {
    _copiedTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppTheme.background,
      endDrawer: Drawer(
        backgroundColor: AppTheme.surface,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.profile.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      l10n.heroHeadline,
                      style: AppTheme.mono(
                        fontSize: 12,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: AppTheme.border, height: 1),
              const SizedBox(height: 8),
              ListTile(
                leading: const Icon(
                  Icons.work_outline_rounded,
                  color: AppTheme.primary,
                ),
                title: Text(l10n.navProjects),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_projectsKey);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.timeline_rounded,
                  color: AppTheme.primary,
                ),
                title: Text(l10n.navExperience),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_experienceKey);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.layers_outlined,
                  color: AppTheme.primary,
                ),
                title: Text(l10n.navSkills),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_skillsKey);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.mail_outline_rounded,
                  color: AppTheme.primary,
                ),
                title: Text(l10n.navContact),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(_contactKey);
                },
              ),
              const Spacer(),
              const Divider(color: AppTheme.border, height: 1),
              ListTile(
                leading: const Icon(
                  Icons.download_rounded,
                  size: 18,
                  color: AppTheme.primary,
                ),
                title: Text(l10n.downloadCv),
                onTap: () {
                  Navigator.pop(context);
                  _openCv(context);
                },
              ),
              if (widget.profile.githubUrl != null)
                ListTile(
                  leading: const AppIcon(
                    AppIcons.github,
                    size: 18,
                    color: AppTheme.textSecondary,
                  ),
                  title: const Text('GitHub'),
                  onTap: () {
                    Navigator.pop(context);
                    _launchExternal(widget.profile.githubUrl!);
                  },
                ),
              if (widget.profile.linkedinUrl != null)
                ListTile(
                  leading: const AppIcon(
                    AppIcons.linkedin,
                    size: 18,
                    color: AppTheme.textSecondary,
                  ),
                  title: const Text('LinkedIn'),
                  onTap: () {
                    Navigator.pop(context);
                    _launchExternal(widget.profile.linkedinUrl!);
                  },
                ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: StudioBackgroundPainter())),
          Column(
            children: [
              NavBar(
                profile: widget.profile,
                onProjectsTap: () => _scrollToSection(_projectsKey),
                onExperienceTap: () => _scrollToSection(_experienceKey),
                onSkillsTap: () => _scrollToSection(_skillsKey),
                onContactTap: () => _scrollToSection(_contactKey),
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HeroSection(
                        profile: widget.profile,
                        onViewProjectsTap: () => _scrollToSection(_projectsKey),
                        onContactTap: () => _scrollToSection(_contactKey),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        key: _projectsKey,
                        child: _buildProjectsSection(context),
                      ),
                      const SizedBox(height: 76),
                      Container(
                        key: _experienceKey,
                        child: ExperienceSection(profile: widget.profile),
                      ),
                      const SizedBox(height: 68),
                      Container(key: _skillsKey, child: const SkillsSection()),
                      const SizedBox(height: 84),
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
      return const Center(
        child: CircularProgressIndicator(color: AppTheme.primary),
      );
    }
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context)!;
    final isDesktop = size.width > 900;

    int crossAxisCount = 1;
    if (size.width > 1080) {
      crossAxisCount = 3;
    } else if (size.width > 700) {
      crossAxisCount = 2;
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 48 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.projectsEyebrow,
                style: AppTheme.mono(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary,
                  letterSpacing: 1.4,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.selectedProjects,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppTheme.textPrimary,
                  fontSize: isDesktop ? 36 : 28,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.projectsSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 36),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  mainAxisExtent: 555,
                ),
                itemCount: _projects.length,
                itemBuilder: (context, index) {
                  final project = _projects[index];
                  return ProjectCard(
                    title: project.title,
                    description: project.description,
                    tags: project.tags,
                    githubUrl: project.githubUrl,
                    demoUrl: project.demoUrl,
                    youtubeUrl: project.youtubeUrl,
                    previewImage: project.previewImage,
                    previewMedia: project.previewMedia,
                    caseStudy: project.caseStudy,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isDesktop = MediaQuery.of(context).size.width > 900;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(top: BorderSide(color: AppTheme.border, width: 1)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 56,
              horizontal: isDesktop ? 48 : 20,
            ),
            child: Column(
              children: [
                Text(
                  l10n.contactEyebrow,
                  style: AppTheme.mono(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primary,
                    letterSpacing: 1.4,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.navContact,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppTheme.textPrimary,
                    fontSize: isDesktop ? 32 : 26,
                  ),
                ),
                const SizedBox(height: 12),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Text(
                    l10n.contactMsg,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 28),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: _launchEmail,
                      icon: const Icon(Icons.email_outlined, size: 18),
                      label: Text(widget.profile.email),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primary,
                        foregroundColor: AppTheme.background,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        textStyle: Theme.of(context).textTheme.labelLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: _copyEmail,
                      icon: Icon(
                        _footerEmailCopied
                            ? Icons.check_rounded
                            : Icons.copy_rounded,
                        size: 16,
                        color: _footerEmailCopied
                            ? AppTheme.primary
                            : AppTheme.textPrimary,
                      ),
                      label: Text(
                        _footerEmailCopied ? l10n.emailCopied : l10n.copyEmail,
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _footerEmailCopied
                            ? AppTheme.primary
                            : AppTheme.textPrimary,
                        side: BorderSide(
                          color: _footerEmailCopied
                              ? AppTheme.primary
                              : AppTheme.border,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () => _openCv(context),
                      icon: const Icon(Icons.download_rounded, size: 16),
                      label: Text(l10n.downloadCv),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.textPrimary,
                        side: const BorderSide(color: AppTheme.border),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    if (widget.profile.githubUrl != null)
                      OutlinedButton.icon(
                        onPressed: () =>
                            _launchExternal(widget.profile.githubUrl!),
                        icon: const AppIcon(AppIcons.github, size: 16),
                        label: const Text('GitHub'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.textPrimary,
                          side: const BorderSide(color: AppTheme.border),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    if (widget.profile.linkedinUrl != null)
                      OutlinedButton.icon(
                        onPressed: () =>
                            _launchExternal(widget.profile.linkedinUrl!),
                        icon: const AppIcon(AppIcons.linkedin, size: 16),
                        label: const Text('LinkedIn'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.textPrimary,
                          side: const BorderSide(color: AppTheme.border),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 44),
                const Divider(color: AppTheme.border, height: 1),
                const SizedBox(height: 20),
                Text(
                  l10n.footerText(widget.profile.name),
                  style: AppTheme.mono(
                    fontSize: 12,
                    color: AppTheme.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudioBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final topGlow = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.0, -1.0),
        radius: 1.15,
        colors: [
          AppTheme.primary.withValues(alpha: 0.08),
          AppTheme.secondary.withValues(alpha: 0.04),
          Colors.transparent,
        ],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), topGlow);

    final gridPaint = Paint()
      ..color = AppTheme.border.withValues(alpha: 0.22)
      ..strokeWidth = 1;

    const double gridSize = 48;

    for (double x = 0; x < size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }

    for (double y = 0; y < size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
