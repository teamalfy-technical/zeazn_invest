import 'dart:io';

import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';

abstract class ProjectDs {
  Future<ApiResponse<List<ProjectCategory>>> getProjectCategories({
    String? name,
  });
  Future<ApiResponse<Project>> addProject({
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  });

  Future<ApiResponse<ProjectReward>> addProjectReward({
    required int projectId,
    required String name,
    required String description,
    required String amount,
    required String location,
    required String dateTime,
    required String slotsAvailable,
  });

  Future<ApiResponse<Project>> addProjectFundingGoal({
    required int projectId,
    required String fundingGoal,
  });

  Future<ApiResponse<PaginatedProject>> getProjectByCreator({
    required int page,
  });

  Future<ApiResponse<int>> getProjectCountByCreator();

  Future<ApiResponse<Project>> updateProjectByCreator({
    required int projectId,
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  });

  Future<ApiResponse<PaginatedProject>> getAllProjects({
    required int page,
    required String creatorName,
    required String projectName,
    required String slug,
    required String location,
    required String featuredStatus,
  });

  Future<ApiResponse<Project>> getProject({required int projectId});

  Future<ApiResponse<int>> getAllProjectsCount();

  Future<ApiResponse<Project>> getProjectSlug({required String slug});

  Future<ApiResponse<Project>> publishProject({required int projectId});

  Future<ApiResponse<Project>> saveProjectAsDraft({required int projectId});

  Future<ApiResponse<Project>> archiveProject({required int projectId});

  Future<MediaUploadResponse> addProjectMedia({
    required int projectId,
    required List<File> media,
  });

  Future<ApiResponse<List<ProjectSupporter>>> getProjectSupporters({
    required int projectId,
  });
  Future<ApiResponse<List<ProjectComment>>> getProjectComments({
    required int projectId,
  });
  Future<ApiResponse<List<ProjectReview>>> getProjectReviews({
    required int projectId,
  });
  Future<ApiResponse<List<ProjectFaq>>> getProjectFaqs({
    required int projectId,
  });

  Future<ApiResponse<dynamic>> deleteProject({required int projectId});
  Future<ApiResponse<UploadStatus>> getProjectVideoUploadStatus({
    required int projectId,
  });
}
