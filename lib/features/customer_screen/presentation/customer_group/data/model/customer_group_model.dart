class CustomerGroupModel {
  bool? success;
  String? message;
  List<CustomerGroupList>? customerGroupList;

  CustomerGroupModel({this.success, this.message, this.customerGroupList});

  CustomerGroupModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      customerGroupList = <CustomerGroupList>[];
      json['data'].forEach((v) {
        customerGroupList!.add(CustomerGroupList.fromJson(v));
      });
    }
  }
}

class CustomerGroupList {
  // int? id;
  String? groupCode;
  String? groupDesc;
  // String? updateDate;
  // String? updateTime;
  // String? userCode;
  String? ledgerAccount;

  CustomerGroupList(
      {
        //this.id,
        this.groupCode,
        this.groupDesc,
        // this.updateDate,
        // this.updateTime,
        // this.userCode,
        this.ledgerAccount});

  CustomerGroupList.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    groupCode = json['groupcode'];
    groupDesc = json['groupdesc'];
    // updateDate = json['updateDate'];
    // updateTime = json['updateTime'];
    // userCode = json['userCode'];
    ledgerAccount = json['ledgeraccount'];
  }
}

