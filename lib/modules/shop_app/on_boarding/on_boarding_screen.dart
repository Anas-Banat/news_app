import 'dart:html';

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OnBoard'),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          Column(
            children: [
              Expanded(
                PageView.builder(
                itemBuilder: (context, index) => buildBoardingItem(),
                itemCount:3,
                ),
                SizeBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Text('Indicator',),
                  ],
                ),
              ),  
            ],
          ),
        ),  
      ),
    );
  }

  Widget buildBoardingItem() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image(
              image: AssetImage('assets/images/onBiard1.jpg'),
              ),
            ),
            SizeBox(
              height: 30.0,
            ),
            Text(
              'Screen Title',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizeBox(
              height: 15.0,
            ),
            Text(
              'Screen Body',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
}
