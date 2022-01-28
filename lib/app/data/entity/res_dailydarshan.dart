class ResDailyDarshan {
  ResDailyDarshan({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory ResDailyDarshan.fromJson(Map<String, dynamic> json) => ResDailyDarshan(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.name,
    this.imageurl,
  });

  String? name;
  String? imageurl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["Name"] == null ? null : json["Name"],
    imageurl: json["Imageurl"] == null ? null : json["Imageurl"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name == null ? null : name,
    "Imageurl": imageurl == null ? null : imageurl,
  };
}
