class ChatFriendList {
  final String? uid;
  final String? timeStamp;
  final String? message;

  ChatFriendList({this.uid, this.timeStamp, this.message});

  factory ChatFriendList.fromJson(Map<dynamic, dynamic> item) {
    return ChatFriendList(
      uid: item['uid'] ?? '',
      timeStamp: item['timestamp'] ?? '',
      message: item['message'] ?? '',
    );
  }
}
