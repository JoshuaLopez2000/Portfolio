import 'package:flutter/material.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';
import 'package:untitled/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_icons.dart';
import '../../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjectsTap;
  final VoidCallback onContactTap;
  final Profile profile;

  const HeroSection({
    super.key,
    required this.onViewProjectsTap,
    required this.onContactTap,
    required this.profile,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: profile.email,
      queryParameters: {'subject': 'Hello ${profile.name}!'},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 900;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1240),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 48 : 20,
            vertical: isDesktop ? 72 : 44,
          ),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 6, child: _buildTextContent(context, true)),
                    const SizedBox(width: 48),
                    Expanded(flex: 5, child: _buildProfileSummaryCard(context)),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextContent(context, false),
                    const SizedBox(height: 36),
                    _buildProfileSummaryCard(context),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isDesktop) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppTheme.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  l10n.heroBadge,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.mono(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Text(
          l10n.greeting(profile.name),
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontSize: isDesktop ? 54 : 38,
            height: 1.08,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppTheme.primary, AppTheme.secondary],
          ).createShader(bounds),
          child: Text(
            l10n.heroHeadline,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: isDesktop ? 26 : 21,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            l10n.introText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppTheme.textSecondary,
              fontSize: 16,
              height: 1.65,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: onViewProjectsTap,
              icon: const Icon(Icons.arrow_downward_rounded, size: 18),
              label: Text(l10n.viewProjects),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: AppTheme.background,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onContactTap,
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: Text(l10n.contactMe),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.textPrimary,
                side: const BorderSide(color: AppTheme.border, width: 1.2),
                backgroundColor: AppTheme.surface.withValues(alpha: 0.6),
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            if (profile.githubUrl != null)
              _SocialPill(
                icon: const AppIcon(AppIcons.github),
                label: 'GitHub',
                onTap: () => _launchUrl(profile.githubUrl!),
              ),
            if (profile.linkedinUrl != null)
              _SocialPill(
                icon: const AppIcon(AppIcons.linkedin),
                label: 'LinkedIn',
                onTap: () => _launchUrl(profile.linkedinUrl!),
              ),
            _SocialPill(
              icon: const Icon(Icons.mail_outline_rounded),
              label: profile.email,
              onTap: _launchEmail,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProfileSummaryCard(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 28,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.heroCardTitle.toUpperCase(),
                style: AppTheme.mono(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary,
                  letterSpacing: 1.2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceElevated,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Text(
                  'Flutter · Unity · XR',
                  style: AppTheme.mono(
                    fontSize: 11,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _FocusRow(
            index: '01',
            icon: Icons.devices_rounded,
            title: l10n.heroFocus1Title,
            subtitle: l10n.heroFocus1Subtitle,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(color: AppTheme.border, height: 1),
          ),
          _FocusRow(
            index: '02',
            icon: Icons.view_in_ar_rounded,
            title: l10n.heroFocus2Title,
            subtitle: l10n.heroFocus2Subtitle,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Divider(color: AppTheme.border, height: 1),
          ),
          _FocusRow(
            index: '03',
            icon: Icons.cloud_done_outlined,
            title: l10n.heroFocus3Title,
            subtitle: l10n.heroFocus3Subtitle,
          ),
        ],
      ),
    );
  }
}

class _FocusRow extends StatelessWidget {
  final String index;
  final IconData icon;
  final String title;
  final String subtitle;

  const _FocusRow({
    required this.index,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppTheme.surfaceElevated,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.border),
          ),
          child: Icon(icon, size: 20, color: AppTheme.primary),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    index,
                    style: AppTheme.mono(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.secondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppTheme.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialPill extends StatefulWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;

  const _SocialPill({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialPill> createState() => _SocialPillState();
}

class _SocialPillState extends State<_SocialPill> {
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
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.surfaceElevated
                : AppTheme.surface.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primary.withValues(alpha: 0.7)
                  : AppTheme.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconTheme(
                data: IconThemeData(
                  size: 14,
                  color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
                ),
                child: widget.icon,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: AppTheme.mono(
                  fontSize: 12,
                  color: _isHovered
                      ? AppTheme.textPrimary
                      : AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
