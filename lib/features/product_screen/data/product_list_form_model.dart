class ProductListFormModel {
  SkuDetails? skuDetails;
  List<SkuSubdetails>? skuSubdetails;
  List<SkuMisc>? skuMisc;
  List<SkuTax>? skuTax;
  SkuDiscount? skuDiscount;

  ProductListFormModel(
      {this.skuDetails, this.skuSubdetails, this.skuMisc, this.skuTax,this.skuDiscount});

  ProductListFormModel copyWith({
    SkuDetails? skuDetails,
    List<SkuSubdetails>? skuSubdetails,
    List<SkuMisc>? skuMisc,
    List<SkuTax>? skuTax,
    SkuDiscount? skuDiscount,
  }) {
    return ProductListFormModel(
      skuDetails: skuDetails ?? this.skuDetails,
      skuSubdetails: skuSubdetails ?? this.skuSubdetails,
      skuMisc: skuMisc ?? this.skuMisc,
      skuTax: skuTax ?? this.skuTax,
      skuDiscount: skuDiscount ?? this.skuDiscount,
    );
  }

  ProductListFormModel.fromJson(Map<String, dynamic> json) {
    skuDetails = json['sku_details'] != null
        ? SkuDetails.fromJson(json['sku_details'])
        : null;
    //skuDetails = SkuDetails.fromJson(json['sku_details'] ?? {});
    skuDiscount = json['sku_discount'] != null
        ? SkuDiscount.fromJson(json['sku_discount'])
        : null;

    /*skuDiscount = (json['sku_discount'] as List<dynamic>?)
        ?.map((e) => SkuDiscount.fromJson(e))
        .toList() ??
        [];*/

    /*skuSubdetails = (json['sku_subdetails'] as List<dynamic>?)
        ?.map((e) => SkuSubdetails.fromJson(e))
        .toList() ??
        [];*/

    if (json['sku_subdetails'] != null) {
      skuSubdetails = <SkuSubdetails>[];
      json['sku_subdetails'].forEach((v) {
        skuSubdetails!.add(SkuSubdetails.fromJson(v));
      });
    }
    if (json['sku_misc'] != null) {
      skuMisc = <SkuMisc>[];
      json['sku_misc'].forEach((v) {
        skuMisc!.add(SkuMisc.fromJson(v));
      });
    }
    /*skuMisc = (json['sku_misc'] as List<dynamic>?)
        ?.map((e) => SkuMisc.fromJson(e))
        .toList() ??
        [];*/
    if (json['sku_tax'] != null) {
      skuTax = <SkuTax>[];
      json['sku_tax'].forEach((v) {
        skuTax!.add(SkuTax.fromJson(v));
      });
    }
    /*skuTax = (json['sku_tax'] as List<dynamic>?)
        ?.map((e) => SkuTax.fromJson(e))
        .toList() ??
        [];*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (skuDetails != null) {
      data['sku_details'] = skuDetails!.toJson();
    }
    if (skuDiscount != null) {
      data['sku_discount'] = skuDiscount!.toJson();
    }
    if (skuSubdetails != null) {
      data['sku_subdetails'] = skuSubdetails!.map((v) => v.toJson()).toList();
    }
    if (skuMisc != null) {
      data['sku_misc'] = skuMisc!.map((v) => v.toJson()).toList();
    }
    if (skuTax != null) {
      data['sku_tax'] = skuTax!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class SkuMisc {
  final String? SKUNumber;
  final int? LineNumber;
  final String? MiscCode;
  final double? Amount;

  SkuMisc({this.SKUNumber, this.MiscCode, this.Amount, this.LineNumber});

  // fromJson method
  factory SkuMisc.fromJson(Map<String, dynamic> json) {
    return SkuMisc(
      SKUNumber: json['SKUNumber'] as String?,
      LineNumber: json['LineNumber'] as int?,
      MiscCode: json['MiscCode'] as String?,
      Amount: (json['Amount'] as num?)?.toDouble(),
    );
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'SKUNumber': SKUNumber,
      'LineNumber': LineNumber,
      'MiscCode': MiscCode,
      'Amount': Amount,
    };
  }
}

class SkuDetails {
  String? sKUNumber;
  String? prodName;
  String? purity;
  int? pcs;
  double? qty;
  double? nett;
  String? makingType;
  double? makingRate;
  double? mkValue;
  double? stoneValue;
  double? diamondValue;
  double? rate;
  String? ctype;
  double? cvalue;
  double? lineAmount;
  String? batchNo;
  String? style;
  String? prodCode;
  String? colour;
  String? cut;
  String? size;
  String? subDProdCode;
  int? subDPcs;
  double? subDQty;
  double? subDNett;
  double? subDRate;
  String? subDCtype;
  double? subDCvalue;
  String? subDSize;
  String? subDCut;
  String? subDColour;
  String? subDStyle;
  String? imageUrl;
  double? taxableAmount;
  double? taxAmount;
  double? discountAmount;
  double? discountPercentage;
  double? totalAmount;
  double? totalDiamondQty;
  double? totalStoneQty;

  SkuDetails({
    this.sKUNumber,
    this.prodName,
    this.purity,
    this.pcs,
    this.qty,
    this.nett,
    this.makingType,
    this.makingRate,
    this.mkValue,
    this.stoneValue,
    this.diamondValue,
    this.rate,
    this.ctype,
    this.cvalue,
    this.lineAmount,
    this.batchNo,
    this.style,
    this.prodCode,
    this.colour,
    this.cut,
    this.size,
    this.subDProdCode,
    this.subDPcs,
    this.subDQty,
    this.subDNett,
    this.subDRate,
    this.subDCtype,
    this.subDCvalue,
    this.subDSize,
    this.subDCut,
    this.subDColour,
    this.subDStyle,
    this.taxableAmount,
    this.totalAmount,
    this.taxAmount,
    this.discountAmount,
    this.discountPercentage,
    this.totalDiamondQty,
    this.totalStoneQty,
    this.imageUrl,
  });

  SkuDetails copyWith({
    String? skuNumber,
    String? prodName,
    String? purity,
    int? pcs,
    double? qty,
    double? nett,
    String? makingType,
    double? makingRate,
    double? mkValue,
    double? stoneValue,
    double? diamondValue,
    double? rate,
    String? ctype,
    double? cvalue,
    double? lineAmount,
    String? prodCode,
    String? batchNo,
    String? style,
    String? colour,
    String? cut,
    String? size,
    String? imageUrl,
    double? taxableAmount,
    double? taxAmount,
    double? discountAmount,
    double? discountPercentage,
    double? totalAmount,
    double? totalDiamondQty,
    double? totalStoneQty,
  }) {
    return SkuDetails(
      sKUNumber: skuNumber ?? this.sKUNumber,
      prodName: prodName ?? this.prodName,
      purity: purity ?? this.purity,
      pcs: pcs ?? this.pcs,
      qty: qty ?? this.qty,
      nett: nett ?? this.nett,
      makingType: makingType ?? this.makingType,
      makingRate: makingRate ?? this.makingRate,
      mkValue: mkValue ?? this.mkValue,
      stoneValue: stoneValue ?? this.stoneValue,
      diamondValue: diamondValue ?? this.diamondValue,
      imageUrl: imageUrl ?? this.imageUrl,
      rate: rate ?? this.rate,
      ctype: ctype ?? this.ctype,
      cvalue: cvalue ?? this.cvalue,
      lineAmount: lineAmount ?? this.lineAmount,
      prodCode: prodCode ?? this.prodCode,
      batchNo: batchNo ?? this.batchNo,
      style: style ?? this.style,
      colour: colour ?? this.colour,
      cut: cut ?? this.cut,
      size: size ?? this.size,
      taxableAmount: taxableAmount ?? this.taxableAmount,
      taxAmount: taxAmount ?? this.taxAmount,
      discountAmount: discountAmount ?? this.discountAmount,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      totalAmount: totalAmount ?? this.totalAmount,
      totalDiamondQty: totalDiamondQty ?? this.totalDiamondQty,
      totalStoneQty: totalDiamondQty ?? this.totalDiamondQty,
    );
  }

  SkuDetails.fromJson(Map<String, dynamic> json) {
    sKUNumber = json['SKUNumber'];
    // prodName = json['Prod_Name'];
    prodName = json['Prod_Name_'];
    purity = json['Purity'];
    pcs = json['Pcs'];
    qty = json['Qty'];
    nett = json['Nett'];
    makingType = json['MakingType'];
    makingRate = json['MakingRate'];
    imageUrl = json['image_url'];
    mkValue = json['Mkvalue'];
    stoneValue = json['StoneValue'];
    diamondValue = json['DiamondValue'];
    rate = json['Rate'];
    ctype = json['Ctype'];
    cvalue = json['Cvalue'] ?? 0.00;
    lineAmount = json['LineAmount'];
    batchNo = json['Batch_No'];
    style = json['Style'];
    prodCode = json['Prod_Code'];
    colour = json['Colour'];
    cut = json['Cut'];
    size = json['Size'];
    subDProdCode = json['SubD_Prod_Code'];
    subDPcs = json['SubD_Pcs'];
    subDQty = json['SubD_Qty'];
    subDNett = json['SubD_Nett'];
    subDRate = json['SubD_Rate'];
    subDCtype = json['SubD_Ctype'];
    subDCvalue = json['SubD_Cvalue'];
    subDSize = json['SubD_Size'];
    subDCut = json['SubD_Cut'];
    subDColour = json['SubD_Colour'];
    subDStyle = json['SubD_Style'];
    totalAmount = 0.0;
    discountAmount = 0.0;
    discountPercentage = 0.0;
    taxableAmount = 0.0;
    taxAmount = 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SKUNumber'] = sKUNumber;
    data['Prod_Name_'] = prodName;
    data['Purity'] = purity;
    data['Pcs'] = pcs;
    data['Qty'] = qty;
    data['Nett'] = nett;
    data['MakingType'] = makingType;
    data['MakingRate'] = makingRate;
    data['Mkvalue'] = mkValue;
    data['StoneValue'] = stoneValue;
    data['DiamondValue'] = diamondValue;
    data['Rate'] = rate;
    data['Ctype'] = ctype;
    data['image_url'] = imageUrl;
    data['Cvalue'] = cvalue;
    data['LineAmount'] = lineAmount;
    data['Batch_No'] = batchNo;
    data['Style'] = style;
    data['Prod_Code'] = prodCode;
    data['Colour'] = colour;
    data['Cut'] = cut;
    data['Size'] = size;
    data['SubD_Prod_Code'] = subDProdCode;
    data['SubD_Pcs'] = subDPcs;
    data['SubD_Qty'] = subDQty;
    data['SubD_Nett'] = subDNett;
    data['SubD_Rate'] = subDRate;
    data['SubD_Ctype'] = subDCtype;
    data['SubD_Cvalue'] = subDCvalue;
    data['SubD_Size'] = subDSize;
    data['SubD_Cut'] = subDCut;
    data['SubD_Colour'] = subDColour;
    data['SubD_Style'] = subDStyle;
    return data;
  }
}

class SkuSubdetails {
  String? sKUNumber;
  String? prodName;
  String? purity;
  int? pcs;
  double? qty;
  double? nett;
  String? makingType;
  double? makingRate;
  double? mkvalue;
  double? stoneValue;
  double? diamondValue;
  double? rate;
  String? ctype;
  double? cvalue;
  double? lineAmount;
  String? batchNo;
  String? style;
  String? prodCode;
  String? colour;
  String? cut;
  String? size;
  String? subDProdCode;
  String? SubD_Purity;
  String? SubD_Batch_No;
  int? subDPcs;
  double? subDQty;
  double? subDNett;
  double? subDRate;
  String? subDCtype;
  double? subDCvalue;
  String? subDSize;
  String? subDCut;
  String? subDColour;
  String? subDStyle;
  String? product_indicator;

  SkuSubdetails(
      {this.sKUNumber,
      this.prodName,
      this.purity,
      this.pcs,
      this.qty,
      this.nett,
      this.makingType,
      this.makingRate,
      this.mkvalue,
      this.stoneValue,
      this.diamondValue,
      this.rate,
      this.ctype,
      this.cvalue,
      this.lineAmount,
      this.batchNo,
      this.style,
      this.prodCode,
      this.colour,
      this.cut,
      this.size,
      this.subDProdCode,
      this.subDPcs,
      this.subDQty,
      this.subDNett,
      this.subDRate,
      this.subDCtype,
      this.subDCvalue,
      this.subDSize,
      this.SubD_Purity,
      this.SubD_Batch_No,
      this.subDCut,
      this.subDColour,
      this.product_indicator,
      this.subDStyle});

  SkuSubdetails.fromJson(Map<String, dynamic> json) {
    sKUNumber = json['SKUNumber'] ?? "";
    prodName = json['Prod_Name'] ?? "";
    purity = json['Purity'];
    pcs = json['Pcs'];
    qty = json['Qty'];
    nett = json['Nett'];
    makingType = json['MakingType'];
    makingRate = json['MakingRate'];
    mkvalue = json['Mkvalue'];
    stoneValue = json['StoneValue'];
    SubD_Purity = json['SubD_Purity'];
    diamondValue = json['DiamondValue'];
    rate = json['Rate'];
    product_indicator = json['product_indicator'];
    ctype = json['Ctype'];
    cvalue = json['Cvalue'];
    lineAmount = json['LineAmount'];
    batchNo = json['Batch_No'];
    style = json['Style'];
    prodCode = json['Prod_Code'];
    colour = json['Colour'];
    cut = json['Cut'];
    size = json['Size'];
    subDProdCode = json['SubD_Prod_Code'] ?? "";
    SubD_Batch_No = json['SubD_Batch_No'];
    subDPcs = json['SubD_Pcs'];
    subDQty = json['SubD_Qty'];
    subDNett = json['SubD_Nett'];
    subDRate = json['SubD_Rate'];
    subDCtype = json['SubD_Ctype'];
    subDCvalue = json['SubD_Cvalue'];
    subDSize = json['SubD_Size'];
    subDCut = json['SubD_Cut'];
    subDColour = json['SubD_Colour'];
    subDStyle = json['SubD_Style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SKUNumber'] = sKUNumber;
    data['Prod_Name'] = prodName;
    data['Purity'] = purity;
    data['Pcs'] = pcs;
    data['Qty'] = qty;
    data['Nett'] = nett;
    data['MakingType'] = makingType;
    data['product_indicator'] = product_indicator;
    data['MakingRate'] = makingRate;
    data['Mkvalue'] = mkvalue;
    data['SubD_Purity'] = SubD_Purity;
    data['StoneValue'] = stoneValue;
    data['DiamondValue'] = diamondValue;
    data['Rate'] = rate;
    data['Ctype'] = ctype;
    data['Cvalue'] = cvalue;
    data['LineAmount'] = lineAmount;
    data['Batch_No'] = batchNo;
    data['Style'] = style;
    data['Prod_Code'] = prodCode;
    data['Colour'] = colour;
    data['Cut'] = cut;
    data['Size'] = size;
    data['SubD_Prod_Code'] = subDProdCode;
    data['SubD_Pcs'] = subDPcs;
    data['SubD_Qty'] = subDQty;
    data['SubD_Nett'] = subDNett;
    data['SubD_Rate'] = subDRate;
    data['SubD_Ctype'] = subDCtype;
    data['SubD_Cvalue'] = subDCvalue;
    data['SubD_Size'] = subDSize;
    data['SubD_Cut'] = subDCut;
    data['SubD_Colour'] = subDColour;
    data['SubD_Style'] = subDStyle;
    data['SubD_Batch_No'] = SubD_Batch_No;
    return data;
  }
}

class SkuTax {
  String? sKUNumber;
  int? lineNumber;
  String? taxCode;
  double? percentage;
  double? amount;

  SkuTax(
      {this.sKUNumber,
      this.lineNumber,
      this.taxCode,
      this.percentage,
      this.amount});

  SkuTax.fromJson(Map<String, dynamic> json) {
    sKUNumber = json['SKUNumber'];
    lineNumber = json['LineNumber'];
    taxCode = json['TaxCode'];
    percentage = json['Percentage'];
    amount = json['Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SKUNumber'] = sKUNumber;
    data['LineNumber'] = lineNumber;
    data['TaxCode'] = taxCode;
    data['Percentage'] = percentage;
    data['Amount'] = amount;
    return data;
  }
}

class SkuDiscount {
  double? rate;
  String? desc;
  String? rateType;

  SkuDiscount(
      {this.rate,
        this.desc,
        this.rateType,});


  SkuDiscount copyWith({
    double? rate,
    String? desc,
    String? rateType,
  }) {
    return SkuDiscount(
      rate: rate ?? this.rate,
      desc: desc ?? this.desc,
      rateType: rateType ?? this.rateType,
    );
  }

  SkuDiscount.fromJson(Map<String, dynamic> json) {
    rate = json['Rate'];
    desc = json['CalTypeDescription'];
    rateType = json['TaxCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Rate'] = rate;
    data['CalTypeDescription'] = desc;
    data['TaxCode'] = rateType;
    return data;
  }
}
