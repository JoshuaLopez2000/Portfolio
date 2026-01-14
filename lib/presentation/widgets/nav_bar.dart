import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_theme.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      color: AppTheme.background.withValues(alpha: 0.9), // Slight transparency
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
                _NavLink(title: 'Projects', onTap: () {}),
                const SizedBox(width: 32),
                _NavLink(title: 'Skills', onTap: () {}),
                const SizedBox(width: 32),
                _NavLink(title: 'Contact', onTap: () {}),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.primary),
              onPressed: () {
                // Open drawer or modal
              },
            ),
        ],
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
