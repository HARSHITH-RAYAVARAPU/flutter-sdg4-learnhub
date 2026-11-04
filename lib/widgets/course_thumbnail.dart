import 'package:flutter/material.dart';
import '../models/course.dart';
import 'badge_widget.dart';

/// Thumbnail widget for course cards.
/// EXPERIMENT 2b CORE CONCEPT:
/// Demonstrates the use of [Stack] and [Positioned] to place "NEW" and "FREE"
/// badges at precise locations over the course image.
class CourseThumbnail extends StatelessWidget {
  final Course course;
  final double height;
  final bool showBookmark;
  final bool isBookmarked;
  final VoidCallback? onBookmarkToggle;

  const CourseThumbnail({
    super.key,
    required this.course,
    this.height = 175.0,
    this.showBookmark = true,
    this.isBookmarked = false,
    this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      // =======================================================================
      // STACK WIDGET:
      // Enables multiple layers of widgets to overlap on top of each other.
      // The first child is the background image/canvas; subsequent children
      // (wrapped in Positioned) are pinned to specific coordinates.
      // =======================================================================
      child: Stack(
        children: [
          // LAYER 1: Background Course Image with Gradient Fallback
          _buildImageBase(),

          // LAYER 2: Subtle gradient vignette for badge legibility
          _buildGradientOverlay(),

          // LAYER 3 (POSITIONED): "NEW" Badge positioned at TOP-LEFT
          if (course.isNew)
            Positioned(
              top: 10,
              left: 10,
              child: BadgeWidget.newBadge(),
            ),

          // LAYER 4 (POSITIONED): "FREE" or "PRICE" Badge positioned at TOP-RIGHT
          Positioned(
            top: 10,
            right: 10,
            child: course.isFree
                ? BadgeWidget.freeBadge()
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Text(
                      '₹${course.price.toInt()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),

          // LAYER 5 (POSITIONED): Category / Level badge positioned at BOTTOM-LEFT
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.65),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.school_outlined, size: 12, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    course.category,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // LAYER 6 (POSITIONED): Course Duration Tag positioned at BOTTOM-RIGHT
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.65),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.schedule, size: 12, color: Colors.white),
                  const SizedBox(width: 4),
                  Text(
                    course.duration,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the base visual element: decorative gradient with network image overlay
  Widget _buildImageBase() {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: course.gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Image.network(
        course.imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          // Graceful offline fallback rendering course aesthetic icon
          return Center(
            child: Icon(
              Icons.menu_book_rounded,
              size: 54,
              color: Colors.white.withOpacity(0.4),
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white.withOpacity(0.8),
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }

  /// Gradient overlay to ensure text and badges remain crisp and readable
  Widget _buildGradientOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.55),
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(0.65),
            ],
            stops: const [0.0, 0.25, 0.70, 1.0],
          ),
        ),
      ),
    );
  }
}
