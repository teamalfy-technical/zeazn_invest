class MediaUploadResponse {
  bool? success;
  List<MediaItems>? mediaItems;
  List<VideoUploads>? videoUploads;
  double? uploadTime;

  MediaUploadResponse({
    this.success,
    this.mediaItems,
    this.videoUploads,
    this.uploadTime,
  });

  MediaUploadResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['media_items'] != null) {
      mediaItems = <MediaItems>[];
      json['media_items'].forEach((v) {
        mediaItems!.add(MediaItems.fromJson(v));
      });
    }
    if (json['video_uploads'] != null) {
      videoUploads = <VideoUploads>[];
      json['video_uploads'].forEach((v) {
        videoUploads!.add(VideoUploads.fromJson(v));
      });
    }
    uploadTime = json['upload_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (mediaItems != null) {
      data['media_items'] = mediaItems!.map((v) => v.toJson()).toList();
    }
    if (videoUploads != null) {
      data['video_uploads'] = videoUploads!.map((v) => v.toJson()).toList();
    }
    data['upload_time'] = uploadTime;
    return data;
  }
}

class VideoUploads {
  int? uploadId;
  String? filename;
  int? size;
  String? status;

  VideoUploads({this.uploadId, this.filename, this.size, this.status});

  VideoUploads.fromJson(Map<String, dynamic> json) {
    uploadId = json['upload_id'];
    filename = json['filename'];
    size = json['size'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['upload_id'] = uploadId;
    data['filename'] = filename;
    data['size'] = size;
    data['status'] = status;
    return data;
  }
}

class MediaItems {
  int? id;
  String? url;
  String? type;
  String? name;
  int? size;
  String? status;

  MediaItems({this.id, this.url, this.type, this.name, this.size, this.status});

  MediaItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    type = json['type'];
    name = json['name'];
    size = json['size'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['type'] = type;
    data['name'] = name;
    data['size'] = size;
    data['status'] = status;
    return data;
  }
}
