class CountryModel {
  bool? success;
  String? message;
  List<CountryList>? countryList;

  CountryModel({this.success, this.message, this.countryList});

  CountryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      countryList = <CountryList>[];
      json['data'].forEach((v) {
        countryList!.add(CountryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (countryList != null) {
      data['data'] = countryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CountryList {
  String? countryName;

  CountryList({this.countryName});

  CountryList.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_name'] = countryName;
    return data;
  }
}
