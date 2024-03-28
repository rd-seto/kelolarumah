part of 'repository.dart';

class RepositoryImpl {
  late BuildContext _context;
  late RepositoryMethods _repositoryMethods;

  RepositoryImpl(BuildContext context) {
    _context = context;
    _repositoryMethods = RepositoryMethods(_context);
  }

  Future<UserModel?> login(UserLogin userLogin) =>
      _repositoryMethods.login(userLogin: userLogin);

  Future<UserModel?> registration(UserRegistration userRegistration) =>
      _repositoryMethods.registration(userLogin: userRegistration);

  Future postSentToken(final data) =>
      _repositoryMethods.sentFirebaseToken(data: data);

  Future forgetPass(final data) => _repositoryMethods.forgetPass(data: data);

  Future resetPass(final data) => _repositoryMethods.resetPass(data: data);

  Future<DashboardModel?> getDashboardData() =>
      _repositoryMethods.getDashboardData();

  Future<PropertyListModel?> getPropertyData(page) =>
      _repositoryMethods.getPropertyData(page);

  Future<TenantPropertyModel?> getTenantPropertyData() =>
      _repositoryMethods.getTenantPropertyData();

  Future<PropertyListModel?> searchPropertyData({required String search}) =>
      _repositoryMethods.searchPropertyData(search: search);

  Future<TenantSearchModel?> searchTenantPropertyData(search) =>
      _repositoryMethods.searchTenantPropertyData(search);

  Future<TransactionListModel?> searchTransactionData(
          {required String search}) =>
      _repositoryMethods.searchTransactionData(search: search);

  Future<AllDropDownModel?> getAddPropertiesData() =>
      _repositoryMethods.getAddPropertyData();

  Future<AccountCategoryModel?> getAccountsCategoryData() =>
      _repositoryMethods.getAccountsCategoryData();

  Future<LocationModel?> getCountryData() =>
      _repositoryMethods.getCountryData();

  Future<LocationModel?> getDivisionsData(data) =>
      _repositoryMethods.getDivisionData(data);

  Future<LocationModel?> getDistrictData(data) =>
      _repositoryMethods.getDistrictData(data);

  Future<LocationModel?> getAresData(data) =>
      _repositoryMethods.getAreaData(data);

  Future createProperty(data) => _repositoryMethods.createProperty(data);
  Future postGalleryImage(data) => _repositoryMethods.postImage(data);
  Future floorPlanImageAdd(data) => _repositoryMethods.postImage2(data);
  Future propertyDeleteApi(data) => _repositoryMethods.propertyDeleteApi(data);
  // Future<bool> addFacilitiesData(
  //       {required PropertyFacilitiesModel model, int? propertyId}) =>
  //   _repositoryMethods.addFacilities(
  //       model: model, propertyId: propertyId);
  Future addFacilitiesData(data, int? id) =>
      _repositoryMethods.addFacilities(data, id);

  Future<ReportPropertyModel?> getReportPropertyList() =>
      _repositoryMethods.getReportProperty();

  Future<ReportTenantModel?> getReportTenantList(propertyId) =>
      _repositoryMethods.getReportTenant(propertyId);

  Future<ReportDetailsModel?> getReportDetails(data) =>
      _repositoryMethods.reportDetails(data);

  Future<bool> createTransaction(data) =>
      _repositoryMethods.createTransaction(data);

  Future<TenantsDetailsModel?> getTenantsDetails(tenantsId) =>
      _repositoryMethods.getTenantsDetails(tenantsId);

  Future<bool> addTenantData(data) => _repositoryMethods.addTenantData(data);

  Future<TenantModel?> searchTenantData({required String search}) =>
      _repositoryMethods.searchTenantData(search: search);

  Future<List<TenantProperty>> getTenantPropertiesData() =>
      _repositoryMethods.getTenantPropertiesData();

  Future<List<FacilityType>> getFacilitiesData() =>
      _repositoryMethods.getFacilitiesData();

  Future<bool> tenantsEditBasicInfo(data, int? tenantId) =>
      _repositoryMethods.tenantsEditBasicInfo(data, tenantId);

  Future<bool> propertyEditBasicInfo(data, propertyId) =>
      _repositoryMethods.propertyEditBasicInfo(data, propertyId);

  Future<bool> tenantDetailsEditAccount(data, int? tenantId) =>
      _repositoryMethods.tenantDetailsEditAccount(data, tenantId);

  Future<bool> tenantDetailsEditAgreement(data, int? tenantId) =>
      _repositoryMethods.tenantDetailsEditAgreement(data, tenantId);

  Future updateProfile({required ProfileBasicInfoUpdateModel model}) =>
      _repositoryMethods.updateProfile(model: model);

  Future<NotificationModel?> getNotificationData() =>
      _repositoryMethods.getNotification();

  Future<TransactionListModel?> getTransactionListData() =>
      _repositoryMethods.getTransactionListData();

  Future<AddTransactionModel?> getAddTransactionData() =>
      _repositoryMethods.getAddTransactionData();

  Future<BillManagementModel?> getBillManagementListData() =>
      _repositoryMethods.getBillManagementListData();

  Future<PropertyDetailsModel?> getPropertyDetails(id) =>
      _repositoryMethods.getPropertyDetails(id);

  Future<TenantPropertyDetailsModel?> getTenantPropertyDetails(id, slug) =>
      _repositoryMethods.getTenantPropertyDetails(id, slug);

  Future<DocumentListModel?> getDocumentList() =>
      _repositoryMethods.getDocumentListData();

  Future<TransactionDetailsModel?> getTransactionDetails(id) =>
      _repositoryMethods.getTransactionDetails(id);

  Future<TenantModel?> getTenantData(page) =>
      _repositoryMethods.getTenantData(page);

  Future createEmergencyContact(data, tenantId) =>
      _repositoryMethods.createEmergencyContact(data, tenantId);

  Future<TenantWishlistModel?> addWishlist(data) =>
      _repositoryMethods.addWishlist(data);

  // Future<TenantModel?> searchTenantData({required String search}) =>
  //     _repositoryMethods.searchTenantData(search: search);

  // Future<UserModel?> updateProfile({required Map<String, dynamic> json}) =>
  //     _repositoryMethods.updateProfile(json: json);

  // Future<UpdatePassword?> updatePassword({required Map<String, dynamic> json}) =>
  //     _repositoryMethods.updatePassword(json: json);

  Future postPasswordUpdate(data) =>
      _repositoryMethods.postPasswordUpdate(data);

  Future<ProfileDetailsModel?> getProfileDetails() =>
      _repositoryMethods.getProfileDetails();

  // TODO : Tenants part api call ===========================

  Future<TenantsDashboardModel?> getTenantsDashboardData() =>
      _repositoryMethods.getTenantsDashboardData();

  Future<TenantPurchaseHistoryModel?> getTenantPurchaseHistoryData() =>
      _repositoryMethods.getTenantPurchaseHistory();

  Future<TenantWishlistModel?> getTenantWishlists() =>
      _repositoryMethods.getTenantWishlists();

  Future<DuePaymentModel?> getDuePayment() =>
      _repositoryMethods.getDuePayments();
}
