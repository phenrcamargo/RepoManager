
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:repomanager/app/repomanager/application/dto/project.dto.dart';
import 'package:repomanager/app/repomanager/application/use-cases/create-project.usecase.dart';
import 'package:repomanager/app/repomanager/domain/entities/project.entity.dart';
import 'package:repomanager/app/repomanager/domain/enum/git-estatus.enum.dart';
import 'package:repomanager/app/repomanager/domain/repository/project.repository.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class MockProjectRepository extends Mock implements IProjectRepository {}

void main() {
  late MockProjectRepository mockRepository;
  late CreateProjectUseCase useCase;

  setUp(() {
    mockRepository = MockProjectRepository();
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
        .thenAnswer((_) async => Right(null));

      when(mockRepository.createProject(projectEntity))
        .thenAnswer((_) async => Right(projectEntity));

      final result = await useCase.execute(validParams);

      expect(result, isA<ProjectDTO>());
      verify(mockRepository.createProject(projectEntity)).called(1);
    });

    test('should throw exception if failed to create project', () async {
      when(mockRepository.getProject(validParams.path))
        .thenAnswer((_) async => Left(null));

      when(mockRepository.createProject(projectEntity))
        .thenAnswer((_) async => Left(Exception('Error message')));

      expect(
        () => useCase.execute(validParams),
        throwsA(isA<Exception>().having((e) => e.toString(), 'message', contains('Failed to create project'))),
      );
    });
  });
}