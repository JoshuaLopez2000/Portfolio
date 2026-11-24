import 'dart:ui';

import 'package:material_ui/material_ui.dart';
import 'package:untitled/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../features/projects/domain/entities/project.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_theme.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tags;
  final String? githubUrl;
  final String? demoUrl;
  final String? youtubeUrl;
  final String? previewImage;
  final List<ProjectMedia> previewMedia;
  final ProjectCaseStudy? caseStudy;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tags,
    this.githubUrl,
    this.demoUrl,
    this.youtubeUrl,
    this.previewImage,
    this.previewMedia = const [],
    this.caseStudy,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  int _currentMediaIndex = 0;

  List<ProjectMedia> get _mediaItems {
    if (widget.previewMedia.isNotEmpty) {
      return widget.previewMedia;
    }
    if (widget.previewImage != null && widget.previewImage!.isNotEmpty) {
      return [
        ProjectMedia(assetOrUrl: widget.previewImage, label: widget.title),
      ];
    }
    return const [];
  }

  void _stepMedia(int delta) {
    final count = _mediaItems.length;
    if (count <= 1) return;
    setState(() {
      _currentMediaIndex = (_currentMediaIndex + delta + count) % count;
    });
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _playVideo(String url) {
    final videoId = _convertUrlToId(url);
    if (videoId == null) return;

    final controller = YoutubePlayerController.fromVideoId(
      videoId: videoId,
      autoPlay: true,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(16),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                YoutubePlayer(controller: controller, aspectRatio: 16 / 9),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openMediaPreview(int initialIndex) {
    final items = _mediaItems;
    if (items.isEmpty) return;

    int activeIndex = initialIndex.clamp(0, items.length - 1);

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) {
          final active = items[activeIndex];
          return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960, maxHeight: 720),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.background.withValues(alpha: 0.96),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.border,
                      width: 1.2,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(56, 48, 56, 68),
                          child: active.isPlaceholder
                              ? _buildMediaPlaceholderSlot(
                                  active,
                                  isExpanded: true,
                                )
                              : InteractiveViewer(
                                  minScale: 1.0,
                                  maxScale: 3.0,
                                  child: Center(
                                    child: _buildPreviewImage(
                                      active.assetOrUrl!,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      if (items.length > 1) ...[
                        Positioned(
                          left: 8,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: IconButton(
                              icon: const Icon(
                                Icons.chevron_left,
                                color: AppTheme.primary,
                                size: 32,
                              ),
                              onPressed: () => setDialogState(() {
                                activeIndex =
                                    (activeIndex - 1 + items.length) %
                                    items.length;
                              }),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 0,
                          bottom: 0,
                          child: Center(
                            child: IconButton(
                              icon: const Icon(
                                Icons.chevron_right,
                                color: AppTheme.primary,
                                size: 32,
                              ),
                              onPressed: () => setDialogState(() {
                                activeIndex = (activeIndex + 1) % items.length;
                              }),
                            ),
                          ),
                        ),
                      ],
                      Positioned(
                        top: 8,
                        right: 8,
                        child: IconButton(
                          icon: const Icon(
                            Icons.close,
                            color: AppTheme.textPrimary,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 14,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              items.length > 1
                                  ? '${widget.title} · ${active.label}'
                                  : widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: AppTheme.mono(
                                fontSize: 13,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            if (items.length > 1) ...[
                              const SizedBox(height: 8),
                              _buildMediaDots(items.length, activeIndex),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? _convertUrlToId(String url) {
    return YoutubePlayerController.convertUrlToId(url);
  }

  void _openCaseStudy() {
    final cs = widget.caseStudy;
    if (cs == null) return;
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780, maxHeight: 760),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppTheme.border, width: 1.2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(24, 18, 12, 16),
                    decoration: const BoxDecoration(
                      color: AppTheme.background,
                      border: Border(
                        bottom: BorderSide(color: AppTheme.border),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: 8,
                                runSpacing: 6,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 9,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppTheme.primary.withValues(
                                        alpha: 0.14,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: AppTheme.primary.withValues(
                                          alpha: 0.45,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      cs.category,
                                      style: AppTheme.mono(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: AppTheme.primary,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    cs.period,
                                    style: AppTheme.mono(
                                      fontSize: 11,
                                      color: AppTheme.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.title,
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(
                                      color: AppTheme.textPrimary,
                                      fontSize: 22,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${l10n.caseStudyRole}: ${cs.role}',
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: AppTheme.secondary,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close_rounded,
                            color: AppTheme.textSecondary,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _CaseStudyBlock(
                            icon: Icons.flag_outlined,
                            title: l10n.caseStudyProblem,
                            body: cs.problem,
                          ),
                          const SizedBox(height: 18),
                          _CaseStudyBlock(
                            icon: Icons.architecture_rounded,
                            title: l10n.caseStudySolution,
                            body: cs.solution,
                          ),
                          const SizedBox(height: 18),
                          Row(
                            children: [
                              const Icon(
                                Icons.check_circle_outline_rounded,
                                size: 17,
                                color: AppTheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                l10n.caseStudyHighlights,
                                style: Theme.of(context).textTheme.titleSmall
                                    ?.copyWith(
                                      color: AppTheme.textPrimary,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          for (final item in cs.highlights)
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
                                        color: AppTheme.primary,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      item,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppTheme.textSecondary,
                                            height: 1.55,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          const SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppTheme.primary.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppTheme.primary.withValues(alpha: 0.35),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.caseStudyImpact.toUpperCase(),
                                  style: AppTheme.mono(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: AppTheme.primary,
                                    letterSpacing: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  cs.impact,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: AppTheme.textPrimary,
                                        height: 1.55,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: widget.tags
                                .map((tag) => _buildTag(tag))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    decoration: const BoxDecoration(
                      color: AppTheme.background,
                      border: Border(top: BorderSide(color: AppTheme.border)),
                    ),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.end,
                      children: [
                        if (widget.githubUrl != null)
                          _CardActionButton(
                            icon: const AppIcon(AppIcons.github),
                            label: l10n.actionCode,
                            onTap: () => _launchUrl(widget.githubUrl!),
                          ),
                        if (widget.demoUrl != null)
                          _CardActionButton(
                            icon: const AppIcon(AppIcons.externalLink),
                            label: l10n.actionDemo,
                            highlight: true,
                            onTap: () => _launchUrl(widget.demoUrl!),
                          ),
                        if (widget.youtubeUrl != null)
                          _CardActionButton(
                            icon: const AppIcon(AppIcons.youtube),
                            label: l10n.actionVideo,
                            onTap: () {
                              Navigator.of(context).pop();
                              _playVideo(widget.youtubeUrl!);
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreviewImage(String source, {BoxFit fit = BoxFit.cover}) {
    final isNetwork =
        source.startsWith('http://') || source.startsWith('https://');
    if (isNetwork) {
      return Image.network(
        source,
        fit: fit,
        errorBuilder: (_, _, _) => _buildPlaceholderPreview(),
      );
    }
    return Image.asset(
      source,
      fit: fit,
      errorBuilder: (_, _, _) => _buildPlaceholderPreview(),
    );
  }

  Widget _buildPlaceholderPreview() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.background, AppTheme.surfaceElevated],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: _isHovered
                      ? AppTheme.primary.withValues(alpha: 0.6)
                      : AppTheme.border,
                ),
              ),
              child: Icon(
                Icons.web_asset_rounded,
                size: 34,
                color: _isHovered ? AppTheme.primary : AppTheme.textSecondary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'flutter_web',
              style: AppTheme.mono(fontSize: 12, color: AppTheme.textMuted),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMediaPlaceholderSlot(
    ProjectMedia item, {
    bool isExpanded = false,
  }) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.background, AppTheme.surfaceElevated],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isExpanded ? 32 : 44,
        vertical: isExpanded ? 24 : 18,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface.withValues(alpha: 0.78),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isHovered || isExpanded
                ? AppTheme.primary.withValues(alpha: 0.5)
                : AppTheme.border,
            width: 1.2,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.perm_media_outlined,
              size: isExpanded ? 42 : 28,
              color: _isHovered || isExpanded
                  ? AppTheme.primary
                  : AppTheme.secondary,
            ),
            const SizedBox(height: 10),
            Text(
              item.label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppTheme.textPrimary,
                fontSize: isExpanded ? 16 : 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (item.hint != null) ...[
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                  color: AppTheme.background.withValues(alpha: 0.75),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Text(
                  item.hint!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.mono(
                    fontSize: 10.5,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMediaDots(int count, int activeIndex) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 16 : 6,
          height: 6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: isActive
                ? AppTheme.primary
                : AppTheme.textSecondary.withValues(alpha: 0.45),
          ),
        );
      }),
    );
  }

  Widget _buildMediaSlide(ProjectMedia item) {
    if (item.isPlaceholder) {
      return _buildMediaPlaceholderSlot(item);
    }
    final source = item.assetOrUrl!;
    return AnimatedScale(
      scale: _isHovered ? 1.03 : 1.0,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOut,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (item.isGif)
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [AppTheme.surfaceElevated, AppTheme.background],
                  radius: 0.9,
                ),
              ),
            )
          else ...[
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: _buildPreviewImage(source, fit: BoxFit.cover),
            ),
            Container(color: AppTheme.background.withValues(alpha: 0.52)),
          ],
          Center(child: _buildPreviewImage(source, fit: BoxFit.contain)),
        ],
      ),
    );
  }

  Widget _buildPreviewHeader() {
    final items = _mediaItems;
    final hasMedia = items.isNotEmpty;
    final safeIndex =
        hasMedia ? _currentMediaIndex.clamp(0, items.length - 1) : 0;
    final activeItem = hasMedia ? items[safeIndex] : null;

    final previewContent = activeItem == null
        ? _buildPlaceholderPreview()
        : GestureDetector(
            onTap: () => _openMediaPreview(safeIndex),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 240),
                    child: KeyedSubtree(
                      key: ValueKey('$safeIndex-${activeItem.label}'),
                      child: _buildMediaSlide(activeItem),
                    ),
                  ),
                  if (!activeItem.isPlaceholder)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      height: 36,
                      child: IgnorePointer(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                AppTheme.surface.withValues(alpha: 0.72),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (items.length > 1) ...[
                    Positioned(
                      left: 8,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: _MediaNavButton(
                          icon: Icons.chevron_left_rounded,
                          onTap: () => _stepMedia(-1),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: _MediaNavButton(
                          icon: Icons.chevron_right_rounded,
                          onTap: () => _stepMedia(1),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 8,
                      child: Center(
                        child: _buildMediaDots(items.length, safeIndex),
                      ),
                    ),
                  ],
                  if (activeItem.isGif || items.any((item) => item.isGif))
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IgnorePointer(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.background.withValues(alpha: 0.82),
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: activeItem.isGif
                                  ? AppTheme.primary.withValues(alpha: 0.7)
                                  : AppTheme.border,
                            ),
                          ),
                          child: Text(
                            activeItem.isGif ? 'GIF' : 'IMG · GIF',
                            style: AppTheme.mono(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: activeItem.isGif
                                  ? AppTheme.primary
                                  : AppTheme.textSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: AnimatedOpacity(
                      opacity: _isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 180),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppTheme.background.withValues(alpha: 0.82),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.primary.withValues(alpha: 0.45),
                          ),
                        ),
                        child: const Icon(
                          Icons.open_in_full_rounded,
                          size: 15,
                          color: AppTheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 196,
          width: double.infinity,
          child: ClipRect(child: previewContent),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          height: 1,
          width: double.infinity,
          color: _isHovered
              ? AppTheme.primary.withValues(alpha: 0.35)
              : AppTheme.border,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        transform: _isHovered
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppTheme.surface,
          border: Border.all(
            color: _isHovered
                ? AppTheme.primary.withValues(alpha: 0.65)
                : AppTheme.border,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.42 : 0.22),
              blurRadius: _isHovered ? 24 : 12,
              offset: Offset(0, _isHovered ? 12 : 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPreviewHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: _isHovered
                              ? AppTheme.primary
                              : AppTheme.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textSecondary,
                          fontSize: 13.5,
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: widget.tags
                            .map((tag) => _buildTag(tag))
                            .toList(),
                      ),
                      const SizedBox(height: 14),
                      const Divider(color: AppTheme.border, height: 1),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (widget.caseStudy != null)
                            _CardActionButton(
                              icon: const Icon(Icons.article_outlined),
                              label: l10n.actionCaseStudy,
                              highlight: true,
                              onTap: _openCaseStudy,
                            ),
                          if (widget.githubUrl != null)
                            _CardActionButton(
                              icon: const AppIcon(AppIcons.github),
                              label: l10n.actionCode,
                              onTap: () => _launchUrl(widget.githubUrl!),
                            ),
                          if (widget.demoUrl != null)
                            _CardActionButton(
                              icon: const AppIcon(AppIcons.externalLink),
                              label: l10n.actionDemo,
                              highlight: widget.caseStudy == null,
                              onTap: () => _launchUrl(widget.demoUrl!),
                            ),
                          if (widget.youtubeUrl != null)
                            _CardActionButton(
                              icon: const AppIcon(AppIcons.youtube),
                              label: l10n.actionVideo,
                              onTap: () => _playVideo(widget.youtubeUrl!),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
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
    );
  }
}

class _CardActionButton extends StatefulWidget {
  final Widget icon;
  final String label;
  final VoidCallback onTap;
  final bool highlight;

  const _CardActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.highlight = false,
  });

  @override
  State<_CardActionButton> createState() => _CardActionButtonState();
}

class _CardActionButtonState extends State<_CardActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.highlight || _isHovered
        ? AppTheme.primary
        : AppTheme.textSecondary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.primary.withValues(alpha: 0.12)
                : AppTheme.surfaceElevated.withValues(alpha: 0.7),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered || widget.highlight
                  ? AppTheme.primary.withValues(alpha: 0.55)
                  : AppTheme.border,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconTheme(
                data: IconThemeData(size: 13, color: activeColor),
                child: widget.icon,
              ),
              const SizedBox(width: 6),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: _isHovered || widget.highlight
                      ? AppTheme.textPrimary
                      : AppTheme.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MediaNavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _MediaNavButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.background.withValues(alpha: 0.78),
      shape: const CircleBorder(
        side: BorderSide(color: AppTheme.border),
      ),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(icon, size: 18, color: AppTheme.textPrimary),
        ),
      ),
    );
  }
}

class _CaseStudyBlock extends StatelessWidget {
  final IconData icon;
  final String title;
  final String body;

  const _CaseStudyBlock({
    required this.icon,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 17, color: AppTheme.primary),
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppTheme.textSecondary,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}
