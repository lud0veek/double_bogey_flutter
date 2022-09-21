class Simulator{
  final int id;
  final String name;
  final bool isVisible;

  Simulator(this.id, this.name, this.isVisible);

  Simulator.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        isVisible = json['isVisible'] as bool;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'isVisible': isVisible
  };
}