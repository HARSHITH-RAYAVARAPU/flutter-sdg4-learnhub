import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnhub/main.dart';
import 'package:learnhub/widgets/badge_widget.dart';
import 'package:learnhub/widgets/course_thumbnail.dart';

void main() {
  testWidgets('Verify Course Catalog screen and Stack/Positioned badges',
      (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(const LearnHubApp());
    await tester.pumpAndSettle();

    // Verify Title & SDG 4 header are displayed
    expect(find.text('LearnHub'), findsOneWidget);
    expect(find.text('SDG 4: Quality Education Catalog'), findsOneWidget);

    // Verify Stack and Positioned widgets are present in the widget tree
    expect(find.byType(Stack), findsWidgets);
    expect(find.byType(Positioned), findsWidgets);
    expect(find.byType(CourseThumbnail), findsWidgets);

    // Verify presence of "NEW" and "FREE" badges
    expect(find.byType(BadgeWidget), findsWidgets);

    // Search input interaction test
    final searchField = find.byType(TextField);
    expect(searchField, findsOneWidget);
    await tester.enterText(searchField, 'Flutter');
    await tester.pumpAndSettle();

    // Verify filtered result contains Flutter course
    expect(find.textContaining('Flutter & Dart'), findsOneWidget);
  });
}
