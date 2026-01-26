import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiPath {
  //baseurl
  static String baseUrl = '';
  //api về đăng nhập, các thông tin của học sinh
  static String login = '$baseUrl/login';

  static String register = '$baseUrl/register';
  static String forgotPassword = '$baseUrl/forgot-password';
  static String checkPhone = '$baseUrl/check-phone';
  static String saveOtp = '$baseUrl/save-opt';
  static String refreshToken = '$baseUrl/refresh-token';

  // lịch học
  static String listSchedule = '$baseUrl/schedule';

  // chi tiết lớp học
  static String detailSchedule = '$baseUrl/homework';

  // danh sách bài tập về nhà
  static String listExercise = '$baseUrl/exercise';

  // danh sách feedback
  static String listFeedback = '$baseUrl/feedback';

  // Chi tiết feedback
  static String detailFeedback = '$baseUrl/feedback/detail';

  //điểm danh
  static String listCheckin = '$baseUrl/checkin';
  static String detailCheckin = '$baseUrl/checkin/detail';

  // thông tin tài khoản
  static String user = '$baseUrl/user/info';
  static String infoclass = '$baseUrl/info/class';

  // về việc xin nghỉ
  static String classLearned = '$baseUrl/student/class';
  static String lessonLearned = '$baseUrl/student/class/lesson';
  static String requestLeave = '$baseUrl/student/leave';
  static String leaveList = '$baseUrl/student/leave/list';

  // về việc xin đi muộn
  static String classLater = '$baseUrl/student/class/later';
  static String lessonLater = '$baseUrl/student/class/lesson/later';
  static String requestLater = '$baseUrl/student/later';
  // xóa tài khoản
  static String deleteUser = '$baseUrl/user/delete';

  // check password
  static String checkPassword = '$baseUrl/user/password/check';

  // Đổi mật khẩu
  static String changePassword = '$baseUrl/user/password/update';

  //Gửi thông tin onesignal id
  static String pushOnsignalId = '$baseUrl/notify/onesignal_id';

  //Xóa thông tin onesignal id
  static String deleteOnsignalId = '$baseUrl/notify/remove/onesignal_id';

  //Gửi bài tập
  static String uploadHomeWork = '$baseUrl/detail/homework/upload';

  //Hiển thị bài tập đã nộp
  static String showHomeWork = '$baseUrl/homework/submit';

  //Lấy danh sách banner
  static String getBanner = '$baseUrl/banner';

  //Lấy danh sách danh mục
  static String category = '$baseUrl/category';

  static String library = '$baseUrl/library';

  static String postCategory = '$baseUrl/post/category';

  static String detailPost = '$baseUrl/post';

  //Danh sách lớp học
  static String listClass = '$baseUrl/class';
  // Chi tiết lớp học
  static String detailClass = '$baseUrl/class/detail';
  //Danh sách tái phí của một lớp
  static String refee = '$baseUrl/class/refee';

  //Danh sách khóa học video
  static String listLessonVideo = '$baseUrl/lesson';
  //Danh sách Topical
  static String listTopical = '$baseUrl/lesson/topical';
  //Danh sách bài giảng
  static String listLecture = '$baseUrl/lesson/topical/video';
  //Chi tiết 1 video
  static String detailLesson = '$baseUrl/lesson/topical/video/detail';

  //Danh sách thông báo
  static String listNotify = '$baseUrl/notification';
  //Check có thông báo mới hay không
  //Chi tiết thông báo
  //Cập nhật trạng thái khi ấn vào

  //Chat
  static String lecture = '$baseUrl/chat/lecture';
  static String message = '$baseUrl/chat/lecture/message';
  static String sendMessage = '$baseUrl/chat/lecture/message/send';

  static String getDomain =
      'https://612ced09ab461c00178b5fbb.mockapi.io/api/users/test';
}

Future<void> initApiConfig() async {
  //final prefs = await SharedPreferences.getInstance();

  //final cached = prefs.getString('base_url');
  // if (cached != null) {
  //   ApiPath.baseUrl = cached;
  //   return;
  // }

  final res = await http.get(
    Uri.parse('https://612ced09ab461c00178b5fbb.mockapi.io/api/users/test'),
  );

  final data = jsonDecode(res.body);
  ApiPath.baseUrl = data[0]['domain'];

  //await prefs.setString('base_url', ApiPath.baseUrl);
}
