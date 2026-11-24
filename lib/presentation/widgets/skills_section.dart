import 'package:flutter/material.dart';
import 'package:untitled/features/skills/domain/entities/skill.dart';
import 'package:untitled/injection_container.dart';
import 'package:untitled/l10n/app_localizations.dart';

import '../../theme/app_icons.dart';
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

  IconData _getIconForCode(String code) {
    switch (code) {
      case 'flutter':
        return AppIcons.flutter;
      case 'unity':
        return AppIcons.unity;
      case 'cube':
        return AppIcons.cube;
      case 'gamepad':
        return AppIcons.gamepad;
      case 'git-alt':
        return AppIcons.gitAlt;
      case 'mobile-alt':
        return AppIcons.mobile;
      case 'python':
        return AppIcons.python;
      case 'code':
        return AppIcons.code;
      case 'js':
        return AppIcons.js;
      case 'docker':
        return AppIcons.docker;
      case 'linux':
        return AppIcons.linux;
      case 'aws':
        return AppIcons.aws;
      case 'database':
        return AppIcons.database;
      default:
        return AppIcons.code;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppTheme.primary),
      );
    }

    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 900;

    final groups = [
      (
        title: l10n.skillCategoryMobile,
        icon: Icons.devices_rounded,
        skills: _skills
            .where((s) => s.category == SkillCategory.mobile)
            .toList(),
      ),
      (
        title: l10n.skillCategoryInteractive,
        icon: Icons.view_in_ar_rounded,
        skills: _skills
            .where((s) => s.category == SkillCategory.interactive)
            .toList(),
      ),
      (
        title: l10n.skillCategoryBackend,
        icon: Icons.dns_outlined,
        skills: _skills
            .where((s) => s.category == SkillCategory.backendTools)
            .toList(),
      ),
    ];

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 48 : 20,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.skillsEyebrow,
                style: AppTheme.mono(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary,
                  letterSpacing: 1.4,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.techStack,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppTheme.textPrimary,
                  fontSize: isDesktop ? 36 : 28,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                l10n.skillsSubtitle,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(height: 32),
              if (isDesktop)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (int i = 0; i < groups.length; i++) ...[
                        Expanded(
                          child: _SkillCategoryCard(
                            title: groups[i].title,
                            icon: groups[i].icon,
                            skills: groups[i].skills,
                            iconResolver: _getIconForCode,
                          ),
                        ),
                        if (i < groups.length - 1) const SizedBox(width: 20),
                      ],
                    ],
                  ),
                )
              else
                Column(
                  children: [
                    for (int i = 0; i < groups.length; i++) ...[
                      _SkillCategoryCard(
                        title: groups[i].title,
                        icon: groups[i].icon,
                        skills: groups[i].skills,
                        iconResolver: _getIconForCode,
                      ),
                      if (i < groups.length - 1) const SizedBox(height: 16),
                    ],
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Skill> skills;
  final IconData Function(String) iconResolver;

  const _SkillCategoryCard({
    required this.title,
    required this.icon,
    required this.skills,
    required this.iconResolver,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Icon(icon, size: 18, color: AppTheme.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills
                .map(
                  (skill) => _SkillChip(
                    icon: iconResolver(skill.iconCode),
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

class _SkillChip extends StatefulWidget {
  final IconData icon;
  final String label;

  const _SkillChip({required this.icon, required this.label});

  @override
  State<_SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<_SkillChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
          color: _isHovered
              ? AppTheme.primary.withValues(alpha: 0.1)
              : AppTheme.surfaceElevated,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: _isHovered
                ? AppTheme.primary.withValues(alpha: 0.6)
                : AppTheme.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(
              widget.icon,
              size: 15,
              color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                widget.label,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppTheme.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
