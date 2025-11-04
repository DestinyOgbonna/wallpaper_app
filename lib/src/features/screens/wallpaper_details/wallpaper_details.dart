import 'package:desktop_app/src/features/screens/browse_wallpaper_page/browse_wallpaper.dart';
import 'package:desktop_app/src/features/screens/browse_wallpaper_page/widgets/icon_button.dart';
import 'package:desktop_app/src/features/screens/browse_wallpaper_page/widgets/row_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WallpaperDetailsScreen extends StatefulWidget {
  const WallpaperDetailsScreen({super.key});

  @override
  State<WallpaperDetailsScreen> createState() => _WallpaperDetailsScreenState();
}

class _WallpaperDetailsScreenState extends State<WallpaperDetailsScreen> {
  int _selectedIndex = 0;
  int _gridCount = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth >= 900;
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color(0xfff8f8f8),
          endDrawer: !isDesktop ? _buildDrawer() : null,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 98.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.wallpaper, color: Colors.black, size: 28),
                      Gap(12.w),
                      Text(
                        'Wallpapers',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),

                      // Desktop Navigation
                      if (isDesktop) ...[
                        IconButtons(
                          icon: SvgPicture.asset(
                            'assets/svg/home.svg',
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 0
                                  ? Color(0xffCFCFCF)
                                  : Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          text: 'Home',
                          isSelected: _selectedIndex == 0,
                          onPressed: () {
                            setState(() => _selectedIndex = 0);
                          },
                        ),
                        Gap(10.w),
                        IconButtons(
                          icon: SvgPicture.asset(
                            'assets/svg/browse.svg',
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 1
                                  ? Color(0xffCFCFCF)
                                  : Colors.black,
                              BlendMode.srcIn,
                            ),
                          ),
                          text: 'Browse',
                          isSelected: _selectedIndex == 1,
                          onPressed: () {
                            setState(() => _selectedIndex = 1);
                          },
                        ),
                        Gap(10.w),
                        IconButtons(
                          icon: Icon(
                            Icons.favorite_outline,
                            color: _selectedIndex == 2
                                ? Color(0xffCFCFCF)
                                : Colors.black,
                            size: 20,
                          ),
                          text: 'Favorites',
                          isSelected: _selectedIndex == 2,
                          onPressed: () {
                            setState(() => _selectedIndex = 2);
                          },
                        ),
                        Gap(10.w),
                        IconButtons(
                          icon: Icon(
                            Icons.settings_outlined,
                            color: _selectedIndex == 3
                                ? Color(0xffCFCFCF)
                                : Colors.black,
                            size: 20,
                          ),
                          text: 'Settings',
                          isSelected: _selectedIndex == 3,
                          onPressed: () {
                            setState(() => _selectedIndex = 3);
                          },
                        ),
                      ],

                      if (!isDesktop) ...[
                        Gap(10.w),
                        IconButton(
                          icon: Icon(Icons.menu, color: Colors.black, size: 28),
                          onPressed: () {
                            _scaffoldKey.currentState?.openEndDrawer();
                          },
                        ),
                      ],
                    ],
                  ),
                ),
                Gap(40.h),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: GradientText(
                      '<- Back to Categories',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      gradient: LinearGradient(
                        colors: [Color(0XFF000000), Color(0XFFFFF000)],
                      ),
                    ),
                  ),
                ),

                Gap(60),
                // Content Area
                Row(
                  spacing: 20,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 50),
                        padding: EdgeInsets.all(20),
                        width: 600.w,
                        height: 746.h,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Nature ',
                                  style: TextStyle(
                                    fontFamily: 'ClashDisplay',
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                ),

                                Row(
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/svg/grid.svg',
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(
                                          _gridCount == 0
                                              ? Colors.orange
                                              : Colors.grey,
                                          BlendMode.srcIn,
                                        ),
                                      ),

                                      onPressed: () {
                                        setState(() => _gridCount = 0);
                                      },
                                    ),
                                    Gap(10.w),
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'assets/svg/list.svg',
                                        width: 24,
                                        height: 24,
                                        colorFilter: ColorFilter.mode(
                                          _gridCount == 1
                                              ? Colors.orange
                                              : Colors.grey,
                                          BlendMode.srcIn,
                                        ),
                                      ),

                                      onPressed: () {
                                        setState(() => _gridCount = 1);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Gap(30),
                            _gridCount == 1
                                ? Expanded(
                                    child: ListView.separated(
                                      itemCount: 9,

                                      itemBuilder: (context, index) {
                                        return CategoryCard(
                                          fontSize: 15,
                                          width: 180,
                                          title: 'Welcome',
                                          description: 'This is description',
                                          imageUrl: '',
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                            height: 3.h,
                                            color: Color(0xffCFCFCF),
                                            indent: 10,
                                            endIndent: 4,
                                          ),
                                    ),
                                  )
                                : GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 20,
                                          crossAxisSpacing: 20,
                                          mainAxisExtent: 300,
                                        ),
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 6,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        padding: EdgeInsets.all(20),
                                        height: 420.h,
                                        width: 160.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            26,
                                          ),
                                          color: Colors.black54,
                                        ),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentGeometry.topRight,
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
                                                  borderRadius:
                                                      BorderRadius.circular(26),
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
                          ],
                        ),
                      ),
                    ),

                    ///PREVIEW SECTION
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 50),
                        padding: EdgeInsets.all(20),
                        width: 600.w,
                        height: 746.h,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            Container(
                              height: 521.h,
                              width: 581.w,
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: 258.w,
                                      height: 524.h,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Preview',
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Gap(30.h),
                                          Text(
                                            'Name',
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Text(
                                            'Nature 1',
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24,
                                            ),
                                          ),
                                          Gap(40.h),
                                          Text(
                                            'TAGS',
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          Gap(10.h),
                                          Row(
                                            spacing: 10,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),

                                                child: Text(
                                                  'Nature',
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),

                                                child: Text(
                                                  'Ambience',
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),

                                                child: Text(
                                                  'Flowers',
                                                  style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                          Gap(20),
                                          Text(
                                            'Description',
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                          GradientText(
                                            'Discover the pure beauty of "Natural Essence" – your gateway to authentic, nature-inspired experiences.\nLet this unique collection elevate your senses and connect you with the unrefined elegance of the natural world. Embrace',
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              color: Colors.grey[500],
                                            ),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0XFF000000),
                                                Color(0XFFFFFFFF),
                                              ],
                                            ),
                                          ),
                                          Gap(10),
                                          Row(
                                            spacing: 10,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 8,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                    255,
                                                    244,
                                                    244,
                                                    244,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Icon(
                                                  Icons.ios_share_outlined,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 8,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                    255,
                                                    244,
                                                    244,
                                                    244,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Icon(
                                                  Icons
                                                      .transfer_within_a_station_outlined,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                  vertical: 8,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                    255,
                                                    244,
                                                    244,
                                                    244,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Icon(
                                                  Icons.settings_outlined,
                                                  color: Colors.grey[500],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Gap(20.h),
                                  Expanded(
                                    child: Container(
                                      // margin: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                                      width: 258.w,
                                      height: 524.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 4,
                                        ),
                                        color: Colors.amber,
                                        borderRadius: BorderRadius.circular(35),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/mountain.jpg',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Stack(
                                        alignment: AlignmentGeometry.center,
                                        children: [
                                          Positioned(
                                            top: 10,
                                            child: Container(
                                              width: 72.w,
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            child: Container(
                                              width: 72.w,
                                              height: 2.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(26),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Gap(50.h),
                            Padding(
                              padding: const EdgeInsets.only(right: 48.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(10),

                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),
                                      border: Border.all(color: Colors.black),
                                    ),

                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.favorite_border,
                                          color: Colors.black,
                                        ),

                                        Text(
                                          ' Save to Favorite',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Gap(10.w),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    alignment: Alignment.center,

                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(26),

                                      color: Color(0XFFFBB03B),
                                    ),

                                    child: Text(
                                      ' Set to Wallpaper',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffFBB03B), Color(0xffEC0C43)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.wallpaper, color: Colors.white, size: 40),
                  Gap(10.h),
                  Text(
                    'Wallpapers',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            _DrawerItem(
              icon: SvgPicture.asset(
                'assets/svg/home.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0 ? Color(0xffFBB03B) : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              text: 'Home',
              isSelected: _selectedIndex == 0,
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),
            _DrawerItem(
              icon: SvgPicture.asset(
                'assets/svg/browse.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1 ? Color(0xffFBB03B) : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              text: 'Browse',
              isSelected: _selectedIndex == 1,
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),
            _DrawerItem(
              icon: Icon(
                Icons.favorite_outline,
                color: _selectedIndex == 2 ? Color(0xffFBB03B) : Colors.black,
                size: 24,
              ),
              text: 'Favorites',
              isSelected: _selectedIndex == 2,
              onTap: () {
                setState(() => _selectedIndex = 2);
                Navigator.pop(context);
              },
            ),
            Divider(),
            _DrawerItem(
              icon: Icon(
                Icons.settings_outlined,
                color: _selectedIndex == 3 ? Color(0xffFBB03B) : Colors.black,
                size: 24,
              ),
              text: 'Settings',
              isSelected: _selectedIndex == 3,
              onTap: () {
                setState(() => _selectedIndex = 3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.icon,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  });

  final Widget icon;
  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          color: isSelected ? Color(0xffFBB03B) : Colors.black,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Color(0xffFBB03B).withOpacity(0.1),
      onTap: onTap,
    );
  }
}
