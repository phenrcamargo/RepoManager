import '../../domain/entities/workspace.entity.dart';

class WorkspaceDTO {
  String name;
  String path;
  String description;

  WorkspaceDTO.fromEntity(WorkSpaceEntity entity) :
      this(entity.path.toString(), entity.name, entity.description ?? "");
  WorkspaceDTO(this.path, this.name, this.description);
}