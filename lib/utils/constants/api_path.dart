class ApiPath {
  //baseurl
  static const String baseUrl = 'https://casalink.edu.vn/api';
  //api về đăng nhập, các thông tin của học sinh
  static const String login = '$baseUrl/login';

  static const String register = '$baseUrl/register';
  static const String forgotPassword = '$baseUrl/forgot-password';
  static const String checkPhone = '$baseUrl/check-phone';
  static const String saveOtp = '$baseUrl/save-opt';
  static const String refreshToken = '$baseUrl/refresh-token';

  // lịch học
  static const String listSchedule = '$baseUrl/schedule';

  // chi tiết lớp học
  static const String detailSchedule = '$baseUrl/homework';

  // danh sách bài tập về nhà
  static const String listExercise = '$baseUrl/exercise';

  // danh sách feedback
  static const String listFeedback = '$baseUrl/feedback';

  // Chi tiết feedback
  static const String detailFeedback = '$baseUrl/feedback/detail';

  //điểm danh
  static const String listCheckin = '$baseUrl/checkin';
  static const String detailCheckin = '$baseUrl/checkin/detail';

  // thông tin tài khoản
  static const String user = '$baseUrl/user/info';
  static const String infoclass = '$baseUrl/info/class';

  // về việc xin nghỉ
  static const String classLearned = '$baseUrl/student/class';
  static const String lessonLearned = '$baseUrl/student/class/lesson';
  static const String requestLeave = '$baseUrl/student/leave';
  static const String leaveList = '$baseUrl/student/leave/list';
  //dm cứ nhìn nhìn khó chịu vl

  // về việc xin đi muộn
  static const String classLater = '$baseUrl/student/class/later';
  static const String lessonLater = '$baseUrl/student/class/lesson/later';
  static const String requestLater = '$baseUrl/student/later';
  // xóa tài khoản
  static const String deleteUser = '$baseUrl/user/delete';

  // check password
  static const String checkPassword = '$baseUrl/user/password/check';

  // Đổi mật khẩu
  static const String changePassword = '$baseUrl/user/password/update';

  //Gửi thông tin onesignal id
  static const String pushOnsignalId = '$baseUrl/notify/onesignal_id';

  //Xóa thông tin onesignal id
  static const String deleteOnsignalId = '$baseUrl/notify/remove/onesignal_id';

  //Gửi bài tập
  static const String uploadHomeWork = '$baseUrl/detail/homework/upload';

  //Hiển thị bài tập đã nộp
  static const String showHomeWork = '$baseUrl/homework/submit';

  //Lấy danh sách banner
  static const String getBanner = '$baseUrl/banner';

  //Lấy danh sách danh mục
  static const String category = '$baseUrl/category';

  static const String library = '$baseUrl/library';

  static const String postCategory = '$baseUrl/post/category';

  static const String detailPost = '$baseUrl/post';

  //Danh sách lớp học
  static const String listClass = '$baseUrl/class';
  // Chi tiết lớp học
  static const String detailClass = '$baseUrl/class/detail';
  //Danh sách tái phí của một lớp
  static const String refee = '$baseUrl/class/refee';

  //Danh sách khóa học video
  static const String listLessonVideo = '$baseUrl/lesson';
  //Danh sách Topical
  static const String listTopical = '$baseUrl/lesson/topical';
  //Danh sách bài giảng
  static const String listLecture = '$baseUrl/lesson/topical/video';
  //Chi tiết 1 video
  static const String detailLesson = '$baseUrl/lesson/topical/video/detail';

  //Danh sách thông báo
  static const String listNotify = '$baseUrl/notification';
  //Check có thông báo mới hay không
  //Chi tiết thông báo
  //Cập nhật trạng thái khi ấn vào

  //Chat
  static const String lecture = '$baseUrl/chat/lecture';
  static const String message = '$baseUrl/chat/lecture/message';
  static const String sendMessage = '$baseUrl/chat/lecture/message/send';
}
