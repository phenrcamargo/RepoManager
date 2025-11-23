import 'package:repomanager/app/repomanager/workspace/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_data/project_view_data.dart';

class ProjectViewMapper {
  ProjectViewData toProjectViewData(ProjectEntity project) {
    return ProjectViewData(
      path: project.path.path,
      workspacePath: project.workspacePath.path,
      name: project.name,
      description: project.description,
      gitBranch: project.gitBranch,
      notStagedModifiedFiles: project.fileModificationStatus.notStagedModifiedFiles.toString(),
      notStagedDeletedFiles: project.fileModificationStatus.notStagedDeletedFiles.toString(),
      notStagedUntrackedFiles: project.fileModificationStatus.notStagedUntrackedFiles.toString(),
      onStagedAddedFiles: project.fileModificationStatus.onStagedAddedFiles.toString(),
      onStagedModifiedFiles: project.fileModificationStatus.onStagedModifiedFiles.toString(),
      onStagedDeletedFiles: project.fileModificationStatus.onStagedDeletedFiles.toString(),
    );
  }
}