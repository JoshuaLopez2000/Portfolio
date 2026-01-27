import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:untitled/l10n/app_localizations.dart';
import '../../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewProjectsTap;
  final String name;

  const HeroSection({
    super.key,
    required this.onViewProjectsTap,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 100 : 24,
        vertical: 80,
      ),
      child: isDesktop
          ? Row(
              children: [
                Expanded(child: _buildTextContent(context)),
                Expanded(child: _buildVisualContent()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextContent(context),
                const SizedBox(height: 50),
                Center(child: _buildVisualContent()),
              ],
            ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.greeting(name),
          style: Theme.of(
            context,
          ).textTheme.displayMedium?.copyWith(color: AppTheme.primary),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontFamily: 'JetBrains Mono',
              color: AppTheme.textPrimary,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TypewriterAnimatedText(l10n.roleMobile),
                TypewriterAnimatedText(l10n.roleSoftware),
                TypewriterAnimatedText(l10n.roleGames),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          l10n.introText,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.5,
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: onViewProjectsTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            textStyle: const TextStyle(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(l10n.viewProjects),
        ),
      ],
    );
  }

  Widget _buildVisualContent() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: AppTheme.surface.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primary.withValues(alpha: 0.3)),
      ),
      child: Center(
        child: Icon(
          Icons.terminal,
          size: 100,
          color: AppTheme.primary.withValues(alpha: 0.8),
        ),
      ),
    );
  }
}
