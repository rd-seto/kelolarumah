// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'conversation_screen.dart';
//
// class SearchFriend extends StatefulWidget {
//   final String? query;
//
//   const SearchFriend({super.key, this.query});
//
//   @override
//   State<SearchFriend> createState() => _SearchFriendState();
// }
//
// class _SearchFriendState extends State<SearchFriend> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String?>(
//       future: SharedPref.getValue(SharedPref.keyId),
//       builder: (context, userIdSnapshot) {
//         if (userIdSnapshot.hasData) {
//           return FutureBuilder<List<ChatProfileSearch>>(
//               future: ChatRepository().chatUserSearchApi(context, widget.query),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//
//                   final List<ChatProfileSearch>? profiles = snapshot.data;
//                   if(profiles!.isNotEmpty){
//                     return ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: profiles.length,
//                       itemBuilder: (context, index) {
//                         if (userIdSnapshot.data != profiles[index].id.toString()) {
//                           return GestureDetector(
//                             onTap: () {
//                               ChatProfileSearch? searchProfile = profiles[index];
//
//                               // UserModel friendProfile = UserModel(
//                               //     id: searchProfile.id,
//                               //     name: '${searchProfile.name}',
//                               //     email: '${searchProfile.email}');
//
//                               // Navigator.pushReplacement(
//                               //     context,
//                               //     MaterialPageRoute(
//                               //         builder: (context) => ChatConversation(
//                               //           friend: friendProfile,
//                               //         )));
//                             },
//                             child: Card(
//                               color: Colors.transparent,
//                               child: Container(
//                                 decoration: const BoxDecoration(
//                                   borderRadius:
//                                   BorderRadius.all(Radius.circular(6.0)),
//                                   gradient: LinearGradient(
//                                       colors: [
//                                         Color(0xFFFB7159),
//                                         Color(0xFF7001B6),
//                                       ],
//                                       begin: FractionalOffset(3.0, 2.0),
//                                       end: FractionalOffset(0.0, 4.0),
//                                       stops: [0.0, 1.0],
//                                       tileMode: TileMode.clamp),
//                                 ),
//                                 child: ListTile(
//                                   leading: const CircleAvatar(
//                                     child: Icon(Icons.person,
//                                         color: Colors.white),
//                                   ),
//                                   title: Text(
//                                     '${profiles[index].name}',
//                                     style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                   subtitle: Text(
//                                     '${profiles[index].email}',
//                                     style: const TextStyle(color: Colors.white),
//                                   ),
//                                   trailing: CircleAvatar(
//                                     backgroundColor: AppColor.titleColor,
//                                     child: const Icon(
//                                       Icons.message,
//                                       color: Colors.white,
//                                       size: 24,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         }
//                         return const Text(
//                           "Loading",
//                           style: TextStyle(
//                               color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
//                         );
//                       },
//                     );
//                   }
//                   return Padding(
//                     padding: EdgeInsets.only(top: ScreenUtil.defaultSize.height/3),
//                     child: const Text(
//                       "User Not Found",
//                       style: TextStyle(
//                           color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
//                     ),
//                   );
//                 }
//                 return Padding(
//                   padding: EdgeInsets.only(top: ScreenUtil.defaultSize.height/3),
//                   child: const Center(
//                     child: CircularProgressIndicator(
//                       backgroundColor: Colors.white,
//                       valueColor: AlwaysStoppedAnimation(Color(0xff330066)),
//                     ),
//                   ),
//                 );
//               });
//         }
//         return Padding(
//           padding: EdgeInsets.only(top: ScreenUtil.defaultSize.height/3),
//           child: const Text(
//             "Loading",
//             style: TextStyle(
//                 color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500),
//           ),
//         );
//       },
//     );
//   }
// }
