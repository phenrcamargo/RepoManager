import 'dart:io';


class WorkSpaceEntity {
  Directory path;
  String name;
  String? description;

  WorkSpaceEntity({
    required this.path,
    required this.name,
    this.description,
  });

  factory WorkSpaceEntity.fromMap(Map<String, dynamic> map) => WorkSpaceEntity(
    path: Directory(map['path']),
    name: map['name'],
    description: map['description'],
  );
}
