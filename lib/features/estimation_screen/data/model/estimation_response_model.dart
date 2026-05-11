/*
class EstimationResponseModel {
  bool? success;
  String? message;
  String? url;
  Data? data;

  EstimationResponseModel({this.success, this.message, this.data,this.url});

  EstimationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    url = json['url'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['url'] = url;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  EstimationEntry? estimationEntry;
  List<EstimateDetails>? estimateDetails;

  Data({this.estimationEntry, this.estimateDetails});

  Data.fromJson(Map<String, dynamic> json) {
    estimationEntry = json['estimationEntry'] != null
        ? EstimationEntry.fromJson(json['estimationEntry'])
        : null;
    if (json['estimateDetails'] != null) {
      estimateDetails = <EstimateDetails>[];
      json['estimateDetails'].forEach((v) {
        estimateDetails!.add(EstimateDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (estimationEntry != null) {
      data['estimationEntry'] = estimationEntry!.toJson();
    }
    if (estimateDetails != null) {
      data['estimateDetails'] =
          estimateDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EstimationEntry {
  String? estnumber;
  int? transtype;
  String? estdate;
  String? customercode;
  String? currency;
  String? exchangerate;
  String? warehouse;
  String? customeraddressid;
  String? taxper;
  String? taxamount;
  String? disper;
  String? disamount;
  String? estamount;
  String? leCode;
  String? details;
  int? inuse;
  String? placeOfSupply;
  String? userCode;
  String? updateDate;
  String? updateTime;
  // Null? employee;
  // Null? sale;
  String? mobileno;

  EstimationEntry(
      {this.estnumber,
        this.transtype,
        this.estdate,
        this.customercode,
        this.currency,
        this.exchangerate,
        this.warehouse,
        this.customeraddressid,
        this.taxper,
        this.taxamount,
        this.disper,
        this.disamount,
        this.estamount,
        this.leCode,
        this.details,
        this.inuse,
        this.placeOfSupply,
        this.userCode,
        this.updateDate,
        this.updateTime,
        // this.employee,
        // this.sale,
        this.mobileno});

  EstimationEntry.fromJson(Map<String, dynamic> json) {
    estnumber = json['estnumber'];
    transtype = json['transtype'];
    estdate = json['estdate'];
    customercode = json['customercode'];
    currency = json['currency'];
    exchangerate = json['exchangerate'];
    warehouse = json['warehouse'];
    customeraddressid = json['customeraddressid'];
    taxper = json['taxper'];
    taxamount = json['taxamount'];
    disper = json['disper'];
    disamount = json['disamount'];
    estamount = json['estamount'];
    leCode = json['le_code'];
    details = json['details'];
    inuse = json['inuse'];
    placeOfSupply = json['place_of_supply'];
    userCode = json['user_code'];
    updateDate = json['update_date'];
    updateTime = json['update_time'];
    // employee = json['employee'];
    // sale = json['sale'];
    mobileno = json['mobileno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['estnumber'] = estnumber;
    data['transtype'] = transtype;
    data['estdate'] = estdate;
    data['customercode'] = customercode;
    data['currency'] = currency;
    data['exchangerate'] = exchangerate;
    data['warehouse'] = warehouse;
    data['customeraddressid'] = customeraddressid;
    data['taxper'] = taxper;
    data['taxamount'] = taxamount;
    data['disper'] = disper;
    data['disamount'] = disamount;
    data['estamount'] = estamount;
    data['le_code'] = leCode;
    data['details'] = details;
    data['inuse'] = inuse;
    data['place_of_supply'] = placeOfSupply;
    data['user_code'] = userCode;
    data['update_date'] = updateDate;
    data['update_time'] = updateTime;
    // data['employee'] = employee;
    // data['sale'] = sale;
    data['mobileno'] = mobileno;
    return data;
  }
}

class EstimateDetails {
  EstimateProductDetails? estimateProductDetails;
  // List<Null>? estimationMiscCharge;
  List<EstimationSubDetails>? estimationSubDetails;
  List<EstimationTaxDetails>? estimationTaxDetails;

  EstimateDetails(
      {this.estimateProductDetails,
        // this.estimationMiscCharge,
        this.estimationSubDetails,
        this.estimationTaxDetails});

  EstimateDetails.fromJson(Map<String, dynamic> json) {
    estimateProductDetails = json['estimateProductDetails'] != null
        ? EstimateProductDetails.fromJson(json['estimateProductDetails'])
        : null;
    */
/*if (json['estimationMiscCharge'] != null) {
      estimationMiscCharge = <Null>[];
      json['estimationMiscCharge'].forEach((v) {
        estimationMiscCharge!.add(Null.fromJson(v));
      });
    }*//*

    if (json['estimationSubDetails'] != null) {
      estimationSubDetails = <EstimationSubDetails>[];
      json['estimationSubDetails'].forEach((v) {
        estimationSubDetails!.add(EstimationSubDetails.fromJson(v));
      });
    }
    if (json['estimationTaxDetails'] != null) {
      estimationTaxDetails = <EstimationTaxDetails>[];
      json['estimationTaxDetails'].forEach((v) {
        estimationTaxDetails!.add(EstimationTaxDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (estimateProductDetails != null) {
      data['estimateProductDetails'] = estimateProductDetails!.toJson();
    }
    */
/*if (estimationMiscCharge != null) {
      data['estimationMiscCharge'] =
          estimationMiscCharge!.map((v) => v.toJson()).toList();
    }*//*

    if (estimationSubDetails != null) {
      data['estimationSubDetails'] =
          estimationSubDetails!.map((v) => v.toJson()).toList();
    }
    if (estimationTaxDetails != null) {
      data['estimationTaxDetails'] =
          estimationTaxDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EstimateProductDetails {
  // Null? id;
  String? estnumber;
  int? linenumber;
  int? transtype;
  String? prodCode;
  String? purity;
  // Null? size;
  // Null? cut;
  // Null? colour;
  // Null? style;
  // Null? batchNo;
  String? warehouse;
  int? pcs;
  String? qty;
  String? nett;
  String? rate;
  int? ctype;
  String? cvalue;
  String? mkrate;
  String? mktype;
  String? mkvalue;
  String? stonevalue;
  // Null? diamondvalue;
  // Null? wastageper;
  String? wastageqty;
  String? wastagerate;
  // Null? wastagevalue;
  String? taxcode;
  String? taxamount;
  String? disper;
  String? disamount;
  String? lineamount;
  String? miscamount;
  String? leCode;
  String? purpose;
  bool? ingredient;
  String? employeeCode;
  // Null? othervalue;
  // Null? pricePoint;
  // Null? roundoff;
  String? taxablevalue;
  // Null? roundedtaxablevalue;
  // Null? disCalType;
  // String? disamountAftertax;
  // Null? disaftertax;
  String? stoneweight;
  String? diamondweight;
  String? eMPLNAME;
  String? DesignCode;
  String? productName;

  EstimateProductDetails(
      {//this.id,
        this.estnumber,
        this.linenumber,
        this.transtype,
        this.prodCode,
        this.purity,
        // this.size,
        // this.cut,
        // this.colour,
        // this.style,
        // this.batchNo,
        this.warehouse,
        this.pcs,
        this.qty,
        this.nett,
        this.rate,
        this.ctype,
        this.cvalue,
        this.mkrate,
        this.mktype,
        this.mkvalue,
        this.stonevalue,
        // this.diamondvalue,
        // this.wastageper,
        this.wastageqty,
        this.wastagerate,
        // this.wastagevalue,
        this.taxcode,
        this.taxamount,
        this.disper,
        this.disamount,
        this.lineamount,
        this.miscamount,
        this.leCode,
        this.purpose,
        this.ingredient,
        this.employeeCode,
        // this.othervalue,
        // this.pricePoint,
        // this.roundoff,
        this.taxablevalue,
        // this.roundedtaxablevalue,
        // this.disCalType,
        // this.disamountAftertax,
        // this.disaftertax,
        this.stoneweight,
        this.diamondweight,
        this.eMPLNAME,
        this.DesignCode,
        this.productName,
      });

  EstimateProductDetails.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    estnumber = json['estnumber'];
    linenumber = json['linenumber'];
    transtype = json['transtype'];
    prodCode = json['prod_code'];
    purity = json['purity'];
    // size = json['size'];
    // cut = json['cut'];
    // colour = json['colour'];
    // style = json['style'];
    // batchNo = json['batch_no'];
    warehouse = json['warehouse'];
    pcs = json['pcs'];
    qty = json['qty'];
    nett = json['nett'];
    rate = json['rate'];
    ctype = json['ctype'];
    cvalue = json['cvalue'];
    mkrate = json['mkrate'];
    mktype = json['mktype'];
    mkvalue = json['mkvalue'];
    stonevalue = json['stonevalue'];
    // diamondvalue = json['diamondvalue'];
    // wastageper = json['wastageper'];
    wastageqty = json['wastageqty'];
    wastagerate = json['wastagerate'];
    // wastagevalue = json['wastagevalue'];
    taxcode = json['taxcode'];
    taxamount = json['taxamount'];
    disper = json['disper'];
    disamount = json['disamount'];
    lineamount = json['lineamount'];
    miscamount = json['miscamount'];
    leCode = json['le_code'];
    purpose = json['purpose'];
    ingredient = json['ingredient'];
    employeeCode = json['employee_code'];
    // othervalue = json['othervalue'];
    // pricePoint = json['price_point'];
    // roundoff = json['roundoff'];
    taxablevalue = json['taxablevalue'];
    // roundedtaxablevalue = json['roundedtaxablevalue'];
    // disCalType = json['dis_cal_type'];
    // disamountAftertax = json['disamount_aftertax'];
    // disaftertax = json['disaftertax'];
    stoneweight = json['stoneweight'];
    diamondweight = json['diamondweight'];
    eMPLNAME = json['EMPLNAME'];
    DesignCode = json['DesignCode'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['estnumber'] = estnumber;
    data['linenumber'] = linenumber;
    data['transtype'] = transtype;
    data['prod_code'] = prodCode;
    data['purity'] = purity;
    // data['size'] = size;
    // data['cut'] = cut;
    // data['colour'] = colour;
    // data['style'] = style;
    // data['batch_no'] = batchNo;
    data['warehouse'] = warehouse;
    data['pcs'] = pcs;
    data['qty'] = qty;
    data['nett'] = nett;
    data['rate'] = rate;
    data['ctype'] = ctype;
    data['cvalue'] = cvalue;
    data['mkrate'] = mkrate;
    data['mktype'] = mktype;
    data['mkvalue'] = mkvalue;
    data['stonevalue'] = stonevalue;
    // data['diamondvalue'] = diamondvalue;
    // data['wastageper'] = wastageper;
    data['wastageqty'] = wastageqty;
    data['wastagerate'] = wastagerate;
    // data['wastagevalue'] = wastagevalue;
    data['taxcode'] = taxcode;
    data['taxamount'] = taxamount;
    data['disper'] = disper;
    data['disamount'] = disamount;
    data['lineamount'] = lineamount;
    data['miscamount'] = miscamount;
    data['le_code'] = leCode;
    data['purpose'] = purpose;
    data['ingredient'] = ingredient;
    data['employee_code'] = employeeCode;
    // data['othervalue'] = othervalue;
    // data['price_point'] = pricePoint;
    // data['roundoff'] = roundoff;
    data['taxablevalue'] = taxablevalue;
    // data['roundedtaxablevalue'] = roundedtaxablevalue;
    // data['dis_cal_type'] = disCalType;
    // data['disamount_aftertax'] = disamountAftertax;
    // data['disaftertax'] = disaftertax;
    data['stoneweight'] = stoneweight;
    data['diamondweight'] = diamondweight;
    data['EMPLNAME'] = eMPLNAME;
    data['DesignCode'] = DesignCode;
    data['productName'] = productName;
    return data;
  }
}

class EstimationSubDetails {
  // Null? id;
  String? estnumber;
  String? prodName;
  int? estlinenumber;
  int? linenumber;
  int? transtype;
  String? prodCode;
  String? purity;
  // Null? size;
  // Null? cut;
  // Null? colour;
  // Null? style;
  // Null? batchNo;
  int? pcs;
  String? qty;
  String? nett;
  int? ctype;
  String? rate;
  String? cvalue;
  String? leCode;
  // Null? pricePoint;
  int? tradeNJProdType;
  int? tradeProdType;
  String? productIndicator;

  EstimationSubDetails(
      {//this.id,
        this.estnumber,
        this.prodName,
        this.estlinenumber,
        this.linenumber,
        this.transtype,
        this.prodCode,
        this.purity,
        // this.size,
        // this.cut,
        // this.colour,
        // this.style,
        // this.batchNo,
        this.pcs,
        this.qty,
        this.nett,
        this.ctype,
        this.rate,
        this.cvalue,
        this.leCode,
        // this.pricePoint,
        this.tradeNJProdType,
        this.tradeProdType,
        this.productIndicator});

  EstimationSubDetails.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    estnumber = json['estnumber'];
    prodName = json['Prod_Name'];
    estlinenumber = json['estlinenumber'];
    linenumber = json['linenumber'];
    transtype = json['transtype'];
    prodCode = json['prod_code'];
    purity = json['purity'];
    // size = json['size'];
    // cut = json['cut'];
    // colour = json['colour'];
    // style = json['style'];
    // batchNo = json['batch_no'];
    pcs = json['pcs'];
    qty = json['qty'];
    nett = json['nett'];
    ctype = json['ctype'];
    rate = json['rate'];
    cvalue = json['cvalue'];
    leCode = json['le_code'];
    // pricePoint = json['price_point'];
    tradeNJProdType = json['Trade_NJ_Prod_Type'];
    tradeProdType = json['Trade_Prod_type'];
    productIndicator = json['product_indicator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['estnumber'] = estnumber;
    data['Prod_Name'] = prodName;
    data['estlinenumber'] = estlinenumber;
    data['linenumber'] = linenumber;
    data['transtype'] = transtype;
    data['prod_code'] = prodCode;
    data['purity'] = purity;
    // data['size'] = size;
    // data['cut'] = cut;
    // data['colour'] = colour;
    // data['style'] = style;
    // data['batch_no'] = batchNo;
    data['pcs'] = pcs;
    data['qty'] = qty;
    data['nett'] = nett;
    data['ctype'] = ctype;
    data['rate'] = rate;
    data['cvalue'] = cvalue;
    data['le_code'] = leCode;
    // data['price_point'] = pricePoint;
    data['Trade_NJ_Prod_Type'] = tradeNJProdType;
    data['Trade_Prod_type'] = tradeProdType;
    data['product_indicator'] = productIndicator;
    return data;
  }
}

class EstimationTaxDetails {
  // Null? id;
  String? estnumber;
  int? estlinenumber;
  int? linenumber;
  int? transtype;
  String? taxcode;
  // Null? stateCode;
  double? percentage;
  int? caltype;
  int? taxtype;
  String? amount;
  // Null? formno;
  String? leCode;

  EstimationTaxDetails(
      {//this.id,
        this.estnumber,
        this.estlinenumber,
        this.linenumber,
        this.transtype,
        this.taxcode,
        // this.stateCode,
        this.percentage,
        this.caltype,
        this.taxtype,
        this.amount,
        // this.formno,
        this.leCode});

  EstimationTaxDetails.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    estnumber = json['estnumber'];
    estlinenumber = json['estlinenumber'];
    linenumber = json['linenumber'];
    transtype = json['transtype'];
    taxcode = json['taxcode'];
    // stateCode = json['state_code'];
    percentage = json['percentage'];
    caltype = json['caltype'];
    taxtype = json['taxtype'];
    amount = json['amount'];
    // formno = json['formno'];
    leCode = json['le_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['estnumber'] = estnumber;
    data['estlinenumber'] = estlinenumber;
    data['linenumber'] = linenumber;
    data['transtype'] = transtype;
    data['taxcode'] = taxcode;
    // data['state_code'] = stateCode;
    data['percentage'] = percentage;
    data['caltype'] = caltype;
    data['taxtype'] = taxtype;
    data['amount'] = amount;
    // data['formno'] = formno;
    data['le_code'] = leCode;
    return data;
  }
}
*/
class EstimationResponseModel {
  bool? success;
  String? message;
  Data? data;
  String? url;

  EstimationResponseModel({this.success, this.message, this.data, this.url});

  EstimationResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['url'] = url;
    return data;
  }
}

class Data {
  EstimationEntry? estimationEntry;
  List<EstimateDetails>? estimateDetails;
  List<EstimatePaymentsResponse>? estimatePayments;

  Data({this.estimationEntry, this.estimateDetails, this.estimatePayments});

  Data.fromJson(Map<String, dynamic> json) {
    estimationEntry = json['estimationEntry'] != null
        ? EstimationEntry.fromJson(json['estimationEntry'])
        : null;
    if (json['estimateDetails'] != null) {
      estimateDetails = <EstimateDetails>[];
      json['estimateDetails'].forEach((v) {
        estimateDetails!.add(EstimateDetails.fromJson(v));
      });
    }
    if (json['estimatePayments'] != null) {
      estimatePayments = <EstimatePaymentsResponse>[];
      json['estimatePayments'].forEach((v) {
        estimatePayments!.add(EstimatePaymentsResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (estimationEntry != null) {
      data['estimationEntry'] = estimationEntry!.toJson();
    }
    if (estimateDetails != null) {
      data['estimateDetails'] =
          estimateDetails!.map((v) => v.toJson()).toList();
    }
    if (estimatePayments != null) {
      data['estimatePayments'] =
          estimatePayments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EstimationEntry {
  String? estnumber;
  int? transtype;
  String? estdate;
  String? exchangerate;
  String? customeraddressid;
  String? taxper;
  String? taxamount;
  String? disper;
  String? disamount;
  String? estamount;
  // Null? details;
  int? inuse;
  String? placeOfSupply;
  String? userCode;
  String? updateDate;
  String? updateTime;
  // Null? employee;
  String? customercode;
  String? currency;
  String? warehouse;
  String? leCode;

  EstimationEntry(
      {this.estnumber,
        this.transtype,
        this.estdate,
        this.exchangerate,
        this.customeraddressid,
        this.taxper,
        this.taxamount,
        this.disper,
        this.disamount,
        this.estamount,
        // this.details,
        this.inuse,
        this.placeOfSupply,
        this.userCode,
        this.updateDate,
        this.updateTime,
        // this.employee,
        this.customercode,
        this.currency,
        this.warehouse,
        this.leCode});

  EstimationEntry.fromJson(Map<String, dynamic> json) {
    estnumber = json['estnumber'];
    transtype = json['transtype'];
    estdate = json['estdate'];
    exchangerate = json['exchangerate'];
    customeraddressid = json['customeraddressid'];
    taxper = json['taxper'];
    taxamount = json['taxamount'];
    disper = json['disper'];
    disamount = json['disamount'];
    estamount = json['estamount'];
    // details = json['details'];
    inuse = json['inuse'];
    placeOfSupply = json['place_of_supply'];
    userCode = json['user_code'];
    updateDate = json['update_date'];
    updateTime = json['update_time'];
    // employee = json['employee'];
    customercode = json['customercode'];
    currency = json['currency'];
    warehouse = json['warehouse'];
    leCode = json['le_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['estnumber'] = estnumber;
    data['transtype'] = transtype;
    data['estdate'] = estdate;
    data['exchangerate'] = exchangerate;
    data['customeraddressid'] = customeraddressid;
    data['taxper'] = taxper;
    data['taxamount'] = taxamount;
    data['disper'] = disper;
    data['disamount'] = disamount;
    data['estamount'] = estamount;
    // data['details'] = details;
    data['inuse'] = inuse;
    data['place_of_supply'] = placeOfSupply;
    data['user_code'] = userCode;
    data['update_date'] = updateDate;
    data['update_time'] = updateTime;
    // data['employee'] = employee;
    data['customercode'] = customercode;
    data['currency'] = currency;
    data['warehouse'] = warehouse;
    data['le_code'] = leCode;
    return data;
  }
}

class EstimateDetails {
  EstimateProductDetails? estimateProductDetails;
  List<Null>? estimationMiscCharge;
  List<Null>? estimationSubDetails;
  List<EstimationTaxDetails>? estimationTaxDetails;

  EstimateDetails(
      {this.estimateProductDetails,
        this.estimationMiscCharge,
        this.estimationSubDetails,
        this.estimationTaxDetails});

  EstimateDetails.fromJson(Map<String, dynamic> json) {
    estimateProductDetails = json['estimateProductDetails'] != null
        ? EstimateProductDetails.fromJson(json['estimateProductDetails'])
        : null;
    /*if (json['estimationMiscCharge'] != null) {
      estimationMiscCharge = <Null>[];
      json['estimationMiscCharge'].forEach((v) {
        estimationMiscCharge!.add(new Null.fromJson(v));
      });
    }
    if (json['estimationSubDetails'] != null) {
      estimationSubDetails = <Null>[];
      json['estimationSubDetails'].forEach((v) {
        estimationSubDetails!.add(new Null.fromJson(v));
      });
    }*/
    if (json['estimationTaxDetails'] != null) {
      estimationTaxDetails = <EstimationTaxDetails>[];
      json['estimationTaxDetails'].forEach((v) {
        estimationTaxDetails!.add(EstimationTaxDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (estimateProductDetails != null) {
      data['estimateProductDetails'] = estimateProductDetails!.toJson();
    }
    /*if (estimationMiscCharge != null) {
      data['estimationMiscCharge'] =
          estimationMiscCharge!.map((v) => v.toJson()).toList();
    }
    if (estimationSubDetails != null) {
      data['estimationSubDetails'] =
          estimationSubDetails!.map((v) => v.toJson()).toList();
    }*/
    if (estimationTaxDetails != null) {
      data['estimationTaxDetails'] =
          estimationTaxDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EstimateProductDetails {
  //Null? id;
  String? estnumber;
  int? linenumber;
  int? transtype;
  //Null? purity;
  //Null? cut;
  //Null? colour;
  //Null? batchNo;
  int? pcs;
  String? qty;
  String? nett;
  String? rate;
  int? ctype;
  String? cvalue;
  String? mkrate;
  String? mktype;
  String? mkvalue;
  String? stonevalue;
  String? diamondvalue;
  // Null? wastageper;
  String? wastageqty;
  String? wastagerate;
  // Null? wastagevalue;
  String? taxcode;
  String? taxamount;
  String? disper;
  String? disamount;
  String? lineamount;
  String? miscamount;
  String? purpose;
  bool? ingredient;
  // Null? othervalue;
  String? prodCode;
  String? warehouse;
  String? leCode;
  String? employeeCode;
  String? eMPLNAME;
  String? productName;

  EstimateProductDetails(
      {
        //this.id,
        this.estnumber,
        this.linenumber,
        this.transtype,
        // this.purity,
        // this.cut,
        // this.colour,
        // this.batchNo,
        this.pcs,
        this.qty,
        this.nett,
        this.rate,
        this.ctype,
        this.cvalue,
        this.mkrate,
        this.mktype,
        this.mkvalue,
        this.stonevalue,
        this.diamondvalue,
        // this.wastageper,
        this.wastageqty,
        this.wastagerate,
        // this.wastagevalue,
        this.taxcode,
        this.taxamount,
        this.disper,
        this.disamount,
        this.lineamount,
        this.miscamount,
        this.purpose,
        this.ingredient,
        // this.othervalue,
        this.prodCode,
        this.warehouse,
        this.leCode,
        this.employeeCode,
        this.eMPLNAME,
        this.productName});

  EstimateProductDetails.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    estnumber = json['estnumber'];
    linenumber = json['linenumber'];
    transtype = json['transtype'];
    // purity = json['purity'];
    // cut = json['cut'];
    // colour = json['colour'];
    // batchNo = json['batch_no'];
    pcs = json['pcs'];
    qty = json['qty'];
    nett = json['nett'];
    rate = json['rate'];
    ctype = json['ctype'];
    cvalue = json['cvalue'];
    mkrate = json['mkrate'];
    mktype = json['mktype'];
    mkvalue = json['mkvalue'];
    stonevalue = json['stonevalue'];
    diamondvalue = json['diamondvalue'];
    // wastageper = json['wastageper'];
    wastageqty = json['wastageqty'];
    wastagerate = json['wastagerate'];
    // wastagevalue = json['wastagevalue'];
    taxcode = json['taxcode'];
    taxamount = json['taxamount'];
    disper = json['disper'];
    disamount = json['disamount'];
    lineamount = json['lineamount'];
    miscamount = json['miscamount'];
    purpose = json['purpose'];
    ingredient = json['ingredient'];
    // othervalue = json['othervalue'];
    prodCode = json['prod_code'];
    warehouse = json['warehouse'];
    leCode = json['le_code'];
    employeeCode = json['employee_code'];
    eMPLNAME = json['EMPLNAME'];
    productName = json['productName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = this.id;
    data['estnumber'] = estnumber;
    data['linenumber'] = linenumber;
    data['transtype'] = transtype;
    // data['purity'] = this.purity;
    // data['cut'] = this.cut;
    // data['colour'] = this.colour;
    // data['batch_no'] = this.batchNo;
    data['pcs'] = pcs;
    data['qty'] = qty;
    data['nett'] = nett;
    data['rate'] = rate;
    data['ctype'] = ctype;
    data['cvalue'] = cvalue;
    data['mkrate'] = mkrate;
    data['mktype'] = mktype;
    data['mkvalue'] = mkvalue;
    data['stonevalue'] = stonevalue;
    data['diamondvalue'] = diamondvalue;
    // data['wastageper'] = wastageper;
    data['wastageqty'] = wastageqty;
    data['wastagerate'] = wastagerate;
    // data['wastagevalue'] = wastagevalue;
    data['taxcode'] = taxcode;
    data['taxamount'] = taxamount;
    data['disper'] = disper;
    data['disamount'] = disamount;
    data['lineamount'] = lineamount;
    data['miscamount'] = miscamount;
    data['purpose'] = purpose;
    data['ingredient'] = ingredient;
    // data['othervalue'] = othervalue;
    data['prod_code'] = prodCode;
    data['warehouse'] = warehouse;
    data['le_code'] = leCode;
    data['employee_code'] = employeeCode;
    data['EMPLNAME'] = eMPLNAME;
    data['productName'] = productName;
    return data;
  }
}

class EstimationTaxDetails {
  // Null? id;
  String? estnumber;
  int? estlinenumber;
  int? linenumber;
  int? transtype;
  String? taxcode;
  String? stateCode;
  double? percentage;
  int? caltype;
  int? taxtype;
  String? amount;
  // Null? formno;
  String? leCode;

  EstimationTaxDetails(
      {
        // this.id,
        this.estnumber,
        this.estlinenumber,
        this.linenumber,
        this.transtype,
        this.taxcode,
        this.stateCode,
        this.percentage,
        this.caltype,
        this.taxtype,
        this.amount,
        // this.formno,
        this.leCode});

  EstimationTaxDetails.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    estnumber = json['estnumber'];
    estlinenumber = json['estlinenumber'];
    linenumber = json['linenumber'];
    transtype = json['transtype'];
    taxcode = json['taxcode'];
    stateCode = json['state_code'];
    percentage = json['percentage'];
    caltype = json['caltype'];
    taxtype = json['taxtype'];
    amount = json['amount'];
    // formno = json['formno'];
    leCode = json['le_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    // data['id'] = id;
    data['estnumber'] = estnumber;
    data['estlinenumber'] = estlinenumber;
    data['linenumber'] = linenumber;
    data['transtype'] = transtype;
    data['taxcode'] = taxcode;
    data['state_code'] = stateCode;
    data['percentage'] = percentage;
    data['caltype'] = caltype;
    data['taxtype'] = taxtype;
    data['amount'] = amount;
    // data['formno'] = formno;
    data['le_code'] = leCode;
    return data;
  }
}
class EstimatePaymentsResponse {
  int? paymentId;
  String? estimationNumber;
  String? amount;
  Null? createdatw;
  int? modeId;

  EstimatePaymentsResponse(
      {this.paymentId,
        this.estimationNumber,
        this.amount,
        this.createdatw,
        this.modeId});

  EstimatePaymentsResponse.fromJson(Map<String, dynamic> json) {
    paymentId = json['paymentId'];
    estimationNumber = json['estimationNumber'];
    amount = json['amount'];
    createdatw = json['createdatw'];
    modeId = json['modeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paymentId'] = paymentId;
    data['estimationNumber'] = estimationNumber;
    data['amount'] = amount;
    data['createdatw'] = createdatw;
    data['modeId'] = modeId;
    return data;
  }
}
