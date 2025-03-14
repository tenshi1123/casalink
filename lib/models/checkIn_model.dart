class CheckinModel {
  final List<CheckInModel> checkInOffModel;
  final List<CheckInModel> checkinZoomModel;
  CheckinModel({
    required this.checkInOffModel,
    required this.checkinZoomModel,
  });
  factory CheckinModel.fromJson(Map<String, dynamic> json) {
    return CheckinModel(
      checkInOffModel:
          (json['off'] as List).map((e) => CheckInModel.fromJson(e)).toList(),
      checkinZoomModel:
          (json['zoom'] as List).map((e) => CheckInModel.fromJson(e)).toList(),
    );
  }
}

class CheckInModel {
  final String id;
  final String type;
  final String className;
  final String classNote;
  final String coureName;
  final String phonghocName;
  final String cosoName;
  final String thoiluong;
  final String daHoc;
  final String vangMat;
  final String xinNghi;
  final String chuaHoc;
  final String diMuon;
  final String dungGio;
  CheckInModel({
    required this.id,
    required this.type,
    required this.className,
    required this.classNote,
    required this.coureName,
    required this.phonghocName,
    required this.cosoName,
    required this.thoiluong,
    required this.daHoc,
    required this.vangMat,
    required this.xinNghi,
    required this.chuaHoc,
    required this.diMuon,
    required this.dungGio,
  });
  factory CheckInModel.fromJson(Map<String, dynamic> json) {
    return CheckInModel(
      id: json['customer_zoom_google_offline_id'] ?? '',
      type: json['type'] ?? '',
      className: json['class_name'] ?? '',
      classNote: json['class_note'] ?? '',
      coureName: json['course_name'] ?? '',
      phonghocName: json['phonghoc_name'] ?? '',
      cosoName: json['coso_name'] ?? 'Cơ sở Online',
      thoiluong: json['thoi_luong'] ?? '',
      daHoc: json['so_buoi_da_hoc'] ?? '',
      vangMat: json['vang_mat'] ?? '',
      xinNghi: json['xin_nghi'] ?? '',
      chuaHoc: json['chua_hoc'] ?? json['chua_tham_gia'] ?? '',
      diMuon: json['di_muon'] ?? '',
      dungGio: json['dung_gio'] ?? '',
    );
  }
}

class DetailCheckinModel {
  final String typeLearn;
  final String createdDate;
  final String name;
  final String topic;
  final String phonghocName;
  final String cosoName;
  final String gvStatus;
  final String checkinOffId;
  final String meetingId;
  DetailCheckinModel({
    required this.typeLearn,
    required this.createdDate,
    required this.name,
    required this.topic,
    required this.phonghocName,
    required this.cosoName,
    required this.gvStatus,
    required this.checkinOffId,
    required this.meetingId,
  });
  factory DetailCheckinModel.fromJson(Map<String, dynamic> json) {
    return DetailCheckinModel(
      typeLearn: json['type_learn'] ?? '',
      createdDate: json['created_date'] ?? '',
      name: json['name'] ?? '',
      topic: json['topic'] ?? '',
      phonghocName: json['phonghoc_name'] ?? '',
      cosoName: json['coso_name'] ?? '',
      gvStatus: json['gv_status'] ?? '',
      checkinOffId: json['checkin_off_id'] ?? '',
      meetingId: json['meeting_id'] ?? '',
    );
  }
}

class LeaveModel {
  final String id;
  final String customerId;
  final String reason;
  final String createdAt;
  final String updatedAt;
  final String buoiHoc;
  final String lopHoc;
  final String lopHocAlias;
  LeaveModel({
    required this.id,
    required this.customerId,
    required this.reason,
    required this.createdAt,
    required this.updatedAt,
    required this.buoiHoc,
    required this.lopHoc,
    required this.lopHocAlias,
  });
  factory LeaveModel.fromJson(Map<String, dynamic> json) {
    return LeaveModel(
      id: json['id'] ?? '',
      customerId: json['customer_id'] ?? '',
      reason: json['reason'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['update_at'] ?? '',
      buoiHoc: json['buoi_hoc'] ?? '',
      lopHoc: json['lop_hoc'] ?? '',
      lopHocAlias: json['lop_hoc_alias'] ?? '',
    );
  }
}
