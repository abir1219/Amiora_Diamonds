class EstimationRequest {
  final EstimationEntryBody? estimationEntry;
  final List<EstimateDetailsBody>? estimateDetails;
  List<EstimatePayments>? estimatePayments;

  EstimationRequest({
    this.estimationEntry,
    this.estimateDetails,
    this.estimatePayments,
  });

  Map<String, dynamic> toJson() {
    return {
      'estimationEntry': estimationEntry!.toJson(),
      'estimateDetails': estimateDetails!.map((e) => e.toJson()).toList(),
      'estimatePayments': estimatePayments!.map((e) => e.toJson()).toList(),
    };
  }
}

class EstimationEntryBody {
  final String? estnumber;
  // final String? employee;
  final String? currency;
  final double? exchangerate;
  final int? mobileno;
  final String? warehouse;
  final double? taxper;
  final double? taxamount;
  final String? disper;
  final double? disamount;
  final double? estamount;
  final String? leCode;
  final String? details;
  final double? inuse;
  final String? placeOfSupply;
  final String? userCode;

  EstimationEntryBody({
    this.estnumber,
    // this.employee,
    this.currency,
    this.exchangerate,
    this.mobileno,
    this.warehouse,
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
  });

  Map<String, dynamic> toJson() {
    return {
      'estnumber': estnumber,
      // 'employee': employee,
      'currency': currency,
      'exchangerate': exchangerate,
      'mobileno': mobileno,
      'warehouse': warehouse,
      'taxper': taxper,
      'taxamount': taxamount,
      'disper': disper,
      'disamount': disamount,
      'estamount': estamount,
      'le_code': leCode,
      'details': details,
      'inuse': inuse,
      'place_of_supply': placeOfSupply,
      'user_code': userCode,
    };
  }
}

class EstimateDetailsBody {
  final EstimateProductDetailsBody? estimateProductDetails;
  final List<EstimationSubDetailsBody>? estimationSubDetails;
  final List<EstimationMiscChargeBody>? estimationMiscCharge;
  final List<EstimationTaxDetailsBody>? estimationTaxDetails;

  EstimateDetailsBody({
    this.estimateProductDetails,
    this.estimationSubDetails,
    this.estimationMiscCharge,
    this.estimationTaxDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'estimateProductDetails': estimateProductDetails!.toJson(),
      'estimationSubDetails': estimationSubDetails!
          .map((e) => e.toJson())
          .toList(),
      'estimationMiscCharge': estimationMiscCharge!
          .map((e) => e.toJson())
          .toList(),
      'estimationTaxDetails': estimationTaxDetails!
          .map((e) => e.toJson())
          .toList(),
    };
  }
}

class EstimateProductDetailsBody {
  final String? prodCode;
  final String? purity;
  final String? size;
  final String? cut;
  final String? colour;
  final String? style;
  final String? batchNo;
  final String? warehouse;
  final int? pcs;
  final double? qty;
  final double? nett;
  final double? rate;
  final int? ctype;
  final double? cvalue;
  final double? mkrate;
  final int? mktype;
  final double? mkvalue;
  final double? stonevalue;
  final double? diamondvalue;
  final double? wastageper;
  final double? wastagevalue;
  final String? taxcode;
  final double? taxamount;
  final String? disper;
  final double? disamount;
  final String? lineamount;
  final double? miscamount;
  final String? leCode;
  final String? purpose;
  final int? ingredient;
  final String? employeeCode;
  final String? othervalue;
  final String? pricePoint;
  final double? roundoff;
  final double? taxablevalue;
  final double? roundedtaxablevalue;
  final int? disCalType;
  final String? disamountAftertax;
  final String? disaftertax;

  EstimateProductDetailsBody({
    this.prodCode,
    this.purity,
    this.size,
    this.cut,
    this.colour,
    this.style,
    this.batchNo,
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
    this.diamondvalue,
    this.wastageper,
    this.wastagevalue,
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
    this.othervalue,
    this.pricePoint,
    this.roundoff,
    this.taxablevalue,
    this.roundedtaxablevalue,
    this.disCalType,
    this.disamountAftertax,
    this.disaftertax,
  });

  Map<String, dynamic> toJson() {
    return {
      'prod_code': prodCode,
      'purity': purity,
      'size': size,
      'cut': cut,
      'colour': colour,
      'style': style,
      'batch_no': batchNo,
      'warehouse': warehouse,
      'pcs': pcs,
      'qty': qty,
      'nett': nett,
      'rate': rate,
      'ctype': ctype,
      'cvalue': cvalue,
      'mkrate': mkrate,
      'mktype': mktype,
      'mkvalue': mkvalue,
      'stonevalue': stonevalue,
      'diamondvalue': diamondvalue,
      'wastageper': wastageper,
      'wastagevalue': wastagevalue,
      'taxcode': taxcode,
      'taxamount': taxamount,
      'disper': disper,
      'disamount': disamount,
      'lineamount': lineamount,
      'miscamount': miscamount,
      'le_code': leCode,
      'purpose': purpose,
      'ingredient': ingredient,
      'employee_code': employeeCode,
      'othervalue': othervalue,
      'price_point': pricePoint,
      'roundoff': roundoff,
      'taxablevalue': taxablevalue,
      'roundedtaxablevalue': roundedtaxablevalue,
      'dis_cal_type': disCalType,
      'disamount_aftertax': disamountAftertax,
      'disaftertax': disaftertax,
    };
  }
}

class EstimationSubDetailsBody {
  final int? estlinenumber;
  final int? linenumber;
  final String? prodCode;
  final String? purity;
  final String? size;
  final String? cut;
  final String? colour;
  final String? style;
  final String? batchNo;
  final int? pcs;
  final double? qty;
  final double? nett;
  final int? ctype;
  final double? rate;
  final double? cvalue;
  final String? leCode;
  // final String? pricePoint;

  EstimationSubDetailsBody({
    this.estlinenumber,
    this.linenumber,
    this.prodCode,
    this.purity,
    this.size,
    this.cut,
    this.colour,
    this.style,
    this.batchNo,
    this.pcs,
    this.qty,
    this.nett,
    this.ctype,
    this.rate,
    this.cvalue,
    this.leCode,
    // this.pricePoint,
  });

  Map<String, dynamic> toJson() {
    return {
      'estlinenumber': estlinenumber,
      'linenumber': linenumber,
      'prod_code': prodCode,
      'purity': purity,
      'size': size,
      'cut': cut,
      'colour': colour,
      'style': style,
      'batch_no': batchNo,
      'pcs': pcs,
      'qty': qty,
      'nett': nett,
      'ctype': ctype,
      'rate': rate,
      'cvalue': cvalue,
      'le_code': leCode,
      // 'price_point': pricePoint,
    };
  }
}

class EstimationMiscChargeBody {
  final int? estlinenumber;
  final int? linenumber;
  final String? miscChrgCode;
  final double? amount;
  final String? leCode;

  EstimationMiscChargeBody({
    this.estlinenumber,
    this.linenumber,
    this.miscChrgCode,
    this.amount,
    this.leCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'estlinenumber': estlinenumber,
      'linenumber': linenumber,
      'miscchrgcode': miscChrgCode,
      'amount': amount,
      'le_code': leCode,
    };
  }
}

class EstimationTaxDetailsBody {
  final int? estlinenumber;
  final int? linenumber;
  final String? taxCode;
  final String? stateCode;
  final double? percentage;
  final int? calType;
  final int? taxType;
  final double? amount;
  final String? formNo;
  final String? leCode;

  EstimationTaxDetailsBody({
    this.estlinenumber,
    this.linenumber,
    this.taxCode,
    this.stateCode,
    this.percentage,
    this.calType,
    this.taxType,
    this.amount,
    this.formNo,
    this.leCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'estlinenumber': estlinenumber,
      'linenumber': linenumber,
      'taxcode': taxCode,
      'state_code': stateCode,
      'percentage': percentage,
      'caltype': calType,
      'taxtype': taxType,
      'amount': amount,
      'formno': formNo,
      'le_code': leCode,
    };
  }
}

class EstimatePayments {
  int? modeId;
  String? estimationNumber;
  double? amount;

  EstimatePayments({this.modeId, this.estimationNumber, this.amount});

  EstimatePayments.fromJson(Map<String, dynamic> json) {
    modeId = json['modeId'];
    estimationNumber = json['estimationNumber'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['modeId'] = modeId;
    data['estimationNumber'] = estimationNumber;
    data['amount'] = amount;
    return data;
  }
}
