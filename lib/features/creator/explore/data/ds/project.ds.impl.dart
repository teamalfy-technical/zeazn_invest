import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:zeazn_invest_app/core/network/network.dart';
import 'package:zeazn_invest_app/core/utils/utils.dart';
import 'package:zeazn_invest_app/env/env.dart';
import 'package:zeazn_invest_app/features/creator/explore/explore.dart';

final ProjectDs projectDs = Get.put(ProjectDsImpl());

class ProjectDsImpl implements ProjectDs {
  @override
  Future<ApiResponse<Project>> addProject({
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  }) async {
    final payload = dio.FormData.fromMap({
      'project_category_id': projectCategoryId,
      'name': name,
      'desc': description,
      'short_desc': shortDescription,
      'location': location,
    });
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: Env.addProject,
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<Project>> addProjectFundingGoal({
    required int projectId,
    required String fundingGoal,
  }) async {
    final payload = dio.FormData.fromMap({'funding_goal': fundingGoal});
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: payload,
        endPoint: '${Env.addProjectFundingGoal}/$projectId',
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<MediaUploadResponse> addProjectMedia({
    required int projectId,
    required List<File> media,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.post,
        payload: dio.FormData.fromMap({
          'media[]':
              media
                  .map(
                    (file) async => await dio.MultipartFile.fromFile(
                      file.path,
                      filename: file.path.split('/').last.split('.').first,
                    ),
                  )
                  .toList(),
        }),
        endPoint: '${Env.addProjectMedia}/$projectId',
      );
      return MediaUploadResponse.fromJson(res);
    });
  }

  @override
  Future<ApiResponse<Project>> archiveProject({required int projectId}) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.put,
        endPoint: '${Env.archiveProject}/$projectId',
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<dynamic>> deleteProject({required int projectId}) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.delete,
        endPoint: '${Env.deleteProject}/$projectId',
      );
      return ApiResponse<dynamic>.fromJson(res, (data) => data);
    });
  }

  @override
  Future<ApiResponse<PaginatedProject>> getAllProjects({
    required String creatorName,
    required String projectName,
    required String slug,
    required String location,
    required String featuredStatus,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        queryParams: {
          'filter[creator.name]': creatorName,
          'filter[name]': projectName,
          'filter[slug]': slug,
          'filter[location]': location,
          'filter[featured]': featuredStatus,
        },
        endPoint: Env.getAllProjects,
      );
      return ApiResponse<PaginatedProject>.fromJson(
        res,
        (data) => PaginatedProject.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<int>> getAllProjectsCount() async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: Env.getAllProjectsCount,
      );
      return ApiResponse<int>.fromJson(res, (data) => data);
    });
  }

  @override
  Future<ApiResponse<Project>> getProject({required int projectId}) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: '${Env.getProject}/$projectId',
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<PaginatedProject>> getProjectByCreator() async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: Env.getProjectByCreator,
      );
      return ApiResponse<PaginatedProject>.fromJson(
        res,
        (data) => PaginatedProject.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<List<ProjectComment>>> getProjectComments({
    required int projectId,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: '${Env.getProjectComments}/$projectId',
      );
      return ApiResponse<List<ProjectComment>>.fromJson(
        res,
        (data) =>
            (data as List).map((e) => ProjectComment.fromJson(e)).toList(),
      );
    });
  }

  @override
  Future<ApiResponse<int>> getProjectCountByCreator() async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: Env.getProjectCountByCreator,
      );
      return ApiResponse<int>.fromJson(res, (data) => data);
    });
  }

  @override
  Future<ApiResponse<List<ProjectFaq>>> getProjectFaqs({
    required int projectId,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: '${Env.getProjectFaqs}/$projectId',
      );
      return ApiResponse<List<ProjectFaq>>.fromJson(
        res,
        (data) => (data as List).map((e) => ProjectFaq.fromJson(e)).toList(),
      );
    });
  }

  @override
  Future<ApiResponse<List<ProjectReview>>> getProjectReviews({
    required int projectId,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: '${Env.getProjectReviews}/$projectId',
      );
      return ApiResponse<List<ProjectReview>>.fromJson(
        res,
        (data) => (data as List).map((e) => ProjectReview.fromJson(e)).toList(),
      );
    });
  }

  @override
  Future<ApiResponse<Project>> getProjectSlug({required String slug}) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: Env.getProjectSlug,
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<List<ProjectSupporter>>> getProjectSupporters({
    required int projectId,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: '${Env.getProjectSupporters}/$projectId',
      );
      return ApiResponse<List<ProjectSupporter>>.fromJson(
        res,
        (data) =>
            (data as List).map((e) => ProjectSupporter.fromJson(e)).toList(),
      );
    });
  }

  @override
  Future<ApiResponse<UploadStatus>> getProjectVideoUploadStatus({
    required int projectId,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: Env.getProjectSlug,
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<Project>> publishProject({required int projectId}) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: '${Env.publishProject}/$projectId',
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<Project>> saveProjectAsDraft({
    required int projectId,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        endPoint: '${Env.saveProjectAsDraft}/$projectId',
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<Project>> updateProjectByCreator({
    required int projectId,
    required int projectCategoryId,
    required String name,
    required String description,
    required String shortDescription,
    required String location,
  }) async {
    final payload = dio.FormData.fromMap({
      'project_category_id': projectCategoryId,
      'name': name,
      'desc': description,
      'short_desc': shortDescription,
      'location': location,
    });
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        payload: payload,
        endPoint: '${Env.updateProjectByCreator}/$projectId',
      );
      return ApiResponse<Project>.fromJson(
        res,
        (data) => Project.fromJson(data),
      );
    });
  }

  @override
  Future<ApiResponse<List<ProjectCategory>>> getProjectCategories({
    String? name,
  }) async {
    return await asyncFunctionWrapper.handleAsyncNetworkCall(() async {
      final res = await apiService.callService(
        requestType: RequestType.get,
        queryParams: name == null ? null : {'filter[name]': name},
        endPoint: Env.getProjectCategories,
      );
      return ApiResponse<List<ProjectCategory>>.fromJson(
        res,
        (data) =>
            (data as List).map((e) => ProjectCategory.fromJson(e)).toList(),
      );
    });
  }
}
