part of 'dio_imports.dart';

class DioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  BuildContext context;
  final bool forceRefresh;

  DioHelper({this.forceRefresh = true, required this.context}) {
    _dio = Dio(
      BaseOptions(
          baseUrl: ApiProvider.baseUrl,
          contentType: "application/json; charset=utf-8"),
    )
      ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (data) => log(data.toString())));
  }

  DioCacheManager _getCacheManager() {
    _manager = DioCacheManager(CacheConfig(baseUrl: ApiProvider.baseUrl, defaultRequestMethod: "POST"));
    return _manager;
  }

  Options _buildCacheOptions() {
    String? token = GlobalState.instance.get("token");
    return buildCacheOptions(
      const Duration(days: 3),
      maxStale: const Duration(days: 7),
      forceRefresh: forceRefresh,
      options: Options(extra: {}, headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token',}),
    );
  }

  Future<dynamic> get({required String url}) async {
    _dio.options.headers = DioUtils.header ?? await _getHeader();
    try {
      var response = await _dio.get(url, options: _buildCacheOptions());
      debugPrint("response ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioException catch (e) {
      showErrorMessage(e.response);
    }
    return const Text('Something Went Wrong');
  }

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      }
    });

    _dio.options.headers = DioUtils.header ?? await _getHeader();
    debugPrint('headers ${_dio.options.headers.entries}');
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post(url,
          data: haveFile ? formData : body, options: _buildCacheOptions());
      debugPrint("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioException catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> body,
      bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      }
    });

    _dio.options.headers = DioUtils.header ?? await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.put(url, data: haveFile ? formData : body);
      debugPrint("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioException catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> patch(
      {required String url,
      required Map<String, dynamic> body,
      bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = DioUtils.header ?? await _getHeader();
    try {
      var response = await _dio.patch(url, data: body);
      debugPrint("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioException catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> delete(
      {required String url,
      required Map<String, dynamic> body,
      bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    _dio.options.headers = DioUtils.header ?? await _getHeader();
    try {
      var response = await _dio.delete(url, data: body);
      debugPrint("body response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioException catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  Future<dynamic> uploadChatFile(String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    if (showLoader) DioUtils.showLoadingDialog();
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        value.forEach((element) async {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                element.path,
                filename: element.path.split("/").last,
              ));
          files.add(pic);
        });
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});
      }
    });

    _dio.options.headers = DioUtils.header ?? await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post(url, data: formData);
      debugPrint("response ${response.statusCode}");
      if (showLoader) DioUtils.dismissDialog();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        showErrorMessage(response);
      }
    } on DioException catch (e) {
      if (showLoader) DioUtils.dismissDialog();
      showErrorMessage(e.response);
    }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    debugPrint(
        "-------------------------------------------------------------------");
    log("$body");
    debugPrint(
        "-------------------------------------------------------------------");
  }

  showErrorMessage(Response? response) {
    if (response == null) {
      debugPrint("failed response Check Server");
      LoadingDialog.showToastNotification("Check Server");
    } else {
      debugPrint("failed response ${response.statusCode}");
      debugPrint("failed response ${response.data}");
      var data = response.data;
      if (data is String) data = json.decode(response.data);
      switch (response.statusCode) {
        case 500:
          LoadingDialog.showToastNotification(data["msg"].toString());
          break;
        case 400:
          if (data["errors"] != null) {
            Map<String, dynamic> errors = data["errors"];
            debugPrint("response errors $errors");
            errors.forEach((key, value) {
              List<String> lst = List<String>.from(value.map((e) => e));
              for (var e in lst) {
                LoadingDialog.showToastNotification(e);
              }
            });
          } else {
            LoadingDialog.showToastNotification(data["msg"].toString());
          }
          break;
        case 401:
        case 422:
        if (data["errors"] != null) {
          Map<String, dynamic> errors = data["errors"];
          debugPrint("response errors $errors");
          errors.forEach((key, value) {
            List<String> lst = List<String>.from(value.map((e) => e));
            for (var e in lst) {
              LoadingDialog.showToastNotification(e);
            }
          });
        } else {
          LoadingDialog.showToastNotification(data["msg"].toString());
        }
        case 301:
        case 302:
          LoadingDialog.showToastNotification(data['message'], color: Colors.red);
          tokenExpired();
          break;
      }
    }
  }

  _getHeader() async {
    String? token = GlobalState.instance.get("token");
    return {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void tokenExpired() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    /// TODO navigate to logout page from here
  }
}
