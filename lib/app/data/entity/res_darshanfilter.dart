class ResDarshanFilter {
  ResDarshanFilter({
    this.response,
  });

  Response? response;

  factory ResDarshanFilter.fromJson(Map<String, dynamic> json) => ResDarshanFilter(
    response: json["response"] == null ? null : Response.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response == null ? null : response!.toJson(),
  };
}

class Response {
  Response({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
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
    this.dailyDarshanDate,
    this.dailyDarshanTithi,
    this.shreeHarikarishnaMaharajAndShreeRadharamanDev,
    this.shreeRanchhodraijiAndShreeTrikamrayji,
    this.shreeSiddheshwarMahadevAndShreeParvatiji,
    this.shreeGaneshjiMaharaj,
    this.shreeGhanshyamjiMaharaj,
    this.shreeHanumanjiMaharaj,
  });

  String? dailyDarshanDate;
  String? dailyDarshanTithi;
  ShreeHarikarishnaMaharajAndShreeRadharamanDev? shreeHarikarishnaMaharajAndShreeRadharamanDev;
  ShreeRanchhodraijiAndShreeTrikamrayji? shreeRanchhodraijiAndShreeTrikamrayji;
  ShreeSiddheshwarMahadevAndShreeParvatiji? shreeSiddheshwarMahadevAndShreeParvatiji;
  ShreeGaneshjiMaharaj? shreeGaneshjiMaharaj;
  ShreeGhanshyamjiMaharaj? shreeGhanshyamjiMaharaj;
  ShreeHanumanjiMaharaj? shreeHanumanjiMaharaj;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    dailyDarshanDate: json["daily_darshan_date"] == null ? null : json["daily_darshan_date"],
    dailyDarshanTithi: json["daily_darshan_tithi"] == null ? null : json["daily_darshan_tithi"],
    shreeHarikarishnaMaharajAndShreeRadharamanDev: json["shree_harikarishna_maharaj_and_shree_radharaman_dev"] == null ? null : ShreeHarikarishnaMaharajAndShreeRadharamanDev.fromJson(json["shree_harikarishna_maharaj_and_shree_radharaman_dev"]),
    shreeRanchhodraijiAndShreeTrikamrayji: json["shree_ranchhodraiji_and_shree_trikamrayji"] == null ? null : ShreeRanchhodraijiAndShreeTrikamrayji.fromJson(json["shree_ranchhodraiji_and_shree_trikamrayji"]),
    shreeSiddheshwarMahadevAndShreeParvatiji: json["shree_siddheshwar_mahadev_and_shree_parvatiji"] == null ? null : ShreeSiddheshwarMahadevAndShreeParvatiji.fromJson(json["shree_siddheshwar_mahadev_and_shree_parvatiji"]),
    shreeGaneshjiMaharaj: json["shree_ganeshji_maharaj"] == null ? null : ShreeGaneshjiMaharaj.fromJson(json["shree_ganeshji_maharaj"]),
    shreeGhanshyamjiMaharaj: json["shree_ghanshyamji_maharaj"] == null ? null : ShreeGhanshyamjiMaharaj.fromJson(json["shree_ghanshyamji_maharaj"]),
    shreeHanumanjiMaharaj: json["shree_hanumanji_maharaj"] == null ? null : ShreeHanumanjiMaharaj.fromJson(json["shree_hanumanji_maharaj"]),
  );

  Map<String, dynamic> toJson() => {
    "daily_darshan_date": dailyDarshanDate == null ? null : dailyDarshanDate,
    "daily_darshan_tithi": dailyDarshanTithi == null ? null : dailyDarshanTithi,
    "shree_harikarishna_maharaj_and_shree_radharaman_dev": shreeHarikarishnaMaharajAndShreeRadharamanDev == null ? null : shreeHarikarishnaMaharajAndShreeRadharamanDev!.toJson(),
    "shree_ranchhodraiji_and_shree_trikamrayji": shreeRanchhodraijiAndShreeTrikamrayji == null ? null : shreeRanchhodraijiAndShreeTrikamrayji!.toJson(),
    "shree_siddheshwar_mahadev_and_shree_parvatiji": shreeSiddheshwarMahadevAndShreeParvatiji == null ? null : shreeSiddheshwarMahadevAndShreeParvatiji!.toJson(),
    "shree_ganeshji_maharaj": shreeGaneshjiMaharaj == null ? null : shreeGaneshjiMaharaj!.toJson(),
    "shree_ghanshyamji_maharaj": shreeGhanshyamjiMaharaj == null ? null : shreeGhanshyamjiMaharaj!.toJson(),
    "shree_hanumanji_maharaj": shreeHanumanjiMaharaj == null ? null : shreeHanumanjiMaharaj!.toJson(),
  };
}

class ShreeGaneshjiMaharaj {
  ShreeGaneshjiMaharaj({
    this.shreeGaneshjiMaharajImage,
    this.shreeGaneshjiMaharajHeading,
    this.shreeGaneshjiMaharaj,
  });

  String? shreeGaneshjiMaharajImage;
  String? shreeGaneshjiMaharajHeading;
  String? shreeGaneshjiMaharaj;

  factory ShreeGaneshjiMaharaj.fromJson(Map<String, dynamic> json) => ShreeGaneshjiMaharaj(
    shreeGaneshjiMaharajImage: json["shree_ganeshji_maharaj_image"] == null ? null : json["shree_ganeshji_maharaj_image"],
    shreeGaneshjiMaharajHeading: json["shree_ganeshji_maharaj_heading"] == null ? null : json["shree_ganeshji_maharaj_heading"],
    shreeGaneshjiMaharaj: json["shree_ganeshji_maharaj"] == null ? null : json["shree_ganeshji_maharaj"],
  );

  Map<String, dynamic> toJson() => {
    "shree_ganeshji_maharaj_image": shreeGaneshjiMaharajImage == null ? null : shreeGaneshjiMaharajImage,
    "shree_ganeshji_maharaj_heading": shreeGaneshjiMaharajHeading == null ? null : shreeGaneshjiMaharajHeading,
    "shree_ganeshji_maharaj": shreeGaneshjiMaharaj == null ? null : shreeGaneshjiMaharaj,
  };
}

class ShreeGhanshyamjiMaharaj {
  ShreeGhanshyamjiMaharaj({
    this.shreeGhanshyamjiMaharajImage,
    this.shreeGhanshyamjiMaharajHeading,
    this.shreeGhanshyamjiMaharaj,
  });

  String? shreeGhanshyamjiMaharajImage;
  String? shreeGhanshyamjiMaharajHeading;
  String? shreeGhanshyamjiMaharaj;

  factory ShreeGhanshyamjiMaharaj.fromJson(Map<String, dynamic> json) => ShreeGhanshyamjiMaharaj(
    shreeGhanshyamjiMaharajImage: json["shree_ghanshyamji_maharaj_image"] == null ? null : json["shree_ghanshyamji_maharaj_image"],
    shreeGhanshyamjiMaharajHeading: json["shree_ghanshyamji_maharaj_heading"] == null ? null : json["shree_ghanshyamji_maharaj_heading"],
    shreeGhanshyamjiMaharaj: json["shree_ghanshyamji_maharaj"] == null ? null : json["shree_ghanshyamji_maharaj"],
  );

  Map<String, dynamic> toJson() => {
    "shree_ghanshyamji_maharaj_image": shreeGhanshyamjiMaharajImage == null ? null : shreeGhanshyamjiMaharajImage,
    "shree_ghanshyamji_maharaj_heading": shreeGhanshyamjiMaharajHeading == null ? null : shreeGhanshyamjiMaharajHeading,
    "shree_ghanshyamji_maharaj": shreeGhanshyamjiMaharaj == null ? null : shreeGhanshyamjiMaharaj,
  };
}

class ShreeHanumanjiMaharaj {
  ShreeHanumanjiMaharaj({
    this.shreeHanumanjiMaharajImage,
    this.shreeHanumanjiMaharajHeading,
    this.shreeHanumanjiMaharaj,
  });

  String? shreeHanumanjiMaharajImage;
  String? shreeHanumanjiMaharajHeading;
  String? shreeHanumanjiMaharaj;

  factory ShreeHanumanjiMaharaj.fromJson(Map<String, dynamic> json) => ShreeHanumanjiMaharaj(
    shreeHanumanjiMaharajImage: json["shree_hanumanji_maharaj_image"] == null ? null : json["shree_hanumanji_maharaj_image"],
    shreeHanumanjiMaharajHeading: json["shree_hanumanji_maharaj_heading"] == null ? null : json["shree_hanumanji_maharaj_heading"],
    shreeHanumanjiMaharaj: json["shree_hanumanji_maharaj"] == null ? null : json["shree_hanumanji_maharaj"],
  );

  Map<String, dynamic> toJson() => {
    "shree_hanumanji_maharaj_image": shreeHanumanjiMaharajImage == null ? null : shreeHanumanjiMaharajImage,
    "shree_hanumanji_maharaj_heading": shreeHanumanjiMaharajHeading == null ? null : shreeHanumanjiMaharajHeading,
    "shree_hanumanji_maharaj": shreeHanumanjiMaharaj == null ? null : shreeHanumanjiMaharaj,
  };
}

class ShreeHarikarishnaMaharajAndShreeRadharamanDev {
  ShreeHarikarishnaMaharajAndShreeRadharamanDev({
    this.shreeHarikarishnaMaharajAndShreeRadharamanDevImage,
    this.shreeHarikarishnaMaharajHeading,
    this.shreeRadharamanDevHeading,
  });

  String? shreeHarikarishnaMaharajAndShreeRadharamanDevImage;
  String? shreeHarikarishnaMaharajHeading;
  String? shreeRadharamanDevHeading;

  factory ShreeHarikarishnaMaharajAndShreeRadharamanDev.fromJson(Map<String, dynamic> json) => ShreeHarikarishnaMaharajAndShreeRadharamanDev(
    shreeHarikarishnaMaharajAndShreeRadharamanDevImage: json["shree_harikarishna_maharaj_and_shree_radharaman_dev_image"] == null ? null : json["shree_harikarishna_maharaj_and_shree_radharaman_dev_image"],
    shreeHarikarishnaMaharajHeading: json["shree_harikarishna_maharaj_heading"] == null ? null : json["shree_harikarishna_maharaj_heading"],
    shreeRadharamanDevHeading: json["shree_radharaman_dev_heading"] == null ? null : json["shree_radharaman_dev_heading"],
  );

  Map<String, dynamic> toJson() => {
    "shree_harikarishna_maharaj_and_shree_radharaman_dev_image": shreeHarikarishnaMaharajAndShreeRadharamanDevImage == null ? null : shreeHarikarishnaMaharajAndShreeRadharamanDevImage,
    "shree_harikarishna_maharaj_heading": shreeHarikarishnaMaharajHeading == null ? null : shreeHarikarishnaMaharajHeading,
    "shree_radharaman_dev_heading": shreeRadharamanDevHeading == null ? null : shreeRadharamanDevHeading,
  };
}

class ShreeRanchhodraijiAndShreeTrikamrayji {
  ShreeRanchhodraijiAndShreeTrikamrayji({
    this.shreeRanchhodraijiAndShreeTrikamrayjiImage,
    this.shreeRanchhodraijiHeading,
    this.shreeTrikamrayjiHeading,
  });

  String? shreeRanchhodraijiAndShreeTrikamrayjiImage;
  String? shreeRanchhodraijiHeading;
  String? shreeTrikamrayjiHeading;

  factory ShreeRanchhodraijiAndShreeTrikamrayji.fromJson(Map<String, dynamic> json) => ShreeRanchhodraijiAndShreeTrikamrayji(
    shreeRanchhodraijiAndShreeTrikamrayjiImage: json["shree_ranchhodraiji_and_shree_trikamrayji_image"] == null ? null : json["shree_ranchhodraiji_and_shree_trikamrayji_image"],
    shreeRanchhodraijiHeading: json["shree_ranchhodraiji_heading"] == null ? null : json["shree_ranchhodraiji_heading"],
    shreeTrikamrayjiHeading: json["shree_trikamrayji_heading"] == null ? null : json["shree_trikamrayji_heading"],
  );

  Map<String, dynamic> toJson() => {
    "shree_ranchhodraiji_and_shree_trikamrayji_image": shreeRanchhodraijiAndShreeTrikamrayjiImage == null ? null : shreeRanchhodraijiAndShreeTrikamrayjiImage,
    "shree_ranchhodraiji_heading": shreeRanchhodraijiHeading == null ? null : shreeRanchhodraijiHeading,
    "shree_trikamrayji_heading": shreeTrikamrayjiHeading == null ? null : shreeTrikamrayjiHeading,
  };
}

class ShreeSiddheshwarMahadevAndShreeParvatiji {
  ShreeSiddheshwarMahadevAndShreeParvatiji({
    this.shreeSiddheshwarMahadevAndShreeParvatijiImage,
    this.shreeSiddheshwarMahadevHeading,
    this.shreeParvatijiHeading,
  });

  String? shreeSiddheshwarMahadevAndShreeParvatijiImage;
  String? shreeSiddheshwarMahadevHeading;
  String? shreeParvatijiHeading;

  factory ShreeSiddheshwarMahadevAndShreeParvatiji.fromJson(Map<String, dynamic> json) => ShreeSiddheshwarMahadevAndShreeParvatiji(
    shreeSiddheshwarMahadevAndShreeParvatijiImage: json["shree_siddheshwar_mahadev_and_shree_parvatiji_image"] == null ? null : json["shree_siddheshwar_mahadev_and_shree_parvatiji_image"],
    shreeSiddheshwarMahadevHeading: json["shree_siddheshwar_mahadev_heading"] == null ? null : json["shree_siddheshwar_mahadev_heading"],
    shreeParvatijiHeading: json["shree_parvatiji_heading"] == null ? null : json["shree_parvatiji_heading"],
  );

  Map<String, dynamic> toJson() => {
    "shree_siddheshwar_mahadev_and_shree_parvatiji_image": shreeSiddheshwarMahadevAndShreeParvatijiImage == null ? null : shreeSiddheshwarMahadevAndShreeParvatijiImage,
    "shree_siddheshwar_mahadev_heading": shreeSiddheshwarMahadevHeading == null ? null : shreeSiddheshwarMahadevHeading,
    "shree_parvatiji_heading": shreeParvatijiHeading == null ? null : shreeParvatijiHeading,
  };
}
