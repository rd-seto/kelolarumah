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

  Future<PropertyListModel?> getPropertyData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => PropertyListModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.propertyList);
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

  Future<AddPropertyDataModel?> getAddPropertyData() async {
    return await GenericHttp(context).callApi(
        returnType: ReturnType.model,
        methodType: MethodType.get,
        toJsonFunc: (json) => AddPropertyDataModel.fromJson(json),
        returnDataFun: (data) => data,
        showLoader: true,
        name: ApiProvider.addPropertyData);
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
          name: "${ApiProvider.tenantDetails}/$tenantId/details-list");
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
          name: "${ApiProvider.propertyDetails}/$id/details-list");
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
    Future<TenantModel?> getTenantData() async {
      return await GenericHttp(context).callApi(
          returnType: ReturnType.model,
          methodType: MethodType.get,
          toJsonFunc: (json) => TenantModel.fromJson(json),
          returnDataFun: (data) => data,
          showLoader: true,
          name: ApiProvider.searchTenant);
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

    Future<bool> addTenantData({required TenantBodyModel model}) async {
      return await GenericHttp(context).callApi(
          returnType: ReturnType.type,
          json: model.toJson(),
          methodType: MethodType.post,
          returnDataFun: (data) => data != null,
          showLoader: true,
          name: ApiProvider.createTenant);
    }

    Future<bool> tenantsEditBasicInfo(
        {required TenantEditBodyModel model, int? tenantId}) async {
      return await GenericHttp(context).callApi(
          returnType: ReturnType.type,
          json: model.toJson(),
          methodType: MethodType.post,
          returnDataFun: (data) => data != null,
          showLoader: true,
          name: "${ApiProvider.editTenant}/$tenantId/basicinfo");
    }

    Future<TenantModel?> searchTenantData({required String search}) async {
      return await GenericHttp(context).callApi(
          returnType: ReturnType.model,
          methodType: MethodType.get,
          toJsonFunc: (json) => TenantModel.fromJson(json),
          returnDataFun: (data) => data,
          showLoader: true,
          name: '${ApiProvider.tenant}?search=$search');
    }

    Future updateProfile(data) async {
      return await GenericHttp(context).callApi(
          returnType: ReturnType.model,
          methodType: MethodType.post,
          json: data,
          toJsonFunc: (json) => json,
          returnDataFun: (data) => data,
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
  }
