import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/local/local_auth_provider.dart';
import 'package:landlord/pages/landlord/home/dashboard/dashboard_screen.dart';
import 'package:landlord/pages/landlord/drawer/cash_management/cash_management_applicant_type_page.dart';
import 'package:landlord/pages/landlord/drawer/document/document_list/document_list_screen.dart';
import 'package:landlord/pages/landlord/drawer/profile_settings/profile_details_screen/profile_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_screen/properties_screen.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_screen/tenants_screen.dart';
import 'package:landlord/pages/landlord/drawer/transaction/transaction_list/transaction_list_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../auth/login/login_option/login_option_screen.dart';

class TabletAppDrawer extends StatelessWidget {
  const TabletAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: Drawer(
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
                                  const DashboardScreen(
                                    isBottomNav: false,
                                  ));
                            },
                            image: 'assets/drawer/dashbord_icon.png',
                            title: "Dashboard",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DrawerListContent(
                            onTap: () {
                              NavUtil.navigateScreen(
                                  context, const PropertiesScreen());
                            },
                            image: 'assets/drawer/propertise_icon1.png',
                            title: "Properties",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DrawerListContent(
                            onTap: () {
                              NavUtil.navigateScreen(
                                  context,
                                  const TenantsScreen(
                                    isBottomNav: false,
                                  ));
                            },
                            image: 'assets/drawer/tenants_vector.png',
                            title: "Tenants",
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
                              NavUtil.navigateScreen(
                                  context, const TransactionListScreen());
                            },
                            image: 'assets/drawer/transaction_vector.png',
                            title: "Transaction",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DrawerListContent(
                            onTap: () {
                              NavUtil.navigateScreen(
                                  context, const DocumentListScreen());
                            },
                            image: 'assets/drawer/document_vector.png',
                            title: "Document",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DrawerListContent(
                            onTap: () {

                            },
                            image: 'assets/drawer/report_vector.png',
                            title: "Report",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DrawerListContent(
                            onTap: () {
                              NavUtil.navigateScreen(context,
                                  const CashManagementApplicantTypePage());
                            },
                            image: 'assets/drawer/cash_vector.png',
                            title: "Cash Management",
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
                              NavUtil.navigateScreen(
                                  context,
                                  const ProfileDetailsScreen(
                                    isBottomNav: false,
                                  ));
                            },
                            image: 'assets/drawer/settings_vector.png',
                            title: "Profile Settings",
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          DrawerListContent(
                            onTap: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: const Text(
                                    'Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('No')),
                                  TextButton(
                                      onPressed: () async {
                                        context
                                            .read<LocalAutProvider>()
                                            .deleteUser();
                                        NavUtil.pushAndRemoveUntil(
                                            context, const LoginOptionScreen());
                                      },
                                      child: const Text('Yes')),
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
