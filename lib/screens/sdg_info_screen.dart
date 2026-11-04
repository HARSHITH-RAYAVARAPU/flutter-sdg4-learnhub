import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Screen detailing SDG 4: Quality Education and student project attribution.
class SdgInfoScreen extends StatelessWidget {
  const SdgInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SDG 4 Alignment & About'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SDG 4 Header Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.sdgRed,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.menu_book, color: Colors.white, size: 36),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'SUSTAINABLE DEVELOPMENT GOAL 4',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          'Quality Education for All',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            // 2-3 Line SDG Relevance Justification (Rubric requirement)
            const Text(
              'SDG 4 Relevance Justification',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Text(
                'This LearnHub application directly advances SDG 4 (Quality Education) by providing a barrier-free, digitally accessible course catalog that highlights "FREE" and "NEW" educational opportunities using visual Stack and Positioned badges. By demystifying course pricing, skill levels, and curricula upfront, it democratizes access to technical, vocational, and sustainable knowledge for underserved learners worldwide.',
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.5,
                  color: Color(0xFF2E384D),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Core Technical Highlights: Stack & Positioned
            const Text(
              'Layout & Badge Architecture',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTechCard(
              title: 'Stack Widget',
              icon: Icons.layers,
              description:
                  'Used in CourseThumbnail to layer the course cover image, a subtle darkening gradient, and contextual floating badges in a single composite visual container.',
            ),
            const SizedBox(height: 10),
            _buildTechCard(
              title: 'Positioned Widget',
              icon: Icons.crop_free,
              description:
                  'Controls absolute coordinate pinning within the Stack: "NEW" badge at top-left, "FREE" badge at top-right, category tag at bottom-left, and lesson duration tag at bottom-right.',
            ),
            const SizedBox(height: 20),

            // Key SDG 4 Targets Addressed
            const Text(
              'Key SDG 4 Targets Addressed in App',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildTargetTile(
              'Target 4.3',
              'Equal access for all women and men to affordable and quality technical, vocational and tertiary education.',
            ),
            _buildTargetTile(
              'Target 4.4',
              'Substantially increase the number of youth and adults who have relevant skills, including technical and vocational skills, for employment.',
            ),
            _buildTargetTile(
              'Target 4.7',
              'Ensure all learners acquire knowledge and skills needed to promote sustainable development, human rights, and global citizenship.',
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12.5,
                color: AppTheme.textSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 12.5,
                color: AppTheme.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechCard({required String title, required IconData icon, required String description}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue.shade700, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTargetTile(String target, String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppTheme.sdgRedLight,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              target,
              style: const TextStyle(
                color: AppTheme.sdgRed,
                fontWeight: FontWeight.bold,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              desc,
              style: const TextStyle(fontSize: 12, color: AppTheme.textPrimary, height: 1.35),
            ),
          ),
        ],
      ),
    );
  }
}
