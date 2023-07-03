class DocumentListModel {
  DocumentListModel({
    this.result,
    this.apiEndPoint,
    this.message,
    this.data,
  });

  bool? result;
  String? apiEndPoint;
  String? message;
  Data? data;

  factory DocumentListModel.fromJson(Map<String, dynamic> json) => DocumentListModel(
    result: json["result"],
    apiEndPoint: json["api_end_point"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "api_end_point": apiEndPoint,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.messages,
    this.items,
  });

  String? messages;
  Items? items;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    messages: json["messages"],
    items: json["items"] == null ? null : Items.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "messages": messages,
    "items": items?.toJson(),
  };
}

class Items {
  Items({
    this.list,
    this.links,
    this.pagination,
  });

  List<ListElement>? list;
  Links? links;
  Pagination? pagination;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "pagination": pagination?.toJson(),
  };
}

class Links {
  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  String? first;
  String? last;
  dynamic prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class ListElement {
  ListElement({
    this.id,
    this.filename,
    this.date,
    this.icon,
    this.attachmentType,
    this.size,
    this.file
  });

  int? id;
  String? filename;
  String? date;
  String? icon;
  String? attachmentType;
  String? size;
  String? file;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    id: json["id"],
    filename: json["filename"],
    date: json["date"],
    icon: json["icon"],
    attachmentType: json["attachment_type"],
    size: json["size"],
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "filename": filename,
    "date": date,
    "icon": icon,
    "attachment_type": attachmentType,
    "size": size,
    "file": file,
  };
}

class Pagination {
  Pagination({
    this.total,
    this.count,
    this.perPage,
    this.currentPage,
    this.totalPages,
  });

  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    count: json["count"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "count": count,
    "per_page": perPage,
    "current_page": currentPage,
    "total_pages": totalPages,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
