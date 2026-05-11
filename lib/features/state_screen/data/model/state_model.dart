class StateModel {
  bool? success;
  String? message;
  List<StateList>? stateList;

  StateModel({this.success, this.message, this.stateList});

  StateModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      stateList = <StateList>[];
      json['data'].forEach((v) {
        stateList!.add(StateList.fromJson(v));
      });
    }
  }
}

class StateList {
  int? id;
  String? stateCode;
  String? description;
  String? updateDate;
  String? country;
  String? updateTime;
  String? userCode;
  int? status;

  StateList(
      {this.id,
      this.stateCode,
      this.description,
      this.updateDate,
      this.updateTime,
      this.userCode,
      this.country,
      this.status});

  StateList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stateCode = json['state_code'];
    description = json['description'];
    updateDate = json['updateDate'];
    updateTime = json['updateTime'];
    userCode = json['userCode'];
    status = json['status'];
    country = json['country'];
  }
}
