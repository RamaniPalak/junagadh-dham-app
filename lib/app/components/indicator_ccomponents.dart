import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    this.controller,
    this.itemCount = 0,
  }) : assert(controller != null);

  /// PageView Controller
  final PageController? controller;

  /// Number of indicators
  final int itemCount;

  /// Ordinary colours
  final Color normalColor = Colors.white;

  /// Selected color
  final Color selectedColor = Colors.red;

  /// Size of points
  final double size = 12.0;

  /// Spacing of points
  final double spacing = 4.0;

  /// Point Widget
  Widget _buildIndicator(
      int index, int pageCount, double dotSize, double spacing) {
    // Is the current page selected?
    bool isCurrentPageSelected = index ==
        (controller?.page != null ? controller!.page!.round() % pageCount : 0);

    return Container(
      height: size,
      width: size + (2 * spacing),
      child: Center(
        child: Material(
          color: normalColor,
          type: MaterialType.circle,
          child: isCurrentPageSelected
              ? Container(
            width: dotSize,
            height: dotSize,
          )
              : Container(
            width: 6,
            height: 6,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, (int index) {
        return _buildIndicator(index, itemCount, size, spacing);
      }),
    );
  }
}