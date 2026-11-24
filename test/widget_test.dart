import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/features/profile/domain/entities/profile.dart';
import 'package:untitled/injection_container.dart';
import 'package:untitled/main.dart';
import 'package:untitled/presentation/widgets/experience_section.dart';
import 'package:untitled/presentation/widgets/project_card.dart';

void main() {
  testWidgets(
    'App renders projects, case studies, experience, CV and copy email',
    (WidgetTester tester) async {
      sl.init();
      tester.view.physicalSize = const Size(1920, 1080);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        const MiPortfolioApp(
          profile: Profile(
            name: 'Joshua López',
            email: 'joshua.lopez.nava.dev@gmail.com',
            githubUrl: 'https://github.com/JoshuaLopez2000',
            linkedinUrl:
                'https://www.linkedin.com/in/joshua-ivan-lopez-nava-77311721a',
            cvEsPath: 'cv/Joshua_Lopez_CV_ES.pdf',
            cvEnPath: 'cv/Joshua_Lopez_CV_EN.pdf',
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MiPortfolioApp), findsOneWidget);
      expect(find.byType(ProjectCard), findsNWidgets(6));
      expect(find.byType(ExperienceSection), findsOneWidget);
      expect(find.byIcon(Icons.download_rounded), findsWidgets);
      expect(find.byIcon(Icons.copy_rounded), findsWidgets);
      expect(find.byIcon(Icons.article_outlined), findsNWidgets(6));

      addTearDown(tester.view.resetPhysicalSize);
    },
  );
}
