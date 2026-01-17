import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.techStack,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppTheme.primary,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: const [
              _SkillItem(icon: FontAwesomeIcons.python, label: 'Python'),
              _SkillItem(icon: FontAwesomeIcons.code, label: 'Dart/Flutter'),
              _SkillItem(icon: FontAwesomeIcons.js, label: 'JavaScript'),
              _SkillItem(icon: FontAwesomeIcons.docker, label: 'Docker'),
              _SkillItem(icon: FontAwesomeIcons.linux, label: 'Linux'),
              _SkillItem(icon: FontAwesomeIcons.gitAlt, label: 'Git'),
              _SkillItem(icon: FontAwesomeIcons.aws, label: 'AWS'),
              _SkillItem(icon: FontAwesomeIcons.database, label: 'SQL'),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillItem extends StatefulWidget {
  final IconData icon;
  final String label;

  const _SkillItem({required this.icon, required this.label});

  @override
  State<_SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<_SkillItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              shape: BoxShape.circle,
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: AppTheme.primary.withValues(alpha: 0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: Icon(
              widget.icon,
              size: 40,
              color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.label,
            style: TextStyle(
              color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
              fontFamily: 'JetBrains Mono',
              fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
