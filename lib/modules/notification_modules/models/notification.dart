import 'package:cicgreenloan/modules/notification_modules/models/notification_data.dart';

class NotificationModel {
  String? id;
  String? presentType;
  NotificationData? data;
  String? readAt;
  String? humanReadAt;
  String? createdAt;
  String? humanCreatedAt;
  String? updatedAt;
  bool? isRead = true;

  NotificationModel(
      {this.id,
      this.presentType,
      this.data,
      this.readAt,
      this.humanReadAt,
      this.createdAt,
      this.humanCreatedAt,
      this.updatedAt,
      this.isRead});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    presentType = json['present_type'] ?? '';
    data =
        json['data'] != null ? NotificationData.fromJson(json['data']) : null;
    readAt = json['read_at'];
    humanReadAt = json['human_read_at'] ?? '';
    createdAt = json['created_at'] ?? '';
    humanCreatedAt = json['human_created_at'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['present_type'] = presentType;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['read_at'] = readAt;
    data['human_read_at'] = humanReadAt;
    data['created_at'] = createdAt;
    data['human_created_at'] = humanCreatedAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}


