import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/edit_profile/edit_profile_screen.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/profile_details_screen/profile_basic_info.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/profile_details_screen/profile_info_content.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../../data/provider/profile_details_provider.dart';

class ProfileDetailsScreen extends StatelessWidget {
  final bool? isBottomNav;
  const ProfileDetailsScreen({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileDetailsProvider(context),
      child: Consumer<ProfileDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: isBottomNav == false
                ? PreferredSize(
                    preferredSize: Size.fromHeight(70.h),
                    child: const CustomAppBar(appBarName: 'Profile_Details'),
                  )
                : const PreferredSize(
                    // ignore: sort_child_properties_last
                    child: SizedBox(),
                    preferredSize: Size.fromHeight(0)),
            body: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/dashboard/backgorund_img.png',
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: provider.profileDetails?.data.profileInfo.email !=
                            null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Profile info content
                              ProfileInfoContent(
                                provider: provider,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.colorWhite,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                // profile Basic info
                                child: ProfileBasicInfo(
                                  provider: provider,
                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      NavUtil.navigateScreen(
                                          context,
                                          EditProfileScreen(
                                            profileData: provider.profileDetails
                                                ?.data.profileInfo,
                                            provider: provider,
                                          ));
                                    },
                                    child: Image.asset(
                                      'assets/dashboard/edit_float_img.png',
                                      height: 64.h,
                                      width: 64.w,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: const Center(
                                child: CircularProgressIndicator(
                              color: AppColors.colorPrimary,
                            ))),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
