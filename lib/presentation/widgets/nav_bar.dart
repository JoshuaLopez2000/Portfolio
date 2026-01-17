import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/l10n/app_localizations.dart';
import 'package:untitled/main.dart'; // Import to access setLocale
import '../../theme/app_theme.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onProjectsTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onProjectsTap,
    required this.onSkillsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      color: AppTheme.background.withValues(alpha: 0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '< Joshua />',
            style: GoogleFonts.jetBrainsMono(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
          if (isDesktop)
            Row(
              children: [
                _NavLink(title: l10n.navProjects, onTap: onProjectsTap),
                const SizedBox(width: 32),
                _NavLink(title: l10n.navSkills, onTap: onSkillsTap),
                const SizedBox(width: 32),
                _NavLink(title: l10n.navContact, onTap: onContactTap),
                const SizedBox(width: 32),
                _LanguageSwitcher(currentLocale: currentLocale),
              ],
            )
          else
            Row(
              children: [
                _LanguageSwitcher(currentLocale: currentLocale),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.menu, color: AppTheme.primary),
                  onPressed: () {
                    // Future: Implement mobile drawer with same callbacks
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _LanguageSwitcher extends StatelessWidget {
  final Locale currentLocale;

  const _LanguageSwitcher({required this.currentLocale});

  @override
  Widget build(BuildContext context) {
    final isEn = currentLocale.languageCode == 'en';
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final newLocale = isEn ? const Locale('es') : const Locale('en');
          MiPortfolioApp.setLocale(context, newLocale);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.primary),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            isEn ? 'EN' : 'ES',
            style: GoogleFonts.jetBrainsMono(
              color: AppTheme.primary,
              fontWeight: FontWeight.bold,
            ),
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
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Text(
            widget.title,
            style: GoogleFonts.jetBrainsMono(
              color: _isHovered ? AppTheme.primary : AppTheme.textPrimary,
              fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
