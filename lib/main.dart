import 'dart:io';

import 'package:casalink/utils/constants/api_path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'app.dart';
import 'models/category_model.dart';

List<CategoryModel> listCategori = [];
List<CategoryModel> listPostCate = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApiConfig();
  if (Platform.isIOS) {
    WebViewPlatform.instance = WebKitWebViewPlatform();
  }
  // Only call clearSavedSettings() during testing to reset internal values.
  //await Upgrader.clearSavedSettings(); // REMOVE this for release builds
  await FlutterDownloader.initialize();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initializeDateFormatting().then((_) => runApp(const App()));
  });
}
