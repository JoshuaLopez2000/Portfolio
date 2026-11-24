import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';
import 'package:untitled/l10n/app_localizations.dart';
import 'package:untitled/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_icons.dart';
import '../../theme/app_theme.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onExperienceTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onContactTap;
  final Profile profile;

  const NavBar({
    super.key,
    required this.onProjectsTap,
    required this.onExperienceTap,
    required this.onSkillsTap,
    required this.onContactTap,
    required this.profile,
  });

  Future<void> _launchExternal(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  String _initials(String fullName) {
    final parts = fullName.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return 'JL';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 860;
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.background.withValues(alpha: 0.86),
            border: const Border(
              bottom: BorderSide(color: AppTheme.border, width: 1),
            ),
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1240),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 48 : 20,
                  vertical: 14,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppTheme.primary, AppTheme.secondary],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _initials(profile.name),
                            style: AppTheme.mono(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.background,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          profile.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: AppTheme.textPrimary,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.2,
                              ),
                        ),
                      ],
                    ),
                    if (isDesktop)
                      Row(
                        children: [
                          _NavLink(
                            title: l10n.navProjects,
                            onTap: onProjectsTap,
                          ),
                          const SizedBox(width: 24),
                          _NavLink(
                            title: l10n.navExperience,
                            onTap: onExperienceTap,
                          ),
                          const SizedBox(width: 24),
                          _NavLink(title: l10n.navSkills, onTap: onSkillsTap),
                          const SizedBox(width: 24),
                          _NavLink(
                            title: l10n.navContact,
                            onTap: onContactTap,
                          ),
                          const SizedBox(width: 20),
                          Container(
                            width: 1,
                            height: 20,
                            color: AppTheme.border,
                          ),
                          const SizedBox(width: 14),
                          if (profile.githubUrl != null)
                            _NavIconLink(
                              icon: const AppIcon(AppIcons.github),
                              tooltip: 'GitHub',
                              onTap: () => _launchExternal(profile.githubUrl!),
                            ),
                          if (profile.linkedinUrl != null) ...[
                            const SizedBox(width: 6),
                            _NavIconLink(
                              icon: const AppIcon(AppIcons.linkedin),
                              tooltip: 'LinkedIn',
                              onTap: () =>
                                  _launchExternal(profile.linkedinUrl!),
                            ),
                          ],
                          const SizedBox(width: 14),
                          _LanguageSwitcher(currentLocale: currentLocale),
                        ],
                      )
                    else
                      Row(
                        children: [
                          _LanguageSwitcher(currentLocale: currentLocale),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(
                              Icons.menu_rounded,
                              color: AppTheme.textPrimary,
                            ),
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavIconLink extends StatefulWidget {
  final Widget icon;
  final String tooltip;
  final VoidCallback onTap;

  const _NavIconLink({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  @override
  State<_NavIconLink> createState() => _NavIconLinkState();
}

class _NavIconLinkState extends State<_NavIconLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _isHovered
                  ? AppTheme.surfaceElevated
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconTheme(
              data: IconThemeData(
                size: 17,
                color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
              ),
              child: widget.icon,
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageSwitcher extends StatefulWidget {
  final Locale currentLocale;

  const _LanguageSwitcher({required this.currentLocale});

  @override
  State<_LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<_LanguageSwitcher> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isEn = widget.currentLocale.languageCode == 'en';
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final newLocale = isEn ? const Locale('es') : const Locale('en');
          MiPortfolioApp.setLocale(context, newLocale);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: _isHovered ? AppTheme.surfaceElevated : AppTheme.surface,
            border: Border.all(
              color: _isHovered ? AppTheme.primary : AppTheme.border,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.language_rounded,
                size: 14,
                color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
              ),
              const SizedBox(width: 6),
              Text(
                isEn ? 'EN' : 'ES',
                style: AppTheme.mono(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink({required this.title, required this.onTap});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 180),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          child: Text(widget.title),
        ),
      ),
    );
  }
}
