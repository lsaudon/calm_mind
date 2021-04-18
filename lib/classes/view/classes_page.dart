import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/icons.dart';
import 'package:calm_mind/themes/images.dart';
import 'package:calm_mind/themes/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ClassesBloc(classesRepository: RepositoryProvider.of<ClassesRepository>(context))..add(LoadClasses()),
      child: const ClassesView(),
    );
  }
}

class ClassesView extends StatelessWidget {
  const ClassesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          _Header(),
          SizedBox(height: spacing5),
          SizedBox(
            height: 40,
            child: _Tags(),
          ),
          SizedBox(height: spacing),
          Expanded(child: _ClassesList()),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: spacing4, left: spacing4, right: spacing4),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                CalmMindImages.logo,
                width: iconSize,
                height: iconSize,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(width: spacing4),
            Expanded(
              child: Text(
                'Hi, Martha',
                style: theme.textTheme.headline4?.copyWith(color: CalmMindColors.ink01),
              ),
            ),
            IconButton(
              icon: SvgPicture.asset(
                CalmMindIcons.menuBurger,
                height: iconSize,
                width: iconSize,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = ['Sleeper', 'Inner Peace', 'Stress', 'Anxiety', 'Sleeper', 'Inner Peace', 'Stress', 'Anxiety'];
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        final widget = _Tag(
          item,
          active: index == 1,
        );
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: widget,
          );
        }
        return widget;
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: spacing2);
      },
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(
    this.data, {
    Key? key,
    this.active = false,
  }) : super(key: key);

  final String data;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.button?.copyWith(color: CalmMindColors.ink01);
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(spacing4)),
        color: active ? CalmMindColors.ink01 : CalmMindColors.ink00,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: spacing4),
      child: Text(
        data,
        style: active ? textStyle?.copyWith(color: CalmMindColors.ink06, fontWeight: FontWeight.w800) : textStyle,
      ),
    );
  }
}

class _ClassesList extends StatelessWidget {
  const _ClassesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassesBloc, ClassesState>(
      builder: (context, state) {
        if (state is ClassesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ClassesLoaded) {
          final classes = state.classes;
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            mainAxisSpacing: spacing4,
            crossAxisSpacing: spacing4,
            itemCount: classes.length,
            padding: const EdgeInsets.all(spacing4),
            itemBuilder: (BuildContext context, int index) {
              final item = classes[index];
              if (index == 0) {
                return _Card.big(
                  label: item.label,
                  timeLabel: item.timeLabel,
                  imageName: item.imageName,
                  color: item.color,
                );
              }
              return _Card(
                label: item.label,
                timeLabel: item.timeLabel,
                imageName: item.imageName,
                color: item.color,
              );
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(index == 0 ? 2 : 1);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    Key? key,
    required this.label,
    required this.timeLabel,
    required this.imageName,
    required this.color,
  })   : isBig = false,
        super(key: key);

  const _Card.big({
    Key? key,
    required this.label,
    required this.timeLabel,
    required this.imageName,
    required this.color,
  })   : isBig = true,
        super(key: key);

  final String label;
  final String timeLabel;
  final String imageName;
  final Color color;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: theme.textTheme.headline5?.copyWith(color: CalmMindColors.ink01),
        ),
        const SizedBox(height: spacing2),
        Row(children: [_TimeLabel(timeLabel: timeLabel)]),
        const SizedBox(height: spacing2),
        Expanded(
          child: Image.asset(imageName),
        ),
      ],
    );
    if (isBig) {
      child = Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.headline5?.copyWith(color: CalmMindColors.ink01),
                ),
              ),
              _TimeLabel(timeLabel: timeLabel)
            ],
          ),
          const SizedBox(height: spacing2),
          Expanded(
            child: Image.asset(imageName),
          ),
        ],
      );
    }
    return IntrinsicHeight(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(spacing4)),
        ),
        color: color,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(spacing4),
          child: child,
        ),
      ),
    );
  }
}

class _TimeLabel extends StatelessWidget {
  const _TimeLabel({
    Key? key,
    required this.timeLabel,
  }) : super(key: key);

  final String timeLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(spacing4)),
        color: CalmMindColors.ink06,
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: spacing2),
      height: 24,
      child: Text(
        timeLabel,
        style: theme.textTheme.caption?.copyWith(
          color: CalmMindColors.darkBackground,
        ),
      ),
    );
  }
}
