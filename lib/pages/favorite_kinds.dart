import 'package:flutter/material.dart';
import 'package:jody/components/custom_appbar2.dart';
import 'package:jody/components/custom_container_in_setting.dart';
import 'package:jody/pages/favourites.dart';
import 'package:jody/views/favorites_tourism_view.dart';

class FavoriteKinds extends StatelessWidget {
  const FavoriteKinds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(children: [
        const SizedBox(
          height: 55,
        ),
        CustomAppBar2(
          title: 'Favorite Kinds',
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(
          height: 10,
        ),
        // GestureDetector(
        //     onTap: () {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
        //         return Favorites();
        //       }));
        //     },
        //     child: CustomContainerSetting(
        //       icon: Icons.abc,
        //       tileName: 'Governorates',
        //     )),
        // const SizedBox(
        //   height: 10,
        // ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Favorites();
            }));
          },
          child: const CustomContainerSetting(
            icon: Icons.abc,
            tileName: 'Legends',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Favorites();
            }));
          },
          child: const CustomContainerSetting(
            icon: Icons.abc,
            tileName: 'Trips',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FavoritesTourismPlaceView();
            }));
          },
          child: const CustomContainerSetting(
            icon: Icons.abc,
            tileName: 'Tourism Places',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) {
        //       return Favorites();
        //     }));
        //   },
        //   child: CustomContainerSetting(
        //     icon: Icons.abc,
        //     tileName: 'Offers',
        //   ),
        // ),
      ]),
    ));
  }
}
