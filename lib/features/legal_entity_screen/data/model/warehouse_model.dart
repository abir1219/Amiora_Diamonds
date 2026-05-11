class WarehouseModel {
  final bool isSuccessful;
  final List<WarehouseData> warehouseList;

  WarehouseModel({
    required this.isSuccessful,
    required this.warehouseList,
  });

  factory WarehouseModel.fromJson(Map<String, dynamic> json) {
    return WarehouseModel(
      isSuccessful: json['success'] ?? false,
      warehouseList: (json['warehouses'] as List<dynamic>)
          .map((item) => WarehouseData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': isSuccessful,
      'warehouses': warehouseList.map((item) => item.toJson()).toList(),
    };
  }
}

class WarehouseData {
  final String name;
  final String code;
  final String stateCode;
  final String stateDesc;

  WarehouseData({
    required this.name,
    required this.code,
    required this.stateCode,
    required this.stateDesc,
  });

  factory WarehouseData.fromJson(Map<String, dynamic> json) {
    return WarehouseData(
      name: json['username'] ?? '',
      code: json['wh_code'] ?? '',
      stateCode: json['state_code'] ?? '',
      stateDesc: json['state_description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': name,
      'wh_code': code,
      'state_code': stateCode,
      'state_description': stateDesc,
    };
  }
}