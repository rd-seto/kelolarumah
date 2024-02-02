//
// import 'package:dio/dio.dart';
// import 'package:hrm_app/data/server/respository/repository.dart';
//
// class ChatRepository{
//
//   Repository repository = Repository();
//
//   Future<List<ChatProfileSearch>> chatUserSearchApi(context,query) async {
//
//     final email = await SharedPref.getValue(SharedPref.keyEmail);
//
//     FormData fromData = FormData.fromMap({
//       "email": email,
//       "query": query
//     });
//
//     final response = await repository.chatUserSearch(fromData);
//     if(response?.status == "ok"){
//     return response?.searchProfiles ?? [];
//     }
//     return [];
//   }
// }