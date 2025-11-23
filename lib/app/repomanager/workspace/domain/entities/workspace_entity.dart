import 'dart:io';

import 'package:path/path.dart' as p;

class WorkSpaceEntity {
  Directory path;
  String name;
  String? description;

  WorkSpaceEntity({
    required Directory path,
    required this.name,
    this.description,
  }) : path = Directory(p.normalize(path.path));

  factory WorkSpaceEntity.fromMap(Map<String, dynamic> map) => WorkSpaceEntity(
    path: Directory(p.normalize(map['path'])),
    name: map['name'],
    description: map['description'],
  );
  
  Map<String, dynamic> toMap() => {
    'path': p.normalize(path.path),
    'name': name,
    'description': description
  };
}
