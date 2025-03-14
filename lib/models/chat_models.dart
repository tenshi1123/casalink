class LectureModels {
  final String id;
  final String fullName;
  final String email;
  final String message;
  LectureModels({
    required this.id,
    required this.fullName,
    required this.email,
    required this.message,
  });
  factory LectureModels.fromJson(Map<String, dynamic> json) {
    return LectureModels(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
