import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NkHelper {
  static Widget shimmerWidget({double? w, double? h}) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200]!,
        highlightColor: Colors.grey.withOpacity(0.2),
        child: SizedBox(
          height: h,
          width: w,
        ));
  }
}
