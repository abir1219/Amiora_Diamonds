class ApiEndPoints {
  // static const LOGIN_BASE_URL = "http://cloud24k.com/api/";

  static final CLIENT_SOCKE_URL =
      "ws://192.168.0.41:8000/ws/online-users/?device_id";

  // static final TEST_SOCKE_URL = "ws://192.168.1.189:8001/ws/online-users/?device_id"; //Azam Local
  // static final TEST_SOCKE_URL = "ws://0a598a0f83f9.ngrok-free.app/ws/online-users/?device_id"; //Saibal Local
  // static final TEST_SOCKE_URL = "ws://192.168.1.180:8091/ws/online-users/?device_id"; // Saibal Local
  static final TEST_SOCKE_URL = "ws://192.168.1.189:8000/ws/online-users/?device_id"; // Saibal Local

  static final SOCKET_BASE_URL = CLIENT_SOCKE_URL;

  static final TEST_URL =
      // "http://crownestapi.cloud24k.com/api/estimations/";
      // "https://2fde4c9176c9.ngrok-free.app/api/estimations/"; // Saibal Local
  // "http://192.168.1.180:8091/api/estimations/"; // Saibal Local
  "http://192.168.1.189:8000/api/estimations/"; // Saibal Local
  // "https://86b4-136-232-65-198.ngrok-free.app/api/estimations/"; // Azam Local
  //  "https://0a598a0f83f9.ngrok-free.app/api/estimations/"; // Saibal Local
  static final CLIENT_URL = "http://192.168.0.41:8000/api/estimations/";
  static final BASE_URL = CLIENT_URL;
  static _ApiEndPoints authEndpoints = _ApiEndPoints();
}
//192.168.0.41:8000
class _ApiEndPoints {
  final String login = "login/v2/";
  final String stateList = "stateMasterList/";
  final String countryList = "countryList/";
  final String warehouseList = "warehouse/get-warehouses/";
  final String updatePassword = "user-info/update-password/";
  final String salesmanList = "sales-person/";
  final String estimationNumberGenerate = "estimate-seq/";
  final String addCustomer = "master/customerMaster/create_customer/";
  final String customerList = "customerMasterList/";
  final String customerGroupList = "customerGroup/";
  final String addressList = "addressList/";
  final String productList = "sku-list/";
  final String skuDetails = "sku-details/";
  final String miscList = "master/miscChargeMaster/";
  final String ingredientList = "sku/prodList/";
  final String purityMasterList = "master/PurityMaster/";
  final String sizeMasterList = "master/SizeMaster/";
  final String colorMasterList = "master/ColourMaster/";
  final String cutMasterList = "master/CutMaster/";
  final String styleMasterList = "master/StyleMaster/";
  final String batchMasterList = "master/BatchMaster/";
  final String createEstimationEntry = "estimate-create/";
  final String addAddress = "address-add/";
  final String checkRateSet = "alert/";
  final String STORE_LIST = "user-info/accessible/user-list/";
}
