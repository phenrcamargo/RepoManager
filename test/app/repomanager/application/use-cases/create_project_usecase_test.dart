import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:repomanager/app/repomanager/application/dto/project_dto.dart';
import 'package:repomanager/app/repomanager/application/use-cases/create_project_usecase.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/enum/git_status_enum.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

@GenerateNiceMocks([MockSpec<IProjectRepository>()])
import 'create_project_usecase_test.mocks.dart';

void main() {
  late IProjectRepository mockRepository;
  late CreateProjectUseCase useCase;

  setUp(() {
    mockRepository = MockIProjectRepository();
    useCase = CreateProjectUseCase(repository: mockRepository);
  });

  group('CreateProjectUseCase', () {
    final projectEntity = ProjectEntity(
      path: Directory('/test/path'),
      workspacePath: Directory('/test/workspacePath'),
      name: 'Test Project',
      description: 'Description',
      gitStatus: GitStatusEnum.DIRTY,
      gitBranch: 'main',
    );

    final validParams = CreateProjectUseCaseParams(
      Directory('/test/path'),
      Directory('/test/workspacePath'),
      'Test Project',
      'Description',
      GitStatusEnum.DIRTY,
      'main',
    );

    test('should throw exception if project already exists', () {
      when(mockRepository.getProject(validParams.path))
        .thenAnswer((_) async => Right(projectEntity));

        expect(
          () => useCase.execute(validParams),
          throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Project already exists'))),
        );
    });

    test('should create project', () async {
      when(mockRepository.getProject(validParams.path))
        .thenAnswer((_) async => const Right(null));

      when(mockRepository.createProject(captureAny))
        .thenAnswer((_) async => Right(projectEntity));

      final result = await useCase.execute(validParams);

      expect(result, isA<ProjectDTO>());
      verify(mockRepository.createProject(projectEntity)).called(1);
    });

    test('should throw exception if failed to create project', () async {
      when(mockRepository.getProject(validParams.path))
        .thenAnswer((_) async => const Left(null));

      when(mockRepository.createProject(any<ProjectEntity>()))
        .thenAnswer((_) async => const Left(null));

      expect(
        () => useCase.execute(validParams),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to create project'))),
      );
    });
  });
}