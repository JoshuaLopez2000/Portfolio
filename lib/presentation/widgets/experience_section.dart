import 'package:flutter/material.dart';
import 'package:untitled/features/experience/domain/entities/experience.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';
import 'package:untitled/injection_container.dart';
import 'package:untitled/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_theme.dart';

class ExperienceSection extends StatefulWidget {
  final Profile profile;

  const ExperienceSection({super.key, required this.profile});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  ExperienceSummary? _summary;
  bool _isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadExperience();
  }

  Future<void> _loadExperience() async {
    final locale = Localizations.localeOf(context).languageCode;
    final summary = await sl.getExperience(lang: locale);
    if (mounted) {
      setState(() {
        _summary = summary;
        _isLoading = false;
      });
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

  @override
  Widget build(BuildContext context) {
    if (_isLoading || _summary == null) {
      return const Center(
        child: CircularProgressIndicator(color: AppTheme.primary),
      );
    }

    final summary = _summary!;
    final l10n = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 900;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 48 : 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.experienceEyebrow,
                          style: AppTheme.mono(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primary,
                            letterSpacing: 1.4,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.experienceTitle,
                          style: Theme.of(context).textTheme.displayMedium
                              ?.copyWith(
                                color: AppTheme.textPrimary,
                                fontSize: isDesktop ? 36 : 28,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.experienceSubtitle,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: AppTheme.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  if (isDesktop) ...[
                    const SizedBox(width: 24),
                    _buildCvButton(context, l10n),
                  ],
                ],
              ),
              if (!isDesktop) ...[
                const SizedBox(height: 18),
                _buildCvButton(context, l10n),
              ],
              const SizedBox(height: 32),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          for (int i = 0; i < summary.experiences.length; i++)
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: i < summary.experiences.length - 1
                                    ? 18
                                    : 0,
                              ),
                              child: _ExperienceCard(
                                item: summary.experiences[i],
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      flex: 4,
                      child: _EducationCard(
                        title: l10n.educationTitle,
                        education: summary.education,
                        spokenLanguages: summary.spokenLanguages,
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    for (int i = 0; i < summary.experiences.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _ExperienceCard(item: summary.experiences[i]),
                      ),
                    _EducationCard(
                      title: l10n.educationTitle,
                      education: summary.education,
                      spokenLanguages: summary.spokenLanguages,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCvButton(BuildContext context, AppLocalizations l10n) {
    return OutlinedButton.icon(
      onPressed: () => _openCv(context),
      icon: const Icon(Icons.download_rounded, size: 18),
      label: Text(l10n.downloadCv),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primary,
        side: BorderSide(color: AppTheme.primary.withValues(alpha: 0.6)),
        backgroundColor: AppTheme.primary.withValues(alpha: 0.08),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final ExperienceItem item;

  const _ExperienceCard({required this.item});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppTheme.primary.withValues(alpha: 0.55)
                : AppTheme.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 8,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.role,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${item.company} · ${item.location}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: item.isCurrent
                        ? AppTheme.primary.withValues(alpha: 0.14)
                        : AppTheme.surfaceElevated,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: item.isCurrent
                          ? AppTheme.primary.withValues(alpha: 0.5)
                          : AppTheme.border,
                    ),
                  ),
                  child: Text(
                    item.period,
                    style: AppTheme.mono(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: item.isCurrent
                          ? AppTheme.primary
                          : AppTheme.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            for (final bullet in item.highlights)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: AppTheme.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        bullet,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                          fontSize: 13.5,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (item.tags.isNotEmpty) ...[
              const SizedBox(height: 6),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: item.tags
                    .map(
                      (tag) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceElevated,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppTheme.border),
                        ),
                        child: Text(
                          tag,
                          style: AppTheme.mono(
                            fontSize: 11,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final String title;
  final List<EducationItem> education;
  final String spokenLanguages;

  const _EducationCard({
    required this.title,
    required this.education,
    required this.spokenLanguages,
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
                child: const Icon(
                  Icons.school_outlined,
                  size: 18,
                  color: AppTheme.primary,
                ),
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
          for (int i = 0; i < education.length; i++) ...[
            Text(
              education[i].degree,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              education[i].institution,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondary,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${education[i].period} · ${education[i].location}',
              style: AppTheme.mono(fontSize: 11, color: AppTheme.primary),
            ),
            if (i < education.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Divider(color: AppTheme.border, height: 1),
              ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: AppTheme.border, height: 1),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.translate_rounded,
                size: 16,
                color: AppTheme.secondary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  spokenLanguages,
                  style: AppTheme.mono(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
