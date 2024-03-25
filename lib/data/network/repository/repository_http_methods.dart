part of 'repository.dart';

class RepositoryMethods {
  final BuildContext context;

  RepositoryMethods(this.context);

  Future<UserModel?> login({required UserLogin userLogin}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: userLogin.toJson(),
        showLoader: true,
        toJsonFunc: (json) => UserModel.fromJson(json),
        returnDataFun: (data) => data,
        name: ApiProvider.login);
  }

  Future<UserModel?> registration({required UserRegistration userLogin}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: userLogin.toJson(),
        toJsonFunc: (json) => UserModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.registration);
  }

  Future<DashboardModel?> getDashboardData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => DashboardModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.dashboard);
  }

  Future<PropertyListModel?> getPropertyData(page) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => PropertyListModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.propertyList}?page=$page");
  }

  Future<TenantPropertyModel?> getTenantPropertyData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantPropertyModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.tenantProperty);
  }

  Future<PropertyListModel?> searchPropertyData(
      {required String search}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => PropertyListModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: '${ApiProvider.propertyList}?search=$search');
  }

  Future<TenantSearchModel?> searchTenantPropertyData(search) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantSearchModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.search);
  }

  Future<AllDropDownModel?> getAddPropertyData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => AllDropDownModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.addPropertyData);
  }

  Future<AccountCategoryModel?> getAccountsCategoryData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => AccountCategoryModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.addCategoryData);
  }

  /// Get country data from add property
  Future<LocationModel?> getCountryData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => LocationModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.getCountryData);
  }

  /// Get country data from add property
  Future<LocationModel?> getDivisionData(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => LocationModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.getDivisionData);
  }

  /// Get District data from add property
  Future<LocationModel?> getDistrictData(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => LocationModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.getDistrictsData);
  }

  /// Get Area data from add property
  Future<LocationModel?> getAreaData(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => LocationModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.getAreaData);
  }

  /// Get Area data from add property
  Future createProperty(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.createPropertyData);
  }

  Future postImage(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.galleryImageAdd);
  }

  Future postImage2(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.floorPlan);
  }

  Future propertyDeleteApi(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.type,
        methodType: MethodType.delete,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.propertyDelete}$data");
  }

  // Future<bool> addFacilities(
  //     {required PropertyFacilitiesModel model, int? propertyId}) async {
  //   return await GenericHttp(context).callApi(
  //       returnType: ReturnType.type,
  //       json: model.toJson(),
  //       methodType: MethodType.post,
  //       returnDataFun: (data) => data != null,
  //       showLoader: true,
  //       name: "${ApiProvider.addfacilities}/$propertyId");
  // }
  Future addFacilities(data, id) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.type,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data['result'],
        showLoader: true,
        name: "${ApiProvider.addfacilities}/$id");
  }

  /// Get report property list data
  Future<ReportPropertyModel?> getReportProperty() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => ReportPropertyModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.getReportPropertyListData);
  }

  /// Get report Details data
  Future<ReportDetailsModel?> reportDetails(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => ReportDetailsModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.getReportDetails);
  }

  /// Get report tenant list data
  Future<ReportTenantModel?> getReportTenant(propertyId) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => ReportTenantModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.getReportTenantListData}/$propertyId");
  }

  /// Get Area data from add transaction
  Future<bool> createTransaction(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data != null,
        showLoader: true,
        name: ApiProvider.createTransactionData);
  }

  /// Tenants Details API
  Future<TenantsDetailsModel?> getTenantsDetails(tenantId) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantsDetailsModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.tenantDetails}$tenantId");
  }

  Future<NotificationModel?> getNotification() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => NotificationModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.notification);
  }

  Future<PropertyDetailsModel?> getPropertyDetails(id) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => PropertyDetailsModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.propertyDetails}/$id/details-list/");
  }

  Future<TenantPropertyDetailsModel?> getTenantPropertyDetails(id, slug) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantPropertyDetailsModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.tenantPropertyDetails}$slug?advertise_id=$id");
  }

  Future<DocumentListModel?> getDocumentListData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => DocumentListModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.documentList);
  }

  Future<TransactionDetailsModel?> getTransactionDetails(id) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TransactionDetailsModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.transactionDetails}/$id");
  }

  Future sentFirebaseToken({required data}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        name: ApiProvider.firebaseToken);
  }

  Future forgetPass({required data}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        name: ApiProvider.forgetPassword);
  }

  Future resetPass({required data}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        showLoader: true,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        name: ApiProvider.resetPassword);
  }

  /// Tenants List API
  Future<TenantModel?> getTenantData(page) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.tenantList}?page=$page");
  }

  Future<List<TenantProperty>> getTenantPropertiesData() async {
    return await GenericHttp<TenantProperty>(context).callApi(
        returnType: ReturnType.list,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantProperty.fromJson(json),
        returnDataFun: (data) => data['data']['properties'],
        showLoader: true,
        name: ApiProvider.propertiesTenant) as List<TenantProperty>;
  }

  Future<List<FacilityType>> getFacilitiesData() async {
    return await GenericHttp<FacilityType>(context).callApi(
        returnType: ReturnType.list,
        methodType: MethodType.get,
        toJsonFunc: (json) => FacilityType.fromJson(json),
        returnDataFun: (data) => data['data']['facility_types'],
        showLoader: true,
        name: ApiProvider.facilityData) as List<FacilityType>;
  }

  Future<bool> addTenantData(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.type,
        json: data,
        methodType: MethodType.post,
        returnDataFun: (data) => data != null,
        showLoader: true,
        name: ApiProvider.createTenant);
  }

  Future<bool> tenantsEditBasicInfo(data, int? tenantId) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.type,
        json: data,
        methodType: MethodType.post,
        returnDataFun: (data) => data != null,
        showLoader: true,
        name: "${ApiProvider.editTenant}$tenantId");
  }

  Future<bool> propertyEditBasicInfo(
      {required PropertyBasicInfoModel model, int? propertyId}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.type,
        json: model.toJson(),
        methodType: MethodType.post,
        returnDataFun: (data) => data != null,
        showLoader: true,
        name: "${ApiProvider.editPropertyBasic}/$propertyId/basicinfo");
  }

  Future<bool> tenantDetailsEditAccount(data, int? tenantId) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.type,
        json: data,
        methodType: MethodType.post,
        returnDataFun: (data) => data != null,
        showLoader: true,
        name: "${ApiProvider.addAccount}$tenantId");
  }

  Future<bool> tenantDetailsEditAgreement(data, int? tenantId) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.type,
        json: data,
        methodType: MethodType.post,
        returnDataFun: (data) => data != null,
        showLoader: true,
        name: "${ApiProvider.editTenant}/$tenantId/agreement");
  }

  Future<TenantModel?> searchTenantData({required String search}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: '${ApiProvider.searchTenant}$search');
  }

  // Future updateProfile(data) async {

  //   return await GenericHttp(context).callApi(
  //       returnType: ReturnType.model,
  //       methodType: MethodType.post,
  //       json: data,
  //       toJsonFunc: (json) => json,
  //       returnDataFun: (data) => data,
  //       showLoader: true,
  //       name: ApiProvider.profileUpdate);
  // }
  Future<bool> updateProfile(
      {required ProfileBasicInfoUpdateModel model}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.type,
        json: model.toJson(),
        methodType: MethodType.post,
        returnDataFun: (data) => data != null,
        showLoader: true,
        name: ApiProvider.profileUpdate);
  }

  Future postPasswordUpdate(data) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.passwordUpdate);
  }

  // Future<UpdatePassword?> updatePassword(
  //     {required Map<String, dynamic> json}) async {
  //   return await GenericHttp(context).callApi(
  //       returnType: ReturnType.type,
  //       methodType: MethodType.post,
  //       json: json,
  //       toJsonFunc: (json) => UserModel.fromJson(json),
  //       returnDataFun: (data) => data,
  //       name: ApiProvider.passwordUpdate);
  // }

  ///transactionList
  Future<TransactionListModel?> getTransactionListData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TransactionListModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.transactionList);
  }

  ///Add transaction get
  Future<AddTransactionModel?> getAddTransactionData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => AddTransactionModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.addTransaction);
  }

  ///Transaction Search
  Future<TransactionListModel> searchTransactionData(
      {required String search}) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TransactionListModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: '${ApiProvider.transactionList}?search=$search');
  }

  ///cashManagementList
  Future<CashManagementListModel?> getCashManagementListData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => CashManagementListModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.cashManagementList);
  }

  /// Get Area data from add property
  Future createEmergencyContact(data, tenantId) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => json,
        returnDataFun: (data) => data,
        showLoader: true,
        name: "${ApiProvider.tenantUpdate}$tenantId/emergency");
  }

  Future<TenantWishlistModel?> addWishlist(
    data,
  ) async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.post,
        json: data,
        toJsonFunc: (json) => TenantWishlistModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.addWishlist);
  }

  ///profile details
  /// Tenants Details API
  Future<ProfileDetailsModel?> getProfileDetails() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => ProfileDetailsModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.profileDetails);
  }

  // TODO : Tenants part api call ==========================

  Future<TenantsDashboardModel?> getTenantsDashboardData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantsDashboardModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.tenantDashboard);
  }

  Future<TenantPurchaseHistoryModel?> getTenantPurchaseHistory() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantPurchaseHistoryModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.tenantPurchaseHistory);
  }

  Future<TenantWishlistModel?> getTenantWishlists() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => TenantWishlistModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.tenantWishlist);
  }

  Future<DuePaymentModel?> getDuePayments() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => DuePaymentModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.tenantDuePayment);
  }
}
