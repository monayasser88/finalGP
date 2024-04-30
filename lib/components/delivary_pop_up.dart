import 'package:flutter/material.dart';
import 'package:jody/pages/account.dart';


class DelivaryPopUp extends StatelessWidget {
  const DelivaryPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              const Image(
                image: AssetImage('assets/congratsImage.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Congrats!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'poppins',
                  //color: Colors.black
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Your tickets will arrive within two days',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.w700,
                    color: Colors.grey),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Color(0xffB68B25)),
                  minimumSize: MaterialStatePropertyAll(Size(340, 50)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  )),
                ),
                child: const Text(
                  'Back Home',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'poppins',
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return Account();
                  })));
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showCustomPopupdelivary(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return const DelivaryPopUp();
    },
  );
}
