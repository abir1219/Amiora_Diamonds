class ProductModel {
  // bool? success;
  // String? message;
  List<ProductListModel>? productList;

  ProductModel({/*this.success, this.message,*/ this.productList});

  ProductModel.fromJson(Map<String, dynamic> json) {
    // success = json['success'];
    // message = json['message'];
    if (json['data'] != null) {
      productList = <ProductListModel>[];
      json['data'].forEach((v) {
        productList!.add(ProductListModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      // 'success': success,
      // 'message': message,
      'data': productList?.map((v) => v.toJson()).toList(),
    };
  }
}

class ProductListModel {
  int? id;
  String? skuEntryNo;
  int? masterType;
  String? skuDetailCode;
  int? skuEntryId;
  String? skuPostedNo;
  int? skuEntryPostedId;
  int? trType;
  String? trTypeName;
  int? pcs;
  String? quantity;
  String? nett;
  String? rate;
  String? makingRate;
  bool? ingredient;
  bool? mrp;
  String? markup;
  String? diaVal;
  String? stoneVal;
  int? mType;

  //Null? mTypeName;
  int? calculationType;
  String? calculationTypeName;
  String? makingVal;
  String? calculationVal;
  String? totalAmt;
  String? productSku;
  bool? hallMarked;
  String? orderNo;
  String? oldSku;
  String? huId;
  bool? confirmed;
  String? updateDate;
  String? updateTime;
  String? userCode;
  ProductCode? productCode;
  MiscChargeCode? miscChargeCode;
  Purity? purity;
  Size? size;
  Size? cut;
  Size? color;
  Size? style;
  Batch? batch;
  List<TaxInfo>? taxInfo;
  List<MiscProdCharge>? miscCharge;
  List<IngredientInfo>? ingredientInfo;

  ProductListModel(
      {this.id,
      this.skuEntryNo,
      this.masterType,
      this.skuDetailCode,
      this.skuEntryId,
      this.skuPostedNo,
      this.skuEntryPostedId,
      this.trType,
      this.trTypeName,
      this.pcs,
      this.quantity,
      this.nett,
      this.rate,
      this.makingRate,
      this.ingredient,
      this.mrp,
      this.markup,
      this.diaVal,
      this.stoneVal,
      this.mType,
      // this.mTypeName,
      this.calculationType,
      this.calculationTypeName,
      this.makingVal,
      this.calculationVal,
      this.totalAmt,
      this.productSku,
      this.hallMarked,
      this.orderNo,
      this.oldSku,
      this.huId,
      this.confirmed,
      this.updateDate,
      this.updateTime,
      this.userCode,
      this.productCode,
      this.miscChargeCode,
      this.purity,
      this.size,
      this.cut,
      this.color,
      this.style,
      this.batch,
      this.taxInfo,
      this.miscCharge,
      this.ingredientInfo});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skuEntryNo = json['skuEntryNo'];
    masterType = json['master_type'];
    skuDetailCode = json['skuDetailCode'];
    skuEntryId = json['skuEntryId'];
    skuPostedNo = json['skuPostedNo'];
    skuEntryPostedId = json['skuEntryPostedId'];
    trType = json['trType'];
    trTypeName = json['trTypeName'];
    pcs = json['pcs'];
    quantity = json['quantity'];
    nett = json['nett'];
    rate = json['rate'];
    makingRate = json['makingRate'];
    ingredient = json['ingredient'];
    mrp = json['mrp'];
    markup = json['markup'];
    diaVal = json['diaVal'];
    stoneVal = json['stoneVal'];
    mType = json['mType'];
    // mTypeName = json['mTypeName'];
    calculationType = json['calculationType'];
    calculationTypeName = json['calculationTypeName'];
    makingVal = json['makingVal'];
    calculationVal = json['calculationVal'];
    totalAmt = json['totalAmt'];
    productSku = json['productSku'];
    hallMarked = json['hallMarked'];
    orderNo = json['orderNo'];
    oldSku = json['oldSku'];
    huId = json['huId'];
    confirmed = json['confirmed'];
    updateDate = json['updateDate'];
    updateTime = json['updateTime'];
    userCode = json['userCode'];
    productCode = json['productCode'] != null
        ? ProductCode.fromJson(json['productCode'])
        : null;
    miscChargeCode = json['miscChargeCode'] != null
        ? MiscChargeCode.fromJson(json['miscChargeCode'])
        : null;
    purity = json['purity'] != null ? Purity.fromJson(json['purity']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
    cut = json['cut'] != null ? Size.fromJson(json['cut']) : null;
    color = json['color'] != null ? Size.fromJson(json['color']) : null;
    style = json['style'] != null ? Size.fromJson(json['style']) : null;
    batch = json['batch'] != null ? Batch.fromJson(json['batch']) : null;
    if (json['miscCharge'] != null) {
      miscCharge = <MiscProdCharge>[];
      json['miscCharge'].forEach((v) {
        miscCharge!.add(MiscProdCharge.fromJson(v));
      });
    }
    if (json['taxInfo'] != null) {
      taxInfo = <TaxInfo>[];
      json['taxInfo'].forEach((v) {
        taxInfo!.add(TaxInfo.fromJson(v));
      });
    }
    if (json['ingredientInfo'] != null) {
      ingredientInfo = <IngredientInfo>[];
      json['ingredientInfo'].forEach((v) {
        ingredientInfo!.add(IngredientInfo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'skuEntryNo': skuEntryNo,
      'master_type': masterType,
      'skuDetailCode': skuDetailCode,
      'skuEntryId': skuEntryId,
      'skuPostedNo': skuPostedNo,
      'skuEntryPostedId': skuEntryPostedId,
      'trType': trType,
      'trTypeName': trTypeName,
      'pcs': pcs,
      'quantity': quantity,
      'nett': nett,
      'rate': rate,
      'makingRate': makingRate,
      'ingredient': ingredient,
      'mrp': mrp,
      'markup': markup,
      'diaVal': diaVal,
      'stoneVal': stoneVal,
      'mType': mType,
      'calculationType': calculationType,
      'calculationTypeName': calculationTypeName,
      'makingVal': makingVal,
      'calculationVal': calculationVal,
      'totalAmt': totalAmt,
      'productSku': productSku,
      'hallMarked': hallMarked,
      'orderNo': orderNo,
      'oldSku': oldSku,
      'huId': huId,
      'confirmed': confirmed,
      'updateDate': updateDate,
      'updateTime': updateTime,
      'userCode': userCode,
      'productCode': productCode?.toJson(),
      'miscChargeCode': miscChargeCode?.toJson(),
      'purity': purity?.toJson(),
      'size': size?.toJson(),
      'cut': cut?.toJson(),
      'color': color?.toJson(),
      'style': style?.toJson(),
      'batch': batch?.toJson(),
      'taxInfo': taxInfo?.map((v) => v.toJson()).toList(),
      'miscCharge': miscCharge?.map((v) => v.toJson()).toList(),
      'ingredientInfo': ingredientInfo?.map((v) => v.toJson()).toList(),
    };
  }
}

class ProductCode {
  int? id;
  String? prodCode;
  String? prodName;
  String? image;

  ProductCode({this.id, this.prodCode, this.prodName,this.image});

  ProductCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    prodCode = json['prodCode'];
    prodName = json['ProdName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'prodCode': prodCode,
      'prodName': prodName,
      'image': image,
    };
  }
}

class MiscChargeCode {
  int? id;
  String? miscChargeCode;
  double? rate;

  MiscChargeCode({this.id, this.miscChargeCode, this.rate});

  MiscChargeCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    miscChargeCode = json['miscChargeCode'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'miscChargeCode': miscChargeCode,
      'rate': rate,
    };
  }
}

class Purity {
  int? id;
  String? purity;
  double? tonch;
  String? displayPuTo;

  Purity({this.id, this.purity, this.tonch, this.displayPuTo});

  Purity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    purity = json['purity'];
    tonch = json['tonch'];
    displayPuTo = json['DisplayPuTo'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'purity': purity,
      'tonch': tonch,
      'DisplayPuTo': displayPuTo,
    };
  }
}

class Size {
  int? id;
  String? code;
  String? description;

  Size({this.id, this.code, this.description});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'description': description,
    };
  }
}

class Batch {
  int? id;
  String? batchCode;

  Batch({this.id, this.batchCode});

  Batch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    batchCode = json['Batch_Code'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Batch_Code': batchCode,
    };
  }
}

class TaxInfo {
  double? percentage;
  String? taxCode;
  int? id;
  int? taxType;

  TaxInfo({this.percentage, this.taxCode, this.id, this.taxType});

  TaxInfo.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
    taxCode = json['taxCode'];
    id = json['id'];
    taxType = json['taxType'];
  }

  Map<String, dynamic> toJson() {
    return {
      'percentage': percentage,
      'taxCode': taxCode,
      'id': id,
      'taxType': taxType,
    };
  }
}

class IngredientInfo {
  int? id;
  String? skuEntryNo;
  int? skuEntryId;
  String? skuPostedNo;
  int? skuEntryPostedId;
  int? trType;
  String? trTypeName;
  String? productCode;
  int? pieces;
  String? quantity;
  String? nett;
  String? rate;
  int? calculationType;
  String? calculationTypeName;
  String? calculationValue;
  String? updateDate;
  String? updateTime;
  String? userCode;
  ProductCode? productCodeId;
  Purity? purity;
  Size? size;
  Size? cut;
  Size? color;
  Size? style;
  Batch? batch;

  IngredientInfo(
      {this.id,
      this.skuEntryNo,
      this.skuEntryId,
      this.skuPostedNo,
      this.skuEntryPostedId,
      this.trType,
      this.trTypeName,
      this.productCode,
      this.pieces,
      this.quantity,
      this.nett,
      this.rate,
      this.calculationType,
      this.calculationTypeName,
      this.calculationValue,
      this.updateDate,
      this.updateTime,
      this.userCode,
      this.productCodeId,
      this.purity,
      this.size,
      this.cut,
      this.color,
      this.style,
      this.batch});

  IngredientInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skuEntryNo = json['skuEntryNo'];
    skuEntryId = json['skuEntryId'];
    skuPostedNo = json['skuPostedNo'];
    skuEntryPostedId = json['skuEntryPostedId'];
    trType = json['trType'];
    trTypeName = json['trTypeName'];
    productCode = json['productCode'];
    pieces = json['pieces'];
    quantity = json['quantity'];
    nett = json['nett'];
    rate = json['rate'];
    calculationType = json['calculationType'];
    calculationTypeName = json['calculationTypeName'];
    calculationValue = json['calculationValue'];
    updateDate = json['updateDate'];
    updateTime = json['updateTime'];
    userCode = json['userCode'];
    productCodeId = json['productCodeId'] != null
        ? ProductCode.fromJson(json['productCodeId'])
        : null;
    purity = json['purity'] != null ? Purity.fromJson(json['purity']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
    cut = json['cut'] != null ? Size.fromJson(json['size']) : null;
    color = json['color'] != null ? Size.fromJson(json['size']) : null;
    style = json['style'] != null ? Size.fromJson(json['size']) : null;
    batch = json['batch'] != null ? Batch.fromJson(json['batch']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'skuEntryNo': skuEntryNo,
      'skuEntryId': skuEntryId,
      'skuPostedNo': skuPostedNo,
      'skuEntryPostedId': skuEntryPostedId,
      'trType': trType,
      'trTypeName': trTypeName,
      'productCode': productCode,
      'pieces': pieces,
      'quantity': quantity,
      'nett': nett,
      'rate': rate,
      'calculationType': calculationType,
      'calculationTypeName': calculationTypeName,
      'calculationValue': calculationValue,
      'updateDate': updateDate,
      'updateTime': updateTime,
      'userCode': userCode,
      'productCodeId': productCodeId?.toJson(),
      'purity': purity?.toJson(),
      'size': size?.toJson(),
      'cut': cut?.toJson(),
      'color': color?.toJson(),
      'style': style?.toJson(),
      'batch': batch?.toJson(),
    };
  }
}

class MiscProdCharge {
  int? id;
  String? miscChargeCode;
  double? rate;

  MiscProdCharge({this.id, this.miscChargeCode, this.rate});

  MiscProdCharge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    miscChargeCode = json['miscChargeCode'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'miscChargeCode': miscChargeCode,
      'rate': rate,
    };
  }
}
