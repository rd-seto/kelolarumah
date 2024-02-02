import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:landlord/pages/chat_screen/message.dart';
import 'image_preview_screen.dart';

class ChatLine extends StatefulWidget {
  final Message? message;
  final String? currentUser;

  const ChatLine({super.key, this.message, this.currentUser});

  @override
  State<ChatLine> createState() => _ChatLineState();
}

class _ChatLineState extends State<ChatLine> {
  // var storageReference = FirebaseStorage
  @override
  Widget build(BuildContext context) {
    if (widget.currentUser.toString() == widget.message?.from) {
      return Row(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Color(0xff6B5EFD),
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          widget.message?.type == 'call' || widget.message?.type == 'call_end' || widget.message?.type == 'audio_call'
              ? Container(
                  padding: const EdgeInsets.all(24.0),
                  margin: const EdgeInsets.only(left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.shade100,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('${widget.message?.message}',
                          style: TextStyle(
                            color: Colors.blue.shade500,
                            fontWeight: FontWeight.bold,
                          )),
                      Icon(Icons.call_made, color: Colors.red.shade400),
                    ],
                  ),
                )
              : widget.message?.type == 'image'
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 15.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: InkWell(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return ImagePreviewScreen(
                              message: widget.message?.message,
                            );
                          })),
                          onLongPress: () {
                            downloadImage(widget.message?.message);
                          },
                          child: Hero(
                            tag: 'imagePreview',
                            child: Image.memory(
                              base64Decode(widget.message?.message),
                              scale: 5,
                              height: 200.0,
                              width: 200.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    )
                  : widget.message?.message.length < 30
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text('${widget.message?.message}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      : Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.only(left: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text('${widget.message?.message}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          widget.message?.type == 'call' ||
                  widget.message?.type == 'call_end' ||
                  widget.message?.type == 'audio_call'
              ? Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(top: 4, bottom: 4, left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text('${widget.message?.message}',
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          )),
                      const Icon(Icons.call_made, color: Colors.red),
                    ],
                  ),
                )
              : widget.message?.type == 'image'
                  ? InkWell(
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ImagePreviewScreen(
                          message: widget.message?.message,
                        );
                      })),
                      onLongPress: () {
                        downloadImage(widget.message?.message);
                      },
                      child: Hero(
                        tag: '${widget.message?.message}',
                        child: Image.memory(
                          base64Decode(widget.message?.message),
                          scale: 5,
                          height: 200.0,
                          width: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : widget.message?.message.length < 30
                      ? Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(24.0),
                            ),
                          ),
                          child: Text('${widget.message?.message}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      : Expanded(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(24.0),
                              ),
                            ),
                            child: Text(
                              '${widget.message?.message}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
        ],
      );
    }
  }

  downloadImage(message) async {
    int max = 101;
    int randomNumber = Random().nextInt(max);

    try {
      Uint8List imageInUnit8List = base64Decode(message);
      File file = await File('/storage/emulated/0/Download/image$randomNumber.png').create();
      file.writeAsBytesSync(imageInUnit8List);
      Fluttertoast.showToast(msg: 'Download Complete');
    } on Exception {
      rethrow;
    }
  }
}
