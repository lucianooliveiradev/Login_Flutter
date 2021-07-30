class User {
  String name;
  bool isEnable;

  User({this.name, this.isEnable});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    isEnable = json['isEnable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['isEnable'] = this.isEnable;
    return data;
  }
}
