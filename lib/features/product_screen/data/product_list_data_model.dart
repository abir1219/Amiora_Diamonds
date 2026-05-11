class ProductListDataModel {
  List<ProductList>? productList;

  ProductListDataModel({this.productList});

  ProductListDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      productList = <ProductList>[];
      json['data'].forEach((v) {
        productList!.add(ProductList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (productList != null) {
      data['data'] = productList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductList {
  String? sKUNumber;
  int? pcs;
  double? qty;
  double? nett;
  String? purity;
  String? orderNumber;
  String? referenceID;
  String? prodName;
  String? imageUrl;

  ProductList(
      {this.sKUNumber,
        this.pcs,
        this.qty,
        this.nett,
        this.purity,
        this.orderNumber,
        this.referenceID,
        this.prodName,
        this.imageUrl,
      });

  ProductList.fromJson(Map<String, dynamic> json) {
    sKUNumber = json['SKUNumber'];
    pcs = json['Pcs'];
    qty = json['Qty'];
    nett = json['Nett'];
    purity = json['Purity'];
    orderNumber = json['Order_number'];
    referenceID = json['Reference_ID'];
    prodName = json['Prod_Name'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SKUNumber'] = sKUNumber;
    data['Pcs'] = pcs;
    data['Qty'] = qty;
    data['Nett'] = nett;
    data['Purity'] = purity;
    data['Order_number'] = orderNumber;
    data['Reference_ID'] = referenceID;
    data['Prod_Name'] = prodName;
    data['image_url'] = imageUrl;
    return data;
  }
}
