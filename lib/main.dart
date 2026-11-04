import 'package:flutter/material.dart';
import 'screens/course_catalog_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LearnHubApp());
}

/// Root widget for the LearnHub Application.
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
