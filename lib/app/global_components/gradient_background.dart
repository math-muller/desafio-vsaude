import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final double screenSize;

  const GradientBackground({
    Key? key,
    required this.child,
    this.screenSize = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * screenSize,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.58],
          colors: [
            Colors.pink,
            Colors.purple,
          ],
        ),
      ),
      child: child,
    );
  }
}
