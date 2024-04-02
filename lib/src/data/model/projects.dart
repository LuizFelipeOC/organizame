// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectModel {
  String id;
  String alias;
  String description;
  String createdAt;
  String? updateAt;
  String status;
  String? userId;

  ProjectModel({
    required this.id,
    required this.alias,
    required this.description,
    required this.createdAt,
    this.updateAt,
    required this.status,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alias': alias,
      'descritpion': description,
      'status': status,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] as String,
      alias: map['alias'] as String,
      description: map['descritpion'] as String,
      createdAt: map['created_at'] as String,
      updateAt: map['update_at'] != null ? map['update_at'] as String : null,
      status: map['status'] ?? '',
      userId: map['userId'] != null ? map['userId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
