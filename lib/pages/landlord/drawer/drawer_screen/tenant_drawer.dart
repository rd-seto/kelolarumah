import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/extention/device_type_extention.dart';
import 'package:landlord/pages/chat_screen/chat_room.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/profile_settings_screen/profile_settings_screen.dart';
import 'package:landlord/pages/landlord/home/language/language_screen.dart';
import 'package:landlord/pages/tenants/due_payment/view/due_payment_page.dart';
import 'package:landlord/pages/tenants/my_wishlist/view/my_wishlist_page.dart';
import 'package:landlord/pages/tenants/properties/view/tenant_properties_screen.dart';
import 'package:landlord/pages/tenants/purchase_history/view/purchase_history_page.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../auth/login/login_option/login_option_screen.dart';

class TenantAppDrawer extends StatelessWidget {
  const TenantAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    print('device type ${context.deviceType()}');
    return Drawer(
      backgroundColor: AppColors.backgroundColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.0.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/dashboard/landlord_logo.png',
                  height: 38.h,
                  width: 185.w,
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w, vertical: 16.h),
                    child: Column(
                      children: [
                        DrawerListContent(
                          onTap: () {
                            NavUtil.navigateScreen(
                                context,
                                const ProfileSettingsScreen(
                                  isBottomNav: false,
                                ));
                          },
                          image: 'assets/drawer/propertise_icon1.png',
                          title: "my_profile".tr(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DrawerListContent(
                          onTap: () {
                            NavUtil.navigateScreen(
                                context,
                                const PurchaseHistoryPage(
                                  isBottomNav: false,
                                ));
                          },
                          image: 'assets/drawer/cash_vector.png',
                          title: "purchase_history".tr(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DrawerListContent(
                          onTap: () {
                            NavUtil.navigateScreen(
                                context, const TenantPropertiesScreen());
                          },
                          image: 'assets/drawer/propertise_icon1.png',
                          title: "Properties".tr(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w, vertical: 16.h),
                    child: Column(
                      children: [
                        DrawerListContent(
                          onTap: () {
                            NavUtil.navigateScreen(context, const ChatRoom());
                          },
                          image: 'assets/drawer/chat.png',
                          title: "chat".tr(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DrawerListContent(
                          onTap: () {
                            NavUtil.navigateScreen(
                                context, const MyWishlistPage());
                          },
                          image: 'assets/drawer/transaction_vector.png',
                          title: "my_wishlist".tr(),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DrawerListContent(
                          onTap: () {
                            NavUtil.navigateScreen(
                                context, const DuePaymentPage());
                          },
                          image: 'assets/drawer/report_vector.png',
                          title: "due_payment".tr(),
                        ),

                        // DrawerListContent(
                        //   onTap: () {
                        //     NavUtil.navigateScreen(context, const Tickets());
                        //   },
                        //   image: 'assets/drawer/cash_vector.png',
                        //   title: "Tickets",
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12.0.w, vertical: 16.h),
                    child: Column(
                      children: [
                        // DrawerListContent(
                        //   onTap: () {
                        //     NavUtil.navigateScreen(
                        //         context, const TenantsProfileSetting());
                        //   },
                        //   image: 'assets/drawer/settings_vector.png',
                        //   title: "Profile Settings",
                        // ),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        DrawerListContent(
                          onTap: () {
                            NavUtil.navigateScreen(
                                context, const LanguageScreen());
                          },
                          image: 'assets/drawer/settings_vector.png',
                          title: "Language",
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        DrawerListContent(
                          onTap: () => showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content:
                                  const Text('Are_you_sure_you_want_to_logout?')
                                      .tr(),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('No').tr()),
                                TextButton(
                                    onPressed: () async {
                                      context
                                          .read<LocalAutProvider>()
                                          .deleteUser();
                                      NavUtil.pushAndRemoveUntil(
                                          context, const LoginOptionScreen());
                                    },
                                    child: const Text('Yes').tr()),
                              ],
                            ),
                          ),
                          image: 'assets/drawer/logout_vector.png',
                          title: "Logout",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerListContent extends StatelessWidget {
  final String? title;
  final String? image;
  final Function()? onTap;

  const DrawerListContent({super.key, this.title, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            image ?? '',
            height: 24.h,
          ),
          SizedBox(
            width: 12.w,
          ),
          CustomText(
            text: title,
            color: AppColors.black2Sd,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
