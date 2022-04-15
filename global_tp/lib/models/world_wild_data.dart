/*
class Example {
  Confirmed? confirmed;
  Recovered? recovered;
  Deaths? deaths;
  String? dailySummary;
  DailyTimeSeries? dailyTimeSeries;
  String? image;
  String? source;
  String? countries;
  CountryDetail? countryDetail;
  String? lastUpdate;

  Example(
      {this.confirmed,
      this.recovered,
      this.deaths,
      this.dailySummary,
      this.dailyTimeSeries,
      this.image,
      this.source,
      this.countries,
      this.countryDetail,
      this.lastUpdate});

  Example.fromJson(Map<String, dynamic> json) {
    this.confirmed = json["confirmed"] == null
        ? null
        : Confirmed.fromJson(json["confirmed"]);
    this.recovered = json["recovered"] == null
        ? null
        : Recovered.fromJson(json["recovered"]);
    this.deaths =
        json["deaths"] == null ? null : Deaths.fromJson(json["deaths"]);
    this.dailySummary = json["dailySummary"];
    this.dailyTimeSeries = json["dailyTimeSeries"] == null
        ? null
        : DailyTimeSeries.fromJson(json["dailyTimeSeries"]);
    this.image = json["image"];
    this.source = json["source"];
    this.countries = json["countries"];
    this.countryDetail = json["countryDetail"] == null
        ? null
        : CountryDetail.fromJson(json["countryDetail"]);
    this.lastUpdate = json["lastUpdate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.confirmed != null) data["confirmed"] = this.confirmed?.toJson();
    if (this.recovered != null) data["recovered"] = this.recovered?.toJson();
    if (this.deaths != null) data["deaths"] = this.deaths?.toJson();
    data["dailySummary"] = this.dailySummary;
    if (this.dailyTimeSeries != null)
      data["dailyTimeSeries"] = this.dailyTimeSeries?.toJson();
    data["image"] = this.image;
    data["source"] = this.source;
    data["countries"] = this.countries;
    if (this.countryDetail != null)
      data["countryDetail"] = this.countryDetail?.toJson();
    data["lastUpdate"] = this.lastUpdate;
    return data;
  }
}

class CountryDetail {
  String? pattern;
  String? example;

  CountryDetail({this.pattern, this.example});

  CountryDetail.fromJson(Map<String, dynamic> json) {
    this.pattern = json["pattern"];
    this.example = json["example"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["pattern"] = this.pattern;
    data["example"] = this.example;
    return data;
  }
}

class DailyTimeSeries {
  String? pattern;
  String? example;

  DailyTimeSeries({this.pattern, this.example});

  DailyTimeSeries.fromJson(Map<String, dynamic> json) {
    this.pattern = json["pattern"];
    this.example = json["example"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["pattern"] = this.pattern;
    data["example"] = this.example;
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
*/