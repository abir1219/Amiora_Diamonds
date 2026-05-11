part of 'estimation_bloc.dart';

class EstimationState extends Equatable {
  final List<Map<String, dynamic>> payments;

  // API related
  final ApiStatus? apiStatus;
  final ApiStatus? apiDialogStatus;
  final String? message;

  //Rate Check
  final bool? isRateSet;

  // Estimation details
  final String? estimationNumber;
  final String? narration;

  // Customer details
  final String? customerName;
  final String? customerId;
  final CustomerList? customerData;
  final int? customerGroupId;
  final CustomerGroupList? selectedCustomerGroup;
  final List<CustomerList>? customerList;
  final List<CustomerGroupList>? customerGroupList;

  // Address details
  final String? address;
  final int? addressId;
  final int? selectAddressIndex;
  final List<AddressList>? addressList;
  final List<AddressList>? selectedAddressList;
  final List<bool>? isPrimaryAddress;

  // Product details
  final ProductListFormModel? productListFormModel;
  final SkuDetails? skuDetails;
  final List<ProductList>? productList;
  final List<ProductList> filteredProductList;
  // final List<ProductList>? selectedProductList;
  final List<ProductListFormModel>? selectedProductList;

  // Miscellaneous items
  final List<MiscList>? miscList;
  final MiscList? misProd;

  // State and country details
  final String? stateCode;
  final String? stateName;
  final int? stateId;
  final List<StateList>? stateList;
  final String? countryName;
  final List<CountryList>? countryList;

  // Ingredient details
  final List<IngredientList>? ingredientList;
  final IngredientList? selectIngredient;

  // Salesperson details
  final EmployeeList? employee;
  final String? salesmanName;
  final String? salesPerson;
  final String? salesPersonId;

  // Financial details
  final List<double>? lineAmountList;
  final List<double>? taxAmountList;
  final List<double>? discountAmountList;
  final List<double>? discountPercentageList;
  final List<double>? totalQtyList;

  //Tax
  final double? taxPercentage;
  final String? taxCode;

  // Other
  final String? checkboxText;
  final String? prodCode;
  final String? prodName;
  final String? pan;
  final String? pos;
  final int? posId;
  final List<double>? rotationAngle;
  final EstimationResponseModel? estimationResponseModel;
  final List<EmployeeList>? employeeList;
  final List<EmployeeList>? filteredEmployeeList;

  //PdfData
  final FutureOr<Uint8List>? pdfData;

  const EstimationState({
    this.payments = const [],

    // API related
    this.isRateSet,
    this.apiStatus,
    this.apiDialogStatus,
    this.message,

    // Estimation details
    this.estimationNumber,
    this.narration,

    // Customer details
    this.customerName,
    this.customerId,
    this.customerData,
    this.customerGroupId,
    this.selectedCustomerGroup,
    this.customerList = const [],
    this.customerGroupList = const [],

    // Address details
    this.address,
    this.addressId,
    this.selectAddressIndex,
    this.addressList = const [],
    this.selectedAddressList = const [],
    this.isPrimaryAddress = const [],

    // Product details
    this.productListFormModel,
    this.skuDetails,
    this.productList = const [],
    this.filteredProductList = const [],
    this.selectedProductList = const [],

    // Miscellaneous items
    this.miscList = const [],
    this.misProd,

    // State and country details
    this.stateCode,
    this.stateName,
    this.stateId,
    this.stateList = const [],
    this.countryName,
    this.countryList = const [],

    // Ingredient details
    this.ingredientList = const [],
    this.selectIngredient,

    // Salesperson details
    this.salesmanName,
    this.salesPerson,
    this.salesPersonId,
    this.employee,

    // Financial details
    this.lineAmountList = const [],
    this.taxAmountList = const [],
    this.discountAmountList = const [],
    this.discountPercentageList = const [],
    this.totalQtyList = const [],

    //Tax
    this.taxPercentage,
    this.taxCode,

    // Other
    this.checkboxText,
    this.prodCode,
    this.prodName,
    this.pan,
    this.pos,
    this.posId,
    this.rotationAngle = const [],
    this.estimationResponseModel,
    this.employeeList = const [],
    this.filteredEmployeeList = const [],

    //PdfData
    this.pdfData,
  });

  EstimationState copyWith({
    List<Map<String, dynamic>>? payments,
    // API related
    bool? isRateSet,
    ApiStatus? apiStatus,
    ApiStatus? apiDialogStatus,
    String? message,

    // Estimation details
    String? estimationNumber,
    String? narration,

    // Customer details
    String? customerName,
    String? customerId,
    CustomerList? customerData,
    int? customerGroupId,
    CustomerGroupList? selectedCustomerGroup,
    List<CustomerList>? customerList,
    List<CustomerGroupList>? customerGroupList,

    // Address details
    String? address,
    int? addressId,
    int? selectAddressIndex,
    List<AddressList>? addressList,
    List<AddressList>? selectedAddressList,
    List<bool>? isPrimaryAddress,

    // Product details
    SkuDetails? skuDetails,
    ProductListFormModel? productListFormModel,
    List<ProductList>? productList,
    List<ProductList>? filteredProductList,
    // List<ProductList>? selectedProductList,
    List<ProductListFormModel>? selectedProductList,

    // Miscellaneous items
    List<MiscList>? miscList,
    MiscList? misProd,

    // State and country details
    String? stateCode,
    String? stateName,
    int? stateId,
    List<StateList>? stateList,
    String? countryName,
    List<CountryList>? countryList,

    // Ingredient details
    List<IngredientList>? ingredientList,
    IngredientList? selectIngredient,

    // Salesperson details
    String? salesmanName,
    String? salesPerson,
    String? salesPersonId,
    EmployeeList? employee,

    // Financial details
    List<double>? lineAmountList,
    List<double>? taxAmountList,
    List<double>? discountAmountList,
    List<double>? discountPercentageList,
    List<double>? totalQtyList,

    //Tax
    double? taxPercentage,
    String? taxCode,

    // Other
    String? checkboxText,
    String? prodCode,
    String? prodName,
    String? pan,
    String? pos,
    int? posId,
    List<double>? rotationAngle,
    EstimationResponseModel? estimationResponseModel,
    List<EmployeeList>? employeeList,
    List<EmployeeList>? filteredEmployeeList,

    //PdfData
    FutureOr<Uint8List>? pdfData
  }) {
    return EstimationState(
      payments: payments ?? this.payments,
      // API related
      isRateSet: isRateSet ?? this.isRateSet,
      apiStatus: apiStatus ?? this.apiStatus,
      apiDialogStatus: apiDialogStatus ?? this.apiDialogStatus,
      message: message ?? this.message,

      // Estimation details
      estimationNumber: estimationNumber ?? this.estimationNumber,
      narration: narration ?? this.narration,

      // Customer details
      customerName: customerName ?? this.customerName,
      customerId: customerId ?? this.customerId,
      customerData: customerData ?? this.customerData,
      customerGroupId: customerGroupId ?? this.customerGroupId,
      selectedCustomerGroup:
      selectedCustomerGroup ?? this.selectedCustomerGroup,
      customerList: customerList ?? this.customerList,
      customerGroupList: customerGroupList ?? this.customerGroupList,

      // Address details
      address: address ?? this.address,
      addressId: addressId ?? this.addressId,
      selectAddressIndex: selectAddressIndex ?? this.selectAddressIndex,
      addressList: addressList ?? this.addressList,
      selectedAddressList: selectedAddressList ?? this.selectedAddressList,
      isPrimaryAddress: isPrimaryAddress ?? this.isPrimaryAddress,

      // Product details
      productListFormModel: productListFormModel ?? this.productListFormModel,
      skuDetails: skuDetails ?? this.skuDetails,
      productList: productList ?? this.productList,
      filteredProductList: filteredProductList ?? this.filteredProductList,
      // selectedProductList: selectedProductList ?? this.selectedProductList,
      selectedProductList: selectedProductList ?? this.selectedProductList,

      // Miscellaneous items
      miscList: miscList ?? this.miscList,
      misProd: misProd ?? this.misProd,

      // State and country details
      stateCode: stateCode ?? this.stateCode,
      stateName: stateName ?? this.stateName,
      stateId: stateId ?? this.stateId,
      stateList: stateList ?? this.stateList,
      countryName: countryName ?? this.countryName,
      countryList: countryList ?? this.countryList,

      // Ingredient details
      ingredientList: ingredientList ?? this.ingredientList,
      selectIngredient: selectIngredient ?? this.selectIngredient,

      // Salesperson details
      salesmanName: salesmanName ?? this.salesmanName,
      salesPerson: salesPerson ?? this.salesPerson,
      salesPersonId: salesPersonId ?? this.salesPersonId,
      employee: employee ?? this.employee,

      // Financial details
      lineAmountList: lineAmountList ?? this.lineAmountList,
      taxAmountList: taxAmountList ?? this.taxAmountList,
      discountAmountList: discountAmountList ?? this.discountAmountList,
      discountPercentageList: discountPercentageList ?? this.discountPercentageList,
      totalQtyList: totalQtyList ?? this.totalQtyList,

      //Tax
      taxPercentage: taxPercentage ?? this.taxPercentage,
      taxCode: taxCode ?? this.taxCode,

      // Other
      checkboxText: checkboxText ?? this.checkboxText,
      prodCode: prodCode ?? this.prodCode,
      prodName: prodName ?? this.prodName,
      pan: pan ?? this.pan,
      pos: pos ?? this.pos,
      posId: posId ?? this.posId,
      rotationAngle: rotationAngle ?? this.rotationAngle,
      estimationResponseModel:
      estimationResponseModel ?? this.estimationResponseModel,

      employeeList: employeeList ?? this.employeeList,
      filteredEmployeeList: filteredEmployeeList ?? this.filteredEmployeeList,

      //PdfData
      pdfData: pdfData ?? this.pdfData,
    );
  }

  @override
  List<Object?> get props =>
      [
        payments,
        // API related
        isRateSet,
        apiStatus,
        apiDialogStatus,
        message,

        // Estimation details
        estimationNumber,
        narration,

        // Customer details
        customerName,
        customerId,
        customerData,
        customerGroupId,
        selectedCustomerGroup,
        customerList,
        customerGroupList,

        // Address details
        address,
        addressId,
        selectAddressIndex,
        addressList,
        selectedAddressList,
        isPrimaryAddress,

        // Product details
        productListFormModel,
        skuDetails,
        productList,
        filteredProductList,
        selectedProductList,

        // Miscellaneous items
        miscList,
        misProd,

        // State and country details
        stateCode,
        stateName,
        stateId,
        stateList,
        countryName,
        countryList,

        // Ingredient details
        ingredientList,
        selectIngredient,

        // Salesperson details
        salesmanName,
        salesPerson,
        salesPersonId,

        // Financial details
        lineAmountList,
        taxAmountList,
        discountAmountList,
        discountPercentageList,
        totalQtyList,

        //Tax
        taxCode,
        taxPercentage,

        // Other
        checkboxText,
        prodCode,
        prodName,
        pan,
        pos,
        posId,
        rotationAngle,
        estimationResponseModel,

        employeeList,
        filteredEmployeeList,

        //PdfData
        pdfData
      ];
}
