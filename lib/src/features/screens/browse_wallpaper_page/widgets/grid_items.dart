import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GridItems extends StatelessWidget {
  const GridItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(30),
            height: 290.h,
            width: 435.w,
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

                  Text(
                    'Mountain, Fog,Forest and Landscapes',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Gap(5.h),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffFFFFFF),
                          Color(0xffCFCFCF),
                          Color(0xffEEEEEE),
                          Color(0xffFFFFFF),
                        ],
                      ),
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
    );
  }
}
