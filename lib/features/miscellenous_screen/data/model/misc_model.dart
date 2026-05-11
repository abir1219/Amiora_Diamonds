class MiscModel {
  bool? success;
  String? message;
  List<MiscList>? miscList;

  MiscModel({this.success, this.message, this.miscList});

  MiscModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      miscList = <MiscList>[];
      json['data'].forEach((v) {
        miscList!.add(MiscList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (miscList != null) {
      data['data'] = miscList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MiscList {
  int? id;
  String? miscChargeTypeDisplay;
  String? miscChargeDisplay;
  String? miscChargeCode;
  bool? hallMark;
  int? miscChargeTo;
  int? miscChargeType;
  String? rate;
  String? updateDate;
  String? updateTime;
  String? userCode;
  OffsetLedger? offsetLedger;
  OffsetLedger? ledgerAccount;
  int? status;

  MiscList(
      {this.id,
        this.miscChargeTypeDisplay,
        this.miscChargeDisplay,
        this.miscChargeCode,
        this.hallMark,
        this.miscChargeTo,
        this.miscChargeType,
        this.rate,
        this.updateDate,
        this.updateTime,
        this.userCode,
        this.offsetLedger,
        this.ledgerAccount,
        this.status});

  MiscList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    miscChargeTypeDisplay = json['miscChargeType_display'];
    miscChargeDisplay = json['miscCharge_display'];
    miscChargeCode = json['miscChargeCode'];
    hallMark = json['hallMark'];
    miscChargeTo = json['miscChargeTo'];
    miscChargeType = json['miscChargeType'];
    rate = json['rate'];
    updateDate = json['updateDate'];
    updateTime = json['updateTime'];
    userCode = json['userCode'];
    offsetLedger = json['offsetLedger'] != null
        ? OffsetLedger.fromJson(json['offsetLedger'])
        : null;
    ledgerAccount = json['ledgerAccount'] != null
        ? OffsetLedger.fromJson(json['ledgerAccount'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['miscChargeType_display'] = miscChargeTypeDisplay;
    data['miscCharge_display'] = miscChargeDisplay;
    data['miscChargeCode'] = miscChargeCode;
    data['hallMark'] = hallMark;
    data['miscChargeTo'] = miscChargeTo;
    data['miscChargeType'] = miscChargeType;
    data['rate'] = rate;
    data['updateDate'] = updateDate;
    data['updateTime'] = updateTime;
    data['userCode'] = userCode;
    if (offsetLedger != null) {
      data['offsetLedger'] = offsetLedger!.toJson();
    }
    if (ledgerAccount != null) {
      data['ledgerAccount'] = ledgerAccount!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class OffsetLedger {
  int? id;
  String? ledgerAccount;
  String? ledgerName;

  OffsetLedger({this.id, this.ledgerAccount, this.ledgerName});

  OffsetLedger.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ledgerAccount = json['ledgerAccount'];
    ledgerName = json['ledgerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ledgerAccount'] = ledgerAccount;
    data['ledgerName'] = ledgerName;
    return data;
  }
}
