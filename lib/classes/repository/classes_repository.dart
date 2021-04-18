import 'package:calm_mind/classes/classes.dart';
import 'package:calm_mind/themes/colors.dart';
import 'package:calm_mind/themes/images.dart';

class ClassesRepository {
  Stream<List<Class>> classes() async* {
    yield [
      Class('Zen Meditation', '20 min', CalmMindImages.smallHappinessEntertainment, CalmMindColors.orange),
      Class('Reflection', '6 min', CalmMindImages.smallHappinessCandleShelf, CalmMindColors.blue),
      Class('Visualization', '13 min', CalmMindImages.smallHappinessStanding2, CalmMindColors.pink),
      Class('Loving Kindness', '15 min', CalmMindImages.smallHappinessStanding1, CalmMindColors.yellow),
      Class('Focused Attention', '10 min', CalmMindImages.smallHappinessWavyPlant, CalmMindColors.purple),
    ];
  }
}
