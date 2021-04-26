import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';

class ClassesRepository {
  Stream<List<Class>> classes(TagEnum tagEnum) async* {
    switch (tagEnum) {
      case TagEnum.none:
        yield [
          Class(ClassId.init(), 'Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment,
              CalmMindColors.orange),
          Class(ClassId.init(), 'Reflection', '6 min', CalmMindImages.smallHappinessCandleShelf, CalmMindColors.blue),
          Class(ClassId.init(), 'Visualization', '13 min', CalmMindImages.smallHappinessStanding2, CalmMindColors.pink),
          Class(ClassId.init(), 'Loving Kindness', '15 min', CalmMindImages.smallHappinessStanding1,
              CalmMindColors.yellow),
          Class(ClassId.init(), 'Focused Attention', '10 min', CalmMindImages.smallHappinessWavyPlant,
              CalmMindColors.purple),
        ];
        break;
      case TagEnum.sleeper:
        yield [
          Class(ClassId.init(), 'Zen Meditation Sleeper', '20 min', CalmMindImages.smallHappinessEntertainment,
              CalmMindColors.orange),
          Class(ClassId.init(), 'Reflection', '6 min', CalmMindImages.smallHappinessCandleShelf, CalmMindColors.blue),
          Class(ClassId.init(), 'Visualization', '13 min', CalmMindImages.smallHappinessStanding2, CalmMindColors.pink),
          Class(ClassId.init(), 'Loving Kindness', '15 min', CalmMindImages.smallHappinessStanding1,
              CalmMindColors.yellow),
          Class(ClassId.init(), 'Focused Attention', '10 min', CalmMindImages.smallHappinessWavyPlant,
              CalmMindColors.purple),
        ];
        break;
      case TagEnum.innerPeace:
        yield [
          Class(ClassId.init(), 'Zen Meditation InnerPeace', '20 min', CalmMindImages.smallHappinessEntertainment,
              CalmMindColors.orange),
          Class(ClassId.init(), 'Reflection', '6 min', CalmMindImages.smallHappinessCandleShelf, CalmMindColors.blue),
          Class(ClassId.init(), 'Visualization', '13 min', CalmMindImages.smallHappinessStanding2, CalmMindColors.pink),
          Class(ClassId.init(), 'Loving Kindness', '15 min', CalmMindImages.smallHappinessStanding1,
              CalmMindColors.yellow),
          Class(ClassId.init(), 'Focused Attention', '10 min', CalmMindImages.smallHappinessWavyPlant,
              CalmMindColors.purple),
        ];
        break;
      case TagEnum.stress:
        yield [
          Class(ClassId.init(), 'Zen Meditation Stress', '20 min', CalmMindImages.smallHappinessEntertainment,
              CalmMindColors.orange),
          Class(ClassId.init(), 'Reflection', '6 min', CalmMindImages.smallHappinessCandleShelf, CalmMindColors.blue),
          Class(ClassId.init(), 'Visualization', '13 min', CalmMindImages.smallHappinessStanding2, CalmMindColors.pink),
          Class(ClassId.init(), 'Loving Kindness', '15 min', CalmMindImages.smallHappinessStanding1,
              CalmMindColors.yellow),
          Class(ClassId.init(), 'Focused Attention', '10 min', CalmMindImages.smallHappinessWavyPlant,
              CalmMindColors.purple),
        ];
        break;
      case TagEnum.anxiety:
        yield [
          Class(ClassId.init(), 'Zen Meditation Anxiety', '20 min', CalmMindImages.smallHappinessEntertainment,
              CalmMindColors.orange),
          Class(ClassId.init(), 'Reflection', '6 min', CalmMindImages.smallHappinessCandleShelf, CalmMindColors.blue),
          Class(ClassId.init(), 'Visualization', '13 min', CalmMindImages.smallHappinessStanding2, CalmMindColors.pink),
          Class(ClassId.init(), 'Loving Kindness', '15 min', CalmMindImages.smallHappinessStanding1,
              CalmMindColors.yellow),
          Class(ClassId.init(), 'Focused Attention', '10 min', CalmMindImages.smallHappinessWavyPlant,
              CalmMindColors.purple),
        ];
        break;
    }
  }
}
