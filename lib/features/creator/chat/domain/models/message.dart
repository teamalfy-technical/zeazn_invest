class Message {
  int? id;
  String? title;
  String? body;
  String? fromNumber;
  String? toNumber;
  String? messageType;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? readStatus;
  String? readAt;

  Message({
    this.id,
    this.title,
    this.body,
    this.fromNumber,
    this.toNumber,
    this.messageType,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.readStatus,
    this.readAt,
  });

  Message copyWith({
    int? id,

    String? title,
    String? body,
    String? fromNumber,
    String? toNumber,
    String? messageType,
    String? status,

    String? createdAt,
    String? updatedAt,

    String? readStatus,
    String? readAt,
  }) {
    return Message(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      fromNumber: fromNumber ?? this.fromNumber,
      toNumber: toNumber ?? this.toNumber,
      messageType: messageType ?? this.messageType,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      readStatus: readStatus ?? this.readStatus,
      readAt: readAt ?? this.readAt,
    );
  }

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    fromNumber = json['from_number'];
    toNumber = json['to_number'];
    messageType = json['message_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    readStatus = json['read_status'];
    readAt = json['read_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['from_number'] = fromNumber;
    data['to_number'] = toNumber;
    data['message_type'] = messageType;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;

    data['read_status'] = readStatus;
    data['read_at'] = readAt;
    return data;
  }
}
