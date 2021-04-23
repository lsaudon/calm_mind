import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:calm_mind/l10n/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Circle(
            offset: Offset(size.width - 60, 60),
            radius: 279 / 2,
            color: CalmMindColors.orange,
          ),
          Circle(
            offset: Offset(size.width / 2, size.height - 140),
            radius: 496 / 2,
            color: CalmMindColors.blue.withOpacity(0.9),
          ),
          _Content(),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

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
                  height: 19,
                  width: 19,
                ),
                const SizedBox(width: spacing),
                Text(
                  l10n.applicationName,
                  style: theme.textTheme.headline5?.copyWith(color: CalmMindColors.ink03),
                ),
              ],
            ),
            const SizedBox(height: spacing2),
            Text(
              l10n.tagline,
              style: theme.textTheme.headline2?.copyWith(color: CalmMindColors.ink01),
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
              onTap: () {
                Navigator.of(context).pushReplacement<MaterialPageRoute, ClassesPage>(
                    MaterialPageRoute(builder: (context) => const ClassesPage()));
              },
              focusColor: Colors.white,
              child: Container(
                decoration: const ShapeDecoration(
                  color: CalmMindColors.darkBackground,
                  shape: CircleBorder(),
                ),
                height: 64,
                width: 64,
                child: const Icon(
                  Icons.chevron_right,
                  color: CalmMindColors.ink06,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  const Circle({
    Key? key,
    this.offset,
    this.radius,
    this.color,
  }) : super(key: key);

  final Offset? offset;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _Circle(
        offset ?? const Offset(0, 0),
        radius ?? 0,
        color ?? CalmMindColors.ink01,
      ),
    );
  }
}

class _Circle extends CustomPainter {
  _Circle(this.offset, this.radius, this.color);

  final Offset offset;
  final double radius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
