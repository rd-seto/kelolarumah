import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/shimmer/shimmers.dart';
import 'package:landlord/data/provider/tenant_property_provider.dart';
import 'package:landlord/pages/tenants/my_wishlist/content/wishlist_content.dart';
import 'package:landlord/pages/tenants/properties/content/search_property.dart';
import 'package:landlord/pages/tenants/property_details/view/tenant_property_details_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class TenantPropertiesScreen extends StatefulWidget {
  const TenantPropertiesScreen({super.key});

  @override
  State<TenantPropertiesScreen> createState() => _TenantPropertiesScreenState();
}

class _TenantPropertiesScreenState extends State<TenantPropertiesScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TenantPropertyProvider(context),
      child: Consumer<TenantPropertyProvider>(
        builder: (BuildContext context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Properties'),
            ),
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
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  NavUtil.navigateScreen(
                                      context, const SearchProperty());
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: AppColors.colorWhite,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: AppColors.stockColor)),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.search_rounded,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Search here',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   width: 10.w,
                            // ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(8.r),
                            //   ),
                            //   child: Padding(
                            //     padding: EdgeInsets.symmetric(
                            //         horizontal: 15.0.w, vertical: 15.h),
                            //     child: const Icon(
                            //       Icons.filter_list,
                            //       color: AppColors.colorPrimary,
                            //       size: 20,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        provider.tenantPropertyModel?.data != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: CustomText(
                                      text: 'trending_properties'.tr(),
                                      color: AppColors.titleTextColor,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  provider
                                              .tenantPropertyModel
                                              ?.data
                                              ?.trendingProperties
                                              ?.list
                                              ?.isEmpty ==
                                          false
                                      ? ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: provider
                                                  .tenantPropertyModel
                                                  ?.data
                                                  ?.trendingProperties
                                                  ?.list
                                                  ?.length ??
                                              0,
                                          itemBuilder: (context, index) {
                                            final data = provider
                                                .tenantPropertyModel
                                                ?.data
                                                ?.trendingProperties
                                                ?.list?[index];
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  NavUtil.navigateScreen(
                                                      context,
                                                      TenantPropertyDetailsScreen(
                                                        propertyId:
                                                            data!.advertiseId!,
                                                        slug: data.slug,
                                                      ));
                                                },
                                                child: WishlistContent(
                                                  thumbnail: data?.image ?? '',
                                                  title: data?.name ?? "",
                                                  address: data?.address ?? "",
                                                  bedrooms: data?.bathrooms
                                                          .toString() ??
                                                      '',
                                                  bathrooms: data?.bathrooms
                                                          .toString() ??
                                                      '',
                                                  size: data?.size ?? '',
                                                  price: data?.price ?? '',
                                                  type: data?.type.toString() ??
                                                      '',
                                                  vacant: data?.vacant ?? '',
                                                  flatNo: data?.flatNo ?? '',
                                                  completion:
                                                      data?.completion ?? '',
                                                  dealType:
                                                      data?.dealType ?? '',
                                                  category:
                                                      data?.category ?? '',
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : const NoDataFoundWidget(),
                                  Visibility(
                                    visible: provider
                                                .tenantPropertyModel
                                                ?.data
                                                ?.recommendedProperties
                                                ?.list
                                                ?.isEmpty ==
                                            true
                                        ? false
                                        : true,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: CustomText(
                                            text: 'recommended_properties'.tr(),
                                            color: AppColors.titleTextColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        provider
                                                    .tenantPropertyModel
                                                    ?.data
                                                    ?.recommendedProperties
                                                    ?.list
                                                    ?.isEmpty ==
                                                false
                                            ? ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: provider
                                                        .tenantPropertyModel
                                                        ?.data
                                                        ?.recommendedProperties
                                                        ?.list
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  final data = provider
                                                      .tenantPropertyModel
                                                      ?.data
                                                      ?.recommendedProperties
                                                      ?.list?[index];
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        NavUtil.navigateScreen(
                                                            context,
                                                            TenantPropertyDetailsScreen(
                                                              propertyId: data!
                                                                  .advertiseId!,
                                                              slug: data.slug,
                                                            ));
                                                      },
                                                      child: WishlistContent(
                                                        thumbnail:
                                                            data?.image ?? '',
                                                        title: data?.name ?? "",
                                                        address:
                                                            data?.address ?? "",
                                                        bedrooms: data
                                                                ?.bathrooms
                                                                .toString() ??
                                                            '',
                                                        bathrooms: data
                                                                ?.bathrooms
                                                                .toString() ??
                                                            '',
                                                        size: data?.size ?? '',
                                                        price:
                                                            data?.price ?? '',
                                                        type: data?.type
                                                                .toString() ??
                                                            '',
                                                        vacant:
                                                            data?.vacant ?? '',
                                                        flatNo:
                                                            data?.flatNo ?? '',
                                                        completion:
                                                            data?.completion ??
                                                                '',
                                                        dealType:
                                                            data?.dealType ??
                                                                '',
                                                        category:
                                                            data?.category ??
                                                                '',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : const NoDataFoundWidget(),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: provider
                                                .tenantPropertyModel
                                                ?.data
                                                ?.discountedProperties
                                                ?.list
                                                ?.isEmpty ==
                                            true
                                        ? false
                                        : true,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: CustomText(
                                            text: 'discounted_properties'.tr(),
                                            color: AppColors.titleTextColor,
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        provider
                                                    .tenantPropertyModel
                                                    ?.data
                                                    ?.discountedProperties
                                                    ?.list
                                                    ?.isEmpty ==
                                                false
                                            ? ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: provider
                                                        .tenantPropertyModel
                                                        ?.data
                                                        ?.discountedProperties
                                                        ?.list
                                                        ?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  final data = provider
                                                      .tenantPropertyModel
                                                      ?.data
                                                      ?.discountedProperties
                                                      ?.list?[index];
                                                  return Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10),
                                                    child: InkWell(
                                                      onTap: () {
                                                        NavUtil.navigateScreen(
                                                            context,
                                                            TenantPropertyDetailsScreen(
                                                              propertyId: data!
                                                                  .advertiseId!,
                                                              slug: data.slug,
                                                            ));
                                                      },
                                                      child: WishlistContent(
                                                        thumbnail:
                                                            data?.image ?? '',
                                                        title: data?.name ?? "",
                                                        address:
                                                            data?.address ?? "",
                                                        bedrooms: data
                                                                ?.bathrooms
                                                                .toString() ??
                                                            '',
                                                        bathrooms: data
                                                                ?.bathrooms
                                                                .toString() ??
                                                            '',
                                                        size: data?.size ?? '',
                                                        price:
                                                            data?.price ?? '',
                                                        type: data?.type
                                                                .toString() ??
                                                            '',
                                                        vacant:
                                                            data?.vacant ?? '',
                                                        flatNo:
                                                            data?.flatNo ?? '',
                                                        completion:
                                                            data?.completion ??
                                                                '',
                                                        dealType:
                                                            data?.dealType ??
                                                                '',
                                                        category:
                                                            data?.category ??
                                                                '',
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )
                                            : const NoDataFoundWidget(),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : const Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RectangularCardShimmer(
                                    height: 30,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RectangularCardShimmer(
                                    height: 400,
                                    width: double.infinity,
                                  ),
                                  RectangularCardShimmer(
                                    height: 30,
                                    width: double.infinity,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  RectangularCardShimmer(
                                    height: 400,
                                    width: double.infinity,
                                  ),
                                ],
                              )
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
