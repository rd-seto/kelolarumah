import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/data/model/document_list_model.dart';
import 'package:landlord/data/network/repository/repository.dart';
import 'package:landlord/utils/shared_preferences.dart';
import 'package:open_filex/open_filex.dart';

class DocumentProvider extends ChangeNotifier {
  DocumentListModel? documentListModel;

  // final String pdfUrl = 'https://www.africau.edu/images/default/sample.pdf';
  String? _pdfPath;
  String? cachePdfPath;
  List<String> listOfPath = [];
  List<String> cachingListOfPath = [];
  List<ListElement> cacheList = [];
  bool isLoading = false;

  DocumentProvider(context) {
    getDocument(context);
    getCacheDocuments(context);
  }

  void getDocument(context) async {
    var apiResponse = await RepositoryImpl(context).getDocumentList();
    if (apiResponse != null) {
      documentListModel = apiResponse;
    }
    notifyListeners();
  }

  Future<void> getCachedPdf() async {
    // final cacheManager = await DefaultCacheManager.getInstance();
    final fileInfo = await DefaultCacheManager().getFileFromCache('pdfUrl');
    if (fileInfo != null && await fileInfo.file.exists()) {
      cachePdfPath = fileInfo.file.path;

      notifyListeners();
    }
  }

  Future getCacheDocuments(context) async {
    isLoading = true;
    var listOfMap = await SPUtill.getDocumentList(SPUtill.keyDocumentList);

    // print('length ${listOfMap.length}');

    cacheList = listOfMap;
    isLoading = false;
    notifyListeners();
  }

  Future<void> downloadPdf(ListElement cacheModel) async {
    final fileInfo =
        await DefaultCacheManager().getFileFromCache(cacheModel.file!);
    if (fileInfo != null && await fileInfo.file.exists()) {
      openPdf(fileInfo.file.path);
    } else {
      final file = await DefaultCacheManager().getSingleFile(cacheModel.file!);

      _pdfPath = file.path;

      if (_pdfPath?.isNotEmpty == true) {
        cacheList.add(ListElement(
          id: cacheModel.id,
          filename: cacheModel.filename,
          icon: cacheModel.icon,
          size: cacheModel.size,
          file: _pdfPath,
        ));
        debugPrint('length ${cacheList.toList()}');

        SPUtill.setDocumentPathList(
            SPUtill.keyDocumentList, cacheList.map((e) => e.toJson()).toList());
        Fluttertoast.showToast(msg: "Download Complete");
      }
    }
    notifyListeners();
  }

  Future<void> openPdf(path) async {
    if (path != null) {
      debugPrint(_pdfPath.toString());
      await OpenFilex.open(path);
    }
  }
}
