import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

extension DecorationImageExtension on DecorationImage {
  DecorationImage? ifNotNull(String? cond) {
    return cond != null ? this : null;
  }
}

extension WidgetExtensions on Widget {
  Widget toShimmer(bool cond) {
    return cond
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade800,
            highlightColor: Colors.grey.shade700,
            child: this)
        : this;
  }
}
