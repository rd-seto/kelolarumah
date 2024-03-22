import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/model/property_list_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/data/provider/tenant_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PropertyProvider extends ChangeNotifier {
  PropertyListModel? propertyListResponse;
  List<ListElement> listOfProperties = <ListElement>[];

  int page = 1;
  bool isError = false;
  late RefreshController refreshController ;


  final debounce = Debounce(milliseconds: 500);

  PropertyProvider(BuildContext context) {
    refreshController = RefreshController(initialRefresh: true);
    //propertyData(context);
  }


  loadItems(BuildContext context) {
    refreshController.requestRefresh();
    page = 1;
    propertyData(context);
    notifyListeners();
  }

  loadMoreItems(BuildContext context) {
    page = page + 1;
    propertyData(context);
    notifyListeners();
  }

  void setItems(List<ListElement> item) {
    listOfProperties.clear();
    listOfProperties = item;
    refreshController.refreshCompleted();
    isError = false;
    notifyListeners();
  }

  void setMoreItems(List<ListElement> item) {
    listOfProperties.addAll(item);
    refreshController.loadComplete();
    notifyListeners();
  }



  void propertyData(BuildContext context) async {
    var apiResponse = await RepositoryImpl(context).getPropertyData();
    if (apiResponse?.result == true) {
      if(apiResponse?.data?.properties?.list?.isNotEmpty == true){
        if(page == 1){
          setItems(apiResponse!.data!.properties!.list!);
          refreshController.loadComplete();
          notifyListeners();
        } else {
          setMoreItems(apiResponse!.data!.properties!.list!);
          notifyListeners();
        }
      } else{
        refreshController.loadNoData();
        notifyListeners();
      }

    } else {
      setFetchError();
    }
    notifyListeners();
  }

  setFetchError() {
    if (page == 0) {
      isError = true;
      refreshController.refreshFailed();
      notifyListeners();
    } else {
      refreshController.loadFailed();
      notifyListeners();
    }
  }


  void searchPropertyData(BuildContext context, String searchKey) async {
    debounce.run(() async {
      propertyListResponse =
          await RepositoryImpl(context).searchPropertyData(search: searchKey);
      notifyListeners();
    });
    notifyListeners();
  }

  void propertyDelete(context, propertyId, VoidCallback onDone) async {
    await RepositoryImpl(context).propertyDeleteApi(propertyId).then((success) {
      if (success = true) {
        Fluttertoast.showToast(msg: 'Successfully Updated');
        onDone();
      } else {
        Fluttertoast.showToast(msg: 'Something Went Wrong');
      }
    });

    notifyListeners();
  }



}
