import 'package:flutter/material.dart';

class Notificationpage extends StatelessWidget {
  const Notificationpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(top: 100, left: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/PngItem_1799641.png',
              height: 70,
              width: 70,
              color: Colors.green,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Turn on notifications?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Dont miss important messages from {Club name}.',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
            SizedBox(
              height: 35,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Container(
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.only(top: 13),
                  child: Text(
                    'Yes,notify me',
                    style: TextStyle(fontSize: 23),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            SizedBox(
              height: 25,
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 20),
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ],
        ),
      ),
    );
  }
}
