import 'package:desktop_app/src/features/screens/browse_wallpaper_page/browse_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SavedWallPapersScreen extends StatefulWidget {
  const SavedWallPapersScreen({super.key});

  @override
  State<SavedWallPapersScreen> createState() => _SavedWallPapersScreenState();
}

class _SavedWallPapersScreenState extends State<SavedWallPapersScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallScreen = constraints.maxWidth < 1000;
        return Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                'Your Saved Wallpapers',
                style: TextStyle(
                  fontFamily: 'ClashDisplay',
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
                gradient: const LinearGradient(
                  colors: [Color(0xffFBB03B), Color(0xffEC0C43)],
                ),
              ),

              Text(
                'Browse and manage your favorite wallpapers in one place.',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),

              Gap(50.h),

              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isSmallScreen ? 2 : 6,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    mainAxisExtent: 350,
                  ),
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(20),
                      height: 320.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/mountain.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(26),
                        color: Colors.black54,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: AlignmentGeometry.topRight,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.favorite,
                                  color: Color(0xffFBB03B),
                                ),
                              ),
                            ),
                            Spacer(),
                            Text(
                              'Nature',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Gap(7.h),

                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(26),
                                color: Colors.black54,
                                // gradient: LinearGradient(
                                //   colors: [
                                //     Color(0xffFFFFFF),
                                //     Color(0xffCFCFCF),
                                //     Color(0xffEEEEEE),
                                //     Color(0xffFFFFFF),
                                //   ],
                                // ),
                              ),
                              child: Text(
                                '3 View Details',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
