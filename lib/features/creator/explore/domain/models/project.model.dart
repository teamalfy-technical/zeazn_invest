class Project {
  int? projectId;
  int? creatorId;
  String? creatorName;
  String? projectCategoryId;
  String? projectCategory;
  String? projectName;
  String? slug;
  String? shortDesc;
  String? desc;
  int? amountRaised;
  int? fundingGoal;
  int? fundingPercentage;
  String? location;
  String? status;
  String? featured;
  String? createdAt;
  String? updatedAt;
  int? noOfComment;
  int? noOfProjectReviews;
  double? overallRating;
  List<ProjectComment>? comments;
  List<ProjectReview>? reviews;
  List<ProjectFaq>? faqs;
  List<ProjectDeal>? exclusiveDeals;
  List<ProjectMedia>? projectImages;
  List<ProjectMedia>? projectVideos;

  Project({
    this.projectId,
    this.creatorId,
    this.creatorName,
    this.projectCategoryId,
    this.projectCategory,
    this.projectName,
    this.slug,
    this.shortDesc,
    this.desc,
    this.amountRaised,
    this.fundingGoal,
    this.fundingPercentage,
    this.location,
    this.status,
    this.featured,
    this.createdAt,
    this.updatedAt,
    this.noOfComment,
    this.noOfProjectReviews,
    this.overallRating,
    this.comments,
    this.reviews,
    this.faqs,
    this.exclusiveDeals,
    this.projectImages,
    this.projectVideos,
  });

  Project.fromJson(Map<String, dynamic> json) {
    projectId = json['project_id'];
    creatorId = json['creator_id'];
    creatorName = json['creator_name'];
    projectCategoryId = json['project_category_id'];
    projectCategory = json['project_category'];
    projectName = json['project_name'];
    slug = json['slug'];
    shortDesc = json['short_desc'];
    desc = json['desc'];
    amountRaised = json['amount_raised'];
    fundingGoal = json['funding_goal'];
    fundingPercentage = json['funding_percentage'];
    location = json['location'];
    status = json['status'];
    featured = json['featured'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    noOfComment = json['no_of_comment'];
    noOfProjectReviews = json['no_of_project_reviews'];
    overallRating = json['overall_rating'];
    if (json['comments'] != null) {
      comments = <ProjectComment>[];
      json['comments'].forEach((v) {
        comments!.add(ProjectComment.fromJson(v));
      });
    }
    if (json['project_reviews'] != null) {
      reviews = <ProjectReview>[];
      json['project_reviews'].forEach((v) {
        reviews!.add(ProjectReview.fromJson(v));
      });
    }
    if (json['faq'] != null) {
      faqs = <ProjectFaq>[];
      json['faq'].forEach((v) {
        faqs!.add(ProjectFaq.fromJson(v));
      });
    }
    if (json['exclusive_deals'] != null) {
      exclusiveDeals = <ProjectDeal>[];
      json['exclusive_deals'].forEach((v) {
        exclusiveDeals!.add(ProjectDeal.fromJson(v));
      });
    }
    if (json['project_images'] != null) {
      projectImages = <ProjectMedia>[];
      json['project_images'].forEach((v) {
        projectImages!.add(ProjectMedia.fromJson(v));
      });
    }
    if (json['project_videos'] != null) {
      projectVideos = <ProjectMedia>[];
      json['project_videos'].forEach((v) {
        projectVideos!.add(ProjectMedia.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project_id'] = projectId;
    data['creator_id'] = creatorId;
    data['creator_name'] = creatorName;
    data['project_category_id'] = projectCategoryId;
    data['project_category'] = projectCategory;
    data['project_name'] = projectName;
    data['slug'] = slug;
    data['short_desc'] = shortDesc;
    data['desc'] = desc;
    data['amount_raised'] = amountRaised;
    data['funding_goal'] = fundingGoal;
    data['funding_percentage'] = fundingPercentage;
    data['location'] = location;
    data['status'] = status;
    data['featured'] = featured;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['no_of_comment'] = noOfComment;
    data['no_of_project_reviews'] = noOfProjectReviews;
    data['overall_rating'] = overallRating;
    if (comments != null) {
      data['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    if (reviews != null) {
      data['project_reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    if (faqs != null) {
      data['faq'] = faqs?.map((v) => v.toJson()).toList();
    }
    if (exclusiveDeals != null) {
      data['exclusive_deals'] = exclusiveDeals?.map((v) => v.toJson()).toList();
    }
    if (projectImages != null) {
      data['project_images'] = projectImages?.map((v) => v.toJson()).toList();
    }
    if (projectVideos != null) {
      data['project_videos'] = projectVideos?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProjectDeal {
  int? rewardId;
  String? rewardName;
  String? description;
  String? amount;
  int? slotsAvailable;
  int? slotsClaimed;

  ProjectDeal({
    this.rewardId,
    this.rewardName,
    this.description,
    this.amount,
    this.slotsAvailable,
    this.slotsClaimed,
  });

  ProjectDeal.fromJson(Map<String, dynamic> json) {
    rewardId = json['reward_id'];
    rewardName = json['reward_name'];
    description = json['description'];
    amount = json['amount'];
    slotsAvailable = json['slots_available'];
    slotsClaimed = json['slots_claimed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['reward_id'] = rewardId;
    data['reward_name'] = rewardName;
    data['description'] = description;
    data['amount'] = amount;
    data['slots_available'] = slotsAvailable;
    data['slots_claimed'] = slotsClaimed;
    return data;
  }
}

class UploadStatus {
  int? id;
  String? status;
  int? progress;
  int? progressPercent;
  String? originalFilename;

  UploadStatus({
    this.id,
    this.status,
    this.progress,
    this.progressPercent,
    this.originalFilename,
  });

  UploadStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    progress = json['progress'];
    progressPercent = json['progress_percent'];
    originalFilename = json['original_filename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['progress'] = progress;
    data['progress_percent'] = progressPercent;
    data['original_filename'] = originalFilename;
    return data;
  }
}

class ProjectMedia {
  int? id;
  String? name;
  String? url;
  String? thumbnailUrl;

  ProjectMedia({this.id, this.name, this.url, this.thumbnailUrl});

  ProjectMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    thumbnailUrl = json['thumbnail_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['thumbnail_url'] = thumbnailUrl;
    return data;
  }
}

class ProjectComment {
  int? id;
  int? userId;
  int? projectId;
  int? parentId;
  String? comment;
  int? depth;
  String? createdAt;
  String? updatedAt;

  ProjectComment({
    this.id,
    this.userId,
    this.projectId,
    this.parentId,
    this.comment,
    this.depth,
    this.createdAt,
    this.updatedAt,
  });

  ProjectComment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    projectId = json['project_id'];
    parentId = json['parent_id'];
    comment = json['comment'];
    depth = json['depth'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['project_id'] = projectId;
    data['parent_id'] = parentId;
    data['comment'] = comment;
    data['depth'] = depth;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProjectReview {
  int? id;
  int? userId;
  int? projectId;
  int? ratings;
  String? comment;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  ProjectReview({
    this.id,
    this.userId,
    this.projectId,
    this.ratings,
    this.comment,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  ProjectReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    projectId = json['project_id'];
    ratings = json['ratings'];
    comment = json['comment'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['project_id'] = projectId;
    data['ratings'] = ratings;
    data['comment'] = comment;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProjectSupporter {
  int? projectSupportId;
  int? projectId;
  int? userId;
  String? investor;
  int? projectRewardId;
  String? amount;
  int? numberOfSlots;
  String? paymentMethod;
  String? email;
  String? status;
  String? anonymous;
  String? transactionId;
  String? createdAt;
  String? updatedAt;

  ProjectSupporter({
    this.projectSupportId,
    this.projectId,
    this.userId,
    this.investor,
    this.projectRewardId,
    this.amount,
    this.numberOfSlots,
    this.paymentMethod,
    this.email,
    this.status,
    this.anonymous,
    this.transactionId,
    this.createdAt,
    this.updatedAt,
  });

  ProjectSupporter.fromJson(Map<String, dynamic> json) {
    projectSupportId = json['project_support_id'];
    projectId = json['project_id'];
    userId = json['user_id'];
    investor = json['investor'];
    projectRewardId = json['project_reward_id'];
    amount = json['amount'];
    numberOfSlots = json['number_of_slots'];
    paymentMethod = json['payment_method'];
    email = json['email'];
    status = json['status'];
    anonymous = json['anonymous'];
    transactionId = json['transaction_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['project_support_id'] = projectSupportId;
    data['project_id'] = projectId;
    data['user_id'] = userId;
    data['investor'] = investor;
    data['project_reward_id'] = projectRewardId;
    data['amount'] = amount;
    data['number_of_slots'] = numberOfSlots;
    data['payment_method'] = paymentMethod;
    data['email'] = email;
    data['status'] = status;
    data['anonymous'] = anonymous;
    data['transaction_id'] = transactionId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProjectFaq {
  int? id;
  int? projectId;
  String? question;
  String? answer;
  int? publishStatus;
  String? createdAt;
  String? updatedAt;

  ProjectFaq({
    this.id,
    this.projectId,
    this.question,
    this.answer,
    this.publishStatus,
    this.createdAt,
    this.updatedAt,
  });

  ProjectFaq.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    question = json['question'];
    answer = json['answer'];
    publishStatus = json['publish_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['project_id'] = projectId;
    data['question'] = question;
    data['answer'] = answer;
    data['publish_status'] = publishStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
