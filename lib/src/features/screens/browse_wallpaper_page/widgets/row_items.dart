import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RowItems extends StatefulWidget {
  const RowItems({super.key});

  @override
  State<RowItems> createState() => _RowItemsState();
}

class _RowItemsState extends State<RowItems> {
  final List<Map<String, String>> categories = const [
    {
      'title': 'Nature',
      'description': 'Mountain, Fog, Forest and Landscapes',
      'image':
          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
    },
    {
      'title': 'Abstract',
      'description': 'Colorful patterns and artistic designs',
      'image':
          'https://images.unsplash.com/photo-1557672172-298e090bd0f1?w=400',
    },
    {
      'title': 'Space',
      'description': 'Galaxies, planets and cosmic wonders',
      'image':
          'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=400',
    },
    {
      'title': 'Space',
      'description': 'Galaxies, planets and cosmic wonders',
      'image':
          'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=400',
    },
    {
      'title': 'Space',
      'description': 'Galaxies, planets and cosmic wonders',
      'image':
          'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=400',
    },
    {
      'title': 'Space',
      'description': 'Galaxies, planets and cosmic wonders',
      'image':
          'https://images.unsplash.com/photo-1419242902214-272b3f66ee7a?w=400',
    },
    // Add more categories...
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: categories.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryCard(
            title: category['title']!,
            description: category['description']!,
            imageUrl: category['image']!,
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: 3.h,
          color: Color(0xffCFCFCF),
          indent: 10,
          endIndent: 4,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double height;
  final double width;
  final double fontSize;

  const CategoryCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.height = 185,
    this.width = 277,
    this.fontSize = 24,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 20, bottom: 20),
            width: width.w,
            height: height.h,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(26),
              image: DecorationImage(
                image: AssetImage('assets/images/mountain.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: fontSize.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Gap(8.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(12.h),
                  InkWell(
                    onTap: () {
                      // Navigate to details
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 244, 244),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '3 wallpapers',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
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
}
