import 'package:desktop_app/src/features/screens/browse_wallpaper_page/widgets/grid_items.dart';
import 'package:desktop_app/src/features/screens/browse_wallpaper_page/widgets/row_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _gridCount = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 800;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(23.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header section
                  _buildHeader(isSmallScreen),
                  Gap(30.h),

                  // Only show toggle buttons on large screens
                  if (!isSmallScreen)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Explore our curated collections of stunning wallpapers',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        _buildViewToggle(),
                      ],
                    ),

                  if (isSmallScreen)
                    Text(
                      'Explore our curated collections of stunning\nwallpapers',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),

                  Gap(30.h),

                  // Animated layout switch (grid ↔ list)
                  isSmallScreen
                      ? AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                          child: const RowItems(key: ValueKey(1)),
                        )
                      : AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) =>
                              FadeTransition(opacity: animation, child: child),
                          child: _gridCount == 0
                              ? const GridItems(key: ValueKey(0))
                              : const RowItems(key: ValueKey(1)),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Header with gradient text
  Widget _buildHeader(bool isSmallScreen) {
    return GradientText(
      'Browse Categories',
      style: TextStyle(
        fontFamily: 'ClashDisplay',
        fontSize: isSmallScreen ? 26 : 40,
        fontWeight: FontWeight.w500,
      ),
      gradient: const LinearGradient(
        colors: [Color(0xffFBB03B), Color(0xffEC0C43)],
      ),
    );
  }

  /// Grid/List toggle icons
  Widget _buildViewToggle() {
    return Row(
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
          onPressed: () => setState(() => _gridCount = 0),
        ),
        Gap(10.w),
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
          onPressed: () => setState(() => _gridCount = 1),
        ),
      ],
    );
  }
}

/// Custom gradient text widget
class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
