import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:zeazn_invest_app/core/errors/errors.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';

abstract class ProjectService {
  Future<Either<ZFailure, ApiResponse<List<ProjectCategory>>>>
  getProjectCategories({String? name});

  Future<Either<ZFailure, ApiResponse<Project>>> addProject({
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  });

  Future<Either<ZFailure, ApiResponse<Project>>> addProjectFundingGoal({
    required int projectId,
    required String fundingGoal,
  });

  Future<Either<ZFailure, ApiResponse<PaginatedProject>>> getProjectByCreator();

  Future<Either<ZFailure, ApiResponse<int>>> getProjectCountByCreator();

  Future<Either<ZFailure, ApiResponse<Project>>> updateProjectByCreator({
    required int projectId,
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  });

  Future<Either<ZFailure, ApiResponse<PaginatedProject>>> getAllProjects({
    required String creatorName,
    required String projectName,
    required String slug,
    required String location,
    required String featuredStatus,
  });

  Future<Either<ZFailure, ApiResponse<Project>>> getProject({
    required int projectId,
  });

  Future<Either<ZFailure, ApiResponse<int>>> getAllProjectsCount();

  Future<Either<ZFailure, ApiResponse<Project>>> getProjectSlug({
    required String slug,
  });

  Future<Either<ZFailure, ApiResponse<Project>>> publishProject({
    required int projectId,
  });

  Future<Either<ZFailure, ApiResponse<Project>>> saveProjectAsDraft({
    required int projectId,
  });

  Future<Either<ZFailure, ApiResponse<Project>>> archiveProject({
    required int projectId,
  });

  Future<Either<ZFailure, MediaUploadResponse>> addProjectMedia({
    required int projectId,
    required List<File> media,
  });

  Future<Either<ZFailure, ApiResponse<List<ProjectSupporter>>>>
  getProjectSupporters({required int projectId});
  Future<Either<ZFailure, ApiResponse<List<ProjectComment>>>>
  getProjectComments({required int projectId});
  Future<Either<ZFailure, ApiResponse<List<ProjectReview>>>> getProjectReviews({
    required int projectId,
  });
  Future<Either<ZFailure, ApiResponse<List<ProjectFaq>>>> getProjectFaqs({
    required int projectId,
  });

  Future<Either<ZFailure, ApiResponse<dynamic>>> deleteProject({
    required int projectId,
  });

  Future<Either<ZFailure, ApiResponse<UploadStatus>>>
  getProjectVideoUploadStatus({required int projectId});
}
