import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/notification_model.dart';
import 'package:landlord/pages/landlord/home/notification/notification_details.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

class NotificationListCart extends StatelessWidget {
  final Color? containerBackgroundColor;
  final NotificationModel? notificationResponse;

  const NotificationListCart(
      {super.key, this.containerBackgroundColor, this.notificationResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: containerBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 16.h),
        child: notificationResponse?.data?.items != null
            ? ListView.separated(
                shrinkWrap: true,
                itemCount: notificationResponse?.data?.items?.length ?? 0,
                itemBuilder: (context, index) {
                  List<Item>? items = notificationResponse?.data?.items;
                  return InkWell(
                    onTap: () {
                      NavUtil.navigateScreen(
                          context,
                          NotificationDetails(
                              isBottomNav: false, item: items?[index]));
                    },
                    child: Row(
                      children: [
                        Container(
                            decoration: const BoxDecoration(
                                color: AppColors.colorPrimary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            padding: const EdgeInsets.all(8),
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 20,
                            )),
                        SizedBox(
                          width: 14.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: items?[index].title ?? "",
                                color: AppColors.titleTextColor,
                                fontSize: 18.sp,
                                maxLine: 1,
                                fontWeight: FontWeight.bold,
                                height: 1.6,
                              ),
                              CustomText(
                                text: items?[index].description ?? "",
                                color: AppColors.titleTextColor,
                                fontSize: 14.sp,
                                maxLine: 3,
                                fontWeight: FontWeight.w500,
                                height: 1.6,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text: items?[index].timeDifference ?? "",
                                    color: AppColors.colorPrimary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.6,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  CustomText(
                                    text: items?[index].createdAt ?? "",
                                    color: AppColors.colorPrimary,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    height: 1.6,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    color: AppColors.colorPrimary,
                    thickness: 0.3,
                  );
                },
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.colorPrimary,
                  ),
                ),
              ),
      ),
    );
  }
}
