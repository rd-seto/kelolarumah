// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:landlord/components/custom_text.dart';
// import 'package:landlord/data/model/property_details_model.dart';
// import 'package:landlord/utils/theme/app_colors.dart';

// class TenantsListContainer extends StatelessWidget {
//   const TenantsListContainer({
//     Key? key,
//     this.currentTenant,
//   }) : super(key: key);

//   final List<CurrentTenant>? currentTenant;

//   @override
//   Widget build(BuildContext context) {
//     return currentTenant?.isNotEmpty == true
//         ? ListView.builder(
//             shrinkWrap: true,
//             itemCount: currentTenant?.length ?? 0,
//             itemBuilder: (context, index) {
//               final data = currentTenant?[index];
//               return Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(color: AppColors.stockColor)),
//                 child: Padding(
//                   padding: EdgeInsets.all(8.0.sp),
//                   child: Row(
//                     children: [
//                       CachedNetworkImage(
//                         height: 54,
//                         width: 54,
//                         fit: BoxFit.cover,
//                         imageUrl: data?.image ?? '',
//                         placeholder: (context, url) => Center(
//                           child: Image.asset(
//                               "assets/dashboard/placeholder_image.png"),
//                         ),
//                         errorWidget: (context, url, error) =>
//                             const Icon(Icons.error),
//                       ),
//                       // Image.network(
//                       //   currentTenant?.image ?? '',
//                       //   height: 54.h,
//                       //   width: 54.w,
//                       // ),
//                       SizedBox(
//                         width: 20.w,
//                       ),
//                       Expanded(
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomText(
//                                     height: 1,
//                                     text: data?.name ?? '',
//                                     color: AppColors.titleTextColor,
//                                     fontSize: 14.sp,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                   SizedBox(
//                                     height: 6.h,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Image.asset(
//                                         'assets/dashboard/home_vector.png',
//                                         height: 15.h,
//                                         width: 15.w,
//                                       ),
//                                       SizedBox(
//                                         width: 4.w,
//                                       ),
//                                       CustomText(
//                                         height: 1,
//                                         text: data?.propertiesName ?? '',
//                                         color: const Color(0xff828282),
//                                         fontSize: 14.sp,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 6.h,
//                                   ),
//                                   Row(
//                                     children: [
//                                       Image.asset(
//                                         'assets/dashboard/Map-Line_vector.png',
//                                         height: 15.h,
//                                         width: 15.w,
//                                       ),
//                                       SizedBox(
//                                         width: 4.w,
//                                       ),
//                                       Expanded(
//                                         child: CustomText(
//                                           height: 1,
//                                           maxLine: 3,
//                                           text: data?.presentAddress ?? '',
//                                           color: const Color(0xff828282),
//                                           fontSize: 14.sp,
//                                           fontWeight: FontWeight.w700,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Image.asset(
//                                   'assets/dashboard/call_vector.png',
//                                   height: 20.h,
//                                   width: 20.w,
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 Image.asset(
//                                   'assets/dashboard/message_vector.png',
//                                   height: 20.h,
//                                   width: 20.w,
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 Image.asset(
//                                   'assets/dashboard/more_vector.png',
//                                   height: 20.h,
//                                   width: 20.w,
//                                 ),
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           )
//         : CustomText(
//             height: 1,
//             text: 'No Tenant Found',
//             color: Colors.black,
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w700,
//           );
//   }
// }
