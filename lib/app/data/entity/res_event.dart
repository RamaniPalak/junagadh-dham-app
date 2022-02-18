class ResEvents {
  ResEvents({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory ResEvents.fromJson(Map<String, dynamic> json) => ResEvents(
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
    this.blogImage,
    this.eventTitle,
    this.eventDescription,
    this.eventDate,
  });

  String? blogImage;
  String? eventTitle;
  String? eventDescription;
  String? eventDate;



  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    blogImage: json["blog_image"] == null ? null : json["blog_image"],
    eventTitle: json["event_title"] == null ? null : json["event_title"],
    eventDescription: json["event_description"] == null ? null : json["event_description"],
    eventDate: json["event_date"] == null ? null : json["event_date"],
  );



  Map<String, dynamic> toJson() => {
    "blog_image": blogImage == null ? null : blogImage,
    "event_title": eventTitle == null ? null : eventTitle,
    "event_description": eventDescription == null ? null : eventDescription,
    "event_date": eventDate == null ? null : eventDate,
  };
}
