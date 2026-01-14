import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../theme/app_theme.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tags;
  final String? githubUrl;
  final String? demoUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.tags,
    this.githubUrl,
    this.demoUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _isHovered
            ? Matrix4.translationValues(0, -5, 0)
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppTheme.surface.withValues(alpha: 0.4),
          border: Border.all(
            color: _isHovered ? AppTheme.primary : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primary.withValues(alpha: 0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: _isHovered
                          ? AppTheme.primary
                          : AppTheme.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.tags.map((tag) => _buildTag(tag)).toList(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (widget.githubUrl != null)
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github),
                          color: _isHovered
                              ? AppTheme.primary
                              : AppTheme.textSecondary,
                          onPressed: () => _launchUrl(widget.githubUrl!),
                        ),
                      if (widget.demoUrl != null)
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.upRightFromSquare,
                          ),
                          color: _isHovered
                              ? AppTheme.primary
                              : AppTheme.textSecondary,
                          onPressed: () => _launchUrl(widget.demoUrl!),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.background.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.codeComment.withValues(alpha: 0.5)),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          color: AppTheme.codeComment,
          fontSize: 12,
          fontFamily: 'JetBrains Mono',
        ),
      ),
    );
  }
}
