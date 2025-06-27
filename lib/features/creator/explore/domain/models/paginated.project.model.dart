import 'package:zeazn_invest_app/features/creator/explore/explore.dart';

class PaginatedProject {
  List<Project>? projects;
  Pagination? pagination;

  PaginatedProject({this.projects, this.pagination});

  PaginatedProject.fromJson(Map<String, dynamic> json) {
    pagination =
        json['pagination'] != null
            ? Pagination.fromJson(json['pagination'])
            : null;
    if (json['projects'] != null) {
      projects = <Project>[];
      json['projects'].forEach((v) {
        projects!.add(Project.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pagination'] = pagination?.toJson();
    if (projects != null) {
      data['projects'] = projects?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? totalPages;
  int? perPage;
  int? totalItems;
  bool? hasMore;
  String? nextPageUrl;
  String? prevPageUrl;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.perPage,
    this.totalItems,
    this.hasMore,
    this.nextPageUrl,
    this.prevPageUrl,
  });

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
    perPage = json['per_page'];
    totalItems = json['total_items'];
    hasMore = json['has_more'];
    nextPageUrl = json['next_page_url'];
    prevPageUrl = json['prev_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    data['per_page'] = perPage;
    data['total_items'] = totalItems;
    data['has_more'] = hasMore;
    data['next_page_url'] = nextPageUrl;
    data['prev_page_url'] = prevPageUrl;
    return data;
  }
}
