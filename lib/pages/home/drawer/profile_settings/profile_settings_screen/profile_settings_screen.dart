import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/pages/home/drawer/profile_settings/edit_profile/edit_profile_screen.dart';
import 'package:landlord/pages/home/drawer/tenants/components/summary_container_black.dart';
import 'package:landlord/pages/home/drawer/tenants/components/summary_container_white.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../../data/local/local_auth_provider.dart';
import '../../../../../data/provider/profile_details_provider.dart';

class ProfileSettingsScreen extends StatelessWidget {
  final bool? isBottomNav;
  const ProfileSettingsScreen({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocalAutProvider>(context);
    final user = provider.getUser();
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          ProfileDetailsProvider(context),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/drawer/profile_edit_img.png',
                                height: 80.h,
                              ),
                              CustomText(
                                text: user?.name ?? '',
                                color: AppColors.titleTextColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                height: 1.75,
                              ),
                              CustomText(
                                text: user?.email ?? '',
                                color: AppColors.black2Sd,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                height: 1.75,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 18.0.w,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 28.h,
                                ),
                                 SummaryContainerBlack(
                                  title: "Join Date",
                                  subTitle: provider.profileDetails?.data?.profileInfo?.joinDate ?? "N/A",
                                ),
                                 SummaryContainerWhite(
                                  title: "Occupation",
                                  subTitle: provider.profileDetails?.data?.profileInfo?.occupation ?? "N/A",
                                ),
                                 SummaryContainerBlack(
                                  title: "Designation",
                                  subTitle: provider.profileDetails?.data?.profileInfo?.designation ?? "N/A",
                                ),
                                 SummaryContainerWhite(
                                  title: "Institution",
                                    subTitle: provider.profileDetails?.data?.profileInfo?.institution ?? "N/A",
                                ),
                                SummaryContainerBlack(
                                  title: "NID_No",
                                  subTitle: provider.profileDetails?.data?.profileInfo?.nid ?? "N/A",
                                ),
                                SummaryContainerWhite(
                                  title: "Passport_No",
                                  subTitle: provider.profileDetails?.data?.profileInfo?.passport ?? "N/A",
                                ),
                              ],
                            ),
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
                                    context, const EditProfileScreen());
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
                    ),
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
