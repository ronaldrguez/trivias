enum CategoryEnum {
  biology('Biology'),
  movies('Movies'),
  literature('Literature'),
  geography('Geography'),
  science('Science'),
  select('Select');

  const CategoryEnum(this.value);

  final String value;

  @override
  String toString() {
    return value;
  }

  static CategoryEnum? toEnum(String inputValue) {
    try {
      return CategoryEnum.values.firstWhere((item) => item.value == inputValue);
    } catch (_) {
      return null;
    }
  }

  static List<String> get getAllCategories {
    return CategoryEnum.values.map((e) => e.value).toList();
  }
}