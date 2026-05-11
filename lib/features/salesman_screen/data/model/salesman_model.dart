class SalesmanModel {
  bool? success;

  // String? message;
  List<EmployeeList>? employeeList;

  SalesmanModel({
    this.success,
    // this.message,
    this.employeeList,
  });

  SalesmanModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    // message = json['message'];
    if (json['Sales Persons'] != null) {
      employeeList = <EmployeeList>[];
      json['Sales Persons'].forEach((v) {
        employeeList!.add(EmployeeList.fromJson(v));
      });
    }
  }
}

class EmployeeList {
  String? emplId;
  String? eName;

  EmployeeList({
    this.emplId,
    this.eName,
  });

  EmployeeList.fromJson(Map<String, dynamic> json) {
    emplId = json['emplid'];
    eName = json['ename'];
  }
}
