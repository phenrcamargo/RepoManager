import '../../domain/entities/project.entity.dart';

class ProjectDTO {
  final String path;
  final String workspacePath;
  final String name;
  final String? description;
  final String gitStatus;
  final String gitBranch;

  ProjectDTO.fromEntity(ProjectEntity entity) :
        this(entity.path.toString(), entity.workspacePath.toString(), entity.name, entity.description, entity.gitStatus, entity.gitBranch);
  ProjectDTO(this.path, this.workspacePath, this.name, this.description, this.gitStatus, this.gitBranch);
}