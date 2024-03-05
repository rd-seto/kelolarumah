import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/components/shimmer/shimmers.dart';
import 'package:landlord/data/provider/tenant_property_details_provider.dart';
import 'package:landlord/pages/tenants/property_details/content/basic_info/properties_basic_info.dart';
import 'package:landlord/pages/tenants/property_details/content/floor_plan/floor_plan_cart.dart';
import 'package:landlord/pages/tenants/property_details/content/gallery/property_gallery_cart.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class TenantPropertyDetailsScreen extends StatefulWidget {
  const TenantPropertyDetailsScreen(
      {super.key, required this.propertyId, this.slug});
  final String? slug;
  final int propertyId;

  @override
  State<TenantPropertyDetailsScreen> createState() =>
      _TenantPropertyDetailsScreenState();
}

class _TenantPropertyDetailsScreenState
    extends State<TenantPropertyDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TenantPropertyDetailsProvider(
          context, widget.propertyId, widget.slug),
      child: Consumer<TenantPropertyDetailsProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: const CustomAppBar(appBarName: 'Properties_Details'),
            ),
            body: Stack(
              children: [
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.75,
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
                provider.tenantPropertyDetailModel?.data != null
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0.w, vertical: 13.h),
                        child: Column(
                          children: [
                            Container(
                              height: 200.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: CachedNetworkImage(
                                height: 200.h,
                                fit: BoxFit.cover,
                                imageUrl: provider.tenantPropertyDetailModel
                                        ?.data?.property?.image ??
                                    '',
                                placeholder: (context, url) => Center(
                                  child: Image.asset(
                                      "assets/dashboard/placeholder_image.png"),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                left: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: provider.tenantPropertyDetailModel
                                              ?.data?.property?.name ??
                                          '',
                                      color: AppColors.black2Sd,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                      height: 2,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: AppColors.color2Orange,
                                          size: 16,
                                        ),
                                        // SizedBox(
                                        //   width: 8.h,
                                        // ),
                                        CustomText(
                                          text: provider
                                              .tenantPropertyDetailModel
                                              ?.data
                                              ?.address
                                              ?.address,
                                          color: AppColors.color2Orange,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          height: 1.75,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        //// have to do add spacer
                                        // Container(
                                        //   padding: EdgeInsets.all(6.sp),
                                        //   decoration: BoxDecoration(
                                        //     color: AppColors.color2Orange,
                                        //     borderRadius: BorderRadius.circular(30),
                                        //   ),
                                        //   child: const Icon(
                                        //     Icons.edit,
                                        //     color: AppColors.colorWhite,
                                        //     size: 15,
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.colorWhite),
                              child: TabBar(
                                tabAlignment: TabAlignment.start,
                                isScrollable: true,
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
                                    text: 'Gallery'.tr(),
                                  ),
                                  // Tab(
                                  //   text: 'Tenants'.tr(),
                                  // ),
                                  // Tab(
                                  //   text: 'Facilities'.tr(),
                                  // ),
                                  Tab(
                                    text: 'Floor_Plans'.tr(),
                                  ),
                                ],
                                indicatorColor: AppColors.colorPrimary,
                                controller: _tabController,
                                indicatorSize: TabBarIndicatorSize.values.last,
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                // ignore: sort_child_properties_last
                                children: [
                                  //Basic info cart
                                  TenantPropertiesBasicInfo(
                                    propertyBasicInfo: provider
                                        .tenantPropertyDetailModel
                                        ?.data
                                        ?.property,
                                    pID: widget.propertyId,
                                  ),
                                  //Gallery Cart
                                  TenantPropertyGalleryCart(
                                    propertyGalleries: provider
                                        .tenantPropertyDetailModel
                                        ?.data
                                        ?.galleries,
                                    pId: widget.propertyId,
                                  ),
                                  //tenants cart
                                  // TenantsPropertyContainer(
                                  //   tenants: provider
                                  //       .tenantPropertyDetailModel?.data?.tenants
                                  // ),

                                  ///facilites cart
                                  // PropertyFacilitiesCart(
                                  //   facilities: provider
                                  //       .propertyDetailsResponse?.data?.facilities,
                                  //   provider: provider,
                                  //   pId: widget.propertyId,
                                  // ),
                                  TenantFloorPlanCart(
                                    floorPlans: provider
                                        .tenantPropertyDetailModel
                                        ?.data
                                        ?.floorPlans,
                                  )
                                ],
                                controller: _tabController,
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              RectangularCardShimmer(
                                height: 250,
                                width: double.infinity,
                              ),
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
                                height: 30,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RectangularCardShimmer(
                                height: 50,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RectangularCardShimmer(
                                height: 50,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RectangularCardShimmer(
                                height: 50,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RectangularCardShimmer(
                                height: 50,
                                width: double.infinity,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RectangularCardShimmer(
                                height: 50,
                                width: double.infinity,
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
