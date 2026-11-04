import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Interactive filter bar for categories and badge-based filters ("FREE", "NEW").
class CategoryFilterBar extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelectCategory;
  final bool filterFreeOnly;
  final ValueChanged<bool> onToggleFreeOnly;
  final bool filterNewOnly;
  final ValueChanged<bool> onToggleNewOnly;

  const CategoryFilterBar({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onSelectCategory,
    required this.filterFreeOnly,
    required this.onToggleFreeOnly,
    required this.filterNewOnly,
    required this.onToggleNewOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Horizontal List
        SizedBox(
          height: 42,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final cat = categories[index];
              final isSelected = cat == selectedCategory;
              return ChoiceChip(
                label: Text(cat),
                selected: isSelected,
                selectedColor: AppTheme.sdgRed,
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppTheme.textPrimary,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  fontSize: 12.5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected ? AppTheme.sdgRed : Colors.grey.shade300,
                  ),
                ),
                showCheckmark: false,
                onSelected: (selected) {
                  if (selected) {
                    onSelectCategory(cat);
                  }
                },
              );
            },
          ),
        ),
        const SizedBox(height: 8),

        // Quick Badge Filter Toggles (Free / New)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Text(
                'Badge Filters:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textSecondary,
                ),
              ),
              const SizedBox(width: 8),

              // Filter FREE badge
              FilterChip(
                avatar: Icon(
                  Icons.card_giftcard_rounded,
                  size: 14,
                  color: filterFreeOnly ? Colors.white : const Color(0xFF2E7D32),
                ),
                label: const Text('Free Courses'),
                selected: filterFreeOnly,
                selectedColor: const Color(0xFF2E7D32),
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                  color: filterFreeOnly ? Colors.white : const Color(0xFF2E7D32),
                ),
                backgroundColor: Colors.green.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: filterFreeOnly ? Colors.transparent : Colors.green.shade200,
                  ),
                ),
                onSelected: onToggleFreeOnly,
              ),
              const SizedBox(width: 8),

              // Filter NEW badge
              FilterChip(
                avatar: Icon(
                  Icons.fiber_new_rounded,
                  size: 16,
                  color: filterNewOnly ? Colors.white : const Color(0xFF0288D1),
                ),
                label: const Text('New Releases'),
                selected: filterNewOnly,
                selectedColor: const Color(0xFF0288D1),
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                  color: filterNewOnly ? Colors.white : const Color(0xFF0288D1),
                ),
                backgroundColor: Colors.lightBlue.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: filterNewOnly ? Colors.transparent : Colors.lightBlue.shade200,
                  ),
                ),
                onSelected: onToggleNewOnly,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
