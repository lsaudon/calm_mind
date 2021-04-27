import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:calm_mind/class_player/class_player.dart';

class ClassPlayerPage extends StatelessWidget {
  const ClassPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClassPlayerView();
  }
}

class ClassPlayerView extends StatelessWidget {
  const ClassPlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalmMindColors.yellow,
      body: Column(
        children: [
          const _Header(),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: const [
                _Content(),
                _PlayerTabBars(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: spacing5, horizontal: spacing4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                CalmMindIcons.chevronArrowLeft,
              ),
              iconSize: iconSize,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                CalmMindIcons.download,
              ),
              iconSize: iconSize,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassPlayerBloc, ClassPlayerState>(
      builder: (context, state) {
        if (state is ClassPlayerLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ClassPlayerLoadSuccess) {
          final classItem = state.value;
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(spacing6),
                topRight: Radius.circular(spacing6),
              ),
              color: CalmMindColors.ink06,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: spacing12),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 231,
                      width: 231,
                      color: CalmMindColors.orange,
                    ),
                    const SizedBox(height: spacing6),
                    _TextContent(
                      label: classItem.label,
                      tag: classItem.tag,
                    ),
                    const SizedBox(height: spacing6),
                    const _PlayerElements(),
                    const SizedBox(height: spacing6),
                    Container(
                      height: 48,
                      color: CalmMindColors.orange,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class _TextContent extends StatelessWidget {
  const _TextContent({
    Key? key,
    required this.label,
    required this.tag,
  }) : super(key: key);

  final String label;
  final TagEnum tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: spacing2,
        bottom: spacing4,
      ),
      child: Column(
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline4?.copyWith(color: CalmMindColors.ink01),
          ),
          const SizedBox(height: spacing),
          Text(
            tag.toText(),
            style: Theme.of(context).textTheme.subtitle2?.copyWith(color: CalmMindColors.ink02),
          ),
        ],
      ),
    );
  }
}

class _PlayerElements extends StatelessWidget {
  const _PlayerElements({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: SvgPicture.asset(CalmMindIcons.fastBackward),
          onPressed: () {},
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            primary: CalmMindColors.orange,
            elevation: 0,
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(spacing6),
            child: SvgPicture.asset(
              CalmMindIcons.pause,
              height: iconSize,
              width: iconSize,
            ),
          ),
        ),
        IconButton(
          icon: SvgPicture.asset(CalmMindIcons.fastForward),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PlayerTabBars extends StatelessWidget {
  const _PlayerTabBars({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(spacing6),
          topRight: Radius.circular(spacing6),
        ),
        color: CalmMindColors.orange,
      ),
      height: 96,
      child: Padding(
        padding: const EdgeInsets.only(top: spacing2, left: spacing6, right: spacing6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            _PlayerTab(CalmMindIcons.favourites),
            _PlayerTab(CalmMindIcons.playlist),
            _PlayerTab(CalmMindIcons.shuffle),
          ],
        ),
      ),
    );
  }
}

class _PlayerTab extends StatelessWidget {
  const _PlayerTab(
    this.assetName, {
    Key? key,
  }) : super(key: key);

  final String assetName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 99,
      height: 64,
      child: Center(
        child: SvgPicture.asset(
          assetName,
          height: iconSize,
          width: iconSize,
        ),
      ),
    );
  }
}
