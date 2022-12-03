import 'package:calm_mind/classes/models/class_for_list.dart';
import 'package:calm_mind/classes/models/class_id.dart';
import 'package:calm_mind/classes/models/tag_enum.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/images.dart';

class ClassesRepository {
  Stream<List<ClassForList>> classes(final TagEnum tagEnum) async* {
    switch (tagEnum) {
      case TagEnum.none:
        yield [
          ClassForList(
            ClassId.init(),
            'Zen Meditation',
            '20 min',
            CalmMindImages.smallHappinessEntertainment,
            CalmMindColors.orange,
          ),
          ClassForList(
            ClassId.init(),
            'Reflection',
            '6 min',
            CalmMindImages.smallHappinessCandleShelf,
            CalmMindColors.blue,
          ),
          ClassForList(
            ClassId.init(),
            'Visualization',
            '13 min',
            CalmMindImages.smallHappinessStanding2,
            CalmMindColors.pink,
          ),
          ClassForList(
            ClassId.init(),
            'Loving Kindness',
            '15 min',
            CalmMindImages.smallHappinessStanding1,
            CalmMindColors.yellow,
          ),
          ClassForList(
            ClassId.init(),
            'Focused Attention',
            '10 min',
            CalmMindImages.smallHappinessWavyPlant,
            CalmMindColors.purple,
          ),
        ];
        break;
      case TagEnum.sleeper:
        yield [
          ClassForList(
            ClassId.init(),
            'Zen Meditation Sleeper',
            '20 min',
            CalmMindImages.smallHappinessEntertainment,
            CalmMindColors.orange,
          ),
          ClassForList(
            ClassId.init(),
            'Reflection',
            '6 min',
            CalmMindImages.smallHappinessCandleShelf,
            CalmMindColors.blue,
          ),
          ClassForList(
            ClassId.init(),
            'Visualization',
            '13 min',
            CalmMindImages.smallHappinessStanding2,
            CalmMindColors.pink,
          ),
          ClassForList(
            ClassId.init(),
            'Loving Kindness',
            '15 min',
            CalmMindImages.smallHappinessStanding1,
            CalmMindColors.yellow,
          ),
          ClassForList(
            ClassId.init(),
            'Focused Attention',
            '10 min',
            CalmMindImages.smallHappinessWavyPlant,
            CalmMindColors.purple,
          ),
        ];
        break;
      case TagEnum.innerPeace:
        yield [
          ClassForList(
            ClassId.init(),
            'Zen Meditation InnerPeace',
            '20 min',
            CalmMindImages.smallHappinessEntertainment,
            CalmMindColors.orange,
          ),
          ClassForList(
            ClassId.init(),
            'Reflection',
            '6 min',
            CalmMindImages.smallHappinessCandleShelf,
            CalmMindColors.blue,
          ),
          ClassForList(
            ClassId.init(),
            'Visualization',
            '13 min',
            CalmMindImages.smallHappinessStanding2,
            CalmMindColors.pink,
          ),
          ClassForList(
            ClassId.init(),
            'Loving Kindness',
            '15 min',
            CalmMindImages.smallHappinessStanding1,
            CalmMindColors.yellow,
          ),
          ClassForList(
            ClassId.init(),
            'Focused Attention',
            '10 min',
            CalmMindImages.smallHappinessWavyPlant,
            CalmMindColors.purple,
          ),
        ];
        break;
      case TagEnum.stress:
        yield [
          ClassForList(
            ClassId.init(),
            'Zen Meditation Stress',
            '20 min',
            CalmMindImages.smallHappinessEntertainment,
            CalmMindColors.orange,
          ),
          ClassForList(
            ClassId.init(),
            'Reflection',
            '6 min',
            CalmMindImages.smallHappinessCandleShelf,
            CalmMindColors.blue,
          ),
          ClassForList(
            ClassId.init(),
            'Visualization',
            '13 min',
            CalmMindImages.smallHappinessStanding2,
            CalmMindColors.pink,
          ),
          ClassForList(
            ClassId.init(),
            'Loving Kindness',
            '15 min',
            CalmMindImages.smallHappinessStanding1,
            CalmMindColors.yellow,
          ),
          ClassForList(
            ClassId.init(),
            'Focused Attention',
            '10 min',
            CalmMindImages.smallHappinessWavyPlant,
            CalmMindColors.purple,
          ),
        ];
        break;
      case TagEnum.anxiety:
        yield [
          ClassForList(
            ClassId.init(),
            'Zen Meditation Anxiety',
            '20 min',
            CalmMindImages.smallHappinessEntertainment,
            CalmMindColors.orange,
          ),
          ClassForList(
            ClassId.init(),
            'Reflection',
            '6 min',
            CalmMindImages.smallHappinessCandleShelf,
            CalmMindColors.blue,
          ),
          ClassForList(
            ClassId.init(),
            'Visualization',
            '13 min',
            CalmMindImages.smallHappinessStanding2,
            CalmMindColors.pink,
          ),
          ClassForList(
            ClassId.init(),
            'Loving Kindness',
            '15 min',
            CalmMindImages.smallHappinessStanding1,
            CalmMindColors.yellow,
          ),
          ClassForList(
            ClassId.init(),
            'Focused Attention',
            '10 min',
            CalmMindImages.smallHappinessWavyPlant,
            CalmMindColors.purple,
          ),
        ];
        break;
    }
  }
}
