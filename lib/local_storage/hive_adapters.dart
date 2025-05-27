import 'package:hive_flutter/hive_flutter.dart';
import 'package:market_price_control_app/models/submitted_report_model.dart';
import 'package:market_price_control_app/models/user_login.dart';

class HiveAdapter {
  hiveAdapterbox() async {
    Hive.registerAdapter(SubmittedReportAdapter());
    Hive.registerAdapter(UserLoginAdapter());

    await Hive.openBox<SubmittedReport>('reportList');
    await Hive.openBox<UserLogin>('userLogin');
  }
}
