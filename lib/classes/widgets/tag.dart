import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/theme_data.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag(
    this.data, {
    super.key,
    this.active = false,
    this.onTap,
  });

  final String data;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(final BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .labelLarge
        ?.copyWith(color: CalmMindColors.ink01);
    final widget = Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(spacing4)),
        color: active ? CalmMindColors.ink01 : CalmMindColors.ink00,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: spacing4),
      child: Text(
        data,
        style: active
            ? textStyle?.copyWith(
                color: CalmMindColors.ink06,
                fontWeight: FontWeight.w800,
              )
            : textStyle,
      ),
    );
    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: widget,
      );
    }

    return widget;
  }
}
