import 'package:flutter/material.dart';

class BackgroundColorWidget extends StatelessWidget {
  const BackgroundColorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff7DDFFF),
            Color(0xffB09EFF),
            Color(0xffED92EF),
            Color(0xffF9B1D0),
            Color(0xffE8B8E0),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
