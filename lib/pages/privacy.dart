import 'package:flutter/material.dart';
import 'package:jody/components/custom_appbar.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 55,
            ),
            CustomAppBar(
              title: 'Policy',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(
              height: 24,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Terms of use',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 18,
                fontWeight: FontWeight.w600,
                //color: Colors.black
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Last Updated : ',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 14,
                fontWeight: FontWeight.w200,
                //color: Colors.black
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              'Please read this terms carefully before using our service',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 15,
                fontWeight: FontWeight.w500,
                //color: Colors.black
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Defintions',
              style: TextStyle(
                fontFamily: 'poppins',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                //color: Colors.black
              ),
            )
          ],
        ),
      ),
    );
  }
}
