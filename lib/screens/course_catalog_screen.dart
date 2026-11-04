import 'package:flutter/material.dart';
import '../models/course.dart';
import '../theme/app_theme.dart';
import '../widgets/category_filter_bar.dart';
import '../widgets/course_card.dart';
import '../widgets/sdg_banner.dart';
import 'sdg_info_screen.dart';

/// Main screen satisfying Experiment 2b problem statement:
/// "Build a Course Catalog screen where thumbnails carry 'New/Free' badges using Stack and Positioned."
class CourseCatalogScreen extends StatefulWidget {
  const CourseCatalogScreen({super.key});

  @override
  State<CourseCatalogScreen> createState() => _CourseCatalogScreenState();
}

class _CourseCatalogScreenState extends State<CourseCatalogScreen> {
  final List<Course> _allCourses = Course.sampleCourses;
  String _selectedCategory = 'All';
  String _searchQuery = '';
  bool _filterFreeOnly = false;
  bool _filterNewOnly = false;
  bool _isGridView = false;
  final Set<String> _bookmarkedIds = {};

  final List<String> _categories = [
    'All',
    'Technology',
    'Science',
    'Mathematics',
    'Sustainability',
    'Languages',
    'Education',
  ];

  List<Course> get _filteredCourses {
    return _allCourses.where((course) {
      // Category match
      final matchesCategory = _selectedCategory == 'All' ||
          course.category.toLowerCase() == _selectedCategory.toLowerCase();

      // Search match
      final matchesSearch = _searchQuery.isEmpty ||
          course.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          course.instructor.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          course.category.toLowerCase().contains(_searchQuery.toLowerCase());

      // Free filter match
      final matchesFree = !_filterFreeOnly || course.isFree;

      // New filter match
      final matchesNew = !_filterNewOnly || course.isNew;

      return matchesCategory && matchesSearch && matchesFree && matchesNew;
    }).toList();
  }

  void _toggleBookmark(String id) {
    setState(() {
      if (_bookmarkedIds.contains(id)) {
        _bookmarkedIds.remove(id);
      } else {
        _bookmarkedIds.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final courses = _filteredCourses;
    final isTablet = MediaQuery.of(context).size.width >= 650;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: AppTheme.sdgRed,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.school, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LearnHub',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
                Text(
                  'SDG 4: Quality Education Catalog',
                  style: TextStyle(
                    fontSize: 10.5,
                    color: AppTheme.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Toggle Grid / List View',
            icon: Icon(_isGridView ? Icons.view_agenda_outlined : Icons.grid_view_rounded),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
          IconButton(
            tooltip: 'SDG 4 Project Details',
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SdgInfoScreen()),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // 1. Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    _searchQuery = val.trim();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search courses by topic, skill or educator...',
                  prefixIcon: const Icon(Icons.search, color: AppTheme.sdgRed),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear, size: 18),
                          onPressed: () {
                            setState(() {
                              _searchQuery = '';
                            });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: AppTheme.sdgRed, width: 1.5),
                  ),
                ),
              ),
            ),
          ),

          // 2. SDG 4 Quality Education Banner
          const SliverToBoxAdapter(
            child: SdgBanner(),
          ),

          // 3. Categories & Quick Filter Chips
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: CategoryFilterBar(
                categories: _categories,
                selectedCategory: _selectedCategory,
                onSelectCategory: (cat) => setState(() => _selectedCategory = cat),
                filterFreeOnly: _filterFreeOnly,
                onToggleFreeOnly: (val) => setState(() => _filterFreeOnly = val),
                filterNewOnly: _filterNewOnly,
                onToggleNewOnly: (val) => setState(() => _filterNewOnly = val),
              ),
            ),
          ),

          // 5. Results Counter & Active Filter Indicators
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Available Courses (${courses.length})',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  if (_filterFreeOnly || _filterNewOnly || _selectedCategory != 'All' || _searchQuery.isNotEmpty)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _selectedCategory = 'All';
                          _searchQuery = '';
                          _filterFreeOnly = false;
                          _filterNewOnly = false;
                        });
                      },
                      child: const Text('Reset Filters', style: TextStyle(fontSize: 12)),
                    ),
                ],
              ),
            ),
          ),

          // 6. Course List / Grid View
          if (courses.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: _buildEmptyState(),
            )
          else if (_isGridView || isTablet)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 3 : 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.68,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final course = courses[index];
                    return CourseCard(
                      course: course,
                      isBookmarked: _bookmarkedIds.contains(course.id),
                      onBookmarkToggle: () => _toggleBookmark(course.id),
                    );
                  },
                  childCount: courses.length,
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final course = courses[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CourseCard(
                        course: course,
                        isBookmarked: _bookmarkedIds.contains(course.id),
                        onBookmarkToggle: () => _toggleBookmark(course.id),
                      ),
                    );
                  },
                  childCount: courses.length,
                ),
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text(
              'No Courses Found',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search keywords or clearing active filters.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedCategory = 'All';
                  _searchQuery = '';
                  _filterFreeOnly = false;
                  _filterNewOnly = false;
                });
              },
              child: const Text('View All Courses'),
            ),
          ],
        ),
      ),
    );
  }
}
