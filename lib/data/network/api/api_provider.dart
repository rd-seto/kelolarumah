class ApiProvider {
  static const String baseUrl = 'https://landlord.onesttech.com/api';

  static String login = '$baseUrl/public/v1/login';
  static String registration = '$baseUrl/register';
  static String firebaseToken = '$baseUrl/user/firebase-token';
  static String forgetPassword = '$baseUrl/email/forgot-password';
  static String resetPassword = '$baseUrl/email/reset-password';
  static String dashboard = '$baseUrl/private/v1/dashboard';
  static String tenantSearch = '$baseUrl/tenant';
  static String tenantList = '$baseUrl/private/v1/tenant/list';
  static String searchTenant = '$baseUrl/private/v1/tenant/list?name=';
  static String createTenant = '$baseUrl/private/v1/tenant/store';
  static String editTenant = '$baseUrl/private/v1/tenant/update/';
  static String addAccount = '$baseUrl/private/v1/accounts/store/';
  static String editPropertyBasic = '$baseUrl/private/v1/property/update/';
  static String propertiesTenant = '$baseUrl/tenant/create';
  static String facilityData = '$baseUrl/property/facility/edit/1';
  static String propertyList = '$baseUrl/private/v1/property/list';
  static String addPropertyData = '$baseUrl/private/v1/property/create';
  static String addCategoryData = '$baseUrl/private/v1/accounts/create';
  static String getCountryData = '$baseUrl/countries';
  static String getDivisionData = '$baseUrl/divisions';
  static String getDistrictsData = '$baseUrl/districts';
  static String getAreaData = '$baseUrl/area';
  static String createPropertyData = '$baseUrl/private/v1/property/store';
  static String galleryImageAdd = '$baseUrl/private/v1/property/add-gallery';
  static String floorPlan = '$baseUrl/private/v1/property/add-floorplan';
  static String propertyDelete = '$baseUrl/private/v1/property/delete/';
  static String addfacilities = '$baseUrl/property/facility/update';
  static String createTransactionData = '$baseUrl/transaction/store';
  static String propertyDetails = '$baseUrl/private/v1/property';
  static String getReportPropertyListData = '$baseUrl/reports/properties';
  static String getReportTenantListData =
      '$baseUrl/reports/property-wise-tenants';
  static String getReportDetails = '$baseUrl/reports/search';
  static String profileUpdate = '$baseUrl/private/v1/user/profile-update';
  static String passwordUpdate = '$baseUrl/private/v1/user/change-password';
  static String transactionList =
      '$baseUrl/private/v1/transactions/landlord-transactions';
  static String transactionDetails = "$baseUrl/transaction/details";
  static String addTransaction = '$baseUrl/transaction/create';
  static String billManagementList = '$baseUrl/private/v1/bill/list';
  static String notification = '$baseUrl/notifications';
  static String tenantDetails = '$baseUrl/private/v1/tenant/show/';
  static String documentList = '$baseUrl/documents';
  static String tenantUpdate = '$baseUrl/tenant/update/';
  static String profileDetails = "$baseUrl/private/v1/user/profile";

// TODO : Tenants part api call ===========================
  static String tenantDashboard = '$baseUrl/private/v1/tenant/dashboard';
  static String tenantPurchaseHistory = '$baseUrl/private/v1/tenant/orders';
  static String tenantWishlist = '$baseUrl/private/v1/tenant/wishlist';
  static String tenantDuePayment = '$baseUrl/private/v1/tenant/due-payment';
  static String tenantProperty = '$baseUrl/private/v1/category-properties';
  static String tenantPropertyDetails = '$baseUrl/private/v1/property-details/';
  static String search = '$baseUrl/private/v1/properties';
  static String addWishlist = '$baseUrl/private/v1/wishlists/add';
}
