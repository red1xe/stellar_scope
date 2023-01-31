// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import "dart:math" as math;
import 'package:stellar_scope/main.dart';

class PlanetRotation extends StatefulWidget {
  String planetImage;
  PlanetRotation(
    Key? key,
    this.planetImage,
  ) : super(key: key);
  @override
  _PlanetRotationState createState() => _PlanetRotationState();
}

class _PlanetRotationState extends State<PlanetRotation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: Image.network(widget.planetImage),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
