import 'package:repomanager/app/repomanager/workspace/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_data/workspace_view_data.dart';

class WorkSpaceViewMapper {
  static WorkSpaceViewData fromEntity(WorkSpaceEntity entity) {
    return WorkSpaceViewData(
      path: entity.path.path,
      name: entity.name,
      description: entity.description ?? "Without description",
    );
  }

  static List<WorkSpaceViewData> fromEntityList(List<WorkSpaceEntity> entities) {
    return entities.map((entity) => fromEntity(entity)).toList();
  }
}