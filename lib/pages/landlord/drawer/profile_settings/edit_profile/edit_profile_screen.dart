import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/model/update_profile_model.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/edit_profile/change_password_content.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/edit_profile/edit_profile_info_content.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/edit_profile/profile_edit_basic_info.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../../data/local/local_auth_provider.dart';
import '../../../../../data/model/profile_details_model.dart';
import '../../../../../data/provider/profile_details_provider.dart';
import '../../../../../data/provider/update_profile_provider.dart';

class EditProfileScreen extends StatefulWidget {
  final ProfileInfo? profileData;
  final ProfileDetailsProvider? provider;

  const EditProfileScreen({super.key, this.profileData, this.provider});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<LocalAutProvider>(context, listen: false).getUser();

    Provider.of<UpdateProfileProvider>(context, listen: false);

    UpdatePassword updatePassword = UpdatePassword();
    final provider = Provider.of<UpdateProfileProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(appBarName: 'Edit_Profile'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 4,
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/dashboard/backgorund_img.png',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 13.h),
            child: Column(
              children: [
                // Edit profile info content
                EditProfileInfoContent(provider: provider, widget: widget),
                SizedBox(
                  height: 10.h,
                ),
                TabBar(
                  unselectedLabelColor: AppColors.black2Sd,
                  labelColor: AppColors.colorPrimary,
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    Tab(
                      text: 'Basic_Info'.tr(),
                    ),
                    Tab(
                      text: 'Reset_Password'.tr(),
                    ),
                  ],
                  indicatorColor: AppColors.colorPrimary,
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    // ignore: sort_child_properties_last
                    children: [
                      ProfileEditBasicInfo(
                        profileData: widget.profileData,
                        imagePath: provider.imagePath,
                        onSave: () {
                          widget.provider?.profileDetailsData(context);
                        },
                      ),
                      ChangePasswordContent(
                          provider: provider, updatePassword: updatePassword)
                    ],
                    controller: _tabController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
