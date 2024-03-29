import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/update_profile_provider.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/edit_profile/edit_profile_screen.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class EditProfileInfoContent extends StatelessWidget {
  const EditProfileInfoContent({
    super.key,
    required this.provider,
    required this.widget,
  });

  final UpdateProfileProvider provider;
  final EditProfileScreen widget;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              InkWell(
                onTap: () {
                  provider.pickImage(context);
                },
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: const Color(0xFFE4E4E4), width: 8)),
                        child: provider.imagePath == null
                            ? ClipOval(
                                child: Image.network(
                                    widget.profileData?.avatar ??
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUefeN8m3w2jrqlb2CaPONb1XVKRTDXpyALbIlnpI-7A&s',
                                    fit: BoxFit.cover),
                              )
                            : ClipOval(
                                child: Image.file(
                                provider.imagePath!,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              )),
                      ),
                      widget.profileData?.avatar == null
                          ? Positioned(
                              bottom: 6,
                              right: 6,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.colorPrimary),
                                child: const Icon(
                                  size: 18.0,
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : Positioned(
                              bottom: 6,
                              right: 6,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.colorPrimary),
                                child: const Icon(
                                  size: 18.0,
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
          CustomText(
            text: widget.profileData?.name,
            color: AppColors.titleTextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            height: 1.75,
          ),
          CustomText(
            text: widget.profileData?.email,
            color: AppColors.black2Sd,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            height: 1.75,
          ),
        ],
      ),
    );
  }
}
