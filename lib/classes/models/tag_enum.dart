enum TagEnum {
  none,
  sleeper,
  innerPeace,
  stress,
  anxiety,
}

extension TagEnumExtension on TagEnum {
  String toText() {
    switch (this) {
      case TagEnum.sleeper:
        return 'Sleeper';
      case TagEnum.innerPeace:
        return 'Inner Peace';
      case TagEnum.stress:
        return 'Stress';
      case TagEnum.anxiety:
        return 'Anxiety';
      case TagEnum.none:
        return '';
    }
  }
}
