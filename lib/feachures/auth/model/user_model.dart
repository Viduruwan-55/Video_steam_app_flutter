class UserModel {
  final String displayName;
  final String email;
  final String userName;
  final String profilePic;
  final String uid;
  final String type;
  final String description;
  final int videos;
  final List subcriptions;

  UserModel(
      {required this.displayName,
      required this.email,
      required this.userName,
      required this.profilePic,
      required this.uid,
      required this.type,
      required this.description,
      required this.videos,
      required this.subcriptions});

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
      'email': email,
      'userName': userName,
      'profilePic': profilePic,
      'userId': uid,
      'type': type,
      'description': description,
      'videos': videos,
      'subcriptions': subcriptions,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] as String,
      email: map['email'] as String,
      userName: map['userName'] as String,
      profilePic: map['profilePic'] as String,
      uid: map['userId'] as String,
      type: map['type'] as String,
      description: map['description'] as String,
      videos: map['videos'] as int,
      subcriptions: map['subcriptions'] as List,
    );
  }
}
