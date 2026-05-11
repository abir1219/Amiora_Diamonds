class StoreModel {
  String? message;
  List<WarehouseList>? warehouse;

  StoreModel({this.message, this.warehouse});

  StoreModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['warehouse'] != null) {
      warehouse = <WarehouseList>[];
      json['warehouse'].forEach((v) {
        warehouse!.add(WarehouseList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (warehouse != null) {
      data['warehouse'] = warehouse!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WarehouseList {
  String? username;
  String? whCode;
  String? leCode;
  String? leName;
  String? stateCode;
  String? stateDescription;

  WarehouseList(
      {this.username,
        this.whCode,
        this.leCode,
        this.leName,
        this.stateCode,
        this.stateDescription});

  WarehouseList.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    whCode = json['wh_code'];
    leCode = json['le_code'];
    leName = json['le_name'];
    stateCode = json['state_code'];
    stateDescription = json['state_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['wh_code'] = whCode;
    data['le_code'] = leCode;
    data['le_name'] = leName;
    data['state_code'] = stateCode;
    data['state_description'] = stateDescription;
    return data;
  }
}
