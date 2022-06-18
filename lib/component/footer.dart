import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(12.0),
      width: MediaQuery.of(context).size.width,
      child: const Center(
        child: Text(
          'Copyright 2022, by Muhammad Rizal Afifuddin.\nBuilt with Flutter.',
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
