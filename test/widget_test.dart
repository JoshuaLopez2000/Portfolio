// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled/main.dart';

void main() {
  testWidgets('App renders smoke test', (WidgetTester tester) async {
    // Set a larger screen size to avoid overflow errors in responsive widgets like ProjectCard
    tester.view.physicalSize = const Size(1920, 1080);
    tester.view.devicePixelRatio = 1.0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MiPortfolioApp());

    // Verify that the app renders without crashing.
    expect(find.byType(MiPortfolioApp), findsOneWidget);
    
    // Reset the surface size
    addTearDown(tester.view.resetPhysicalSize);
  });
}
