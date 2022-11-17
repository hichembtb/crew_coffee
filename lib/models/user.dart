class UserModel {
  final String uid;
  final String name;
  final String sugars;
  final int strength;
  UserModel(
    this.uid, {
    required this.name,
    required this.strength,
    required this.sugars,
  });
  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      '',
      name: data['name'],
      strength: data['strength'],
      sugars: data['sugars'],
    );
  }
}
