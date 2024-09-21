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
}
