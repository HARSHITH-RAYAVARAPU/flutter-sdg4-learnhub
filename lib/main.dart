import 'package:flutter/material.dart';
import 'screens/course_catalog_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LearnHubApp());
}

/// Root widget for the LearnHub Application.
/// Developed for:
/// - Student: Rayavarapu Harshith (Roll No: 24PA1A05J5)
/// - Experiment: 2b (Stack & Positioned Widgets)
/// - SDG: 4 (Quality Education)
/// - Problem Statement: "Build a Course Catalog screen where thumbnails carry 'New/Free' badges using Stack and Positioned."
class LearnHubApp extends StatelessWidget {
  const LearnHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LearnHub - Quality Education Course Catalog',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const CourseCatalogScreen(),
    );
  }
}
