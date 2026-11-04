# LearnHub: SDG 4 Quality Education Course Catalog

**Course Lab Assignment:** Flutter Lab – SDG-Based Assignment  
**Student Name:** Rayavarapu Harshith  
**Student Roll Number:** 24PA1A05J5 (S.No: 7)  
**Experiment Number:** 2b  
**SDG Goal:** SDG 4 – Quality Education  
**Assigned Problem Statement:**  
> *"Build a Course Catalog screen where thumbnails carry 'New/Free' badges using Stack and Positioned."*

---

## 🎯 1. UN SDG 4 Relevance Justification (Rubric Criterion 5)
> **"This LearnHub application directly advances United Nations SDG 4 (Quality Education) by providing an open, digitally inclusive course catalog that prominently highlights 'FREE' and 'NEW' educational opportunities using visual Stack and Positioned badges. By demystifying tuition costs, skill levels, and curricula upfront, it democratizes access to technical, vocational, and sustainable knowledge for underserved learners worldwide."**

---

## 🏗️ 2. Core Flutter Concept: Stack & Positioned (Rubric Criterion 2)

Experiment 2b focuses specifically on mastering multi-layer UI composition using Flutter's **`Stack`** and **`Positioned`** widgets:

### Why `Stack`?
In standard Flutter layouts (`Column` or `Row`), child widgets are placed sequentially along a single axis without overlapping. A `Stack` widget allows widgets to be layered on top of each other along the Z-axis (depth):
1. **Base Layer:** The course image / thumbnail canvas (`CourseThumbnail`).
2. **Overlay Layer:** Vignette gradient ensuring high contrast and legibility.
3. **Badge Layer:** Floating metadata badges placed over the thumbnail.

### Why `Positioned`?
A `Positioned` widget can only be used as a direct child of a `Stack`. It pins the child widget to exact coordinates relative to the bounding box of the `Stack` using `top`, `bottom`, `left`, and `right`:

```dart
// Code snippet from lib/widgets/course_thumbnail.dart
ClipRRect(
  borderRadius: BorderRadius.circular(16),
  child: Stack(
    children: [
      // 1. Background image canvas
      _buildImageBase(),

      // 2. Subtle gradient overlay for readability
      _buildGradientOverlay(),

      // 3. "NEW" Badge positioned at TOP-LEFT
      if (course.isNew)
        Positioned(
          top: 10,
          left: 10,
          child: BadgeWidget.newBadge(),
        ),

      // 4. "FREE" Badge positioned at TOP-RIGHT
      Positioned(
        top: 10,
        right: 10,
        child: course.isFree
            ? BadgeWidget.freeBadge()
            : PriceTagWidget(price: course.price),
      ),

      // 5. Category Tag positioned at BOTTOM-LEFT
      Positioned(
        bottom: 10,
        left: 10,
        child: CategoryBadge(course.category),
      ),

      // 6. Lesson Duration Tag positioned at BOTTOM-RIGHT
      Positioned(
        bottom: 10,
        right: 10,
        child: DurationBadge(course.duration),
      ),
    ],
  ),
)
```

---

## 📱 3. Application Features & Architecture (Rubric Criterion 1 & 4)

- **Search & Dynamic Filtering:** Instant search by keyword, instructor, or topic.
- **Badge Filter Toggles:** Quick one-tap filters for `Free Courses` and `New Releases`.
- **Category Filter Chips:** Technology, Science, Mathematics, Sustainability, Languages, and Education.
- **Adaptive Layout:** Toggle between Single-Column List View and Multi-Column Responsive Grid View.
- **Detailed Course Screen:** Course syllabus, SDG 4 target breakdown, instructor bio, and instant enrollment dialog.
- **Offline Resilience:** Graceful gradient fallbacks and icons ensure the app never crashes even without internet.

### Project Structure:
```text
LEARNHUB/
├── lib/
│   ├── main.dart                      # App entry point & initialization
│   ├── models/
│   │   └── course.dart                # Course entity & rich SDG 4 sample repository
│   ├── theme/
│   │   └── app_theme.dart             # Material 3 theme & SDG 4 palette (#C5192D)
│   ├── widgets/
│   │   ├── badge_widget.dart          # Reusable "NEW" and "FREE" badge widget
│   │   ├── course_thumbnail.dart      # CORE EXPERIMENT: Stack & Positioned layout
│   │   ├── course_card.dart           # Interactive card with rating & instructor info
│   │   ├── category_filter_bar.dart   # Category & badge filter toggles
│   │   └── sdg_banner.dart            # UN SDG 4 showcase banner
│   └── screens/
│       ├── course_catalog_screen.dart # Main catalog screen with search & grid/list
│       ├── course_detail_screen.dart  # Detailed course syllabus & enrollment modal
│       └── sdg_info_screen.dart       # Student assignment & SDG 4 target mapping
├── test/
│   └── widget_test.dart               # Automated tests for Stack & Positioned widgets
├── web/
│   ├── index.html                     # Web scaffolding
│   └── manifest.json                  # PWA manifest
├── demo_preview.html                  # Instant interactive browser demo
├── pubspec.yaml                       # Dependencies & assets configuration
└── README.md                          # Documentation & viva explanation
```

---

## 🎨 4. UI/UX Design System (Rubric Criterion 3)
- **Primary Brand Color:** `#C5192D` (Official United Nations SDG 4 Crimson Red).
- **Badge Colors:** 
  - `NEW` Badge: `#0288D1` (Azure Blue) with `fiber_new` icon.
  - `FREE` Badge: `#2E7D32` (Emerald Green) with `card_giftcard` icon.
- **Typography:** High readability hierarchy with Roboto typeface, clean line heights, and WCAG AA contrast.
- **Surface Elevation:** Subtle box-shadows, 16px corner radii, and border accents.

---

## 🚀 5. How to Run the Application

### Option A: Using Flutter (Desktop / Mobile / Web)
```bash
# 1. Navigate to project directory
cd c:\Users\Thanmye\Desktop\LEARNHUB

# 2. Fetch packages
flutter pub get

# 3. Run on connected device or Chrome
flutter run -d chrome
# OR for Windows desktop:
flutter run -d windows
```

### Option B: Run Automated Unit & Widget Tests
```bash
flutter test
```

### Option C: Instant Browser Preview (Zero Setup Needed)
Simply double-click `demo_preview.html` or open it in any web browser to test all interactive features, badges, search, and modals immediately.

---

## 🎓 6. Viva Voce Preparation (Rubric Criterion 6)

### Q1: What is the primary purpose of the `Stack` widget in Flutter?
**Answer:** The `Stack` widget allows multiple child widgets to be placed on top of each other along the Z-axis (overlapping layers), rather than linearly like `Row` or `Column`.

### Q2: Can a `Positioned` widget be placed inside a `Column` or `Container`?
**Answer:** No. A `Positioned` widget is an inherited layout widget that **must be an immediate child of a `Stack`**. Placing it outside a `Stack` throws an assert error during runtime.

### Q3: How do `top`, `bottom`, `left`, and `right` properties work in `Positioned`?
**Answer:** They define the distance in logical pixels between the edge of the child widget and the corresponding edge of the parent `Stack` bounding box.

### Q4: How is this application linked to SDG 4?
**Answer:** SDG 4 is "Quality Education". This application provides equal access to learning opportunities by clearly distinguishing and categorizing free, open-access, and newly introduced courses for learners worldwide.

---

**Submitted by:** Rayavarapu Harshith  
**Roll No:** 24PA1A05J5  
**Department:** Computer Science & Engineering (CSE-D, 2026 Batch)
