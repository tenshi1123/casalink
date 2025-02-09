import 'package:casalink/modules/chat/screen/list_conversation_screen.dart';
import 'package:casalink/modules/diemdanh/diemdanh_screen.dart';
import 'package:casalink/utils/constants/styles.dart';
import 'package:casalink/utils/widget/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../main.dart';
import '../../../models/category_model.dart';
import '../../../models/info_model.dart';
import '../../../models/schedule_model.dart';
import '../../../repo/category_repo.dart';
import '../../../repo/follow_class_repo.dart';
import '../../../repo/schedule_repo.dart';
import '../../../utils/widget/custom_dialog.dart';
import '../../absenteehistory/history_screen.dart';
import '../../diemdanh/detail_screen.dart';
import 'excercise_screen.dart';
import '../../feedback/feedback_screen.dart';
import '../../notification/notification_screen.dart';
import 'schedule_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.infoModel, required this.infoClassModel});
  final InfoModel infoModel;
  final InfoClassModel infoClassModel;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> _docLibra = ValueNotifier<int>(0);
  final ValueNotifier<int> _centralBoard = ValueNotifier<int>(0);
  final controller1 = PageController(viewportFraction: 1, keepPage: true);
  final controller2 = PageController(viewportFraction: 0.75, keepPage: true);
  final controller3 = PageController(viewportFraction: 0.75, keepPage: true);
  bool _isLoading = false;
  bool _isLoading1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2FDFF),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 375.w,
              height: 295.h,
              child: Stack(children: [
                Container(
                  height: 295.h,
                  width: 375.w,
                  color: const Color(0xffF2FDFF),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image(
                    width: MediaQuery.of(context).size.width,
                    height: 255.h,
                    image: const AssetImage(
                      'assets/images/appbar_background.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 72.h,
                  left: 16.w,
                  child: SizedBox(
                    width: 340.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image(
                              image:
                                  const AssetImage('assets/images/avatar.png'),
                              height: 44.h,
                              width: 44.w,
                              fit: BoxFit.fill,
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                pushWithoutNavBar(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        const ListConversationScreen()),
                                  ),
                                );
                              },
                              child: const Image(
                                  image: AssetImage('assets/images/mess.png')),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            InkWell(
                              onTap: () {
                                pushWithoutNavBar(
                                  context,
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        const NotificationScreen()),
                                  ),
                                );
                              },
                              child: Image(
                                image:
                                    const AssetImage('assets/images/bell.png'),
                                height: 40.h,
                                width: 40.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          'Xin chào,',
                          style: defaultText16Re.copyWith(
                            color: Colors.white.withValues(alpha: 0.6),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          widget.infoModel.fullName,
                          style: defaultText20B.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5.h,
                  left: 20.w,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                    width: 343.w,
                    height: 90.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(12),
                          blurRadius: 8,
                          offset: const Offset(0, 4), // Shadow position
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Lớp',
                              style: defaultText14M.copyWith(
                                color: const Color(0xff292929).withAlpha(70),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                              width: 80.w,
                              child: Text(
                                widget.infoClassModel.lopHoc,
                                style: defaultText16M,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: VerticalDivider(
                            color: Color(0xffD9D9D9),
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chi nhánh',
                              style: defaultText14M.copyWith(
                                color: const Color(0xff292929).withAlpha(70),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                              width: 80.w,
                              child: Text(
                                widget.infoClassModel.coso,
                                style: defaultText16M,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: VerticalDivider(
                            color: Color(0xffD9D9D9),
                            thickness: 1,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số buổi còn lại',
                              style: defaultText14M.copyWith(
                                color: const Color(0xff292929).withAlpha(70),
                              ),
                            ),
                            SizedBox(
                              height: 40.h,
                              width: 80.w,
                              child: Text(
                                widget.infoClassModel.numberLessons,
                                style: defaultText16M,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 20.h, bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Theo dõi lớp học',
                    style: defaultText16B,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                width: 343.w,
                height: 300.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            pushWithoutNavBar(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const ScheduleScreen()),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/lich_hoc.png',
                            height: 144.h,
                            width: 163.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _isLoading = true;
                            });
                            List<DataHomeWorkModel> listExcercise =
                                await FollowClassRepo().getExcercises();
                            setState(() {
                              _isLoading = false;
                            });
                            pushWithoutNavBar(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ExcerciseScreen(
                                      listExcercise: listExcercise,
                                    )),
                              ),
                            );
                          },
                          child: _isLoading
                              ? SizedBox(
                                  height: 144.h,
                                  width: 163.w,
                                  child: Center(
                                    child: SizedBox(
                                      width: 40.w,
                                      height: 40.h,
                                      child: const CircularProgressIndicator(),
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  'assets/images/bai_tap.png',
                                  height: 144.h,
                                  width: 163.w,
                                  fit: BoxFit.fill,
                                ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _isLoading1 = true;
                            });
                            ListFeedBackModel listFeedBack =
                                await FollowClassRepo().getListFeedback();
                            setState(() {
                              _isLoading1 = false;
                            });
                            pushWithoutNavBar(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => FeedBackScreen(
                                      listFeedBack: listFeedBack,
                                    )),
                              ),
                            );
                          },
                          child: _isLoading1
                              ? SizedBox(
                                  height: 144.h,
                                  width: 163.w,
                                  child: Center(
                                    child: SizedBox(
                                      width: 40.w,
                                      height: 40.h,
                                      child: const CircularProgressIndicator(),
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  'assets/images/test_feedback.png',
                                  height: 144.h,
                                  width: 163.w,
                                  fit: BoxFit.fill,
                                ),
                        ),
                        GestureDetector(
                          onTap: () {
                            pushWithoutNavBar(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const RollCallScreen()),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/images/diem_danh.png',
                            height: 144.h,
                            width: 163.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  color: Colors.white),
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  const LeaveAbsencePopUp(
                                    type: '1',
                                  )),
                          child: Container(
                            height: 40.h,
                            width: 106.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2.w,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              color: const Color(0xffED1C24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4), // Shadow position
                                ),
                              ],
                            ),
                            child: Center(
                                child: Text(
                              'xin nghỉ',
                              style: defaultText14B.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  const LeaveAbsencePopUp(
                                    type: '2',
                                  )),
                          child: Container(
                            height: 40.h,
                            width: 106.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4), // Shadow position
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              color: const Color(0xff28B4E9),
                            ),
                            child: Center(
                                child: Text(
                              'xin đi muộn',
                              style: defaultText14B.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  const FeedbackPopUp()),
                          child: Container(
                            height: 40.h,
                            width: 106.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2.w,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(12),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4), // Shadow position
                                ),
                              ],
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.r),
                              ),
                              color: const Color(0xff273D8C),
                            ),
                            child: Center(
                                child: Text(
                              'feedback',
                              style: defaultText14B.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const HistoryScreen()),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      child: Text(
                        'Lịch sử',
                        style: defaultText16B,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Text(
                      'Lịch học sắp tới',
                      style: defaultText16B,
                    ),
                  ),
                  FutureBuilder(
                    future: ScheduleRepo().getScheduleList(
                        DateFormat('dd-MM-yyyy').format(DateTime.now()),
                        DateFormat('dd-MM-yyyy').format(DateTime.now()
                            .add(const Duration(days: 7)))), // Hàm gọi API
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(
                          'Something went wrong',
                          style: defaultText14M,
                        );
                      } else if (snapshot.hasData) {
                        final listLichHoc =
                            snapshot.data as List<ScheduleModel>;
                        return SizedBox(
                          height: 188.h,
                          width: 375.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: SizedBox(
                                  height: 146.h,
                                  width: 343.w,
                                  child: PageView.builder(
                                    padEnds: false,
                                    controller: controller1,
                                    itemCount: listLichHoc.length,
                                    itemBuilder: (_, index) {
                                      return UpcomingSchedule(
                                        model: listLichHoc[index],
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              SmoothPageIndicator(
                                controller: controller1,
                                count: listLichHoc.length,
                                effect: CustomizableEffect(
                                  activeDotDecoration: DotDecoration(
                                    width: 20.w,
                                    height: 8.h,
                                    color: Colors.indigo,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  dotDecoration: DotDecoration(
                                    width: 8.w,
                                    height: 8.h,
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16),
                                    verticalOffset: 0,
                                  ),
                                  spacing: 6.0,
                                ),
                                // effect: SlideEffect(
                                //     paintStyle: PaintingStyle.stroke,
                                //     activeDotColor: const Color(0xff273D8C),
                                //     dotColor: const Color(0xffE3E3E3),
                                //     dotHeight: 10.h,
                                //     dotWidth: 10.w),
                                onDotClicked: (index) {
                                  controller1.animateToPage(index,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut);
                                },
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Text(
                          'Something went wrong2',
                          style: defaultText14M,
                        );
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Text(
                      'Thư viện tài liệu',
                      style: defaultText16B,
                    ),
                  ),
                  SizedBox(
                    height: 284.h,
                    width: 375.w,
                    child: ValueListenableBuilder<int>(
                      valueListenable: _docLibra,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 55.h,
                              width: 375.w,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: listCategori.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 16.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        _docLibra.value = index;
                                      },
                                      child: Column(
                                        children: [
                                          feedbackItem(
                                            value == index,
                                            listCategori[index].categoryName,
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                                height: 229.h,
                                width: 375.w,
                                child: FutureBuilder(
                                  future: CategoryRepo().getLibrary(
                                      listCategori[_docLibra.value]
                                          .id), // Hàm gọi API
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.w,
                                          height: 40.h,
                                          child:
                                              const CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                        'Something went wrong',
                                        style: defaultText14M,
                                      );
                                    } else if (snapshot.hasData) {
                                      final listlibra =
                                          snapshot.data as List<LibraryModel>;
                                      return SizedBox(
                                        width: 375.w,
                                        height: 166.h,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.r),
                                                bottomLeft:
                                                    Radius.circular(16.r),
                                              ),
                                              child: SizedBox(
                                                height: 208.h,
                                                width: 375.w,
                                                child: PageView.builder(
                                                  padEnds: false,
                                                  controller: controller2,
                                                  itemCount: listlibra.length,
                                                  itemBuilder: (_, index) {
                                                    return DocumentItem(
                                                      model: listlibra[index],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            SmoothPageIndicator(
                                              controller: controller2,
                                              count: 3,
                                              effect: CustomizableEffect(
                                                activeDotDecoration:
                                                    DotDecoration(
                                                  width: 20.w,
                                                  height: 8.h,
                                                  color: Colors.indigo,
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                dotDecoration: DotDecoration(
                                                  width: 8.w,
                                                  height: 8.h,
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  verticalOffset: 0,
                                                ),
                                                spacing: 6.0,
                                              ),
                                              onDotClicked: (index) {
                                                controller2.animateToPage(index,
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.easeInOut);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        'Something went wrong2',
                                        style: defaultText14M,
                                      );
                                    }
                                  },
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h, bottom: 16.h),
                    child: Text(
                      'Bảng tin trung tâm',
                      style: defaultText16B,
                    ),
                  ),
                  SizedBox(
                    height: 284.h,
                    width: 375.w,
                    child: ValueListenableBuilder<int>(
                      valueListenable: _centralBoard,
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        return Column(
                          children: [
                            SizedBox(
                              height: 35.h,
                              width: 375.w,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: listPostCate.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 16.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        _centralBoard.value = index;
                                      },
                                      child: feedbackItem(
                                        value == index,
                                        listPostCate[index].categoryName,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                                height: 229.h,
                                width: 375.w,
                                child: FutureBuilder(
                                  future: CategoryRepo().getPostCategory(
                                      listPostCate[_centralBoard.value]
                                          .id), // Hàm gọi API
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: SizedBox(
                                          width: 40.w,
                                          height: 40.h,
                                          child:
                                              const CircularProgressIndicator(),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                        'Something went wrong',
                                        style: defaultText14M,
                                      );
                                    } else if (snapshot.hasData) {
                                      final listPost =
                                          snapshot.data as List<PostModel>;
                                      return SizedBox(
                                        width: 375.w,
                                        height: 166.h,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.r),
                                                bottomLeft:
                                                    Radius.circular(16.r),
                                              ),
                                              child: SizedBox(
                                                height: 208.h,
                                                width: 375.w,
                                                child: PageView.builder(
                                                  padEnds: false,
                                                  controller: controller3,
                                                  itemCount: listPost.length,
                                                  itemBuilder: (_, index) {
                                                    return PostItem(
                                                      model: listPost[index],
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                            SmoothPageIndicator(
                                              controller: controller3,
                                              count: 3,
                                              effect: CustomizableEffect(
                                                activeDotDecoration:
                                                    DotDecoration(
                                                  width: 20.w,
                                                  height: 8.h,
                                                  color: Colors.indigo,
                                                  borderRadius:
                                                      BorderRadius.circular(24),
                                                ),
                                                dotDecoration: DotDecoration(
                                                  width: 8.w,
                                                  height: 8.h,
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  verticalOffset: 0,
                                                ),
                                                spacing: 6.0,
                                              ),
                                              onDotClicked: (index) {
                                                controller2.animateToPage(index,
                                                    duration: const Duration(
                                                        milliseconds: 300),
                                                    curve: Curves.easeInOut);
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return Text(
                                        'Something went wrong2',
                                        style: defaultText14M,
                                      );
                                    }
                                  },
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            )
          ],
        ),
      ),
    );
  }
}

//Vội vl không tách widgetwidget

class UpcomingSchedule extends StatelessWidget {
  const UpcomingSchedule({super.key, required this.model});
  final ScheduleModel model;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DetaiLessonModel listExcercise = await ScheduleRepo().getDetailSchedule(
          checkinOffId: model.checkinOffId,
          typeLearn: model.typeLearn,
          meetingId: model.meetingId,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => DetailScreen(
                  detailLesson: listExcercise,
                )),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: 343.w,
        height: 136.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff273D8C).withValues(alpha: 0.12),
              blurRadius: 16,
              spreadRadius: 0,
              offset: const Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Container(
                  width: 90.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: const Color(0xff273D8C),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        model.createdDate.day.toString(),
                        style: defaultText16B.copyWith(
                            color: Colors.white, fontSize: 24.sp),
                      ),
                      Text(
                        'Tháng ${model.createdDate.month}',
                        style: defaultText16M.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.buoiHoc,
                      style: defaultText18B,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '${DateFormat('EEEE').format(model.createdDate)}  (${model.timeStart.replaceRange(5, null, '')} - ${model.timeEnd.replaceRange(5, null, '')})',
                      style: defaultText14M,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Phòng học: ',
                    style: defaultText16M,
                    children: [
                      TextSpan(
                          text: model.phongHocName ?? 'A101',
                          style: defaultText16B.copyWith(
                              color: const Color(0xff273D8C))),
                    ],
                  ),
                ),
                Container(
                  width: 1.w,
                  height: 20.h,
                  color: const Color(0xff273D8C),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Chi nhánh: ',
                    style: defaultText16M,
                    children: [
                      TextSpan(
                          text: model.cosoName ?? 'Mỹ Đình',
                          style: defaultText16B.copyWith(
                              color: const Color(0xff273D8C))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<String> list = [
  'assets/images/banner.png',
  'assets/images/banner1.png',
  'assets/images/banner2.png',
  'assets/images/banner3.png',
  'assets/images/banner4.png',
  'assets/images/banner5.png',
];
