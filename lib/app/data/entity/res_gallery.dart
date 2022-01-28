

class ResGallery {
  ResGallery({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ResGallery.fromJson(Map<String, dynamic> json) => ResGallery(
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
    this.imageurl,
  });

  List<String>? imageurl;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    imageurl: json["Imageurl"] == null ? null : List<String>.from(json["Imageurl"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "Imageurl": imageurl == null ? null : List<dynamic>.from(imageurl!.map((x) => x)),
  };
}
