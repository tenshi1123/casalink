import 'package:casalink/utils/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 375.w,
            height: 290.h,
            child: Stack(children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image(
                  width: MediaQuery.of(context).size.width,
                  height: 255.h,
                  image: const AssetImage(
                    'assets/images/appbar_background.png',
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Positioned(
                bottom: 0.h,
                left: 20.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  width: 343.w,
                  height: 90.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.r),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(3, 4), // Shadow position
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
                              color: const Color(0xff292929).withOpacity(0.6),
                            ),
                          ),
                          Text(
                            'NC',
                            style: defaultText16M,
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
                              color: const Color(0xff292929).withOpacity(0.6),
                            ),
                          ),
                          Text(
                            'Mỹ Đình',
                            style: defaultText16M,
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
                              color: const Color(0xff292929).withOpacity(0.6),
                            ),
                          ),
                          Text(
                            '50',
                            style: defaultText16M,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            width: 343.w,
            height: 343.h,
            child: GridView.count(
              // Create a grid with 2 columns. If you change the scrollDirection to
              // horizontal, this produces 2 rows.
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(100, (index) {
                return Center(
                  child: Text(
                    'Item $index',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
