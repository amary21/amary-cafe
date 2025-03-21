import 'package:amary_cafe/service/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> notificationModule() {
  return [
    Provider(
      create: (context) => NotificationService()
        ..init()
        ..configureLocalTimeZone(),
    )
  ];
}
