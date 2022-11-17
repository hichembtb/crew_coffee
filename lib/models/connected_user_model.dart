class ConnectedUserModel {
  final String name;
  final String sugars;
  final int strength;

  ConnectedUserModel({
    required this.name,
    required this.strength,
    required this.sugars,
  });
  factory ConnectedUserModel.fromMap(Map<String, dynamic> data) {
    return ConnectedUserModel(
      name: data['name'],
      strength: data['strength'],
      sugars: data['sugars'],
    );
  }
}
