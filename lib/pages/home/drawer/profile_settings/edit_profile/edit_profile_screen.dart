import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/components/text_form_field.dart';
import 'package:landlord/data/model/update_profile_model.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../data/local/local_auth_provider.dart';
import '../../../../../data/provider/update_profile_provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

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
                Center(
                  child: Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Image.asset(
                            'assets/drawer/profile_edit_img.png',
                            height: 80.h,
                          ),
                          Positioned(
                            left: 48.w,
                            right: 0.w,
                            bottom: -5.h,
                            child: Image.asset(
                              'assets/dashboard/edit_float_img.png',
                              height: 36.h,
                              width: 36.w,
                            ),
                          ),
                        ],
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
                      const ProfileEditBasicInfo(),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            FromField(
                              title: "Current_Password",
                              onChange: (currentPassword) {
                                updatePassword.oldPassword = currentPassword;
                              },
                              hintText: "xxxxxxxx",
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            FromField(
                              title: "New_Password",
                              onChange: (newPassword) {
                                updatePassword.password = newPassword;
                              },
                              hintText: "xxxxxxxxx",
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            FromField(
                              title: "Confirm_Password",
                              onChange: (confirmPassword) {
                                updatePassword.confirmPassword =
                                    confirmPassword;
                              },
                              hintText: "xxxxxxxxx",
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ElevatedButtonWidget(
                              text: "Save",
                              onPressed: () {
                                if (updatePassword.password ==
                                    updatePassword.confirmPassword) {
                                  Provider.of<UpdateProfileProvider>(context,
                                          listen: false)
                                      .updateProfile(
                                          json: updatePassword.toJson(),
                                          context: context);
                                } else {
                                  Fluttertoast.showToast(
                                    msg:
                                        'Password and confirm password not matched',
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      )
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

class ProfileEditBasicInfo extends StatelessWidget {
  const ProfileEditBasicInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpdateProfile user = UpdateProfile();

    final userModel = Provider.of<LocalAutProvider>(context).getUser();

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          FromField(
            hintText: "name",
            controller: TextEditingController(text: userModel?.name),
            onChange: (name) {
              user.name = name;
            },
            title: "name",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            title: "Email",
            controller: TextEditingController(text: userModel?.email),
            onChange: (email) {
              user.email = email;
            },
            hintText: "example@gmail.com",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            title: "Phone_Number",
            onChange: (phone) {
              user.phone = phone;
            },
            hintText: "01XXXXXXXXXX",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            hintText: "2023/02/15",
            title: "Date_Of_Birth",
            onChange: (date) {
              user.dateOfBirth = date;
            },
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_month_outlined),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            hintText: "01xxxxxxxxxx",
            controller: TextEditingController(text: userModel?.nid),
            onChange: (nid) {
              user.nidNo = nid;
            },
            title: "NID_No",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            hintText: "BDXXXXXXXXXX",
            controller: TextEditingController(text: userModel?.passport),
            onChange: (passport) {
              user.passportNo = passport;
            },
            title: "Passport_No",
          ),
          SizedBox(
            height: 20.h,
          ),
          ElevatedButtonWidget(
            text: "Save",
            onPressed: () {
              Provider.of<UpdateProfileProvider>(context, listen: false)
                  .updateProfile(json: user.toJson(), context: context);
            },
          )
        ],
      ),
    );
  }
}
