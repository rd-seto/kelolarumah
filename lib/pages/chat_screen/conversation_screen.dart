import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/model/user_model.dart';
import '../../utils/theme/app_colors.dart';
import 'chat_line.dart';
import 'common_method.dart';
import 'firebase_service.dart';
import 'message.dart';

class ChatConversation extends StatefulWidget {
  final UserModel? friend;
  final int? userId;

  const ChatConversation({super.key, this.friend, this.userId});

  @override
  State<ChatConversation> createState() => _ChatConversationState();
}

class _ChatConversationState extends State<ChatConversation> {
  //scroll controller
  final ScrollController listScrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();
  String message = '';
  XFile? imageFile;
  File? file;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseService database = FirebaseService();
    final chatUser = widget.friend?.id;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Row(
            children: [
              Text('${widget.friend?.name}'),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: widget.friend?.avatar == null ||
                          widget.friend?.avatar == ''
                      ? Image.network(
                          'https://support.hubstaff.com/wp-content/uploads/2019/08/good-pic.png',
                          width: 45.0,
                          height: 45.0,
                          fit: BoxFit.cover,
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: NetworkImage(
                              widget.friend?.avatar?.toString() ?? ""),
                        ),
                ),
              ),
            ],
          ),
          actions: const <Widget>[],
        ),
        body: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            child: StreamBuilder<List<Message>>(
              stream: database.getChatRoomMessage(widget.userId, chatUser),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  ///By default chat screen view
                  ///where show all messages
                  return Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data?.length,
                            controller: listScrollController,
                            reverse: true,
                            itemBuilder: (_, index) {
                              return ChatLine(
                                message: snapshot.data?.elementAt(index),
                                currentUser: '${widget.userId}',
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: const BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.white,
                                      ),
                                      onPressed: () async {
                                        imageFile = await ChatCommon.getImage();
                                        //print('image file : ${imageFile.path}');
                                        ///read the file asynchronously as the image can be very large which may cause blocking of main thread
                                        String? base64Image = base64Encode(
                                            await imageFile!.readAsBytes());

                                        Map<String, dynamic> map = {
                                          'type': 'image',
                                          'message': base64Image,
                                          'status': 'not seen',
                                          'from': '${widget.userId}',
                                          'timestamp':
                                              '${Timestamp.now().seconds}'
                                        };

                                        ///create chat room for current user
                                        database.createChatRoom(
                                            widget.userId, chatUser, map);

                                        ///create chat room for chat user
                                        database.createChatRoom(
                                            chatUser, widget.userId, map);

                                        ///update friend list for current user
                                        database.createFriend(
                                            widget.userId, chatUser, 'photo');

                                        ///update friend list for chat user
                                        database.createFriend(
                                            chatUser, widget.userId, 'photo');
                                        if (kDebugMode) {
                                          print(
                                              'current uid ${widget.userId}   chat uid : $chatUser');
                                        }
                                        listScrollController.animateTo(0.0,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeOut);

                                        database.sendNotificationWithTopic(
                                            topic: 'user$chatUser',
                                            title: 'New Message',
                                            body: 'Attachment',
                                            map: widget.userId,
                                            status: 'message');
                                      },
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _messageController,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  maxLines: null,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                  decoration: const InputDecoration(
                                    hintText: 'Message...',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Map<String, dynamic> map = {
                                    'type': 'message',
                                    'message': _messageController.text,
                                    'status': 'not seen',
                                    'from': '${widget.userId}',
                                    'timestamp': '${Timestamp.now().seconds}'
                                  };

                                  debugPrint(_messageController.text);

                                  ///create chat room for current user
                                  database.createChatRoom(
                                      widget.userId, chatUser, map);

                                  ///create chat room for chat user
                                  database.createChatRoom(
                                      '$chatUser', widget.userId, map);

                                  ///update chat friend list for current user
                                  database.createFriend(widget.userId,
                                      '$chatUser', _messageController.text);

                                  ///update chat friend list for chat user
                                  database.createFriend('$chatUser',
                                      widget.userId, _messageController.text);
                                  if (kDebugMode) {
                                    print(
                                        'current uid ${widget.userId}   chat uid : $chatUser');
                                  }
                                  listScrollController.animateTo(0.0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut);

                                  database.sendNotificationWithTopic(
                                      topic: 'user$chatUser',
                                      title: 'New Message',
                                      body: _messageController.text,
                                      map: widget.userId,
                                      status: 'message');

                                  _messageController.clear();
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.send,
                                        color: AppColors.colorPrimary,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ColoredBox(
                    color: AppColors.colorWhite,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            controller: listScrollController,
                            children: [
                              SizedBox(
                                height: ScreenUtil.defaultSize.height / 2,
                              ),
                              const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: const BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0))),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(right: 16.0),
                                child: Material(
                                  color: Colors.transparent,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.image,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () async {
                                        imageFile = await ChatCommon.getImage();
                                        //print('image file : ${imageFile.path}');
                                        ///read the file asynchronously as the image can be very large which may cause blocking of main thread
                                        String? base64Image = base64Encode(
                                            await imageFile!.readAsBytes());

                                        Map<String, dynamic> map = {
                                          'type': 'image',
                                          'message': base64Image,
                                          'status': 'not seen',
                                          'from': widget.userId,
                                          'timestamp':
                                              '${Timestamp.now().seconds}'
                                        };

                                        ///create chat room for current user
                                        database.createChatRoom(
                                            widget.userId, chatUser, map);

                                        ///create chat room for chat user
                                        database.createChatRoom(
                                            chatUser, widget.userId, map);

                                        ///update friend list for current user
                                        database.createFriend(
                                            widget.userId, chatUser, 'photo');

                                        ///update friend list for chat user
                                        database.createFriend(
                                            chatUser, widget.userId, 'photo');
                                        if (kDebugMode) {
                                          print(
                                              'current uid ${widget.userId}   chat uid : $chatUser');
                                        }
                                        listScrollController.animateTo(0.0,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeOut);

                                        database.sendNotificationWithTopic(
                                            topic: 'user$chatUser',
                                            title: 'New Message',
                                            body: 'Attachment',
                                            map: widget.userId,
                                            status: 'message');
                                      },
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _messageController,
                                  keyboardType: TextInputType.multiline,
                                  textInputAction: TextInputAction.newline,
                                  maxLines: null,
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 16.0),
                                  decoration: const InputDecoration(
                                    hintText: 'Message...',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Map<String, dynamic> map = {
                                    'type': 'message',
                                    'message': _messageController.text,
                                    'status': 'not seen',
                                    'from': '${widget.userId}',
                                    'timestamp': '${Timestamp.now().seconds}'
                                  };

                                  debugPrint(_messageController.text);

                                  ///create chat room for current user
                                  database.createChatRoom(
                                      widget.userId, chatUser, map);

                                  ///create chat room for chat user
                                  database.createChatRoom(
                                      chatUser, widget.userId, map);

                                  ///update chat friend list for current user
                                  database.createFriend(widget.userId, chatUser,
                                      _messageController.text);

                                  ///update chat friend list for chat user
                                  database.createFriend(chatUser, widget.userId,
                                      _messageController.text);
                                  if (kDebugMode) {
                                    print(
                                        'current uid ${widget.userId}   chat uid : $chatUser');
                                  }
                                  listScrollController.animateTo(0.0,
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeOut);

                                  database.sendNotificationWithTopic(
                                      topic: 'user$chatUser',
                                      title: 'New Message',
                                      body: _messageController.text,
                                      map: widget.userId,
                                      status: 'message');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: CircleAvatar(
                                      radius: 25.0,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.send,
                                        color: Theme.of(context).primaryColor,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ));
  }
}
