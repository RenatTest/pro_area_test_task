import 'package:hive/hive.dart';
part 'cat.g.dart';

@HiveType(typeId: 1)
class Cat {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String phone;

  Cat({
    this.id,
    this.name,
    this.phone,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
    );
  }
}
