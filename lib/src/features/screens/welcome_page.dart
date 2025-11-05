import 'package:desktop_app/src/features/screens/browse_wallpaper_page/browse_wallpaper.dart';
import 'package:desktop_app/src/features/screens/browse_wallpaper_page/widgets/icon_button.dart';
import 'package:desktop_app/src/features/screens/favorites/favorites.dart';
import 'package:desktop_app/src/features/screens/homepage/home_screen.dart';
import 'package:desktop_app/src/features/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WelcomePageScreeen extends StatefulWidget {
  const WelcomePageScreeen({super.key});

  @override
  State<WelcomePageScreeen> createState() => _WelcomePageScreeenState();
}

class _WelcomePageScreeenState extends State<WelcomePageScreeen> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return DashboardScreen();
      case 2:
        return SavedWallPapersScreen(); // Replace with your Favorites screen
      case 3:
        return SettingsScreen(); // Replace with your Settings screen
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = constraints.maxWidth >= 900;

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Color(0xfff8f8f8),
          endDrawer: !isDesktop ? _buildDrawer() : null,
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Color(0Xfff8f8f8),
                  automaticallyImplyLeading: false,
                  floating: true,

                  toolbarHeight: 100.h,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        // Header Section
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
                              Icon(
                                Icons.wallpaper,
                                color: Colors.black,
                                size: 28,
                              ),
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
                            ],
                          ),
                        ),

                        // Content Area
                      ],
                    ),
                  ),
                ),

                SliverFillRemaining(child: _getSelectedScreen()),
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
