import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/profile_details_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class ProfileInfoContent extends StatelessWidget {
  final ProfileDetailsProvider? provider;
  const ProfileInfoContent({super.key, this.provider});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(height: 80.h, width: 80.w,
            decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: NetworkImage(provider?.profileDetails?.data.profileInfo.avatar ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUefeN8m3w2jrqlb2CaPONb1XVKRTDXpyALbIlnpI-7A&s',), fit: BoxFit.fill),),
          ),
          CustomText(text: provider?.profileDetails?.data.profileInfo.name ?? '', color: AppColors.titleTextColor, fontSize: 16.sp, fontWeight: FontWeight.w700, height: 1.75,),
          CustomText(text: provider?.profileDetails?.data.profileInfo.email ?? '',
            color: AppColors.black2Sd, fontSize: 14.sp, fontWeight: FontWeight.w400, height: 1.75,),
        ],
      ),
    );
  }
}
