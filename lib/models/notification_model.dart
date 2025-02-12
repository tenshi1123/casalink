class NotificationModel {
  final String id;
  final String title;
  final String content;
  final String link;
  final String customerID;
  final String isSee;
  final String createdAt;
  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.link,
    required this.customerID,
    required this.isSee,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      link: json['link'] ?? '',
      customerID: json['customer_id'] ?? '',
      isSee: json['is_see'] ?? '',
      createdAt: json['created_at'] ?? '',
    );
  }
}
