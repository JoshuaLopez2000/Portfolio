import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';
import 'package:untitled/injection_container.dart';
import 'package:untitled/main.dart';
import 'package:untitled/presentation/widgets/project_card.dart';

void main() {
  testWidgets('App renders redesigned portfolio with projects and links', (
    WidgetTester tester,
  ) async {
    sl.init();
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    await tester.pumpWidget(
      const MiPortfolioApp(
        profile: Profile(
          name: 'Joshua López',
          email: 'joshua.lopez.nava.dev@gmail.com',
          githubUrl: 'https://github.com/JoshuaLopez2000',
          linkedinUrl: 'https://www.linkedin.com/in/joshua-ivan-lopez-nava-77311721a',
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(MiPortfolioApp), findsOneWidget);
    expect(find.byType(ProjectCard), findsNWidgets(5));
    expect(find.byType(Image), findsWidgets);
    expect(find.byIcon(Icons.perm_media_outlined), findsOneWidget);
    expect(find.text('GitHub'), findsWidgets);
    expect(find.text('LinkedIn'), findsWidgets);

    addTearDown(tester.view.resetPhysicalSize);
  });
}
