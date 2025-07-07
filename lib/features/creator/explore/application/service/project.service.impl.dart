import 'dart:io';

import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/errors/failure.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';

final ProjectService projectService = Get.put(ProjectServiceImpl());

class ProjectServiceImpl implements ProjectService {
  @override
  Future<Either<ZFailure, ApiResponse<Project>>> addProject({
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  }) {
    return projectRepo.addProject(
      projectCategoryId: projectCategoryId,
      name: name,
      description: description,
      shortDescription: shortDescription,
      location: location,
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> addProjectFundingGoal({
    required int projectId,
    required String fundingGoal,
  }) {
    return projectRepo.addProjectFundingGoal(
      projectId: projectId,
      fundingGoal: fundingGoal,
    );
  }

  @override
  Future<Either<ZFailure, MediaUploadResponse>> addProjectMedia({
    required int projectId,
    required List<File> media,
  }) {
    return projectRepo.addProjectMedia(projectId: projectId, media: media);
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> archiveProject({
    required int projectId,
  }) {
    return projectRepo.archiveProject(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse>> deleteProject({
    required int projectId,
  }) {
    return projectRepo.deleteProject(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<PaginatedProject>>> getAllProjects({
    required String creatorName,
    required String projectName,
    required String slug,
    required String location,
    required String featuredStatus,
  }) {
    return projectRepo.getAllProjects(
      creatorName: creatorName,
      projectName: projectName,
      slug: slug,
      location: location,
      featuredStatus: featuredStatus,
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<int>>> getAllProjectsCount() {
    return projectRepo.getAllProjectsCount();
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> getProject({
    required int projectId,
  }) {
    return projectRepo.getProject(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<PaginatedProject>>>
  getProjectByCreator() {
    return projectRepo.getProjectByCreator();
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectComment>>>>
  getProjectComments({required int projectId}) {
    return projectRepo.getProjectComments(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<int>>> getProjectCountByCreator() {
    return projectRepo.getProjectCountByCreator();
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectFaq>>>> getProjectFaqs({
    required int projectId,
  }) {
    return projectRepo.getProjectFaqs(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectReview>>>> getProjectReviews({
    required int projectId,
  }) {
    return projectRepo.getProjectReviews(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> getProjectSlug({
    required String slug,
  }) {
    return projectRepo.getProjectSlug(slug: slug);
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectSupporter>>>>
  getProjectSupporters({required int projectId}) {
    return projectRepo.getProjectSupporters(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<UploadStatus>>>
  getProjectVideoUploadStatus({required int projectId}) {
    return projectRepo.getProjectVideoUploadStatus(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> publishProject({
    required int projectId,
  }) {
    return projectRepo.publishProject(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> saveProjectAsDraft({
    required int projectId,
  }) {
    return projectRepo.saveProjectAsDraft(projectId: projectId);
  }

  @override
  Future<Either<ZFailure, ApiResponse<Project>>> updateProjectByCreator({
    required int projectId,
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  }) {
    return projectRepo.updateProjectByCreator(
      projectId: projectId,
      projectCategoryId: projectCategoryId,
      name: name,
      description: description,
      shortDescription: shortDescription,
      location: location,
    );
  }

  @override
  Future<Either<ZFailure, ApiResponse<List<ProjectCategory>>>>
  getProjectCategories({String? name}) {
    return projectRepo.getProjectCategories(name: name);
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
  }) {
    return projectRepo.addProjectReward(
      projectId: projectId,
      name: name,
      description: description,
      amount: amount,
      location: location,
      dateTime: dateTime,
      slotsAvailable: slotsAvailable,
    );
  }
}
