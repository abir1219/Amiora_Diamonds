part of 'estimation_bloc.dart';

sealed class EstimationEvent extends Equatable {
  const EstimationEvent();
}

/* Fetch Data From Api */


final class CheckRateSetEvent extends EstimationEvent{
  @override
  List<Object?> get props => [];
}

final class FetchStateListEvent extends EstimationEvent {
  @override
  List<Object?> get props => [];
}

final class AddIngredientEvent extends EstimationEvent {
  final int? parentIndex;
  final int? piece;
  final String? quantity;
  final String? nett;
  final String? rate;
  final String? calculationTypeName;
  final String? calculationValue;

  const AddIngredientEvent(
      {this.piece,
      this.quantity,
      this.nett,
      this.parentIndex,
      this.rate,
      this.calculationTypeName,
      this.calculationValue});

  @override
  List<Object?> get props => [
        piece,
        quantity,
        nett,
        rate,
        calculationTypeName,
        calculationValue,
        parentIndex
      ];
}

class SearchProductEvent extends EstimationEvent {
  final String? skuQuery;
  final String? qtyQuery;

  const SearchProductEvent(this.skuQuery, this.qtyQuery);

  @override
  List<Object?> get props => [skuQuery,qtyQuery];
}

final class FetchSalesmanListEvent extends EstimationEvent {
  final String search;

  const FetchSalesmanListEvent({required this.search});

  @override
  List<Object?> get props => [];
}

class SearchEmployeeEvent extends EstimationEvent {
  final String search;

  const SearchEmployeeEvent({required this.search});

  @override
  List<Object?> get props => [search];
}

final class GenerateEstimationNumber extends EstimationEvent{
  @override
  List<Object?> get props => [];

}

final class FetchStateList extends EstimationEvent {
  final String? country;
  final String? search;

  const FetchStateList(this.country,this.search);

  @override
  List<Object?> get props => [country,search];
}

final class FetchCountryList extends EstimationEvent {
  const FetchCountryList();

  @override
  List<Object?> get props => [];
}

final class FetchAddressListEvent extends EstimationEvent {
  const FetchAddressListEvent();

  @override
  List<Object?> get props => [];
}

final class FetchCustomerListEvent extends EstimationEvent {
  const FetchCustomerListEvent();

  @override
  List<Object?> get props => [];
}

final class FetchIngredientEvent extends EstimationEvent {
  const FetchIngredientEvent();

  @override
  List<Object?> get props => [];
}

final class FetchPurityEvent extends EstimationEvent {
  const FetchPurityEvent();

  @override
  List<Object?> get props => [];
}

final class FetchCutEvent extends EstimationEvent {
  const FetchCutEvent();

  @override
  List<Object?> get props => [];
}

final class FetchStyleEvent extends EstimationEvent {
  const FetchStyleEvent();

  @override
  List<Object?> get props => [];
}

final class FetchColorEvent extends EstimationEvent {
  const FetchColorEvent();

  @override
  List<Object?> get props => [];
}

final class FetchSizeEvent extends EstimationEvent {
  const FetchSizeEvent();

  @override
  List<Object?> get props => [];
}

final class FetchBatchEvent extends EstimationEvent {
  const FetchBatchEvent();

  @override
  List<Object?> get props => [];
}

final class FetchCustomerGroupEvent extends EstimationEvent {
  const FetchCustomerGroupEvent();

  @override
  List<Object?> get props => [];
}

/* Select Data From List */

final class SelectAddressIndexEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectAddressIndexEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class LogoutEvent extends EstimationEvent {

  const LogoutEvent();

  @override
  List<Object?> get props => [];
}

final class SelectCustomerGroupEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectCustomerGroupEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class SelectCustomerEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectCustomerEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class FetchProductListEvent extends EstimationEvent {
  final String search;
  const FetchProductListEvent({required this.search});

  @override
  List<Object?> get props => [search];
}

final class FetchSkuDetailsEvent extends EstimationEvent {
  final String? skuCode;
  final bool? fromView;

  const FetchSkuDetailsEvent({this.fromView, this.skuCode});

  @override
  List<Object?> get props => [skuCode,fromView];
}

/*final class ChangeAmountBasedOnDiscount extends EstimationEvent {
  final String discountAmount;
  final String discountAmount;
  final String discountAmount;
  const ChangeAmountBasedOnDiscount({required this.skuCode});

  @override
  List<Object?> get props => [skuCode];
}*/

final class SkuSaveForListEvent extends EstimationEvent {
  // final int? selectedIndex;
  final double? lineAmount;
  final double? taxAmount;
  final double? discountAmount;
  final double? discountPercentage;
  final double? qty;

  const SkuSaveForListEvent(this.lineAmount, this.taxAmount,
      this.discountAmount, this.qty, this.discountPercentage);

  @override
  List<Object?> get props =>
      [lineAmount, taxAmount, discountAmount, qty,discountPercentage];
}

final class SelectProductEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectProductEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class SelectIngredientProdEvent extends EstimationEvent {
  final int? selectedIndex;
  final int parentIndex;

  const SelectIngredientProdEvent(this.selectedIndex, this.parentIndex);

  @override
  List<Object?> get props => [selectedIndex, parentIndex];
}

final class SelectPurityIngredientEvent extends EstimationEvent {
  final int? selectedIndex;
  final int parentIndex;

  const SelectPurityIngredientEvent(this.selectedIndex, this.parentIndex);

  @override
  List<Object?> get props => [selectedIndex, parentIndex];
}

final class SelectCutIngredientEvent extends EstimationEvent {
  final int? selectedIndex;
  final int parentIndex;

  const SelectCutIngredientEvent(this.selectedIndex, this.parentIndex);

  @override
  List<Object?> get props => [selectedIndex, parentIndex];
}

final class SelectStyleIngredientEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectStyleIngredientEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class SelectSizeIngredientEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectSizeIngredientEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class SelectColourIngredientEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectColourIngredientEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class SelectBatchIngredientEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectBatchIngredientEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class ClearSelectedIngredientEvent extends EstimationEvent {
  const ClearSelectedIngredientEvent();

  @override
  List<Object?> get props => [];
}

final class ClearSelectedAddressEvent extends EstimationEvent {
  const ClearSelectedAddressEvent();

  @override
  List<Object?> get props => [];
}

//ClearSelectedIngredientEvent

/* Delete Data From List */

final class DeleteIngredientEvent extends EstimationEvent {
  final int? parentIndex;
  final int? childIndex;

  const DeleteIngredientEvent(this.parentIndex, this.childIndex);

  @override
  List<Object?> get props => [parentIndex, childIndex];
}

final class DeleteMiscProdEvent extends EstimationEvent {
  final int? parentIndex;
  final int? childIndex;

  const DeleteMiscProdEvent(this.parentIndex, this.childIndex);

  @override
  List<Object?> get props => [parentIndex, childIndex];
}

final class ApiStatusChangeEvent extends EstimationEvent {
  @override
  List<Object?> get props => [];
}

final class SelectAddressEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectAddressEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class SelectStateEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectStateEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class SelectCountryEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectCountryEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class AddCustomerEvent extends EstimationEvent {
  final String? customerName;
  final String? customerGroup;
  final String? customerMobileNo;
  final String? customerEmailId;
  final String? customerDOB;
  final String? customerPan;
  final String? customerMarriageAnniversary;
  final String? customerAadharId;
  final String? customerCountry;
  final String? customerState;
  final String? customerCreditLimit;

  const AddCustomerEvent(
      {required this.customerGroup,
      required this.customerMobileNo,
      this.customerEmailId,
      this.customerDOB,
      this.customerPan,
      this.customerMarriageAnniversary,
      this.customerAadharId,
      this.customerCountry,
      this.customerState,
      this.customerCreditLimit,
      required this.customerName});

  @override
  List<Object?> get props => [
        customerName,
        customerGroup,
        customerMobileNo,
        customerEmailId,
        customerDOB,
        customerPan,
        customerMarriageAnniversary,
        customerAadharId,
        customerCountry,
        customerState,
        customerCreditLimit
      ];
}

final class SelectSalesmanEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectSalesmanEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class ChangeAngle extends EstimationEvent {
  final int? selectedIndex;

  const ChangeAngle(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class FetchMisList extends EstimationEvent {
  @override
  List<Object?> get props => [];
}

final class SelectMiscEvent extends EstimationEvent {
  final int? selectedIndex;

  const SelectMiscEvent(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

final class AddMiscProdEvent extends EstimationEvent {
  final MiscList misProd;
  final int parentIndex;

  const AddMiscProdEvent({required this.misProd, required this.parentIndex});

  @override
  List<Object?> get props => [misProd, parentIndex];
}

final class DeleteFromSelectedProduct extends EstimationEvent {
  final int? selectedIndex;

  const DeleteFromSelectedProduct(this.selectedIndex);

  @override
  List<Object?> get props => [selectedIndex];
}

class SavePaymentDetails extends EstimationEvent{
  final Map<String, double> paymentsData; // key = title, value = amount

  const SavePaymentDetails(this.paymentsData);

  @override
  List<Object?> get props => [paymentsData];
}

class SendEstimateData extends EstimationEvent {


  const SendEstimateData();

  @override
  List<Object?> get props => [];
}

final class SaveCustomerDetailsEvent extends EstimationEvent {
  // final String? customerCode;
  final String? customerName;

  // final int? customerGroupId;
  final String? mobileNo;
  final String? email;
  final String? dob;
  final String? pan;
  final String? marriageAnniversary;
  final String? aadharNo;
  final String? creditLimit;

  @override
  List<Object?> get props => [
        // customerCode,
        customerName,
        // customerGroupId,
        mobileNo,
        email,
        dob,
        pan,
        marriageAnniversary,
        aadharNo,
        creditLimit
      ];

  const SaveCustomerDetailsEvent(
      // this.customerCode,
      this.customerName,
      // this.customerGroupId,
      this.mobileNo,
      this.email,
      this.dob,
      this.pan,
      this.marriageAnniversary,
      this.aadharNo,
      this.creditLimit);
}

final class ChangeCheckBox extends EstimationEvent {
  final String? text;

  const ChangeCheckBox(this.text);

  @override
  List<Object?> get props => [text];
}

final class AddAddressEvent extends EstimationEvent {
  final String? city;
  final int? stateId;
  final String? street1;
  final String? street2;
  final String? doorNo;
  final String? houseNo;
  final String? mobile1;
  final String? mobile2;
  final String? phone1;
  final String? phone2;
  final String? fax;
  final String? email;
  final String? pincode;

  const AddAddressEvent(
    this.city,
    this.stateId,
    this.street1,
    this.street2,
    this.doorNo,
    this.houseNo,
    this.mobile1,
    this.mobile2,
    this.phone1,
    this.phone2,
    this.fax,
    this.email,
    this.pincode,
  );

  @override
  List<Object?> get props => [
        city,
        stateId,
        street1,
        street2,
        doorNo,
        houseNo,
        mobile1,
        mobile2,
        phone1,
        phone2,
        fax,
        email,
        pincode
      ];
}

final class ResetDataEvent extends EstimationEvent {
  @override
  List<Object?> get props => [];
}

final class ResetSelectedProductDataEvent extends EstimationEvent {
  @override
  List<Object?> get props => [];
}
