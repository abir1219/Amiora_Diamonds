import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../core/constants/api_end_points.dart';
import '../../../../core/constants/api_status.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/local/shared_preferences_helper.dart';
import '../../../address_screen/data/model/address_model.dart';
import '../../../country_screen/data/model/country_model.dart';
import '../../../customer_screen/presentation/customer_group/data/model/customer_group_model.dart';
import '../../../customer_screen/presentation/view_customer/data/model/customer_list_model.dart';
import '../../../ingredient_screen/data/model/ingredient_model.dart';
import '../../../miscellenous_screen/data/model/misc_model.dart';
import '../../../product_screen/data/product_list_data_model.dart';
import '../../../product_screen/data/product_list_form_model.dart';
import '../../../salesman_screen/data/model/salesman_model.dart';
import '../../../state_screen/data/model/state_model.dart';
import '../../data/model/estimation_body_model.dart';
import '../../data/model/estimation_response_model.dart';
import '../../data/repository/estimation_repository.dart';

part 'estimation_event.dart';

part 'estimation_state.dart';

class EstimationBloc extends Bloc<EstimationEvent, EstimationState> {
  var estimationRepository = EstimationRepository();

  EstimationBloc(this.estimationRepository) : super(EstimationState()) {
    on<CheckRateSetEvent>(_checkRateSet);
    on<FetchStateList>(_fetchStateList);
    on<GenerateEstimationNumber>(_generateEstimationNumber);
    on<FetchCountryList>(_fetchCountryList);
    on<LogoutEvent>(_logout);
    on<FetchSkuDetailsEvent>(_fetchSkuDetails);
    on<FetchSalesmanListEvent>(_fetchSalesmanList);
    on<SavePaymentDetails>(_savePaymentDetails);
    on<SelectStateEvent>(_selectState);
    on<SelectCountryEvent>(_selectCountry);
    on<SelectSalesmanEvent>(_selectSalesman);
    on<SelectCustomerEvent>(_selectCustomer);
    on<SelectCustomerGroupEvent>(_selectCustomerGroup);
    on<SelectAddressEvent>(_selectedAddressList);
    // on<AddCustomerEvent>(_addCustomer);
    on<FetchAddressListEvent>(_fetchAddressList);
    on<FetchIngredientEvent>(_fetchIngredientList);
    on<ApiStatusChangeEvent>(_changeApiStatus);
    on<FetchCustomerListEvent>(_fetchCustomerList);
    on<FetchCustomerGroupEvent>(_fetchCustomerGroupList);
    on<FetchProductListEvent>(_fetchProductList);
    on<SearchProductEvent>(_searchProduct);
    on<SearchEmployeeEvent>(_searchEmployee);
    on<SkuSaveForListEvent>(_skuSaveForList);
    on<ChangeAngle>(_changeAngle);
    // on<DeleteIngredientEvent>(_deleteIngredient);
    // on<DeleteMiscProdEvent>(_deleteMiscProd);
    on<DeleteFromSelectedProduct>(_deleteSelectedProd);
    on<FetchMisList>(_fetchMiscList);
    on<SelectMiscEvent>(_selectMiscProduct);
    // on<AddMiscProdEvent>(_addMiscProduct);
    // on<FetchPurityEvent>(_fetchPurityList);
    // on<FetchStyleEvent>(_fetchStyleList);
    // on<FetchColorEvent>(_fetchColorList);
    // on<FetchCutEvent>(_fetchCutList);
    // on<FetchSizeEvent>(_fetchSizeList);
    // on<FetchBatchEvent>(_fetchBatchList);
    on<SelectIngredientProdEvent>(_selectIngredientProd);
    // on<SelectPurityIngredientEvent>(_selectPurityIngredient);
    // on<SelectCutIngredientEvent>(_selectCutIngredient);
    // on<SelectColourIngredientEvent>(_selectColourIngredient);
    // on<SelectSizeIngredientEvent>(_selectSizeIngredient);
    // on<SelectStyleIngredientEvent>(_selectStyleIngredient);
    // on<SelectBatchIngredientEvent>(_selectBatchIngredient);
    on<ClearSelectedIngredientEvent>(_clearSelectedIngredient);
    // on<AddIngredientEvent>(_addIngredient);
    on<SendEstimateData>(_submitEstimationData);
    on<SelectAddressIndexEvent>(_selectAddressIndex);
    on<ClearSelectedAddressEvent>(_clearSelectAddressList);
    on<SaveCustomerDetailsEvent>(_saveCustomer);
    on<ChangeCheckBox>(_changeCheckBox);
    on<AddAddressEvent>(_addAddress);
    on<ResetDataEvent>(_resetData);
    on<ResetSelectedProductDataEvent>(_resetSelectedProductData);
  }

  //SelectIngredientProdEvent

  void _changeApiStatus(
    ApiStatusChangeEvent event,
    Emitter<EstimationState> emit,
  ) {
    emit(state.copyWith(apiDialogStatus: ApiStatus.initial));
  }

  /*FutureOr<void> _addCustomer(
      AddCustomerEvent event, Emitter<EstimationState> emit) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));

    Map<String, dynamic> body = {
      'customerName' : event.customerName,
      'mobileNo' : event.customerMobileNo,
      'creditLimit' : event.customerCreditLimit,
      'creditLimit' : event.customerCreditLimit,
    };
    await estimationRepository.addCustomer(body).then(
      (value) {
        var addCustomerModel = AddCustomerModel.fromJson(value);
        int index = 0;
        for (int i = 0;
            i <
                addCustomerModel
                    .data!.addressObjResponse!.primaryAddress!.length;
            i++) {
          if (addCustomerModel.data!.addressObjResponse!.primaryAddress![i] ==
              true) {
            index = i;
            break;
          }
        }

        emit(state.copyWith(
            apiDialogStatus: ApiStatus.success,
            customerId: "CUST001",
            customerName: addCustomerModel.data!.customerData!.customerName!,
            address: addCustomerModel
                .data!.addressObjResponse!.addressDetails![index].city));
      },
    ).onError(
      (error, stackTrace) {
        emit(
          state.copyWith(
            apiDialogStatus: ApiStatus.error,
            message: "Failed to add customer",
          ),
        );
      },
    );
  }*/

  FutureOr<void> _selectState(
    SelectStateEvent event,
    Emitter<EstimationState> emit,
  ) {
    debugPrint(
      "StateList===>${state.stateList![event.selectedIndex!].description}",
    );
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.success,
        stateName: state.stateList![event.selectedIndex!].description,
        stateCode: state.stateList![event.selectedIndex!].stateCode,
      ),
    );
    //emit(state.copyWith(stateName: ))
  }

  //_selectCountry
  FutureOr<void> _selectCountry(
    SelectCountryEvent event,
    Emitter<EstimationState> emit,
  ) {
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.success,
        countryName: state.countryList![event.selectedIndex!].countryName,
      ),
    );
    //emit(state.copyWith(stateName: ))
  }

  FutureOr<void> _selectSalesman(
    SelectSalesmanEvent event,
    Emitter<EstimationState> emit,
  ) {
    // debugPrint("StateList===>${state.stateList![event.selectedIndex!].description}");

    /*for (int i = 0; i < state.productListFormModel!.skuTax.length; i++) {
      if (state.productListFormModel!.skuTax[i].taxCode.toUpperCase() ==
          "IGST") {
        taxPercentage = state.productListFormModel!.skuTax[i].percentage;
        taxCode = state.productListFormModel!.skuTax[i].taxCode;
      }
    }*/

    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.success,
        // employee: state.employeeList![event.selectedIndex!],
        employee: state.filteredEmployeeList![event.selectedIndex!],
        // salesmanName: state.employeeList![event.selectedIndex!].eName,
        salesmanName: state.filteredEmployeeList![event.selectedIndex!].eName,
        // salesPersonId: state.employeeList![event.selectedIndex!].emplId.toString(),
        salesPersonId: state.filteredEmployeeList![event.selectedIndex!].emplId.toString(),
      ),
    );
    //emit(state.copyWith(stateName: ))
  }

  FutureOr<void> _selectCustomerGroup(
    SelectCustomerGroupEvent event,
    Emitter<EstimationState> emit,
  ) {
    debugPrint(
      "CustomerList===>${state.customerGroupList![event.selectedIndex!].groupCode}",
    );
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.loaded,
        selectedCustomerGroup: state.customerGroupList![event.selectedIndex!],
      ),
    );
  }

  List<Map<String, dynamic>> estimatePaymentList = [];

  FutureOr<void> _savePaymentDetails(
      SavePaymentDetails event,
      Emitter<EstimationState> emit,
      ) {
    final updatedPayments = List<Map<String, dynamic>>.from(state.payments);

    event.paymentsData.forEach((title, amount) {
      debugPrint("Title--->$title");
      debugPrint("Amount--->$amount");

      int mode = 0;
      final cleanTitle = title.trim().toLowerCase();

      if (cleanTitle == 'card') {
        mode = 1;
      } else if (cleanTitle == 'cash') {
        mode = 2;
      } else if (cleanTitle == 'cheque') {
        mode = 3;
      } else if (cleanTitle == 'adjustment') {
        mode = 5;
      } else if (cleanTitle == 'other') {
        mode = 4;
      }

      final estimatePayments = EstimatePayments(
        modeId: mode,
        amount: amount,
        estimationNumber: '',
      );

      updatedPayments.add(estimatePayments.toJson());
    });

    emit(state.copyWith(payments: updatedPayments));
  }


  FutureOr<void> _selectCustomer(
    SelectCustomerEvent event,
    Emitter<EstimationState> emit,
  ) {
    debugPrint(
      "CustomerList===>${state.customerList![event.selectedIndex!].customerName}",
    );
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.success,
        customerData: state.customerList![event.selectedIndex!],
        // customerName: state.customerList![event.selectedIndex!].customerName,
        // addressId: state.customerList![event.selectedIndex!].addressId,
        // address: state.customerList![event.selectedIndex!].address!.city,
        // customerId: state.customerList![event.selectedIndex!].id!.toString(),
      ),
    );
  }

  FutureOr<void> _fetchStateList(
    FetchStateList event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .fetchStateList(country: event.country!, search: event.search)
        .then((value) {
          debugPrint("STATE_VALUE==>$value");
          var stateModel = StateModel.fromJson(value);
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              stateList: stateModel.stateList,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  FutureOr<void> _logout(
    LogoutEvent event,
    Emitter<EstimationState> emit,
  ) async {
    await _initialize();
    emit(const EstimationState());
    selectedProductList = [];
    emit(
      const EstimationState(
        discountAmountList: [],
        discountPercentageList: [],
        lineAmountList: [],
        employeeList: [],
        totalQtyList: [],
        taxAmountList: [],
        productList: [],
        selectedProductList: [],
      ),
    );
  }

  Future<String> getDeviceId() async {
    SharedPreferencesHelper.init();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id; // Unique Android device ID
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor!; // Unique iOS device ID
    }
    return "Unknown_Device";
  }

  /// Function to connect to WebSocket and send the device ID
  Future<bool> connectToWebSocket(String deviceId) async {
    try {
      debugPrint("DeviceId-->$deviceId");

      final wsUrl = Uri.parse('${ApiEndPoints.SOCKET_BASE_URL}=$deviceId');
      final channel = WebSocketChannel.connect(wsUrl);

      await channel
          .ready; // Ensures the connection is successful before returning

      channel.sink.done.then((_) {
        debugPrint("Socket Disconnect");
      });

      channel.stream.listen(
        (event) {
          debugPrint("event-->$event");
        },
        onDone: () {
          debugPrint("Socket Disconnect");
        },
        onError: (error) {
          debugPrint("WebSocket ERROR: $error");
        },
        cancelOnError: true,
      );

      return true;
    } catch (error) {
      debugPrint("WebSocket connection failed: $error");
      return false;
    }
  }

  Future<bool> _initialize() async {
    String deviceId = await getDeviceId(); // Fetch Device ID
    bool isConnected = await connectToWebSocket(
      deviceId,
    ); // Connect to WebSocket

    if (isConnected) {
      SharedPreferencesHelper.saveString(AppConstants.DEVICE_ID, deviceId);
    }
    debugPrint("isConnected------>$isConnected");
    return isConnected;
  }

  //GenerateEstimationNumber
  FutureOr<void> _fetchCountryList(
    FetchCountryList event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .fetchCountryList()
        .then((value) {
          debugPrint("Country_VALUE==>$value");
          var countryModel = CountryModel.fromJson(value);
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              countryList: countryModel.countryList,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  FutureOr<void> _fetchSkuDetails(
    FetchSkuDetailsEvent event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading,skuDetails: null));

    String lecode = SharedPreferencesHelper.getString(
      AppConstants.LEGAL_ENTITY,
    )!;
    String warehouse = SharedPreferencesHelper.getString(
      AppConstants.WAREHOUSE,
    )!;

    Map<String, dynamic> body = {
      "pvWH": warehouse,
      "pvLeCode": lecode,
      "pvSKUNumber": event.skuCode,
    };
    debugPrint("event.fromView--->${event.fromView}");
    debugPrint(
      "DiscountAmount---->${state.skuDetails?.discountAmount ?? "0.87878"}",
    );
    // debugPrint("state.discountAmount--->${state.skuDetails!.discountAmount}");
    if (event.fromView != false) {
      var value = selectedProductList.where(
        (product) => product.skuDetails?.sKUNumber == event.skuCode,
      );
      //.toList();
      debugPrint("VALUE--->$value");
      var productJson = value.first.toJson();
      debugPrint("productJson--->$productJson");
      var productListFormModel = ProductListFormModel.fromJson(productJson);

      double totalDiamondQtyValue = 0.0;
      double totalStoneQtyValue = 0.0;

      // Check if `skuSubdetails` is not null to avoid null pointer exceptions
      if (productListFormModel.skuSubdetails != null) {
        for (var subDetails in productListFormModel.skuSubdetails!) {
          if (subDetails.product_indicator == "Diamond") {
            debugPrint(
              "Diamond Indicator: Quantity -> ${subDetails.subDQty}, Value -> ${subDetails.subDCvalue}",
            );

            // Ensure null safety for quantities and values
            totalDiamondQtyValue += subDetails.subDQty ?? 0.0;

            debugPrint("Total Diamond Quantity: $totalDiamondQtyValue");
          }

          if (subDetails.product_indicator == "Stone") {
            debugPrint(
              "Stone Indicator: Quantity -> ${subDetails.subDQty}, Value -> ${subDetails.subDCvalue}",
            );

            // Ensure null safety for quantities and values
            totalStoneQtyValue += subDetails.subDQty ?? 0.0;
          }
        }
      }

      debugPrint("Final Total Diamond Quantity: $totalDiamondQtyValue");
      debugPrint("Final Total Stone Quantity: $totalStoneQtyValue");

      // Update the product list form model with the calculated values
      productListFormModel.skuDetails?.totalDiamondQty = totalDiamondQtyValue;
      productListFormModel.skuDetails?.totalStoneQty = totalStoneQtyValue;

      debugPrint(
        "productListFormModel--->${productListFormModel.skuDetails!.totalDiamondQty}",
      );
      debugPrint(
        "productListFormModel--->${productListFormModel.skuDetails!.totalStoneQty}",
      );
      emit(
        state.copyWith(
          apiDialogStatus: ApiStatus.success,
          skuDetails: productListFormModel.skuDetails,
          productListFormModel: productListFormModel,
        ),
      );
    } else {
      await estimationRepository
          .fetchSkuDetails(body)
          .then((value) {
            try {
              // Deserialize the response into your model
              var productListFormModel = ProductListFormModel.fromJson(value);
              debugPrint("Fetched Data: ${value.toString()}");
              debugPrint(
                "Product List Form Model SKU Number: ${productListFormModel.skuDetails?.sKUNumber}",
              );

              double totalDiamondQtyValue = 0.0;
              double totalStoneQtyValue = 0.0;

              // Check if `skuSubdetails` is not null to avoid null pointer exceptions
              if (productListFormModel.skuSubdetails != null) {
                for (var subDetails in productListFormModel.skuSubdetails!) {
                  if (subDetails.product_indicator == "Diamond") {
                    debugPrint(
                      "Diamond Indicator: Quantity -> ${subDetails.subDQty}, Value -> ${subDetails.subDCvalue}",
                    );

                    // Ensure null safety for quantities and values
                    totalDiamondQtyValue += subDetails.subDQty ?? 0.0;

                    debugPrint("Total Diamond Quantity: $totalDiamondQtyValue");
                  }

                  if (subDetails.product_indicator == "Stone") {
                    debugPrint(
                      "Stone Indicator: Quantity -> ${subDetails.subDQty}, Value -> ${subDetails.subDCvalue}",
                    );

                    // Ensure null safety for quantities and values
                    totalStoneQtyValue += subDetails.subDQty ?? 0.0;
                  }
                }
                if (productListFormModel.skuDiscount!.desc!
                    .toLowerCase()
                    .contains("line")) {}
              }

              debugPrint("Final Total Diamond Quantity: $totalDiamondQtyValue");
              debugPrint("Final Total Stone Quantity: $totalStoneQtyValue");

              // Update the product list form model with the calculated values
              productListFormModel.skuDetails?.totalDiamondQty =
                  totalDiamondQtyValue;
              productListFormModel.skuDetails?.totalStoneQty =
                  totalStoneQtyValue;

              // Emit the updated state
              emit(
                state.copyWith(
                  apiDialogStatus: ApiStatus.success,
                  skuDetails: productListFormModel.skuDetails,
                  productListFormModel: productListFormModel,
                ),
              );

              debugPrint(
                "Updated SKU Details SKU Number: ${state.skuDetails?.sKUNumber}",
              );
            } catch (e) {
              debugPrint("Error processing SKU details: $e");
              emit(
                state.copyWith(
                  apiDialogStatus: ApiStatus.error,
                  message: "Error processing data",
                ),
              );
            }
          })
          .onError((error, stackTrace) {
            debugPrint("Error fetching SKU details: $error");
            emit(
              state.copyWith(
                apiDialogStatus: ApiStatus.error,
                message: "Error fetching data",
              ),
            );
          });
    }
  }

  FutureOr<void> _fetchAddressList(
    FetchAddressListEvent event,
    Emitter<EstimationState> emit,
  ) async {
    debugPrint("apiStatus==>${state.apiStatus}");
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .fetchAddressList()
        .then((value) {
          debugPrint("STATE_VALUE==>$value");
          var addressListModel = AddressModel.fromJson(value);
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.loaded,
              addressList: addressListModel.addressList,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  List<AddressList> selectedAddressList = [];

  FutureOr<void> _selectedAddressList(
    SelectAddressEvent event,
    Emitter<EstimationState> emit,
  ) async {
    AddressList selectedAddress = state.addressList![event.selectedIndex!];
    if (!selectedAddressList.contains(selectedAddress)) {
      selectedAddressList.add(selectedAddress);
      debugPrint("Address added to selectedAddressList");
    } else {
      debugPrint("Address is already in the selectedAddressList");
    }

    for (int i = 0; i < selectedAddressList.length; i++) {
      debugPrint("_selectedAddressList_$i-->${selectedAddressList[i].city}");
    }
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.initial,
        selectedAddressList: selectedAddressList,
      ),
    );
  }

  FutureOr<void> _fetchCustomerList(
    FetchCustomerListEvent event,
    Emitter<EstimationState> emit,
  ) async {
    debugPrint("Api_status==>${state.apiStatus}");
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .fetchCustomerList()
        .then((value) {
          var customerListModel = CustomerListModel.fromJson(value);
          debugPrint("Customer_List_VALUE==>$customerListModel");
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              customerList: customerListModel.customerList!,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  FutureOr<void> _fetchCustomerGroupList(
    FetchCustomerGroupEvent event,
    Emitter<EstimationState> emit,
  ) async {
    debugPrint("Api_status==>${state.apiStatus}");
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .fetchCustomerGroupList()
        .then((value) {
          var customerGroupModel = CustomerGroupModel.fromJson(value);
          debugPrint("Customer_Group_VALUE==>$customerGroupModel");
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              customerGroupList: customerGroupModel.customerGroupList!,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  /*FutureOr<void> _fetchProductList(
      FetchProductListEvent event, Emitter<EstimationState> emit) async {
    // debugPrint("Api_status==>${state.apiStatus}");
      emit(state.copyWith(apiDialogStatus: ApiStatus.loading*/ /*,productList:[]*/ /*));
    // state.productList!.clear();
    await estimationRepository.fetchProductList(event.search).then(
      (value) {
        debugPrint("VALUE==>$value");
        // var productModel = ProductModel.fromJson(value);
        var productModel = ProductListDataModel.fromJson(value);
        // debugPrint(
        //     "Product_List_VALUE==>${productModel.productList![0].skuEntryNo}");
        emit(
          state.copyWith(
            apiDialogStatus: ApiStatus.success,
            productList: productModel.productList!,
          ),
        );
      },
    ).onError(
      (error, stackTrace) {
        debugPrint("PRODUCT_ERROR-->$error");
        emit(
          state.copyWith(
            apiDialogStatus: ApiStatus.error,
            message: "Getting some errors",
          ),
        );
      },
    );
  }*/

  FutureOr<void> _fetchProductList(
    FetchProductListEvent event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .fetchProductList(event.search)
        .then((value) {
          final productModel = ProductListDataModel.fromJson(value);
          final list = productModel.productList ?? [];
          debugPrint("PRODUCT_LENGTH-->${list.length}");
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              productList: list,
              filteredProductList: list, // show full list initially
            ),
          );
        })
        .onError((error, stackTrace) {
          debugPrint("PRODUCT_ERROR-->$error");
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  List<ProductList> searchProductList(
    List<ProductList>? productList,
    String query,
  ) {
    if (productList == null || productList.isEmpty || query.isEmpty) {
      return productList ?? [];
    }

    final lowerQuery = query.toLowerCase();

    return productList.where((product) {
      //final prodName = product.prodName?.toLowerCase() ?? '';
      final skuNumber = product.sKUNumber?.toLowerCase() ?? '';

      return /*prodName.contains(lowerQuery) ||*/ skuNumber.contains(
        lowerQuery,
      );
    }).toList();
  }

  /*FutureOr<void> _searchProduct(
      SearchProductEvent event,
      Emitter<EstimationState> emit,
      ) {
    final filteredList = searchProductList(state.productList, event.query);
    for (var product in filteredList) {
      debugPrint("Filtered Product: ${product.sKUNumber}");
    }
    debugPrint("filteredList==>${filteredList.length}");
    emit(state.copyWith(filteredProductList: filteredList));
  }*/

  FutureOr<void> _searchProduct(
    SearchProductEvent event,
    Emitter<EstimationState> emit,
  ) {
    final String skuQuery = (event.skuQuery ?? '').trim();
    final String qtyQuery = (event.qtyQuery ?? '').trim();

    // Parse qty text to number (works for "3" and "3.0")
    final num? typedQty = qtyQuery.isNotEmpty ? num.tryParse(qtyQuery) : null;

    debugPrint(
      "skuQuery ==> $skuQuery | qtyQuery ==> $qtyQuery | typedQty ==> $typedQty",
    );

    num? _asNum(dynamic v) {
      if (v == null) return null;
      if (v is num) return v;
      if (v is String) return num.tryParse(v.trim());
      return num.tryParse(v.toString());
    }

    final list = state.productList ?? [];

    final filteredList = list.where((product) {
      // SKU match (contains)
      final sku = (product.sKUNumber ?? '').toString();
      final matchesSku = skuQuery.isNotEmpty
          ? sku.toLowerCase().contains(skuQuery.toLowerCase())
          : true;

      // QTY match (exact numeric equality)
      bool matchesQty = true;
      if (typedQty != null) {
        final pq = _asNum(product.qty);
        matchesQty = pq != null && pq == typedQty;
        // Helpful debug:
        // debugPrint("SKU ${product.sKUNumber}: pq=$pq == typedQty=$typedQty ? $matchesQty");
      }

      return matchesSku && matchesQty; // both when both queries present
    }).toList();

    debugPrint("filteredList ==> ${filteredList.length}");
    emit(state.copyWith(filteredProductList: filteredList));
  }

  /*FutureOr<void> _searchProduct(
      SearchProductEvent event,
      Emitter<EstimationState> emit,
      ) {
    final skuQuery = event.skuQuery.trim();
    final qtyQuery = event.qtyQuery?.trim();

    debugPrint("skuQuery ==> $skuQuery and qtyQuery ==> $qtyQuery");


    final filteredList = state.productList!.where((product) {
      final matchesSku = skuQuery.isNotEmpty
          ? product.sKUNumber!.toLowerCase().contains(skuQuery.toLowerCase())
          : true;

      debugPrint("matchesSku ==> $matchesSku");

      final matchesQty = qtyQuery != null && qtyQuery.isNotEmpty
          ? product.qty.toString() == qtyQuery // exact match
          : true;

      debugPrint("matchesQty ==> $matchesQty");

      // both must match
      return matchesSku && matchesQty;
    }).toList();

    for (var product in filteredList) {
      debugPrint("Filtered Product: ${product.sKUNumber} | Qty: ${product.qty}");
    }
    debugPrint("filteredList ==> ${filteredList.length}");

    emit(state.copyWith(filteredProductList: filteredList));
  }*/

  FutureOr<void> _fetchSalesmanList(
    FetchSalesmanListEvent event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .getSalesmanList(event.search)
        .then((value) {
          debugPrint("EMPLOYEE_VALUE==>$value");
          var salesmanModel = SalesmanModel.fromJson(value);
          final list = salesmanModel.employeeList! ?? [];
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              employeeList: list,
              filteredEmployeeList: list,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  List<EmployeeList> searchEmployeeList(
    List<EmployeeList>? employeeList,
    String query,
  ) {
    if (employeeList == null || employeeList.isEmpty || query.isEmpty) {
      return employeeList ?? [];
    }

    final lowerQuery = query.toLowerCase();

    return employeeList.where((employee) {
      //final prodName = product.prodName?.toLowerCase() ?? '';
      final employeeName = employee.eName!.toLowerCase() ?? '';

      return /*prodName.contains(lowerQuery) ||*/ employeeName.contains(
        lowerQuery,
      );
    }).toList();
  }

  FutureOr<void> _searchEmployee(
    SearchEmployeeEvent event,
    Emitter<EstimationState> emit,
  ) {
    final filteredList = searchEmployeeList(state.employeeList, event.search);
    for (var employee in filteredList) {
      debugPrint("Filtered Product: ${employee.eName}");
    }
    debugPrint("filteredList==>${filteredList.length}");
    emit(state.copyWith(filteredEmployeeList: filteredList));
  }

  // List<ProductList> selectedProductList = [];
  List<ProductListFormModel> selectedProductList = [];
  List<double> rotationAngle = [];
  List<double> lineAmount = [];
  List<double> taxAmount = [];
  List<double> discountAmount = [];
  List<double> discountPercentageList = [];
  List<double> totalQty = [];

  /*FutureOr<void> _skuSaveForList(SkuSaveForListEvent event,
      Emitter<EstimationState> emit) {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));

    */ /*if (!selectedProductList
        // .contains(state.productList![event.selectedIndex!])) {
        .contains(state.productListFormModel!.skuDetails!.skuNumber)) {*/ /*
    if (!selectedProductList.any((product) =>
    product.skuDetails!.skuNumber ==
        state.productListFormModel!.skuDetails!.skuNumber)) {
      selectedProductList.add(state.productListFormModel!);

      debugPrint(
          "SELECTED_PRODUCT--->${selectedProductList[0].skuSubdetails!.length}");
      rotationAngle.add(360.0);
      taxAmount.add(event.taxAmount!);
      lineAmount.add(event.lineAmount!);
      totalQty.add(event.qty!);
      discountAmount.add(event.discountAmount!);

      // state.skuDetails!.totalAmount! = 0.0;
      state.skuDetails!.totalAmount = event.lineAmount!;
      state.skuDetails!.taxableAmount = (event.lineAmount! - event.taxAmount!);
      state.skuDetails!.discountAmount = event.discountAmount!;
      state.skuDetails!.taxAmount = event.taxAmount!;

      emit(
        state.copyWith(
            apiDialogStatus: ApiStatus.success,
            selectedProductList: selectedProductList,
            rotationAngle: rotationAngle,
            taxAmountList: taxAmount,
            discountAmountList: discountAmount,
            totalQtyList: totalQty,
            lineAmountList: lineAmount),
      );
      debugPrint("${rotationAngle.length}");
      debugPrint("Product added to selectedProductList");
    } else {
      debugPrint("Product is already in the selectedProductList");
      emit(state.copyWith(
          apiDialogStatus: ApiStatus.error,
          message: "Product is already in the list."));
    }

    // debugPrint("selectedProductList-->${selectedProductList[0].miscCharge!.length}");
  }*/
  FutureOr<void> _skuSaveForList(
    SkuSaveForListEvent event,
    Emitter<EstimationState> emit,
  ) {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));

    // Check if the product already exists in the selectedProductList

    final existingProductIndex = selectedProductList.indexWhere(
      (product) {
        debugPrint("existingProductIndex001-->${product.skuDetails!.sKUNumber ==
            state.productListFormModel!.skuDetails!.sKUNumber}");
        return product.skuDetails!.sKUNumber ==
            state.productListFormModel!.skuDetails!.sKUNumber;
      }
    );

    debugPrint("DISCOUNT_AMOUNT-->${event.discountAmount}");
    debugPrint("TOTAL_AMOUNT-->${event.lineAmount}");
    debugPrint("TAXABLE_AMOUNT-->${(event.lineAmount! - event.taxAmount!)}");
    debugPrint("TAX_AMOUNT-->${event.taxAmount}");
    debugPrint("existingProductIndex-->$existingProductIndex");

    if (existingProductIndex != -1) {
      // Update the existing product values
      final updatedProduct = state.productListFormModel!.copyWith(
        skuDetails: state.productListFormModel!.skuDetails!.copyWith(
          totalAmount: event.lineAmount!,
          taxableAmount: (event.lineAmount! - event.taxAmount!),
          discountAmount: event.discountAmount!,
          discountPercentage: event.discountPercentage!,
          taxAmount: event.taxAmount!,
        ),
      );

      selectedProductList[existingProductIndex] = updatedProduct;

      taxAmount[existingProductIndex] = event.taxAmount!;
      lineAmount[existingProductIndex] = event.lineAmount!;
      totalQty[existingProductIndex] = event.qty!;
      discountAmount[existingProductIndex] = event.discountAmount!;
      discountPercentageList[existingProductIndex] = event.discountPercentage!;

      // SharedPreferencesHelper.saveString(AppConstants.DiscountAmount, state.skuDetails!.discountAmount.toString());

      emit(
        state.copyWith(
          apiDialogStatus: ApiStatus.success,
          selectedProductList: selectedProductList,
          rotationAngle: rotationAngle,
          taxAmountList: taxAmount,
          discountAmountList: discountAmount,
          discountPercentageList: discountPercentageList,
          totalQtyList: totalQty,
          lineAmountList: lineAmount,
        ),
      );
      debugPrint("Product updated in selectedProductList");
    } else {
      // Add the new product to the list
      selectedProductList.add(state.productListFormModel!);

      rotationAngle.add(360.0);
      taxAmount.add(event.taxAmount!);
      lineAmount.add(event.lineAmount!);
      totalQty.add(event.qty!);
      discountAmount.add(event.discountAmount!);
      discountPercentageList.add(event.discountPercentage!);

      state.skuDetails!.totalAmount = event.lineAmount!;
      state.skuDetails!.taxableAmount = (event.lineAmount! - event.taxAmount!);
      state.skuDetails!.discountAmount = event.discountAmount!;
      state.skuDetails!.discountPercentage = event.discountPercentage!;
      state.skuDetails!.taxAmount = event.taxAmount!;

      debugPrint("DiscountAmount---->${state.skuDetails!.discountAmount}");
      // SharedPreferencesHelper.saveString(AppConstants.DiscountAmount, state.skuDetails!.discountAmount.toString());

      emit(
        state.copyWith(
          apiDialogStatus: ApiStatus.success,
          selectedProductList: selectedProductList,
          rotationAngle: rotationAngle,
          taxAmountList: taxAmount,
          discountAmountList: discountAmount,
          discountPercentageList: discountPercentageList,
          totalQtyList: totalQty,
          lineAmountList: lineAmount,
        ),
      );
      debugPrint("Product added to selectedProductList");
    }
  }

  FutureOr<void> _changeAngle(
    ChangeAngle event,
    Emitter<EstimationState> emit,
  ) {
    final updatedRotationAngle = List<double>.from(state.rotationAngle!);
    // updatedRotationAngle[event.selectedIndex!] = updatedRotationAngle[event.selectedIndex!] == 360.0 ? 180.0 : 360.0;
    //rotationAngle[event.selectedIndex!] = rotationAngle[event.selectedIndex!] == 360.0 ? 180.0: 360.0;
    for (int i = 0; i < updatedRotationAngle.length; i++) {
      if (i == event.selectedIndex) {
        // Toggle between 360.0 and 180.0 for the selected index
        updatedRotationAngle[i] = updatedRotationAngle[i] == 360.0
            ? 180.0
            : 360.0;
      } else {
        // Set all other items to 360.0
        updatedRotationAngle[i] = 360.0;
      }
    }
    debugPrint("ChangeAngle-->${rotationAngle[event.selectedIndex!]}");
    emit(state.copyWith(rotationAngle: updatedRotationAngle));
  }

  FutureOr<void> _deleteSelectedProd(
    DeleteFromSelectedProduct event,
    Emitter<EstimationState> emit,
  ) {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    debugPrint("Before_Size-->${selectedProductList[event.selectedIndex!]}");

    // Remove the ingredient from the list directly
    selectedProductList.removeAt(event.selectedIndex!);
    rotationAngle.removeAt(event.selectedIndex!);
    lineAmount.removeAt(event.selectedIndex!);
    discountAmount.removeAt(event.selectedIndex!);
    discountPercentageList.removeAt(event.selectedIndex!);

    // debugPrint("After_Size-->${selectedProductList[event.selectedIndex!]}");

    // To ensure the state detects the change, create a new list reference
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.success,
        selectedProductList: List.from(selectedProductList),
      ),
    );
  }

  FutureOr<void> _fetchMiscList(
    FetchMisList event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .fetchMiscList()
        .then((value) {
          debugPrint("Misc_VALUE==>$value");
          var miscModel = MiscModel.fromJson(value);
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              miscList: miscModel.miscList,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  FutureOr<void> _selectMiscProduct(
    SelectMiscEvent event,
    Emitter<EstimationState> emit,
  ) {
    debugPrint(
      "MiscList===>${state.miscList![event.selectedIndex!].miscChargeCode}",
    );
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.success,
        misProd: state.miscList![event.selectedIndex!],
      ),
    );
  }

  List<IngredientList> selectedIngredientList = [];

  FutureOr<void> _selectIngredientProd(
    SelectIngredientProdEvent event,
    Emitter<EstimationState> emit,
  ) {
    // IngredientList ingredient = state.ingredientList![event.selectedIndex!];
    // selectedIngredientList.add(ingredient);
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.success,
        prodCode: state.ingredientList![event.selectedIndex!].prodCode,
        prodName: state.ingredientList![event.selectedIndex!].prodName,
        selectIngredient: state.ingredientList![event.selectedIndex!],
      ),
    );
  }

  FutureOr<void> _fetchIngredientList(
    FetchIngredientEvent event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    await estimationRepository
        .fetchIngredientList()
        .then((value) {
          var ingredientModel = IngredientModel.fromJson(value);
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              ingredientList: ingredientModel.ingredientList,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(apiDialogStatus: ApiStatus.error));
        });
  }

  FutureOr<void> _clearSelectedIngredient(
    ClearSelectedIngredientEvent event,
    Emitter<EstimationState> emit,
  ) {
    debugPrint("_clearSelectedIngredient--->");
    emit(state.copyWith(selectIngredient: null));
    debugPrint("_clearSelectedIngredient--->${state.selectIngredient}");
  }

  FutureOr<void> _clearSelectAddressList(
    ClearSelectedAddressEvent event,
    Emitter<EstimationState> emit,
  ) {
    emit(state.copyWith(selectedAddressList: [], selectAddressIndex: null));
  }

  FutureOr<void> _generateEstimationNumber(
    GenerateEstimationNumber event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    String lecode = SharedPreferencesHelper.getString(
      AppConstants.LEGAL_ENTITY,
    )!;
    String warehouse = SharedPreferencesHelper.getString(
      AppConstants.WAREHOUSE,
    )!;

    Map<String, dynamic> body = {"pvWarehouse": warehouse, "pvLeCode": lecode};

    await estimationRepository
        .generateEstimationNumber(body)
        .then((value) {
          debugPrint("ESTIMATE_NUMBER==>$value");
          //var stateModel = StateModel.fromJson(value);
          String generatedNumber = value["GeneratedNumber"]["GeneratedNumber"];
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.success,
              estimationNumber: generatedNumber,
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: "Getting some errors",
            ),
          );
        });
  }

  Future<String> generateEstimationNumber() async {
    String leCode = SharedPreferencesHelper.getString(
      AppConstants.LEGAL_ENTITY,
    )!;
    String warehouse = SharedPreferencesHelper.getString(
      AppConstants.WAREHOUSE,
    )!;

    final body = {"pvWarehouse": warehouse, "pvLeCode": leCode};

    try {
      // final response = await repository.generateEstimationNumber(body);
      final response = await estimationRepository.generateEstimationNumber(
        body,
      );
      return response["GeneratedNumber"];
    } catch (e) {
      throw Exception("Failed to generate estimation number");
    }
  }

  FutureOr<void> _submitEstimationData(
    SendEstimateData event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    final generatedNumber = await generateEstimationNumber();

    double totalTaxAmount = 0.0;
    for (int i = 0; i < state.taxAmountList!.length; i++) {
      totalTaxAmount += state.taxAmountList![i];
    }

    double totalDiscountAmount = 0.0;
    for (int i = 0; i < state.discountAmountList!.length; i++) {
      totalDiscountAmount += state.discountAmountList![i];
    }

    double totalAmount = 0.0;
    for (int i = 0; i < state.lineAmountList!.length; i++) {
      totalAmount += state.lineAmountList![i];
    }

    // Preparing estimation entry
    EstimationEntryBody estimationEntry = EstimationEntryBody(
      estnumber: generatedNumber,
      //state.estimationNumber!,
      // employee: "",//state.employee!.emplId!,//state.estimationNumber!,
      currency: "INR",
      exchangerate: 1,
      mobileno: int.parse(SharedPreferencesHelper.getString(AppConstants.MOBILE_NO)!),
      warehouse: SharedPreferencesHelper.getString(AppConstants.WAREHOUSE)!,
      taxper: 0.00,
      taxamount: double.parse(totalTaxAmount.toStringAsFixed(2)),
      disper: "0.00",
      disamount: double.parse(totalDiscountAmount.toStringAsFixed(2)),
      estamount: double.parse(totalAmount.toStringAsFixed(2)),
      leCode: SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY)!,
      details: "",
      inuse: 0.00,
      placeOfSupply: state.stateCode ?? "",
      userCode: 'NIM'//SharedPreferencesHelper.getString(AppConstants.USER_NAME)!,
    );

    // Initialize lists outside the loop
    //List<EstimationDetails> estimateDetails = [];

    // Loop through selected product list to construct details
    List<Map<String, dynamic>> estimateDetailsList = [];
    // List<Map<String, dynamic>> estimatePaymentList = [];
    for (var product in selectedProductList) {
      double miscTotalAmount = 0.00;
      /*for (int i = 0; i < product.skuMisc!.length; i++) {
        miscTotalAmount += product.skuMisc![i].Amount!;
      }*/

      // Prepare estimate product details
      EstimateProductDetailsBody productDetails = EstimateProductDetailsBody(
        prodCode: product.skuDetails!.sKUNumber,
        //product.skuDetails!.prodCode,
        purity: product.skuDetails!.purity,
        size: product.skuDetails!.size,
        cut: product.skuDetails!.cut,
        colour: product.skuDetails!.colour,
        style: product.skuDetails!.style,
        batchNo: product.skuDetails!.batchNo,
        warehouse: SharedPreferencesHelper.getString(AppConstants.WAREHOUSE)!,
        pcs: product.skuDetails!.pcs,
        qty: product.skuDetails!.qty,
        nett: product.skuDetails!.nett,
        rate: product.skuDetails!.rate,
        ctype: int.parse(product.skuDetails!.ctype!),
        cvalue: double.parse(product.skuDetails!.cvalue!.toStringAsFixed(2)),
        mkrate: product.skuDetails!.makingRate,
        mktype: int.parse(product.skuDetails!.makingType!),
        mkvalue: double.parse(product.skuDetails!.mkValue!.toStringAsFixed(2)),
        stonevalue: double.parse(
          product.skuDetails!.stoneValue?.toStringAsFixed(2) ?? "0.00",
        ),
        diamondvalue: double.parse(
          product.skuDetails!.diamondValue?.toStringAsFixed(2) ?? "0.00",
        ),
        // wastageper: 1.5,
        // wastagevalue: 50.0,
        taxcode:
            (SharedPreferencesHelper.getString(
                  AppConstants.WAREHOUSE_STATE_CODE,
                ) !=
                state.stateCode)
            ? "IGST"
            : "GST",
        taxamount: double.parse(
          product.skuDetails!.taxAmount!.toStringAsFixed(2),
        ),
        disper: product.skuDetails!.discountPercentage!.toStringAsFixed(2),
        //"0.00",
        disamount: double.parse(
          product.skuDetails!.discountAmount!.toStringAsFixed(2),
        ),
        lineamount: product.skuDetails!.totalAmount!.toStringAsFixed(2),
        miscamount: double.parse(miscTotalAmount.toStringAsFixed(2)),
        leCode: SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY)!,
        // purpose: "Sale",
        ingredient: 1,
        employeeCode: state.employee!.emplId!,
        // othervalue: "0.0",
        // pricePoint: "5000",
        // roundoff: 0.0,
        taxablevalue: double.parse(
          product.skuDetails!.taxableAmount!.toStringAsFixed(2),
        ),
        // roundedtaxablevalue: 5000.0,
        // disCalType: 1,
        disamountAftertax: "0.00",
        // disaftertax: "90.0",
      );
      // EstimationSubDetailsBody subDetails = EstimationSubDetailsBody();

      List<EstimationSubDetailsBody> subDetailsList = [];
      for (var ingredient in product.skuSubdetails!) {
        EstimationSubDetailsBody subDetails = EstimationSubDetailsBody(
          // estlinenumber: 1,
          // linenumber: 1,
          prodCode: ingredient.subDProdCode,
          //"P002",
          purity: ingredient.SubD_Purity,
          size: ingredient.subDSize,
          cut: ingredient.subDCut,
          colour: ingredient.subDColour,
          style: ingredient.subDStyle,
          batchNo: ingredient.SubD_Batch_No,
          pcs: ingredient.subDPcs,
          qty: ingredient.subDQty,
          nett: ingredient.subDNett,
          // ctype: int.parse(ingredient.subDCtype ?? ""),
          rate: ingredient.subDRate,
          // cvalue: double.parse(ingredient.subDCvalue!.toStringAsFixed(2)),
          //cvalue,
          leCode: SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY)!,
          // pricePoint: "4000",
        );
        if (subDetails.purity != null) {
          subDetailsList.add(subDetails);
        }
      }

      debugPrint("state.payments===>${state.payments.toString()}");

      // EstimationMiscChargeBody miscCharge = EstimationMiscChargeBody();
      List<EstimationMiscChargeBody> miscChargeList = [];
      /*for (var misc in product.skuMisc!) {
        EstimationMiscChargeBody miscCharge = EstimationMiscChargeBody(
          // estlinenumber: 1,
          linenumber: misc.LineNumber,
          miscChrgCode: misc.MiscCode,
          amount: misc.Amount,
          leCode: SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY)!,
        );
        miscChargeList.add(miscCharge);
      }*/

      // EstimationTaxDetailsBody taxDetails = EstimationTaxDetailsBody();
      List<EstimationTaxDetailsBody> taxDetailsList = [];

      for (var tax in product.skuTax!) {
        EstimationTaxDetailsBody taxDetails = EstimationTaxDetailsBody();
        if (tax.taxCode == "IGST") {
          taxDetails = EstimationTaxDetailsBody(
            // estlinenumber: 1,
            // linenumber: 1,
            taxCode: "IGST",
            // stateCode: "ST01",
            percentage: tax.percentage,
            calType: 3,
            taxType: 1,
            amount: tax.amount,
            //250.0,
            // formNo: "F001",
            leCode: SharedPreferencesHelper.getString(
              AppConstants.LEGAL_ENTITY,
            )!,
          );
        } else {
          if (tax.taxCode == "CGST") {
            taxDetails = EstimationTaxDetailsBody(
              // estlinenumber: 1,
              // linenumber: 1,
              taxCode: "CGST",
              // stateCode: "ST01",
              percentage: tax.percentage,
              calType: 3,
              taxType: 8,
              amount: tax.amount,
              // formNo: "F001",
              leCode: SharedPreferencesHelper.getString(
                AppConstants.LEGAL_ENTITY,
              )!,
            );
          } else if (tax.taxCode == "SGST") {
            taxDetails = EstimationTaxDetailsBody(
              // estlinenumber: 1,
              // linenumber: 1,
              taxCode: "CGST",
              // stateCode: "ST01",
              percentage: tax.percentage,
              calType: 3,
              taxType: 7,
              amount: tax.amount,
              // formNo: "F001",
              leCode: SharedPreferencesHelper.getString(
                AppConstants.LEGAL_ENTITY,
              )!,
            );
          }
        }
        taxDetailsList.add(taxDetails);
      }

      // Create the EstimateDetails object
      EstimateDetailsBody estimateDetails = EstimateDetailsBody(
        estimateProductDetails: productDetails,
        estimationSubDetails: subDetailsList,
        estimationMiscCharge: miscChargeList,
        estimationTaxDetails: taxDetailsList,
      );

      estimateDetailsList.add(estimateDetails.toJson());
    }

    // Prepare the request body
    Map<String, dynamic> body = {
      'estimationEntry': estimationEntry.toJson(),
      'estimateDetails': estimateDetailsList,
      'estimatePayments': state.payments,
    };

    debugPrint("BODY=======>$body");
    var jsonBody = jsonEncode(body);
    debugPrint("JSON_BODY=======>$jsonBody");

    // await estimationRepository.submitEstimationEntry(jsonEncode(body)).then(
    await estimationRepository
        .submitEstimationEntry(jsonEncode(body))
        .then((value) {
          debugPrint("ESTIMATION_ENTRY_RESPONSE===>$value");
          SharedPreferencesHelper.remove(AppConstants.DiscountAmount);
          SharedPreferencesHelper.remove(AppConstants.MOBILE_NO);
          EstimationResponseModel estimationResponseData =
              EstimationResponseModel.fromJson(value);

          emit(
            state.copyWith(
              apiStatus: ApiStatus.success,
              estimationResponseModel: estimationResponseData,
              //pdfData: value,
              message: "Saved data successfully",
            ),
          );
          selectedAddressList.clear();
          selectedIngredientList.clear();
          state.discountAmountList!.clear();
          state.discountAmountList!.clear();
          state.discountPercentageList!.clear();
          state.lineAmountList!.clear();
          state.employeeList!.clear();
          state.totalQtyList!.clear();
          state.taxAmountList!.clear();
          state.productList!.clear();
          state.selectedProductList!.clear();
          emit(
            EstimationState(
              discountAmountList: [],
              discountPercentageList: [],
              lineAmountList: [],
              employeeList: [],
              totalQtyList: [],
              taxAmountList: [],
              productList: [],
              selectedProductList: [],
            ),
          );
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(apiStatus: ApiStatus.error));
          debugPrint("ESTIMATION_ENTRY_ERROR===>$error");
        });
  }

  FutureOr<void> _selectAddressIndex(
    SelectAddressIndexEvent event,
    Emitter<EstimationState> emit,
  ) {
    for (int i = 0; i < selectedAddressList.length; i++) {
      if (i == event.selectedIndex) {
        selectedAddressList[i].isPrimary = true;
        // continue;
      } else {
        selectedAddressList[i].isPrimary = false;
      }
    }
    emit(
      state.copyWith(
        selectAddressIndex: event.selectedIndex,
        selectedAddressList: selectedAddressList,
      ),
    );
  }

  CustomerList customer = CustomerList();

  // Address address = Address();

  FutureOr<void> _saveCustomer(
    SaveCustomerDetailsEvent event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.loading));

    Map<String, dynamic> body = {
      "customerCode": "",
      "customerName": event.customerName,
      "customerGroup": state.selectedCustomerGroup!.groupCode,
      "mobileNo": event.mobileNo,
      "creditLimit": event.creditLimit,
      "dob": event.dob,
      "marraigeAnni": event.marriageAnniversary,
      "panNo": event.pan,
      "aadhaarNo": event.aadharNo,
      "address_data": state.selectedAddressList!
          .map(
            (value) => {
              "address_Type": 1,
              "address": value.toJson(),
              "primary_Address": value.isPrimary,
            },
          )
          .toList(),
    };

    debugPrint("ADD_CUSTOMER_BODY--->${jsonEncode(body)}");

    await estimationRepository
        .addCustomer(jsonEncode(body))
        .then((value) {
          if (value['success'] == false) {
            emit(
              state.copyWith(
                apiStatus: ApiStatus.error,
                message: value['errors'],
              ),
            );
            // emit(const EstimationState(selectAddressIndex: null,selectedAddressList: []));
          } else {
            emit(state.copyWith(apiStatus: ApiStatus.success));

            debugPrint(
              "customerId=>${value["data"]["customerData"]["customerCode"]}",
            );
            debugPrint(
              "customerName=>${value["data"]["customerData"]["customerName"]}",
            );
            debugPrint(
              "address=>${value["data"]["address_obj_response"]["address_details"][0]["street1"]}",
            );
            debugPrint(
              "addressId=>${value["data"]["address_obj_response"]["address_details"][0]["id"]}",
            );
            /*
    *  customerName: state.customerList![event.selectedIndex!].customerName,
        addressId: state.customerList![event.selectedIndex!].addressId,
        address: state.customerList![event.selectedIndex!].address!.city,
        customerId: state.customerList![event.selectedIndex!].id!.toString(),
    * */
            /*address = Address(
            id: value["data"]["address_obj_response"]["address_details"][0]
                ["id"],
            city: value["data"]["address_obj_response"]["address_details"][0]
                ["city"],
            street1: value["data"]["address_obj_response"]["address_details"][0]
                ["street1"],
            street2: value["data"]["address_obj_response"]["address_details"][0]
                ["street2"],
          );
          customer = CustomerList(
              address: address,
              id: value["data"]["customerData"]["id"],
              //value["data"]["address_obj_response"]["address_details"][0],
              customerCode: value["data"]["customerData"]["customerCode"],
              customerName: value["data"]["customerData"]["customerName"],
              panNo: value["data"]["customerData"]["panNo"]);*/
            emit(
              EstimationState(
                selectAddressIndex: null,
                selectedAddressList: const [],
                customerData: customer, //value["data"]["customerData"]
                // customerId: value["data"]["customerData"]["customerCode"],
                // customerName: value["data"]["customerData"]["customerName"],
                // address:
                //     "${value["data"]["address_obj_response"]["address_details"][0]["street1"]}",
                // //+ value["data"]["address_obj_response"]["address_details"]["street2"]}",
                // addressId: value["data"]["address_obj_response"]
                //     ["address_details"][0]["id"],
              ),
            );
            emit(state.copyWith(apiStatus: ApiStatus.initial));
          }
        })
        .onError((error, stackTrace) {
          emit(state.copyWith(apiStatus: ApiStatus.error));
          emit(EstimationState());
          debugPrint("ADD_CUSTOMER_ERROR===>$error");
        });
  }

  FutureOr<void> _changeCheckBox(
    ChangeCheckBox event,
    Emitter<EstimationState> emit,
  ) {
    emit(
      state.copyWith(
        apiDialogStatus: ApiStatus.initial,
        checkboxText: event.text,
      ),
    );
  }

  List<AddressList>? addressList;

  FutureOr<void> _addAddress(
    AddAddressEvent event,
    Emitter<EstimationState> emit,
  ) async {
    emit(state.copyWith(apiDialogStatus: ApiStatus.loading));
    addressList = state.addressList;

    Map<String, dynamic> body = {
      "city": event.city,
      "state_Code": event.stateId,
      "country": state.countryName, //"India",
      "street1": event.street1,
      "street2": event.street2,
      "door_No": event.doorNo,
      "house_No": event.houseNo,
      "phone1": event.phone1,
      "mobile1": event.mobile1,
      "phone2": event.phone2,
      "mobile2": event.mobile2,
      "fax": event.fax,
      "usercode": SharedPreferencesHelper.getString(AppConstants.USER_NAME),
      "lecode": SharedPreferencesHelper.getString(AppConstants.LEGAL_ENTITY),
      "email": event.email,
      "pincode": event.pincode,
    };
    await estimationRepository
        .addAddressEntry(jsonEncode(body))
        .then((value) {
          debugPrint("--->${state.addressList!.length}");
          // state.addressList!.insert(0, );
          if (value["success"] == true) {
            addressList!.insert(0, AddressList.fromJson(value["data"]));
            emit(
              state.copyWith(
                apiDialogStatus: ApiStatus.loaded,
                message: value["message"],
                addressList: addressList,
              ),
            );
          } else {
            emit(
              state.copyWith(
                apiDialogStatus: ApiStatus.error,
                message: value["message"],
              ),
            );
          }
          // emit(const EstimationState());
        })
        .onError((error, stackTrace) {
          debugPrint("ADD_ADDRESS_ERROR===>$error");
          emit(
            state.copyWith(
              apiDialogStatus: ApiStatus.error,
              message: error.toString(),
            ),
          );
        });
  }

  FutureOr<void> _resetData(
    ResetDataEvent event,
    Emitter<EstimationState> emit,
  ) {
    SharedPreferencesHelper.remove(AppConstants.DiscountAmount);
    SharedPreferencesHelper.remove(AppConstants.MOBILE_NO);
    emit(const EstimationState());
  }

  FutureOr<void> _checkRateSet(
    CheckRateSetEvent event,
    Emitter<EstimationState> emit,
  ) async {
    await estimationRepository
        .checkRateSet()
        .then((value) {
          emit(state.copyWith(isRateSet: value['rate']));
        })
        .onError((error, stackTrace) {
          debugPrint("CHECK_RATE_ERROR===>$error");
        });
  }

  FutureOr<void> _resetSelectedProductData(
    ResetSelectedProductDataEvent event,
    Emitter<EstimationState> emit,
  ) {
    selectedProductList = [];
    lineAmount = [];
    SharedPreferencesHelper.remove(AppConstants.DiscountAmount);
    // SharedPreferencesHelper.remove(AppConstants.MOBILE_NO);
    emit(
      state.copyWith(
        selectedProductList: selectedProductList,
        lineAmountList: lineAmount,
        salesmanName: "",
      ),
    );
  }
}
