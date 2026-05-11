import '../../../../features/product_screen/data/product_model.dart';

class IngredientModel {
  bool? success;
  String? message;
  List<IngredientList>? ingredientList;
  Pagination? pagination;

  IngredientModel({this.success, this.message, this.ingredientList, this.pagination});

  IngredientModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      ingredientList = <IngredientList>[];
      json['data'].forEach((v) {
        ingredientList!.add(IngredientList.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }
}

class IngredientList {
  int? id;
  String? tradeTypeDisplay;
  String? tradeProdTypeDisplay;
  String? tradeNJProdTypeDisplay;
  String? prodCode;
  String? prodName;
  Purity? purity;
  Size? size;
  Size? cut;
  Size? color;
  Size? style;
  Batch? batch;
  InventdimCodeObj? inventdimCodeObj;

  IngredientList(
      {this.id,
        this.tradeTypeDisplay,
        this.tradeProdTypeDisplay,
        this.tradeNJProdTypeDisplay,
        this.prodCode,
        this.prodName,
        this.purity,
        this.size,
        this.cut,
        this.color,
        this.style,
        this.batch,
        this.inventdimCodeObj});

  IngredientList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tradeTypeDisplay = json['tradeType_display'];
    tradeProdTypeDisplay = json['tradeProdType_display'];
    tradeNJProdTypeDisplay = json['TradeNJProdType_display'];
    prodCode = json['prodCode'];
    prodName = json['ProdName'];
    purity =
    json['purity'] != null ? Purity.fromJson(json['purity']) : null;
    size = json['size'] != null ? Size.fromJson(json['size']) : null;
    cut = json['cut'] != null ? Size.fromJson(json['cut']) : null;
    color = json['color'] != null ? Size.fromJson(json['color']) : null;
    style = json['style'] != null ? Size.fromJson(json['style']) : null;
    batch = json['batch'] != null ? Batch.fromJson(json['batch']) : null;
    inventdimCodeObj = json['Inventdim_CodeObj'] != null
        ? InventdimCodeObj.fromJson(json['Inventdim_CodeObj'])
        : null;
  }
}

class Article {
  int? id;
  String? code;
  String? description;

  Article({this.id, this.code, this.description});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    description = json['description'];
  }
}

class PHierarchyObj {
  int? id;
  String? hierarchyCode;
  String? description;

  PHierarchyObj({this.id, this.hierarchyCode, this.description});

  PHierarchyObj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hierarchyCode = json['hierarchyCode'];
    description = json['description'];
  }
}

class DFLTObj {
  int? id;
  String? dimentionTypeDisplay;
  String? dimensionCode;
  String? dimensionName;
  int? dimensionType;

  DFLTObj(
      {this.id,
        this.dimentionTypeDisplay,
        this.dimensionCode,
        this.dimensionName,
        this.dimensionType});

  DFLTObj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dimentionTypeDisplay = json['dimentionType_display'];
    dimensionCode = json['dimensionCode'];
    dimensionName = json['dimensionName'];
    dimensionType = json['dimensionType'];
  }
}

class InvGroupObj {
  int? id;
  String? invGroup;

  InvGroupObj({this.id, this.invGroup});

  InvGroupObj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invGroup = json['inv_Group'];
  }
}

class InvModelGroupObj {
  int? id;
  String? invtModelGroup;

  InvModelGroupObj({this.id, this.invtModelGroup});

  InvModelGroupObj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    invtModelGroup = json['invt_Model_Group'];
  }
}

class InventdimCodeObj {
  int? id;
  String? inventdimCode;
  bool? purity;
  bool? size;
  bool? style;
  bool? cut;
  bool? colour;
  bool? batchNo;
  String? updateDate;
  String? updateTime;
  String? userCode;
  int? status;

  InventdimCodeObj(
      {this.id,
        this.inventdimCode,
        this.purity,
        this.size,
        this.style,
        this.cut,
        this.colour,
        this.batchNo,
        this.updateDate,
        this.updateTime,
        this.userCode,
        this.status});

  InventdimCodeObj.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inventdimCode = json['inventdimCode'];
    purity = json['purity'];
    size = json['size'];
    style = json['style'];
    cut = json['cut'];
    colour = json['colour'];
    batchNo = json['batch_No'];
    updateDate = json['updateDate'];
    updateTime = json['updateTime'];
    userCode = json['userCode'];
    status = json['status'];
  }
}

/*
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
}

class Batch {
  int? id;
  String? batchCode;

  Batch({this.id, this.batchCode});

  Batch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    batchCode = json['Batch_Code'];
  }
}*/

class Pagination {
  int? currentPage;
  int? pageSize;
  int? totalPage;
  int? totalRecord;

  Pagination(
      {this.currentPage, this.pageSize, this.totalPage, this.totalRecord});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    pageSize = json['pageSize'];
    totalPage = json['totalPage'];
    totalRecord = json['totalRecord'];
  }
}
