class NotificationData {
  String? title;
  String? webMessage;
  String? message;
  String? body;
  String? type;
  int? marketId;
  int? transactionId;
  String? operation;
  String? status;
  int? verify;
  int? disbursementId;
  int? scheduleId;
  int? eventId;
  String? amount;
  String? id;
  String? image;
  String? notificationId;
  int? applicationId;
  bool? expired;
  String? url;
  List<Button>? button;

  NotificationData(
      {this.title,
      this.webMessage,
      this.message,
      this.body,
      this.type,
      this.marketId,
      this.transactionId,
      this.operation,
      this.status,
      this.verify,
      this.disbursementId,
      this.scheduleId,
      this.eventId,
      this.amount,
      this.id,
      this.image,
      this.notificationId,
      this.applicationId,
      this.expired,
      this.url});

  NotificationData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    webMessage = json['web_message'];
    message = json['message'];
    body = json['body'];
    type = json['type'];
    marketId = json['market_id'];
    transactionId = json['transaction_id'];
    operation = json['operation'];
    status = json['status'];
    verify = json['verify'];
    disbursementId = json['disbursement_id'];
    scheduleId = json['schedule_id'];
    eventId = json['event_id'];
    amount = json['amount'];
    id = json['id'];
    image = json['image'];
    notificationId = json['notification_id'];
    applicationId = json['application_id'];
    expired = json['expired'];
    url = json['url'];
    if (json['button'] != null) {
      button = <Button>[];
      json['button'].forEach((v) {
        button!.add(Button.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['web_message'] = webMessage;
    data['message'] = message;
    data['body'] = body;
    data['type'] = type;
    data['market_id'] = marketId;
    data['transaction_id'] = transactionId;
    data['operation'] = operation;
    data['status'] = status;
    data['verify'] = verify;
    data['disbursement_id'] = disbursementId;
    data['schedule_id'] = scheduleId;
    data['event_id'] = eventId;
    data['amount'] = amount;
    data['id'] = id;
    data['image'] = image;
    data['notification_id'] = notificationId;
    data['application_id'] = applicationId;
    data['expired'] = expired;
    if (button != null) {
      data['button'] = button!.map((v) => v.toJson()).toList();
    }
    data['expired'] = expired;
    return data;
  }
}

class Button {
  String? title;
  String? target;

  Button({this.title, this.target});

  Button.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    target = json['target'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['target'] = target;
    return data;
  }
}
