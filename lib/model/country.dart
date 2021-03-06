class Country {
  DataPais data;

  Country({this.data});

  Country.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataPais.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DataPais {
  String country;
  int cases = 0;
  int confirmed;
  int deaths = 0;
  int recovered;
  String updatedAt;

  DataPais(
      {this.country,
      this.cases,
      this.confirmed,
      this.deaths,
      this.recovered,
      this.updatedAt});

  DataPais.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    cases = json['cases'];
    confirmed = json['confirmed'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['cases'] = this.cases;
    data['confirmed'] = this.confirmed;
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


