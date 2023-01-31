import 'dart:async';

import 'package:calm_mind/classes/view/classes_page.dart';
import 'package:calm_mind/l10n/l10n.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/icons.dart';
import 'package:calm_mind/themes/images.dart';
import 'package:calm_mind/themes/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(final BuildContext context) {
    final size = MediaQuery.of(context).size;

    const opacity = 0.9;

    return Scaffold(
      body: Stack(
        children: [
          _Circle(
            offset: Offset(size.width - 60, 60),
            radius: 279 / 2,
            color: CalmMindColors.orange,
          ),
          _Circle(
            offset: Offset(size.width / 2, size.height - 140),
            radius: 496 / 2,
            color: CalmMindColors.blue.withOpacity(opacity),
          ),
          _Content(),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    const smileSize = 19.0;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(spacing4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  CalmMindIcons.smile,
                  height: smileSize,
                  width: smileSize,
                ),
                const SizedBox(width: spacing),
                Text(
                  l10n.applicationName,
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(color: CalmMindColors.ink03),
                ),
              ],
            ),
            const SizedBox(height: spacing2),
            Text(
              l10n.tagline,
              style: theme.textTheme.displayMedium
                  ?.copyWith(color: CalmMindColors.ink01),
            ),
            const SizedBox(height: spacing6),
            Expanded(
              child: Image.asset(
                CalmMindImages.smallHappinessSittingOnFloor,
              ),
            ),
            const SizedBox(height: spacing6),
            InkWell(
              key: const Key('homeView_push_to_ClassesPage'),
              onTap: () => unawaited(
                Navigator.of(context)
                    .pushReplacement<MaterialPageRoute<void>, ClassesPage>(
                  MaterialPageRoute(
                    builder: (final context) => const ClassesPage(),
                  ),
                ),
              ),
              focusColor: Colors.white,
              child: Container(
                decoration: const ShapeDecoration(
                  color: CalmMindColors.darkBackground,
                  shape: CircleBorder(),
                ),
                height: iconSize2,
                width: iconSize2,
                child: const Icon(
                  Icons.chevron_right,
                  color: CalmMindColors.ink06,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({
    this.offset,
    this.radius,
    this.color,
  });

  final Offset? offset;
  final double? radius;
  final Color? color;

  @override
  Widget build(final BuildContext context) => CustomPaint(
        painter: _CirclePainter(
          offset ?? Offset.zero,
          radius ?? 0,
          color ?? CalmMindColors.ink01,
        ),
      );
}

class _CirclePainter extends CustomPainter {
  _CirclePainter(this.offset, this.radius, this.color);

  final Offset offset;
  final double radius;
  final Color color;

  @override
  void paint(final Canvas canvas, final Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(final CustomPainter oldDelegate) => true;
}
