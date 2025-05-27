import 'package:market_price_control_app/local_storage/boxes.dart';
import 'package:market_price_control_app/models/submitted_report_model.dart';

class UserService {
  List<SubmittedReport> getReportData() {
    List<SubmittedReport> reportList = [];
    final reports = Boxes.getReportData();
    for (var element in reports.values) {
      final reportBoxes = SubmittedReport(
        date: element.date,
        marketName: element.marketName,
        suggestedPrice: element.suggestedPrice,
        prevPrice: element.prevPrice,
        itemName: element.itemName,
        itemImage: element.itemImage,
        itemDetails: element.itemDetails,
        expDate: element.expDate,
        batchDate: element.batchDate,
        itemId: element.itemId,
        itemWeight: element.itemWeight,
        itemQty: element.itemQty,
        category: element.category,
        subCategory: element.subCategory,
      );

      reportList.add(reportBoxes);
    }
    return reportList;
  }
}
