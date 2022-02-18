

class ResTiming {
  ResTiming({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResTiming.fromJson(Map<String, dynamic> json) => ResTiming(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.morningTiming,
    this.darshanClosed,
    this.eveningTiming,
    this.shayanDarshanClosed,
  });

  List<NingTiming>? morningTiming;
  DarshanClosed? darshanClosed;
  List<NingTiming>? eveningTiming;
  ShayanDarshanClosed? shayanDarshanClosed;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    morningTiming: json["morning_timing"] == null ? null : List<NingTiming>.from(json["morning_timing"].map((x) => NingTiming.fromJson(x))),
    darshanClosed: json["darshan_closed"] == null ? null : DarshanClosed.fromJson(json["darshan_closed"]),
    eveningTiming: json["evening_timing"] == null ? null : List<NingTiming>.from(json["evening_timing"].map((x) => NingTiming.fromJson(x))),
    shayanDarshanClosed: json["shayan_darshan_closed"] == null ? null : ShayanDarshanClosed.fromJson(json["shayan_darshan_closed"]),
  );

  Map<String, dynamic> toJson() => {
    "morning_timing": morningTiming == null ? null : List<dynamic>.from(morningTiming!.map((x) => x.toJson())),
    "darshan_closed": darshanClosed == null ? null : darshanClosed!.toJson(),
    "evening_timing": eveningTiming == null ? null : List<dynamic>.from(eveningTiming!.map((x) => x.toJson())),
    "shayan_darshan_closed": shayanDarshanClosed == null ? null : shayanDarshanClosed!.toJson(),
  };
}

class DarshanClosed {
  DarshanClosed({
    this.darshanCloseTitel,
    this.darshanCloseTime,
  });

  String? darshanCloseTitel;
  String? darshanCloseTime;

  factory DarshanClosed.fromJson(Map<String, dynamic> json) => DarshanClosed(
    darshanCloseTitel: json["darshan_close_titel"] == null ? null : json["darshan_close_titel"],
    darshanCloseTime: json["darshan_close_time"] == null ? null : json["darshan_close_time"],
  );

  Map<String, dynamic> toJson() => {
    "darshan_close_titel": darshanCloseTitel == null ? null : darshanCloseTitel,
    "darshan_close_time": darshanCloseTime == null ? null : darshanCloseTime,
  };
}

class NingTiming {
  NingTiming({
    this.aartiName,
    this.aartiTime,
  });

  String? aartiName;
  String? aartiTime;

  factory NingTiming.fromJson(Map<String, dynamic> json) => NingTiming(
    aartiName: json["aarti_name"] == null ? null : json["aarti_name"],
    aartiTime: json["aarti_time"] == null ? null : json["aarti_time"],
  );

  Map<String, dynamic> toJson() => {
    "aarti_name": aartiName == null ? null : aartiName,
    "aarti_time": aartiTime == null ? null : aartiTime,
  };
}

class ShayanDarshanClosed {
  ShayanDarshanClosed({
    this.shayanDarshanTitle,
    this.shayanDarshanTime,
  });

  String? shayanDarshanTitle;
  String? shayanDarshanTime;

  factory ShayanDarshanClosed.fromJson(Map<String, dynamic> json) => ShayanDarshanClosed(
    shayanDarshanTitle: json["shayan_darshan_title"] == null ? null : json["shayan_darshan_title"],
    shayanDarshanTime: json["shayan_darshan_time"] == null ? null : json["shayan_darshan_time"],
  );

  Map<String, dynamic> toJson() => {
    "shayan_darshan_title": shayanDarshanTitle == null ? null : shayanDarshanTitle,
    "shayan_darshan_time": shayanDarshanTime == null ? null : shayanDarshanTime,
  };
}
