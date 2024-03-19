// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:landlord/components/custom_text.dart';
// import 'package:landlord/data/model/tenant_model.dart';
// import 'package:landlord/utils/theme/app_colors.dart';

// class TenantsSummaryChart extends StatelessWidget {
//   final TenantModel? tenantModel;

//   const TenantsSummaryChart({Key? key, required this.tenantModel})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             height: 100.h,
//             decoration: BoxDecoration(
//                 color: const Color(0xff00B3DA),
//                 borderRadius: BorderRadius.circular(12.r)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomText(
//                   text: 'Total',
//                   color: AppColors.colorWhite,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 CustomText(
//                   text: '${tenantModel?.total ?? 0}',
//                   color: AppColors.colorWhite,
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 10.w,
//         ),
//         Expanded(
//           child: Container(
//             height: 100.h,
//             decoration: BoxDecoration(
//                 color: AppColors.mainColorsh1,
//                 borderRadius: BorderRadius.circular(12.r)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomText(
//                   text: 'Active',
//                   color: AppColors.colorWhite,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 CustomText(
//                   text: '${tenantModel?.active ?? 0}',
//                   color: AppColors.colorWhite,
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 10.w,
//         ),
//         Expanded(
//           child: Container(
//             height: 100.h,
//             decoration: BoxDecoration(
//                 color: AppColors.color2Orange,
//                 borderRadius: BorderRadius.circular(12.r)),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomText(
//                   text: 'Inactive',
//                   color: AppColors.colorWhite,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//                 CustomText(
//                   text: '${tenantModel?.inActive ?? 0}',
//                   color: AppColors.colorWhite,
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.w700,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
