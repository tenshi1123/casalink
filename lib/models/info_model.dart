class InfoModel {
  final String avatar;
  final String fullName;
  final String id;
  final String email;
  final String phone;
  final String gender;
  final String birthday;
  InfoModel({
    required this.avatar,
    required this.fullName,
    required this.id,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthday,
  });
  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      avatar: json['avatar'] ?? '',
      fullName: json['full_name'] ?? '',
      id: json['id'] ?? '',
      email: json['email'] ?? 'Không xác định',
      phone: json['phone'] ?? 'Không xác định',
      gender: json['gender'] ?? 'Không xác định',
      birthday: json['birthday'] ?? 'Không xác định',
    );
  }
}

class InfoHomeModel {
  final String lopHoc;
  final String coso;
  final String numberLessons;

  InfoHomeModel({
    required this.lopHoc,
    required this.coso,
    required this.numberLessons,
  });
  factory InfoHomeModel.fromJson(Map<String, dynamic> json) {
    return InfoHomeModel(
      lopHoc: json['class'] ?? '',
      coso: json['coso'] ?? '',
      numberLessons: json['so_buoi_hoc'] ?? '',
    );
  }
}

class DropClassModel {
  final String name;
  final String typeId;
  final String scheduleId;

  DropClassModel({
    required this.name,
    required this.typeId,
    required this.scheduleId,
  });
  factory DropClassModel.fromJson(Map<String, dynamic> json) {
    return DropClassModel(
      name: json['course_schedule_name'] ?? '',
      typeId: json['setting_course_type_id'] ?? '',
      scheduleId: json['course_schedule_id'] ?? '',
    );
  }
}

class DropLessonModel {
  final String name;
  final String typeLearn;
  final String id;
  final String day;

  DropLessonModel(
      {required this.name,
      required this.typeLearn,
      required this.id,
      required this.day});
  factory DropLessonModel.fromJson(Map<String, dynamic> json) {
    return DropLessonModel(
      name: json['name'] ?? '',
      typeLearn: json['type_learn'] ?? '',
      id: json['buoi_hoc_id'] ?? '',
      day: json['day'] ?? '',
    );
  }
}

class ChildrenInfoModel {
  final String img;
  final String nameChild;
  final String token;
  final String refreshToken;
  ChildrenInfoModel({
    required this.img,
    required this.nameChild,
    required this.token,
    required this.refreshToken,
  });
  factory ChildrenInfoModel.fromJson(Map<String, dynamic> json) {
    return ChildrenInfoModel(
      img: json['img'] ?? '',
      nameChild: json['name_child'] ?? '',
      token: json['token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
    );
  }
}
