class CheckinModel {
  final CheckInOffModel checkInOffModel;
  final CheckinZoomModel checkinZoomModel;
  CheckinModel({
    required this.checkInOffModel,
    required this.checkinZoomModel,
  });
  factory CheckinModel.fromJson(Map<String, dynamic> json) {
    return CheckinModel(
      checkInOffModel: CheckInOffModel.fromJson(json['checkin_offline']),
      checkinZoomModel: CheckinZoomModel.fromJson(json['checkin_zoom']),
    );
  }
}

class CheckInOffModel {
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
  CheckInOffModel({
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
  factory CheckInOffModel.fromJson(Map<String, dynamic> json) {
    return CheckInOffModel(
      id: json['customer_zoom_google_offline_id'] ?? '',
      type: json['type'] ?? '',
      className: json['class_name'] ?? '',
      classNote: json['class_note'] ?? '',
      coureName: json['course_name'] ?? '',
      phonghocName: json['phonghoc_name'] ?? '',
      cosoName: json['coso_name'] ?? '',
      thoiluong: json['thoi_luong'] ?? '',
      daHoc: json['so_buoi_da_hoc'] ?? '',
      vangMat: json['vang_mat'] ?? '',
      xinNghi: json['xin_nghi'] ?? '',
      chuaHoc: json['chua_hoc'] ?? '',
      diMuon: json['di_muon'] ?? '',
      dungGio: json['dung_gio'] ?? '',
    );
  }
}

class CheckinZoomModel {
  final String id;
  final String type;
  final String className;
  final String classNote;
  final String courseName;
  final String thoiluong;
  final String chuaThamGia;
  final String thamGia;
  CheckinZoomModel({
    required this.id,
    required this.type,
    required this.className,
    required this.classNote,
    required this.courseName,
    required this.thoiluong,
    required this.chuaThamGia,
    required this.thamGia,
  });
  factory CheckinZoomModel.fromJson(Map<String, dynamic> json) {
    return CheckinZoomModel(
      id: json['customer_zoom_google_offline_id'] ?? '',
      type: json['type'] ?? '',
      className: json['class_name'] ?? '',
      classNote: json['class_note'] ?? '',
      courseName: json['course_name'] ?? '',
      thoiluong: json['thoi_luong'] ?? '',
      chuaThamGia: json['chua_tham_gia'] ?? '',
      thamGia: json['tham_gia'] ?? '',
    );
  }
}
