import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingRectange extends StatelessWidget {
  const LoadingRectange({super.key, required this.height, required this.width});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: const LinearGradient(
        colors: [Colors.white, Colors.grey],
      ),
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }
}
