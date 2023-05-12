import 'dart:async';

import 'package:calm_mind/class_player/bloc/class_player_bloc.dart';
import 'package:calm_mind/class_player/bloc/class_player_event.dart';
import 'package:calm_mind/class_player/view/class_player_page.dart';
import 'package:calm_mind/classes/bloc/classes_bloc.dart';
import 'package:calm_mind/classes/bloc/classes_state.dart';
import 'package:calm_mind/classes/cubit/tag_cubit.dart';
import 'package:calm_mind/classes/models/class_id.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/classes/widgets/tag.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/icons.dart';
import 'package:calm_mind/themes/images.dart';
import 'package:calm_mind/themes/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassesView extends StatelessWidget {
  const ClassesView({super.key});

  @override
  Widget build(final BuildContext context) => const Scaffold(
        body: Column(
          children: [
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

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: spacing4,
          top: spacing4,
          right: spacing4,
        ),
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
                style: theme.textTheme.headlineMedium
                    ?.copyWith(color: CalmMindColors.ink01),
              ),
            ),
            IconButton(
              onPressed: menuBurgerOnPressed,
              icon: SvgPicture.asset(
                CalmMindIcons.menuBurger,
                width: iconSize,
                height: iconSize,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void menuBurgerOnPressed() {
    debugPrint('menuBurger');
  }
}

class _Tags extends StatelessWidget {
  const _Tags();

  @override
  Widget build(final BuildContext context) {
    final list = TagEnum.values.toList()..remove(TagEnum.none);

    return BlocBuilder<TagCubit, TagEnum>(
      builder: (final context, final state) => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (final context, final index) {
          final item = list[index];
          final widget = Tag(
            item.toText(),
            key: Key('tag_$item'),
            active: state == item,
            onTap: () => context.read<TagCubit>().select(item),
          );
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: widget,
            );
          }

          return widget;
        },
        separatorBuilder: (final context, final index) =>
            const SizedBox(width: spacing2),
        itemCount: list.length,
      ),
    );
  }
}

class _ClassesList extends StatelessWidget {
  const _ClassesList();

  @override
  Widget build(final BuildContext context) =>
      BlocBuilder<ClassesBloc, ClassesState>(
        builder: (final context, final state) {
          if (state is ClassesLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ClassesLoadSuccess) {
            final classes = state.classes;

            return ListView.builder(
              padding: const EdgeInsets.all(spacing4),
              itemBuilder: (final context, final index) {
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
              itemCount: classes.length,
            );
          }

          return const SizedBox();
        },
      );
}

class _Card extends StatelessWidget {
  const _Card({
    required this.label,
    required this.timeLabel,
    required this.imageName,
    required this.color,
  }) : isBig = false;

  const _Card.big({
    required this.label,
    required this.timeLabel,
    required this.imageName,
    required this.color,
  }) : isBig = true;

  final String label;
  final String timeLabel;
  final String imageName;
  final Color color;
  final bool isBig;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    final headlineSmallInk01 =
        theme.textTheme.headlineSmall?.copyWith(color: CalmMindColors.ink01);

    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: headlineSmallInk01,
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
                  style: headlineSmallInk01,
                ),
              ),
              _TimeLabel(timeLabel: timeLabel),
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
        color: color,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(spacing4)),
        ),
        child: InkWell(
          onTap: () => handleTap(context),
          borderRadius: const BorderRadius.all(Radius.circular(spacing4)),
          child: Padding(padding: const EdgeInsets.all(spacing4), child: child),
        ),
      ),
    );
  }

  void handleTap(final BuildContext context) {
    BlocProvider.of<ClassPlayerBloc>(context)
        .add(ClassPlayerSelected(ClassId.init()));
    unawaited(
      Navigator.of(context).push<MaterialPageRoute<ClassPlayerPage>>(
        MaterialPageRoute(builder: (final context) => const ClassPlayerPage()),
      ),
    );
  }
}

class _TimeLabel extends StatelessWidget {
  const _TimeLabel({
    required this.timeLabel,
  });

  final String timeLabel;

  @override
  Widget build(final BuildContext context) {
    final theme = Theme.of(context);
    const height = 24.0;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: spacing2),
      decoration: const BoxDecoration(
        color: CalmMindColors.ink06,
        borderRadius: BorderRadius.all(Radius.circular(spacing4)),
      ),
      height: height,
      child: Text(
        timeLabel,
        style: theme.textTheme.bodySmall
            ?.copyWith(color: CalmMindColors.darkBackground),
      ),
    );
  }
}
