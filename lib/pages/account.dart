import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jody/components/custom_appbar.dart';
import 'package:jody/components/custom_container_in_account.dart';
import 'package:jody/components/logout_pop_up.dart';
import 'package:jody/components/photo_account.dart';
import 'package:jody/pages/change_password.dart';
import 'package:jody/pages/favorite_kinds.dart';
import 'package:jody/pages/profile_page.dart';
import 'package:jody/pages/setting.dart';
import 'package:jody/pages/tickets.dart';

class Account extends StatelessWidget {
  const Account({super.key});

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
            const CustomAppBar(title: 'Account'),
            const SizedBox(
              height: 29,
            ),
            PhotoAccount(),
            const SizedBox(
              height: 27,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
              child: const ContainerAccount(
                  contName: 'Profile', contIcon: Icons.person_outline_rounded),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ChangePassword();
                }));
              },
              child: const ContainerAccount(
                  contName: 'Change Password',
                  contIcon: CupertinoIcons.lock_rotation_open),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Tickets();
                }));
              },
              child: const ContainerAccount(
                  contName: 'My Tickets', contIcon: CupertinoIcons.tickets),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const FavoriteKinds();
                  //SearchPage();
                }));
              },
              child: const ContainerAccount(
                  contName: 'Favorites', contIcon: CupertinoIcons.heart),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Setting();
                }));
              },
              child: const ContainerAccount(
                  contName: 'Setting', contIcon: Icons.settings_outlined),
            ),
            const SizedBox(
              height: 15,
            ),
            ContainerAccount(
              contName: 'Log Out',
              contIcon: Icons.logout,
              onTap: () {
                showCustomPopup(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
