import 'package:calm_mind/class_player/class_player.dart';
import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({final super.key});

  @override
  Widget build(final BuildContext context) {
    return BlocProvider(
      create: (final context) => TagCubit(),
      child: Builder(
        builder: (final context) {
          return BlocProvider(
            create: (final _) => ClassesBloc(
              tagCubit: BlocProvider.of<TagCubit>(context),
              classesRepository: RepositoryProvider.of<ClassesRepository>(context),
            )..add(const ClassesLoaded(TagEnum.none)),
            child: const ClassesView(),
          );
        },
      ),
    );
  }
}

class ClassesView extends StatelessWidget {
  const ClassesView({final super.key});

  @override
  Widget build(final BuildContext context) {
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
  const _Header();

  @override
  Widget build(final BuildContext context) {
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
              onPressed: () {
                // TODO(lsaudon): need to implement.
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags();

  @override
  Widget build(final BuildContext context) {
    final list = TagEnum.values.toList()..remove(TagEnum.none);

    return BlocBuilder<TagCubit, TagEnum>(
      builder: (final context, final state) {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
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
          separatorBuilder: (final context, final index) {
            return const SizedBox(width: spacing2);
          },
        );
      },
    );
  }
}

class _ClassesList extends StatelessWidget {
  const _ClassesList();

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ClassesBloc, ClassesState>(
      builder: (final context, final state) {
        if (state is ClassesLoadInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ClassesLoadSuccess) {
          final classes = state.classes;

          return ListView.builder(
            itemCount: classes.length,
            padding: const EdgeInsets.all(spacing4),
            itemBuilder: (final BuildContext context, final int index) {
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
          );
        }

        return const SizedBox();
      },
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({
    required final this.label,
    required final this.timeLabel,
    required final this.imageName,
    required final this.color,
  }) : isBig = false;

  const _Card.big({
    required final this.label,
    required final this.timeLabel,
    required final this.imageName,
    required final this.color,
  }) : isBig = true;

  final String label;
  final String timeLabel;
  final String imageName;
  final Color color;
  final bool isBig;

  @override
  Widget build(final BuildContext context) {
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(spacing4)),
        ),
        color: color,
        elevation: 0,
        child: InkWell(
          onTap: () => handleTap(context),
          borderRadius: const BorderRadius.all(Radius.circular(spacing4)),
          child: Padding(
            padding: const EdgeInsets.all(spacing4),
            child: child,
          ),
        ),
      ),
    );
  }

  void handleTap(final BuildContext context) {
    BlocProvider.of<ClassPlayerBloc>(context).add(ClassPlayerSelected(ClassId.init()));
    Navigator.of(context)
        .push<MaterialPageRoute>(MaterialPageRoute(builder: (final context) => const ClassPlayerPage()));
  }
}

class _TimeLabel extends StatelessWidget {
  const _TimeLabel({
    required final this.timeLabel,
  });

  final String timeLabel;

  @override
  Widget build(final BuildContext context) {
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
