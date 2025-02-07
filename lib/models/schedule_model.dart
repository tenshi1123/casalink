// model một buổi học trong lịch học
import 'package:intl/intl.dart';

class ScheduleModel {
  final String courseName;
  final String buoiHoc;
  final DateTime createdDate;
  final String timeStart;
  final String timeEnd;
  final String? phongHocName;
  final String? cosoName;
  final String? checkinOffId;
  final String? linkZoom;
  final String? meetingId;
  final String typeLearn;
  ScheduleModel({
    required this.courseName,
    required this.buoiHoc,
    required this.createdDate,
    required this.timeStart,
    required this.timeEnd,
    this.phongHocName,
    this.cosoName,
    this.checkinOffId,
    this.linkZoom,
    this.meetingId,
    required this.typeLearn,
  });
  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      courseName: json["course_name"] ?? '',
      buoiHoc: json["buoi_hoc"] ?? '',
      createdDate: DateFormat("dd-MM-yyyy").parse(json["created_date"] ?? ''),
      timeStart: json["time_start"] ?? '',
      timeEnd: json["time_end"] ?? '',
      phongHocName: json["phonghoc_name"],
      cosoName: json["coso_name"],
      checkinOffId: json["checkin_off_id"],
      linkZoom: json["link_zoom"],
      meetingId: json["meeting_id"],
      typeLearn: json["type_learn"] ?? '',
    );
  }
}

//thông tin chi tiết một buổi học
class DetaiLessonModel {
  final InfoLessonModel infoLesson;
  final List<HomeWorkModel> listHomeWorks;
  final List<DocumentModel> listDocument;
  final String feedback;
  DetaiLessonModel({
    required this.infoLesson,
    required this.listHomeWorks,
    required this.listDocument,
    required this.feedback,
  });
  factory DetaiLessonModel.fromJson(Map<String, dynamic> json) {
    return DetaiLessonModel(
      infoLesson: InfoLessonModel.fromJson(json["info_lesson"]),
      listHomeWorks: (json["homework"] as List)
          .map((e) => HomeWorkModel.fromJson(e))
          .toList(),
      listDocument: (json["document"] as List)
          .map((e) => DocumentModel.fromJson(e))
          .toList(),
      feedback: json['feedback'],
    );
  }
}

// thông tin buổi học
class InfoLessonModel {
  final String? namePhongHoc;
  final String? coSoName;
  final String? linkZoom;
  final String nameLesson;
  final String topic;
  final String lessonContent;
  InfoLessonModel({
    this.namePhongHoc,
    this.coSoName,
    this.linkZoom,
    required this.nameLesson,
    required this.topic,
    required this.lessonContent,
  });
  factory InfoLessonModel.fromJson(Map<String, dynamic> json) {
    return InfoLessonModel(
      namePhongHoc: json["name_phonghoc"],
      coSoName: json["coso_name"],
      linkZoom: json["link_zoom"],
      nameLesson: json["name_lesson"] ?? '',
      topic: json["topic"] ?? '',
      lessonContent: json["lesson_content"] ?? '',
    );
  }
}

class DataHomeWorkModel {
  final List<ListBTModel> listHomeWorks;
  final String name;
  DataHomeWorkModel({
    required this.listHomeWorks,
    required this.name,
  });
  factory DataHomeWorkModel.fromJson(Map<String, dynamic> json) {
    return DataHomeWorkModel(
      listHomeWorks:
          (json["list"] as List).map((e) => ListBTModel.fromJson(e)).toList(),
      name: json['name'],
    );
  }
}

class ListBTModel {
  final String id;
  final String nameExercise;
  final String linkExercise;
  final String timeDeadline;
  final String daySubmit;
  final String status;
  final String score;
  final String percent;
  final String typeLearn;
  final String typeExercise;
  final String noteTeacher;
  ListBTModel({
    required this.id,
    required this.nameExercise,
    required this.linkExercise,
    required this.timeDeadline,
    required this.daySubmit,
    required this.status,
    required this.score,
    required this.percent,
    required this.typeLearn,
    required this.typeExercise,
    required this.noteTeacher,
  });
  factory ListBTModel.fromJson(Map<String, dynamic> json) {
    return ListBTModel(
      id: json["class_lesson_document_id"] ?? '',
      nameExercise: json['name_exercise'] ?? '',
      linkExercise: json['link_exercise'] ?? '',
      timeDeadline: json['deadline'] ?? '',
      daySubmit: json['day_submit'] ?? '',
      status: json['status'] ?? '',
      score: json['score'] ?? '',
      percent: json['percent'] ?? '',
      typeLearn: json['type_learn'] ?? '',
      typeExercise: json['type_exercise'] ?? '',
      noteTeacher: json['note_teacher'] ?? '',
    );
  }
}

// thông tin bài tập về nhà
class HomeWorkModel {
  final String image;
  final String name;
  final String documentId;
  final String timeDeadline;
  final String note;
  final String nameTeacher;
  final String isSubmit;
  final String customerId;
  final String typeLearn;
  final String eventCheckinOffId;
  HomeWorkModel({
    required this.image,
    required this.name,
    required this.documentId,
    required this.timeDeadline,
    required this.note,
    required this.nameTeacher,
    required this.isSubmit,
    required this.customerId,
    required this.typeLearn,
    required this.eventCheckinOffId,
  });
  factory HomeWorkModel.fromJson(Map<String, dynamic> json) {
    return HomeWorkModel(
      image: json["course_schedule_img"] ?? '',
      name: json['name'] ?? '',
      documentId: json['class_lesson_document_id'] ?? '',
      timeDeadline: json['time_deadline'] ?? '',
      note: json['note'] ?? '',
      nameTeacher: json['name_teacher'] ?? '',
      isSubmit: json['is_submit_homework'] ?? '',
      customerId: json['class_lesson_document_customer_id'] ?? '',
      typeLearn: json['type_learn'] ?? '',
      eventCheckinOffId: json['event_checkin_off_id'] ?? '',
    );
  }
}

// thông tin tài liệu
class DocumentModel {
  final String point;
  final String name;
  DocumentModel({
    required this.point,
    required this.name,
  });
  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      point: json['course_schedule_img'],
      name: json['name'],
    );
  }
}

class ListFeedBackModel {
  final List<FeedbackHangNgayModel> listFbDaily;
  final List<FeedbackDinhKyModel> listFbDinhKy;
  ListFeedBackModel({
    required this.listFbDaily,
    required this.listFbDinhKy,
  });
  factory ListFeedBackModel.fromJson(Map<String, dynamic> json) {
    return ListFeedBackModel(
      listFbDaily: (json['hang_ngay'] as List)
          .map((e) => FeedbackHangNgayModel.fromJson(e))
          .toList(),
      listFbDinhKy: (json['dinh_ky'] as List)
          .map((e) => FeedbackDinhKyModel.fromJson(e))
          .toList(),
    );
  }
}

class FeedbackHangNgayModel {
  final String name;
  final List<FeedbackModel> listFeedback;

  FeedbackHangNgayModel({
    required this.name,
    required this.listFeedback,
  });
  factory FeedbackHangNgayModel.fromJson(Map<String, dynamic> json) {
    return FeedbackHangNgayModel(
      name: json['name'] ?? '',
      listFeedback:
          (json["list"] as List).map((e) => FeedbackModel.fromJson(e)).toList(),
    );
  }
}

class FeedbackDinhKyModel {
  final String name;
  final List<FeedbackModel> listFeedback;
  FeedbackDinhKyModel({
    required this.name,
    required this.listFeedback,
  });
  factory FeedbackDinhKyModel.fromJson(Map<String, dynamic> json) {
    return FeedbackDinhKyModel(
      name: json['name'],
      listFeedback:
          (json["list"] as List).map((e) => FeedbackModel.fromJson(e)).toList(),
    );
  }
}

class FeedbackModel {
  final String id;
  final String typelearn;
  final String createdAt;
  final String tenBuoi;
  final String? meetingId;
  FeedbackModel({
    required this.id,
    required this.typelearn,
    required this.createdAt,
    required this.tenBuoi,
    this.meetingId,
  });
  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      id: json['event_checkin_off_id'] ?? '',
      typelearn: json['type_learn'] ?? '',
      createdAt: json['created_at'] ?? '',
      tenBuoi: json['ten_buoi'] ?? '',
      meetingId: json['meeting_id'] ?? '',
    );
  }
}
