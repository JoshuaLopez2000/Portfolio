import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/features/skills/domain/entities/skill.dart';
import 'package:untitled/injection_container.dart';
import 'package:untitled/l10n/app_localizations.dart';

import '../../theme/app_theme.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  List<Skill> _skills = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSkills();
  }

  Future<void> _loadSkills() async {
    final getSkills = sl.getSkills;
    final skills = await getSkills();
    if (mounted) {
      setState(() {
        _skills = skills;
        _isLoading = false;
      });
    }
  }

  final Map<String, IconData> _iconMap = {
    'flutter': FontAwesomeIcons.flutter,
    'unity': FontAwesomeIcons.unity,
    'cube': FontAwesomeIcons.cube,
    'gamepad': FontAwesomeIcons.gamepad,
    'git-alt': FontAwesomeIcons.gitAlt,
    'mobile-alt': FontAwesomeIcons.mobileAlt,
    'python': FontAwesomeIcons.python,
    'code': FontAwesomeIcons.code,
    'js': FontAwesomeIcons.js,
    'docker': FontAwesomeIcons.docker,
    'linux': FontAwesomeIcons.linux,
    'aws': FontAwesomeIcons.aws,
    'database': FontAwesomeIcons.database,
  };

  IconData _getIconForCode(String code) {
    return _iconMap[code] ?? FontAwesomeIcons.code;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppTheme.primary),
      );
    }

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
            children: _skills
                .map(
                  (skill) => _SkillItem(
                    icon: _getIconForCode(skill.iconCode),
                    label: skill.name,
                  ),
                )
                .toList(),
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
