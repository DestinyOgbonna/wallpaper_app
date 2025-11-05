import 'package:desktop_app/src/features/screens/browse_wallpaper_page/browse_wallpaper.dart';
import 'package:desktop_app/src/features/screens/browse_wallpaper_page/widgets/icon_button.dart';
import 'package:desktop_app/src/features/screens/browse_wallpaper_page/widgets/row_items.dart';

import 'package:desktop_app/src/features/screens/wallpaper_details/wallpaper_settings.dart';
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
                // Header
                Container(
                  constraints: BoxConstraints(minHeight: 70),
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 20.w : 16,
                    vertical: 15,
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
                      Icon(
                        Icons.wallpaper,
                        color: Colors.black,
                        size: isDesktop ? 28 : 24,
                      ),
                      Gap(12.w),

                      Text(
                        'Wallpapers',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: isDesktop ? 22 : 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
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

                SizedBox(height: isDesktop ? 40 : 20),

                // Back Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '<- Back to Categories',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: isDesktop ? 16 : 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: isDesktop ? 60 : 30),

                // Content Area - Stack layout for mobile/tablet, Row for desktop
                isDesktop
                    ? _buildDesktopLayout(constraints)
                    : _buildMobileLayout(constraints),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Section - Wallpaper Grid/List
          Expanded(flex: 1, child: _buildWallpaperSection()),
          SizedBox(width: 20),
          // Right Section - Preview
          Expanded(flex: 1, child: _buildPreviewSection()),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildWallpaperSection(),
          SizedBox(height: 30),
          _buildPreviewSection(),
        ],
      ),
    );
  }

  Widget _buildWallpaperSection() {
    return Container(
      constraints: BoxConstraints(minHeight: 400),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Nature',
                  style: TextStyle(
                    fontFamily: 'ClashDisplay',
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/svg/grid.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        _gridCount == 0 ? Colors.orange : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () {
                      setState(() => _gridCount = 0);
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset(
                      'assets/svg/list.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        _gridCount == 1 ? Colors.orange : Colors.grey,
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
          SizedBox(height: 30),
          _gridCount == 1
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
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
                      Divider(height: 20, color: Color(0xffCFCFCF)),
                )
              : LayoutBuilder(
                  builder: (context, constraints) {
                    int crossAxisCount = constraints.maxWidth > 800
                        ? 3
                        : constraints.maxWidth > 500
                        ? 2
                        : 1;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.65,
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return _buildGridItem();
                      },
                    );
                  },
                ),
        ],
      ),
    );
  }

  Widget _buildGridItem() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.black54,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/mountain.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Icon(Icons.favorite, color: Color(0xffFBB03B), size: 20),
            ),
          ),
          Spacer(),
          Text(
            'Nature',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              'View Details',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPreviewSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isCompact = constraints.maxWidth < 600;

        return Container(
          constraints: BoxConstraints(minHeight: 400),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              Flex(
                direction: isCompact ? Axis.vertical : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: isCompact ? 0 : 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: isCompact ? 0 : 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Preview',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 30),
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
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'TAGS',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 10),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              _buildTag('Nature'),
                              _buildTag('Ambience'),
                              _buildTag('Flowers'),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Description',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(height: 8),
                          GradientText(
                            'Discover the pure beauty of "Natural Essence" – \nyour gateway to authentic, nature-inspired experiences.\nLet this unique collection elevate your\n senses and connect you with the unrefined \nelegance of the natural world. Embrace',
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                            gradient: LinearGradient(
                              colors: [Color(0XFF000000), Color(0XFFFFFFFF)],
                            ),
                          ),
                          SizedBox(height: 30),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              _buildActionButton(Icons.ios_share_outlined),
                              _buildActionButton(
                                Icons.transfer_within_a_station_outlined,
                              ),
                              GestureDetector(
                                onTap: _showSettingsModal,
                                child: _buildActionButton(
                                  Icons.settings_outlined,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (!isCompact) SizedBox(width: 20),
                  if (isCompact) SizedBox(height: 30),

                  Flexible(
                    flex: isCompact ? 0 : 1,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 400,
                          maxHeight: 500,
                        ),
                        child: AspectRatio(
                          aspectRatio: 9 / 19.5,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 4),
                              color: Color(0xffFBB03B),
                              borderRadius: BorderRadius.circular(35),
                              image: DecorationImage(
                                image: AssetImage('assets/images/mountain.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      width: 42,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(26),
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      width: 52,
                                      height: 2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(26),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              // Action buttons
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.end,
                children: [
                  ActionButtons(
                    icon: Icons.favorite_border,
                    text: 'Save to Favorite',
                    isPrimary: false,
                  ),
                  ActionButtons(
                    icon: null,
                    text: 'Set to Wallpaper',
                    isPrimary: true,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 244, 244),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: Colors.grey[500], size: 20),
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
                  SizedBox(height: 10),
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

  void _showSettingsModal() {
    showGeneralDialog(
      context: context,
      barrierLabel: "Settings",
      barrierDismissible: true,
      barrierColor: Colors.black.withValues(alpha: 0.8),
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (context, anim1, anim2) {
        return WallpaperSettings();
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    this.icon,
    required this.text,
    required this.isPrimary,
  });
  final IconData? icon;
  final String text;
  final bool isPrimary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: isPrimary ? Color(0XFFFBB03B) : null,
        border: isPrimary ? null : Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: isPrimary ? Colors.white : Colors.black,
              size: 20,
            ),
            SizedBox(width: 8),
          ],
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isPrimary ? Colors.white : Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
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
