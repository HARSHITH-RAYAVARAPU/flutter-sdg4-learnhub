import 'package:flutter/material.dart';

/// Represents an educational course in the catalog aligned with SDG 4: Quality Education.
class Course {
  final String id;
  final String title;
  final String instructor;
  final String category;
  final String duration;
  final int lessonsCount;
  final double rating;
  final int reviewsCount;
  final String level;
  final bool isNew;
  final bool isFree;
  final double price;
  final String imageUrl;
  final List<Color> gradientColors;
  final String description;
  final String sdgTarget;
  final List<String> syllabus;

  const Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.category,
    required this.duration,
    required this.lessonsCount,
    required this.rating,
    required this.reviewsCount,
    required this.level,
    required this.isNew,
    required this.isFree,
    this.price = 0.0,
    required this.imageUrl,
    required this.gradientColors,
    required this.description,
    required this.sdgTarget,
    required this.syllabus,
  });

  /// Sample repository of courses demonstrating "NEW" and "FREE" badges.
  static List<Course> get sampleCourses => [
        const Course(
          id: 'c1',
          title: 'Flutter & Dart: Zero to Hero Mobile App Development',
          instructor: 'Dr. Anita Roy, IIT Kharagpur',
          category: 'Technology',
          duration: '14 Hours',
          lessonsCount: 36,
          rating: 4.9,
          reviewsCount: 1420,
          level: 'Beginner',
          isNew: true,
          isFree: true,
          imageUrl: 'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=600',
          gradientColors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
          description:
              'A complete hands-on guide to cross-platform mobile development using Flutter 3. Learn widget composition, state management, and modern UI architectures.',
          sdgTarget: 'SDG 4.4: Increase technical and vocational skills for employment.',
          syllabus: [
            'Introduction to Dart Syntax & Object-Oriented Programming',
            'Flutter Widget Tree, Stateless vs Stateful Widgets',
            'Layout Mastery: Stack, Positioned, Row, Column, and Flex',
            'State Management with Provider and Reactive State',
            'Publishing Accessible Apps for Android and iOS',
          ],
        ),
        const Course(
          id: 'c2',
          title: 'Introduction to Artificial Intelligence for Social Good',
          instructor: 'Prof. Ramesh Sharma, Stanford Fellow',
          category: 'Technology',
          duration: '10 Hours',
          lessonsCount: 24,
          rating: 4.8,
          reviewsCount: 980,
          level: 'Beginner',
          isNew: true,
          isFree: false,
          price: 499.0,
          imageUrl: 'https://images.unsplash.com/photo-1620712943543-bcc4688e7485?auto=format&fit=crop&w=800&q=80',
          gradientColors: [Color(0xFF4A148C), Color(0xFF7B1FA2)],
          description:
              'Explore how artificial intelligence can tackle urgent global problems such as climate monitoring, automated agriculture, and healthcare accessibility.',
          sdgTarget: 'SDG 4.7: Global citizenship, sustainability, and technological empowerment.',
          syllabus: [
            'Foundations of Machine Learning & Neural Networks',
            'Ethics, Fairness, and Bias in Algorithmic Decision Making',
            'Computer Vision for Satellite Deforestation Tracking',
            'Predictive Analytics for Rural Public Health',
          ],
        ),
        const Course(
          id: 'c3',
          title: 'Renewable Energy Fundamentals & Clean Grid Systems',
          instructor: 'Ing. Elena Rostova, Clean Energy Alliance',
          category: 'Science',
          duration: '8 Hours',
          lessonsCount: 18,
          rating: 4.7,
          reviewsCount: 650,
          level: 'Intermediate',
          isNew: false,
          isFree: true,
          imageUrl: 'https://images.unsplash.com/photo-1466611653911-95081537e5b7?auto=format&fit=crop&w=800&q=80',
          gradientColors: [Color(0xFF004D40), Color(0xFF00897B)],
          description:
              'Understand photovoltaic cell physics, wind turbine mechanics, and smart power grid storage techniques to drive clean energy transitions.',
          sdgTarget: 'SDG 4.3: Equal access to affordable technical and tertiary education.',
          syllabus: [
            'Solar Irradiance, Photovoltaic Arrays, and Inverter Systems',
            'Wind Aerodynamics and Turbines Efficiency',
            'Grid Storage: Lithium-ion Batteries & Pumped Hydro',
            'Decentralized Microgrids for Remote Villages',
          ],
        ),
        const Course(
          id: 'c4',
          title: 'Foundational Mathematics & Logical Reasoning',
          instructor: 'Dr. Michael Chen, Oxford Academy',
          category: 'Mathematics',
          duration: '16 Hours',
          lessonsCount: 42,
          rating: 4.9,
          reviewsCount: 2130,
          level: 'All Levels',
          isNew: false,
          isFree: true,
          imageUrl: 'https://images.unsplash.com/photo-1509228468518-180dd4864904?w=600',
          gradientColors: [Color(0xFFE65100), Color(0xFFFB8C00)],
          description:
              'Master core arithmetic, linear algebra, and probability concepts required for STEM careers. Designed with visual step-by-step problem-solving.',
          sdgTarget: 'SDG 4.6: Universal youth and adult literacy and numeracy.',
          syllabus: [
            'Number Theory and Modular Arithmetic',
            'Matrices, Vectors, and Linear Transformations',
            'Probability Distributions and Combinatorics',
            'Analytical Problem Solving Strategies',
          ],
        ),
        const Course(
          id: 'c5',
          title: 'Sustainable Cities: Urban Ecology & Civic Planning',
          instructor: 'Ar. Devendra Patil, UN Habitat Advisor',
          category: 'Sustainability',
          duration: '12 Hours',
          lessonsCount: 28,
          rating: 4.8,
          reviewsCount: 520,
          level: 'Intermediate',
          isNew: true,
          isFree: true,
          imageUrl: 'https://images.unsplash.com/photo-1477959858617-67f30bc75b82?w=600',
          gradientColors: [Color(0xFF1B5E20), Color(0xFF388E3C)],
          description:
              'Learn the principles of urban heat island reduction, transit-oriented development, and zero-waste community systems for sustainable futures.',
          sdgTarget: 'SDG 4.7: Knowledge and skills for sustainable development.',
          syllabus: [
            'Introduction to Urban Density and Ecological Footprints',
            'Public Transit Integration and Pedestrian-First Zones',
            'Rainwater Harvesting and Decentralized Greywater Treatment',
            'Building Resilient Infrastructure Against Climate Extremes',
          ],
        ),
        const Course(
          id: 'c6',
          title: 'Global English Communication & Professional Writing',
          instructor: 'Sarah Jenkins, TESOL Master Trainer',
          category: 'Languages',
          duration: '6 Hours',
          lessonsCount: 15,
          rating: 4.6,
          reviewsCount: 890,
          level: 'Beginner',
          isNew: false,
          isFree: false,
          price: 299.0,
          imageUrl: 'https://images.unsplash.com/photo-1456513080510-7bf3a84b82f8?w=600',
          gradientColors: [Color(0xFF311B92), Color(0xFF512DA8)],
          description:
              'Enhance professional workplace communication, cross-cultural collaboration, and persuasive academic writing skills for global career mobility.',
          sdgTarget: 'SDG 4.4: Skills for employment, decent jobs and entrepreneurship.',
          syllabus: [
            'Grammar Essentials and Active Sentence Structuring',
            'Formal Email Etiquette and Professional Reports',
            'Cross-Cultural Virtual Collaboration Strategies',
            'Confident Presentation and Public Speaking Techniques',
          ],
        ),
        const Course(
          id: 'c7',
          title: 'Clean Water Sanitation & Community Hydrology',
          instructor: 'Dr. Joseph Mwangi, WaterAid Consultant',
          category: 'Science',
          duration: '9 Hours',
          lessonsCount: 20,
          rating: 4.9,
          reviewsCount: 410,
          level: 'Intermediate',
          isNew: true,
          isFree: false,
          price: 349.0,
          imageUrl: 'https://images.unsplash.com/photo-1541888946425-d0fbb186f5f7?w=600',
          gradientColors: [Color(0xFF006064), Color(0xFF0097A7)],
          description:
              'A field engineering guide to biosand filters, community borehole management, and solar-powered desalination for low-resource regions.',
          sdgTarget: 'SDG 4.3: Equal access to technical education for clean living standards.',
          syllabus: [
            'Waterborne Pathogen Biology and Disease Vectors',
            'Low-Cost Filtration: Biosand and Ceramic Filters',
            'Groundwater Hydrology and Well Pump Maintenance',
            'Community Water Stewardship and Testing Protocols',
          ],
        ),
        const Course(
          id: 'c8',
          title: 'Inclusive Digital Education & Assistive Tech Design',
          instructor: 'Priya Sundaram, Accessibility Architect',
          category: 'Education',
          duration: '11 Hours',
          lessonsCount: 22,
          rating: 4.9,
          reviewsCount: 780,
          level: 'Advanced',
          isNew: true,
          isFree: true,
          imageUrl: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=600',
          gradientColors: [Color(0xFF880E4F), Color(0xFFC2185B)],
          description:
              'Designing educational tools that accommodate all learners, including students with visual, auditory, and motor impairments through WCAG standards.',
          sdgTarget: 'SDG 4.5: Eliminate gender and disability disparities in education.',
          syllabus: [
            'Principles of Universal Design for Learning (UDL)',
            'Screen Readers, High Contrast Ratios, and Haptic Feedback',
            'Cognitive Accessibility in Learning Management Systems',
            'Auditing Educational Software for Section 508 & WCAG 2.2',
          ],
        ),
      ];
}
