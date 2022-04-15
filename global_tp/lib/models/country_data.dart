class Example {
  Confirmed? confirmed;
  Recovered? recovered;
  Deaths? deaths;
  String? lastUpdate;

  Example({this.confirmed, this.recovered, this.deaths, this.lastUpdate});

  Example.fromJson(Map<String, dynamic> json) {
    this.confirmed = json["confirmed"] == null
        ? null
        : Confirmed.fromJson(json["confirmed"]);
    this.recovered = json["recovered"] == null
        ? null
        : Recovered.fromJson(json["recovered"]);
    this.deaths =
        json["deaths"] == null ? null : Deaths.fromJson(json["deaths"]);
    this.lastUpdate = json["lastUpdate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.confirmed != null) data["confirmed"] = this.confirmed?.toJson();
    if (this.recovered != null) data["recovered"] = this.recovered?.toJson();
    if (this.deaths != null) data["deaths"] = this.deaths?.toJson();
    data["lastUpdate"] = this.lastUpdate;
    return data;
  }
}

class Deaths {
  int? value;
  String? detail;

  Deaths({this.value, this.detail});

  Deaths.fromJson(Map<String, dynamic> json) {
    this.value = json["value"];
    this.detail = json["detail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["value"] = this.value;
    data["detail"] = this.detail;
    return data;
  }
}

class Recovered {
  int? value;
  String? detail;

  Recovered({this.value, this.detail});

  Recovered.fromJson(Map<String, dynamic> json) {
    this.value = json["value"];
    this.detail = json["detail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["value"] = this.value;
    data["detail"] = this.detail;
    return data;
  }
}

class Confirmed {
  int? value;
  String? detail;

  Confirmed({this.value, this.detail});

  Confirmed.fromJson(Map<String, dynamic> json) {
    this.value = json["value"];
    this.detail = json["detail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["value"] = this.value;
    data["detail"] = this.detail;
    return data;
  }
}
