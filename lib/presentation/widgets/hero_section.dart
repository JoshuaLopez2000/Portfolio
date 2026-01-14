import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '> Hello, I am Joshua_',
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
                TypewriterAnimatedText('Backend Developer'),
                TypewriterAnimatedText('Systems Architect'),
                TypewriterAnimatedText('Tech Enthusiast'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          'Crafting robust systems and elegant code.\nFocusing on scalability, performance, and clean architecture.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            height: 1.5,
            color: AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primary,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            textStyle: const TextStyle(
              fontFamily: 'JetBrains Mono',
              fontWeight: FontWeight.bold,
            ),
          ),
          child: const Text('View Projects'),
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
