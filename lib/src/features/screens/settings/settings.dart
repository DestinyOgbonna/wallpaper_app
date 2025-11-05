import 'package:desktop_app/src/features/screens/browse_wallpaper_page/browse_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? _selectedOption;
  final List<String> _options = ['Option A', 'Option B', 'Option C'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(30.w),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 900;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                'Settings',
                style: TextStyle(
                  fontFamily: 'ClashDisplay',
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
                gradient: const LinearGradient(
                  colors: [Color(0xffFBB03B), Color(0xffEC0C43)],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Customize your wallpaper Studio experience',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              Gap(50.h),

              /// Main Container
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                ),
                child: isSmallScreen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _buildLeftSection(isSmallScreen),
                          Gap(40.h),
                          _buildPhoneMockup(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildLeftSection(isSmallScreen)),
                          Gap(60.w),
                          _buildPhoneMockup(),
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// LEFT SETTINGS SECTION
  Widget _buildLeftSection(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(20.h),
        const Text(
          'Wallpaper Setup',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const Text(
          'Configure your wallpaper settings and enable auto-rotation',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        Gap(30.h),

        /// Dropdown Section
        Container(
          width: isSmallScreen ? double.infinity : 500.w,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Image Quality',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedOption,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                items: _options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() => _selectedOption = newValue);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an option';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        Gap(20.h),

        /// Notification Settings
        Container(
          width: isSmallScreen ? double.infinity : 500.w,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text(
              'Notifications Settings',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            subtitle: const Text(
              'Get notified about new wallpapers and updates',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            trailing: Switch.adaptive(
              value: true,
              activeTrackColor: const Color(0XFFFBB03B),
              onChanged: (value) {},
            ),
          ),
        ),
        Gap(30.h),

        /// Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _outlinedButton('Cancel'),
            Gap(10.w),
            _filledButton('Save Settings'),
          ],
        ),
      ],
    );
  }

  /// PHONE MOCKUP
  Widget _buildPhoneMockup() {
    return Container(
      height: 520.h,
      width: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.grey[300]!, width: 4),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 18,
            width: 72,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(26),
            ),
          ),
          const Spacer(),
          Container(
            height: 30,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const Gap(10),
          Center(
            child: const Text(
              'Click to disconnect',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            height: 2,
            width: 72,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(26),
            ),
          ),
        ],
      ),
    );
  }

  Widget _outlinedButton(String text) => Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26),
      border: Border.all(color: Colors.grey[300]!),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
  );

  Widget _filledButton(String text) => Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26),
      color: const Color(0XFFFBB03B),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
  );
}
