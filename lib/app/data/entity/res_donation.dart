class ResDonation {
  ResDonation({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<DonationData>? data;

  factory ResDonation.fromJson(Map<String, dynamic> json) => ResDonation(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<DonationData>.from(json["data"].map((x) => DonationData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DonationData {
  DonationData({
    this.id,
    this.donationPrice,
    this.url,
    this.url1,
    this.cat,
    this.name,
  });

  int? id;
  String? donationPrice;
  String? url;
  String? url1;
  String? cat;
  String? name;

  factory DonationData.fromJson(Map<String, dynamic> json) => DonationData(
    id: json["id"],
    donationPrice: json["donation_price"] == null ? null : json["donation_price"],
    url: json["url"] == null ? null : json["url"],
    url1: json["url1"] == null ? null : json["url1"],
    cat: json["cat"] == null ? null : json["cat"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "donation_price": donationPrice == null ? null : donationPrice,
    "url": url == null ? null : url,
    "url1": url1 == null ? null : url1,
    "cat": cat == null ? null : cat,
    "name": name == null ? null : name,
  };
}
