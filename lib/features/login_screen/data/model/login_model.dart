/*
class LoginModel {
  bool? success;
  bool? manualEntry;
  String? message;
  String? error;
  String? username;
  List<String>? leCode;
  List<String>? leNames;

  LoginModel(
      {this.success,
      this.manualEntry,
      this.message,
      this.username,
      this.leCode,
      this.error,
      this.leNames});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      manualEntry: json['manual_entry'] ?? '',
      error: json['error'],
      username: json['username'] ?? '',
      leCode: List<String>.from(json['Le_codes'] ?? []),
      leNames: List<String>.from(json['le_names'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'manual_entry': manualEntry,
      'message': message,
      'username': username,
      'error': error,
      'leNames': leNames,
      'Le_code': leCode,
    };
  }

*/
/*LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'] as String?;
    refreshToken = json['refresh_token'] as String?;
    username = json['username'] as String?;
    leCode = json['le_code'] as String?;
    dbNames = json['db_names'].cast<String>();
    schemaNames = json['schema_names'].cast<String>();
    error = json['error'].cast<String>();
    messages = json['messages'] as String?;
  }*//*

}
*/

class LoginModel {
  String? message;
  List<Warehouse>? warehouse;

  LoginModel({this.message, this.warehouse});

  LoginModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['warehouse'] != null) {
      warehouse = <Warehouse>[];
      json['warehouse'].forEach((v) {
        warehouse!.add(new Warehouse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.warehouse != null) {
      data['warehouse'] = this.warehouse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Warehouse {
  String? username;
  String? whCode;
  String? leCode;
  String? leName;
  String? stateCode;
  String? stateDescription;

  Warehouse(
      {this.username,
        this.whCode,
        this.leCode,
        this.leName,
        this.stateCode,
        this.stateDescription});

  Warehouse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    whCode = json['wh_code'];
    leCode = json['le_code'];
    leName = json['le_name'];
    stateCode = json['state_code'];
    stateDescription = json['state_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['wh_code'] = this.whCode;
    data['le_code'] = this.leCode;
    data['le_name'] = this.leName;
    data['state_code'] = this.stateCode;
    data['state_description'] = this.stateDescription;
    return data;
  }
}
