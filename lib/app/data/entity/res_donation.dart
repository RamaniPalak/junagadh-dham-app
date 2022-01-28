

class ResDonation {
  ResDonation({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory ResDonation.fromJson(Map<String, dynamic> json) => ResDonation(
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
    this.id,
    this.donationPrice,
    this.url,
    this.cat,
    this.name,
  });

  int? id;
  String? donationPrice;
  String? url;
  String? cat;
  String? name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    donationPrice: json["donation_price"] == null ? null : json["donation_price"],
    url: json["url"] == null ? null : json["url"],
    cat: json["cat"] == null ? null : json["cat"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "donation_price": donationPrice == null ? null : donationPrice,
    "url": url == null ? null : url,
    "cat": cat == null ? null : cat,
    "name": name == null ? null : name,
  };
}
