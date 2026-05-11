class AddressModel {
  bool? success;
  String? message;
  List<AddressList>? addressList;

  AddressModel({this.success, this.message, this.addressList});

  AddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      addressList = <AddressList>[];
      json['data'].forEach((v) {
        addressList!.add(AddressList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> addressList = <String, dynamic>{};
    addressList['success'] = success;
    addressList['message'] = message;
    if (this.addressList != null) {
      addressList['data'] = this.addressList!.map((v) => v.toJson()).toList();
    }
    return addressList;
  }
}

class AddressList {
  int? addressid;
  String? city;
  String? stateCode;
  String? country;
  String? street1;
  String? street2;
  String? doorNo;
  String? houseNo;
  String? phone1;
  String? mobile1;
  String? phone2;
  String? mobile2;
  String? fax;
  String? email;
  String? updatedate;
  String? updatetime;
  String? usercode;
  String? lecode;
  String? pincode;
  bool? isPrimary;

  AddressList(
      {this.addressid,
        this.city,
        this.stateCode,
        this.country,
        this.street1,
        this.street2,
        this.doorNo,
        this.houseNo,
        this.phone1,
        this.isPrimary,
        this.mobile1,
        this.phone2,
        this.mobile2,
        this.fax,
        this.email,
        this.updatedate,
        this.updatetime,
        this.usercode,
        this.lecode,
        this.pincode});

  AddressList.fromJson(Map<String, dynamic> json) {
    addressid = json['addressid'];
    city = json['city'];
    stateCode = json['state_code'];
    country = json['country'];
    street1 = json['street1'];
    street2 = json['street2'];
    doorNo = json['door_no'];
    houseNo = json['house_no'];
    phone1 = json['phone1'];
    mobile1 = json['mobile1'];
    isPrimary = false;
    phone2 = json['phone2'];
    mobile2 = json['mobile2'];
    fax = json['fax'];
    email = json['email'];
    updatedate = json['updatedate'];
    updatetime = json['updatetime'];
    usercode = json['usercode'];
    lecode = json['lecode'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> addressList = <String, dynamic>{};
    addressList['addressid'] = addressid;
    addressList['city'] = city;
    addressList['state_code'] = stateCode;
    addressList['country'] = country;
    addressList['street1'] = street1;
    addressList['street2'] = street2;
    addressList['door_no'] = doorNo;
    addressList['house_no'] = houseNo;
    addressList['phone1'] = phone1;
    addressList['mobile1'] = mobile1;
    addressList['phone2'] = phone2;
    addressList['mobile2'] = mobile2;
    addressList['fax'] = fax;
    addressList['email'] = email;
    addressList['updatedate'] = updatedate;
    addressList['updatetime'] = updatetime;
    addressList['usercode'] = usercode;
    addressList['lecode'] = lecode;
    addressList['pincode'] = pincode;
    return addressList;
  }
}
