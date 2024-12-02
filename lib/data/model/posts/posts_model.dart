import '../../data_source/local/posts_entity.dart';

class PostsModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  PostsModel({this.postId, this.id, this.name, this.email, this.body});

  // Factory method to create an instance from a Map
  factory PostsModel.fromMap(Map<String, dynamic> map) {
    return PostsModel(
      postId: map['postId'] as int?,
      id: map['id'] as int?,
      name: map['name'] as String?,
      email: map['email'] as String?,
      body: map['body'] as String?,
    );
  }

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}

// Extension for converting between PostsModel and a corresponding entity class
extension PostsModelX on PostsModel {
  PostsEntity toEntity() {
    return PostsEntity(
      postId: postId,
      id: id,
      name: name,
      email: email,
      body: body,
    );
  }
}
