import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:landlord/data/model/user_model.dart';
import 'package:landlord/pages/chat_screen/friend.dart';
import '../../utils/nav_utail.dart';
import '../../utils/shared_preferences.dart';
import '../../utils/theme/app_colors.dart';
import 'conversation_screen.dart';
import 'firebase_service.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  final FirebaseService _database = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat Room',
        ),
      ),
      body: FutureBuilder<int?>(
          future: SPUtill.getIntValue(SPUtill.keyUserId),
          builder: (context, userIdSnapshot) {
            if (userIdSnapshot.hasData) {
              return StreamBuilder<List<ChatFriendList>>(
                stream: _database.getFriend(userIdSnapshot.data),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'No message found',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            RichText(
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.end,
                                softWrap: true,
                                maxLines: 1,
                                text: TextSpan(
                                  text: 'Start messaging go to ',
                                  style: DefaultTextStyle.of(context).style.copyWith(color: Colors.black54),
                                  children: const <TextSpan>[
                                    TextSpan(
                                        // recognizer: TapGestureRecognizer()..onTap = () => NavUtil.navigateScreen(context, const PhonebookScreen()),
                                        text: 'phonebook',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:   AppColors.colorPrimary,
                                            decoration: TextDecoration.underline,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic)),
                                  ],
                                ))
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        if (userIdSnapshot.data != snapshot.data?.elementAt(index).uid) {
                          String? chatUser = snapshot.data?.elementAt(index).uid;

                          String? lastMessage = snapshot.data?.elementAt(index).message;

                          FirebaseService().getUserData(chatUser ?? '');

                          ///after retrieve chat uid
                          ///then we can access user profile
                          return FutureBuilder<UserModel>(
                            future: _database.getUserData(chatUser!),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data == null) {
                                  return const SizedBox.shrink();
                                }

                                final profile = snapshot.data;

                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChatConversation(friend: profile, userId: userIdSnapshot.data)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: Container(
                                      width: double.infinity,
                                      decoration:  BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(6.0)),
                                        border: Border.all(color: AppColors.colorPrimary)
                                      ),
                                      child: ListTile(
                                        leading: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                Colors.transparent,
                                            backgroundImage: NetworkImage(
                                                profile?.avatar ?? "https://thinksport.com.au/wp-content/uploads/2020/01/avatar-.jpg"),
                                          ),
                                        ),
                                        title: Text(
                                          '${profile?.name}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Text(
                                          '$lastMessage',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            },
                          );
                        } else {
                          return const Column(
                            children: [
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          );
                        }
                      },
                    );
                  } else {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                            child: CircularProgressIndicator(
                          backgroundColor: AppColors.colorPrimary,
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )),
                      ],
                    );
                  }
                },
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
