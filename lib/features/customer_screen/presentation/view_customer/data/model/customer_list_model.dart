class CustomerListModel {
  bool? success;
  String? message;
  List<CustomerList>? customerList;

  CustomerListModel({this.success, this.message, this.customerList});

  CustomerListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      customerList = <CustomerList>[];
      json['data'].forEach((v) {
        customerList!.add(CustomerList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (customerList != null) {
      data['data'] = customerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerList {
  String? customerCode;
  String? customerName;
  String? mobileNumber;
  String? street1;
  String? street2;

  CustomerList(
      {this.customerCode,
        this.customerName,
        this.mobileNumber,
        this.street1,
        this.street2});

  CustomerList.fromJson(Map<String, dynamic> json) {
    customerCode = json['Customer_Code'];
    customerName = json['Customer_Name'];
    mobileNumber = json['MobileNumber'];
    street1 = json['Street1'];
    street2 = json['Street2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Customer_Code'] = customerCode;
    data['Customer_Name'] = customerName;
    data['MobileNumber'] = mobileNumber;
    data['Street1'] = street1;
    data['Street2'] = street2;
    return data;
  }
}
