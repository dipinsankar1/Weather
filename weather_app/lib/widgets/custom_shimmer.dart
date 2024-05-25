import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  const CustomShimmer({
    super.key,
    this.height = 100.0,
    this.width = 100.0,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
        height: height,
        width: width,
      ),
    );
  }
}