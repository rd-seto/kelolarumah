

class ApiProvider{

  static const String baseUrl = 'https://landlord.onestweb.com/api';

  static String login = '$baseUrl/login';
  static String registration = '$baseUrl/register';
  static String forgetPassword = '$baseUrl/email/forgot-password';
  static String resetPassword = '$baseUrl/email/reset-password';
  static String dashboard = '$baseUrl/dashboard';
  static String tenant = '$baseUrl/tenant';
  static String searchTenant = '$baseUrl/tenant';
  static String createTenant = '$baseUrl/tenant/store';
  static String editTenant = '$baseUrl/tenant/update';
  static String propertiesTenant = '$baseUrl/tenant/create';
  static String propertyList = '$baseUrl/property/list';
  static String addPropertyData = '$baseUrl/property/create';
  static String getCountryData = '$baseUrl/countries';
  static String getDivisionData = '$baseUrl/divisions';
  static String getDistrictsData = '$baseUrl/districts';
  static String getAreaData = '$baseUrl/area';
  static String createPropertyData = '$baseUrl/property/store';
  static String createTransactionData = '$baseUrl/transaction/store';
  static String propertyDetails = '$baseUrl/property';
  static String getReportPropertyListData = '$baseUrl/reports/properties';
  static String getReportTenantListData = '$baseUrl/reports/property-wise-tenants';
  static String getReportDetails = '$baseUrl/reports/search';
  static String profileUpdate = '$baseUrl/profile-update';
  static String passwordUpdate = '$baseUrl/change-password';
  static String transactionList = '$baseUrl/transaction';
  static String transactionDetails = "$baseUrl/transaction/details";
  static String addTransaction = '$baseUrl/transaction/create';
  static String cashManagementList = '$baseUrl/cash-management/list';
  static String notification = '$baseUrl/notifications';
  static String tenantDetails = '$baseUrl/tenant';
  static String documentList = '$baseUrl/documents';
  static String tenantUpdate = '$baseUrl/tenant/update/';


}