import 'package:flutter/material.dart';

class OverviewContent {
  const OverviewContent(
      {@required this.title,
      @required this.subTitle,
      @required this.leadingColor,
      @required this.leadingIcon,
      @required this.change,
      @required this.percentOfChange,
      @required this.content,
      @required this.isMoreDetail})
      : assert(title != null),
        assert(subTitle != null),
        assert(leadingColor != null),
        assert(leadingIcon != null),
        assert(change != null),
        assert(percentOfChange != null),
        assert(content != null);

  final String title;
  final String subTitle;
  final Color leadingColor;
  final IconData leadingIcon;
  final int change;
  final double percentOfChange;
  final Map<String, String> content;
  final bool isMoreDetail;
}
