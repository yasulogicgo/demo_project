class UserListModel {
  final int id;
  final String name;
  final String email;

  UserListModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
