import 'dart:io';

import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/failure.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';

final ProjectRepo projectRepo = Get.put(ProjectRepoImpl());

class ProjectRepoImpl implements ProjectRepo {
  @override
  Future<Either<ZFailure, ApiResponse<Project>>> addProject({
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.addProject(
            projectCategoryId: projectCategoryId,
            name: name,
            description: description,
            shortDescription: shortDescription,
            location: location,
          ),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> addProjectFundingGoal({
    required int projectId,
    required String fundingGoal,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.addProjectFundingGoal(
            projectId: projectId,
            fundingGoal: fundingGoal,
          ),
    );
  }

  @override
  Future<Either<ZFailure, MediaUploadResponse>> addProjectMedia({
    required int projectId,
    required List<File> media,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.addProjectMedia(
            projectId: projectId,
            media: media,
          ),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> archiveProject({
    required int projectId,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.archiveProject(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse>> deleteProject({
    required int projectId,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await projectDs.deleteProject(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<PaginatedProject>>> getAllProjects({
    required String creatorName,
    required String projectName,
    required String slug,
    required String location,
    required String featuredStatus,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.getAllProjects(
            creatorName: creatorName,
            projectName: projectName,
            slug: slug,
            location: location,
            featuredStatus: featuredStatus,
          ),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<int>>> getAllProjectsCount() async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await projectDs.getAllProjectsCount(),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> getProject({
    required int projectId,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await projectDs.getProject(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<PaginatedProject>>>
  getProjectByCreator() async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await projectDs.getProjectByCreator(),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectComment>>>>
  getProjectComments({required int projectId}) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.getProjectComments(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<int>>> getProjectCountByCreator() async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await projectDs.getProjectCountByCreator(),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectFaq>>>> getProjectFaqs({
    required int projectId,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.getProjectFaqs(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectReview>>>> getProjectReviews({
    required int projectId,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.getProjectReviews(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> getProjectSlug({
    required String slug,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await projectDs.getProjectSlug(slug: slug),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectSupporter>>>>
  getProjectSupporters({required int projectId}) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async =>
              await projectDs.getProjectSupporters(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<UploadStatus>>>
  getProjectVideoUploadStatus({required int projectId}) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async =>
              await projectDs.getProjectVideoUploadStatus(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> publishProject({
    required int projectId,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.publishProject(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> saveProjectAsDraft({
    required int projectId,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.saveProjectAsDraft(projectId: projectId),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> updateProjectByCreator({
    required int projectId,
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.updateProjectByCreator(
            projectId: projectId,
            projectCategoryId: projectCategoryId,
            name: name,
            description: description,
            shortDescription: shortDescription,
            location: location,
          ),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectCategory>>>>
  getProjectCategories({String? name}) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function: () async => await projectDs.getProjectCategories(name: name),
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<ProjectReward>>> addProjectReward({
    required int projectId,
    required String name,
    required String description,
    required String amount,
    required String location,
    required String dateTime,
    required String slotsAvailable,
  }) async {
    return await customRepositoryWrapper.wrapRepositoryFunction(
      function:
          () async => await projectDs.addProjectReward(
            projectId: projectId,
            name: name,
            description: description,
            amount: amount,
            location: location,
            dateTime: dateTime,
            slotsAvailable: slotsAvailable,
          ),
    );
  }
}
