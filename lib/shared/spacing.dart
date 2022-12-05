import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  const HSpace(
    this.length, {
    Key? key,
    this.child,
  }) : super(key: key);

  final double length;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: length,
    );
  }
}

class WSpace extends StatelessWidget {
  const WSpace(
    this.length, {
    Key? key,
    this.child,
  }) : super(key: key);

  final double length;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: length,
    );
  }
}
