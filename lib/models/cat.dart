class Cat {
  int id;
  String name;
  String phone;
  String image;

  Cat({
    this.id,
    this.name,
    this.phone,
    this.image,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    return Cat(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      image: json["image"],
    );
  }
}
