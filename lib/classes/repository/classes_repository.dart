import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/themes.dart';

class ClassesRepository {
  Stream<List<Class>> classes() async* {
    yield [
      const Class('Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment, CalmMindColors.orange),
      const Class('Reflection', '6 min', CalmMindImages.smallHappinessCandleShelf, CalmMindColors.blue),
      const Class('Visualization', '13 min', CalmMindImages.smallHappinessStanding2, CalmMindColors.pink),
      const Class('Loving Kindness', '15 min', CalmMindImages.smallHappinessStanding1, CalmMindColors.yellow),
      const Class('Focused Attention', '10 min', CalmMindImages.smallHappinessWavyPlant, CalmMindColors.purple),
    ];
  }
}
