import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jody/components/custom_appbar.dart';
import 'package:jody/components/custom_container_in_setting.dart';
import 'package:jody/components/custom_divider.dart';
import 'package:jody/components/dark_mode_container.dart';
import 'package:jody/components/setting_container.dart';
import 'package:jody/pages/account.dart';
import 'package:jody/pages/change_password.dart';
import 'package:jody/pages/privacy.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          children: [
            const SizedBox(
              height: 55,
            ),
            CustomAppBar(
              title: 'Setting',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Account();
                }));
              },
            ),
            const SizedBox(
              height: 23,
            ),
            const SettingContainer(),
            const SizedBox(
              height: 50,
            ),
            const CustomDivider(
              divName: 'Account',
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: 'settings',
                  );
                },
                child: const CustomContainerSetting(
                  tileName: 'Profile',
                  icon: Icons.person_outline_rounded,
                )),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChangePassword();
                }));
              },
              child: const CustomContainerSetting(
                tileName: 'Change Password',
                icon: CupertinoIcons.lock_rotation_open,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomDivider(divName: 'General'),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Privacy();
                }));
              },
              child: const CustomContainerSetting(
                tileName: 'About Kemet',
                icon: Icons.privacy_tip_outlined,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const DarkMode()
          ],
        ),
      ),
    );
  }
}
