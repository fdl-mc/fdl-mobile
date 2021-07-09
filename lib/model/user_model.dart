class UserModel {
  late final String avatar;
  late final int balance;
  late final String name;

  UserModel({required this.avatar, required this.balance, required this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    this.avatar = json['avatar'];
    this.balance = json['balance'];
    this.name = json['name'];
  }
}
