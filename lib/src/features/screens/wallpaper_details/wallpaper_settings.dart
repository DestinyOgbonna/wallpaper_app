import 'package:desktop_app/src/features/screens/wallpaper_details/wallpaper_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class WallpaperSettings extends StatefulWidget {
  const WallpaperSettings({super.key});

  @override
  State<WallpaperSettings> createState() => _WallpaperSettingsState();
}

class _WallpaperSettingsState extends State<WallpaperSettings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Align(
        alignment: Alignment.centerRight,
        child: Material(
          color: Colors.white,
          borderRadius: const BorderRadius.only(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: 700,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wallpaper Setup',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),

                const Text(
                  'Configure your wallpaper settings and enable auto-rotation.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),

                const Gap(30),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: EdgeInsets.only(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    top: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Active WallPapers:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SvgPicture.asset('assets/svg/active.svg'),
                        ],
                      ),
                      const Text(
                        'Set the selected wallpapers as your\ndesktop background.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                Gap(30),
                const Text(
                  'Display mode',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(10),
                _RadioListileWidget(
                  title: 'Fit',
                  subTitle: 'Scale to fit without cropping',
                ),
                _RadioListileWidget(
                  title: 'Fill',
                  subTitle: 'Scale to fill the entire screen',
                ),
                _RadioListileWidget(
                  title: 'Stretch',
                  subTitle: 'Stretch to fill the screen',
                ),
                _RadioListileWidget(
                  title: 'Tile',
                  subTitle: 'Repeat the image to fill the screen',
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  padding: EdgeInsets.only(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    top: 10,
                  ),
                  child: SwitchListTile.adaptive(
                    activeTrackColor: Color(0xffFBB03B),
                    value: true,
                    title: const Text(
                      'Auto - Rotation',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: const Text(
                      'Change wallpaper every 30 minutes',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onChanged: (_) {},
                  ),
                ),
                Gap(30),
                const Text(
                  'Advanced Settings',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(10),
                _RadioListileWidget(
                  title: 'Lock WallPaper',
                  subTitle: 'Prevent accidental Changes',
                ),
                _RadioListileWidget(
                  title: 'Sync Across Devices',
                  subTitle: 'Keep wallpaper consistent on all devices',
                ),

                Gap(40.h),

                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: [
                      ActionButtons(
                        icon: null,
                        text: '     Cancel       ',
                        isPrimary: false,
                      ),
                      ActionButtons(
                        icon: null,
                        text: 'Save Settings',
                        isPrimary: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RadioListileWidget extends StatelessWidget {
  const _RadioListileWidget({required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
      child: RadioListTile(
        toggleable: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30),
        ),
        value: false,
        subtitle: Text(
          subTitle,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
