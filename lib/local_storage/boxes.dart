import 'package:hive_flutter/hive_flutter.dart';
import 'package:market_price_control_app/models/submitted_report_model.dart';
import 'package:market_price_control_app/models/user_login.dart';

class Boxes {
  static Box<SubmittedReport> getReportData() => Hive.box('reportList');
  static Box<UserLogin> getLoginData() => Hive.box('userLogin');
}
