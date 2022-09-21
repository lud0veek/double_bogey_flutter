class Event{
  final int id;
  final DateTime date;
  final String name;
  final String description;
  final bool isVisible;
  final int price;

  Event(this.id,this.date, this.name,this.description, this.isVisible,this.price);

  Event.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        date = DateTime.parse(json['startDate']),
        name = json['name'] as String,
        description = json['description'] as String,
        isVisible = json['isVisible'] as bool,
        price = json['price'] as int;

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'name': name,
    'description': description,
    'isVisible': isVisible,
    'price': price
  };
}