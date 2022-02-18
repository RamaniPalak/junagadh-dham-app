
import 'package:intl/intl.dart';

List<ResList> resListFromJson(List<Map<String,dynamic>> res) {

  return List<ResList>.from(res.map((x) {
    return ResList.fromJson(x);
  }));
}


class ResList {
  ResList({
    this.response,
  });

  ResDate? response;

  factory ResList.fromJson(Map<String, dynamic> json) {
    return ResList(
      response: ResDate?.fromJson(json),
    );
  }

}

class ResDate {
  ResDate({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  ResDateData? data;

  factory ResDate.fromJson(Map<String, dynamic> json) => ResDate(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : ResDateData.fromJson(json["data"]),
  );

}

class ResDateData {
  ResDateData({
    this.date,
    this.tithi,
    this.list,
  });

  String? date;
  String? tithi;
  List<ListElement>? list;

  String get dateOfIssueFormat {

    try {
      final dateFormat = DateTime.parse(date!);

      String dateTime =  DateFormat("dd-MM-yyyy").format(dateFormat);

      return dateTime;

    } on Exception catch (e) {
      print(e);
    }

    return '';
  }

  factory ResDateData.fromJson(Map<String, dynamic> json) => ResDateData(
    date: json["Date"] == null ? null : (json["Date"]),
    tithi: json["Tithi"] == null ? null : (json["Tithi"]),
    list: json["list"] == null ? null : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

}

class ListElement {
  ListElement({
    this.name,
    this.name1,
    this.imageurl,
    this.thumburl,
  });

  String? name;
  String? name1;
  String? imageurl;
  String? thumburl;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    name: json["Name"] == null ? null : json["Name"],
    name1: json["Name_1"] == null ? null : json["Name_1"],
    imageurl: json["Imageurl"] == null ? null : json["Imageurl"],
    thumburl: json["thumburl"] == null ? null : json["thumburl"],
  );
}
