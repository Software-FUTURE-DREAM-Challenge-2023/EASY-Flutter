class UserProfileModel {
  String? id;
  String? username;
  String? nickname;

  UserProfileModel({this.id, this.username, this.nickname});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    nickname = json['nickname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['nickname'] = nickname;
    return data;
  }
}
