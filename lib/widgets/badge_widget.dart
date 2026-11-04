import 'package:flutter/material.dart';

/// Type of badge displayed on the course thumbnail.
enum BadgeType {
  newBadge,
  freeBadge,
  categoryBadge,
  ratingBadge,
  levelBadge,
}

/// A reusable badge widget designed for display within Stack & Positioned overlays.
class BadgeWidget extends StatelessWidget {
  final String label;
  final BadgeType type;
  final IconData? icon;
  final Color? customBgColor;
  final Color? customTextColor;

  const BadgeWidget({
    super.key,
    required this.label,
    this.type = BadgeType.newBadge,
    this.icon,
    this.customBgColor,
    this.customTextColor,
  });

  /// Factory constructor for a 'NEW' badge
  factory BadgeWidget.newBadge({String text = 'NEW'}) {
    return BadgeWidget(
      label: text,
      type: BadgeType.newBadge,
      icon: Icons.fiber_new_rounded,
    );
  }

  /// Factory constructor for a 'FREE' badge
  factory BadgeWidget.freeBadge({String text = 'FREE'}) {
    return BadgeWidget(
      label: text,
      type: BadgeType.freeBadge,
      icon: Icons.card_giftcard_rounded,
    );
  }

  /// Factory constructor for a Category chip badge
  factory BadgeWidget.category(String category) {
    return BadgeWidget(
      label: category,
      type: BadgeType.categoryBadge,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor = Colors.white;
    List<BoxShadow>? shadows = [
      BoxShadow(
        color: Colors.black.withOpacity(0.25),
        blurRadius: 6,
        offset: const Offset(0, 2),
      ),
    ];

    switch (type) {
      case BadgeType.newBadge:
        bgColor = const Color(0xFF0288D1); // Vibrant Ocean Blue
        break;
      case BadgeType.freeBadge:
        bgColor = const Color(0xFF2E7D32); // Emerald Green
        break;
      case BadgeType.ratingBadge:
        bgColor = Colors.black.withOpacity(0.75);
        textColor = const Color(0xFFFFD54F);
        break;
      case BadgeType.categoryBadge:
        bgColor = Colors.black.withOpacity(0.65);
        textColor = Colors.white;
        break;
      case BadgeType.levelBadge:
        bgColor = const Color(0xFF6A1B9A);
        break;
    }

    if (customBgColor != null) bgColor = customBgColor!;
    if (customTextColor != null) textColor = customTextColor!;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: shadows,
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              size: 13,
              color: textColor,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
            ),
          ),
        ],
      ),
    );
  }
}
