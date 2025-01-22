import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../repo/login_repo.dart';

const oneSignalAppId = "";

Future<void> initOneSignal() async {
  OneSignal.initialize('ae23e806-4f08-409e-a16b-63eba8c6ae3e');
  OneSignal.Notifications.requestPermission(true).then((value) {});
  var onesignalId = await OneSignal.User.getOnesignalId();
  await LoginRepo().pushOnesignalId(onesignalId ?? '');
}

void registerOneSignalEventListener({
  required Function(OSNotificationClickEvent) onOpened,
  required Function(OSNotificationClickResult) onReceivedInForeground,
}) {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("ae23e806-4f08-409e-a16b-63eba8c6ae3e");
  OneSignal.Notifications.requestPermission(true);
}

const tagName = "userId";

void sendUserTag(int schoolId) {
  OneSignal.User.addTagWithKey("schoolId", schoolId);
}

void deleteUserTag() {
  OneSignal.User.removeTag("userId");
}
