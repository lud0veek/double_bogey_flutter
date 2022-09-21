class MembershipType{
  final int id;
  final String name;
  final String description;
  final int peopleMax;
  final int maxPerWeek;
  final bool isVisible;
  final int price;
  final int length;

  MembershipType.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = (json['name']) as String,
        description = json['description'] as String,
        peopleMax = json['peopleMax'] as int,
        maxPerWeek = json['maxPerWeek'] as int,
        length = json['length'] as int,
        isVisible = json['isVisible'] as bool,
        price = json['price'] as int;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'peopleMax': peopleMax,
    'maxPerWeek': maxPerWeek,
    'length': length,
    'isVisible': isVisible,
    'price': price
  };
}