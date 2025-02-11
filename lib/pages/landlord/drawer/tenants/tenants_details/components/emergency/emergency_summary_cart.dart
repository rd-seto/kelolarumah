// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:landlord/components/custom_text.dart';
// import 'package:landlord/data/model/tenants_details_model.dart';
// import 'package:landlord/data/provider/tenants_details_provider.dart';
// import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/emergency/add_emergency_screen.dart';
// import 'package:landlord/utils/nav_utail.dart';
// import 'package:landlord/utils/theme/app_colors.dart';

// class EmergencySummaryCart extends StatelessWidget {
//   // final List<EmergencyContact>? emergencyContact;
//   final int tenantId;
//   final TenantsDetailsProvider? tenantDetailsProvider;
//   const EmergencySummaryCart(
//       {super.key,
//       // this.emergencyContact,
//       required this.tenantId,
//       this.tenantDetailsProvider});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         ListView.builder(
//             itemCount: emergencyContact?.length,
//             itemBuilder: (BuildContext context, int index) {
//               final data = emergencyContact?[index];
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     color: AppColors.colorWhite,
//                     child: Padding(
//                       padding: EdgeInsets.all(18.0.sp),
//                       child: Row(
//                         children: [
//                           Column(
//                             children: [
//                               ClipOval(
//                                 child: CachedNetworkImage(
//                                   height: 43.h,
//                                   width: 43.w,
//                                   fit: BoxFit.cover,
//                                   imageUrl: data?.image ??
//                                       "https://www.w3schools.com/howto/img_avatar.png",
//                                   placeholder: (context, url) => Center(
//                                     child: Image.asset(
//                                         "assets/drawer/app_logo.png"),
//                                   ),
//                                   errorWidget: (context, url, error) =>
//                                       const Icon(Icons.error),
//                                 ),
//                               ),
//                               CustomText(
//                                 text: data?.relation ?? "N/A",
//                                 color: AppColors.black2Sd,
//                                 fontSize: 14.sp,
//                                 fontWeight: FontWeight.w600,
//                                 height: 2,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             width: 20.w,
//                           ),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 CustomText(
//                                   text: data?.name ?? "N/A",
//                                   color: AppColors.black2Sd,
//                                   fontSize: 14.sp,
//                                   fontWeight: FontWeight.w700,
//                                   height: 1.75,
//                                 ),
//                                 CustomText(
//                                   text: data?.occupied ?? "N/A",
//                                   color: AppColors.titleTextColor,
//                                   fontSize: 12.sp,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.75,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.call,
//                                       size: 14.sp,
//                                       color: AppColors.black2Sd,
//                                     ),
//                                     SizedBox(
//                                       width: 4.w,
//                                     ),
//                                     CustomText(
//                                       text: data?.phone ?? "N/A",
//                                       color: AppColors.titleTextColor,
//                                       fontSize: 12.sp,
//                                       fontWeight: FontWeight.w400,
//                                       height: 1.75,
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.mail_outline_outlined,
//                                       size: 14.sp,
//                                       color: AppColors.black2Sd,
//                                     ),
//                                     SizedBox(
//                                       width: 4.w,
//                                     ),
//                                     Expanded(
//                                       child: CustomText(
//                                         text: data?.email ?? "N/A",
//                                         color: AppColors.titleTextColor,
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.w400,
//                                         height: 1.75,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }),
//         Positioned(
//             bottom: 0,
//             right: 0,
//             child: InkWell(
//               onTap: () {
//                 NavUtil.navigateScreen(
//                     context,
//                     AddEmergencyScreen(
//                       tenantId: tenantId,
//                       onSave: () {
//                         tenantDetailsProvider?.tenantsDetailsData(
//                             context, tenantId);
//                       },
//                     ));
//               },
//               child: Container(
//                   decoration: const BoxDecoration(
//                       color: AppColors.colorPrimary, shape: BoxShape.circle),
//                   padding: const EdgeInsets.all(16),
//                   child: const Icon(
//                     Icons.add,
//                     color: Colors.white,
//                   )),
//             )),
//       ],
//     );
//   }
// }

// class PopupButtonDesign extends StatelessWidget {
//   final String? title;

//   const PopupButtonDesign({Key? key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(children: [
//           Container(
//             margin: const EdgeInsets.only(right: 6.0),
//             decoration: const BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Color(0XFF004D96),
//                       Color(0XFF0082FF),
//                     ])),
//             child: const Icon(
//               Icons.add,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             title!,
//             style: TextStyle(color: Colors.grey[600]),
//           )
//         ]),
//         const Divider()
//       ],
//     );
//   }
// }
