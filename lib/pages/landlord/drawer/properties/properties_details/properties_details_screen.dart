import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/property_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/components/basic_info/properties_basic_info.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/components/floor_plan/floor_plan_cart.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/components/gallery/property_gallery_cart.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/components/property_container/property_container.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/components/property_facilities/property_facilities_cart.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PropertiesDetailsScreen extends StatefulWidget {
  const PropertiesDetailsScreen({super.key, required this.propertyId});

  final int propertyId;

  @override
  State<PropertiesDetailsScreen> createState() =>
      _PropertiesDetailsScreenState();
}

class _PropertiesDetailsScreenState extends State<PropertiesDetailsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          PropertyDetailsProvider(context, widget.propertyId),
      child: Consumer<PropertyDetailsProvider>(
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
                  left: 0, right: 0, bottom: 0,
                  child: Opacity(opacity: 0.5,
                    child: Image.asset('assets/dashboard/backgorund_img.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 13.h),
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
                          imageUrl: provider.propertyDetailsResponse?.data
                                  ?.property?[0].image ??
                              '',
                          placeholder: (context, url) => Center(
                            child: Image.asset("assets/dashboard/landlord_logo.png")),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/dashboard/landlord_logo.png")
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: provider.propertyDetailsResponse?.data?.property?[0].name ?? '',
                            color: AppColors.black2Sd,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            height: 2,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,color: AppColors.color2Orange, size: 16),
                              CustomText(
                                text: provider.propertyDetailsResponse?.data?.property?[0].address,
                                color: AppColors.color2Orange,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                height: 1.75,
                              ),
                              SizedBox(width: 20.w),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(decoration: const BoxDecoration(color: AppColors.colorWhite),
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
                            Tab(text: 'Basic_Info'.tr()),
                            Tab(text: 'Gallery'.tr()),
                            Tab(text: 'Tenants'.tr()),
                            Tab(text: 'Facilities'.tr()),
                            Tab(text: 'Floor_Plans'.tr()),
                          ],
                          indicatorColor: AppColors.colorPrimary,
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.values.last,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,

                          children: [
                            //Basic info cart
                            PropertiesBasicInfo(
                              propertyBasicInfo: provider
                                  .propertyDetailsResponse?.data?.property?[0],
                              pID: widget.propertyId,
                              provider: provider,
                            ),
                            //Gallery Cart
                            PropertyGalleryCart(
                              propertyGalleries: provider
                                  .propertyDetailsResponse?.data?.gallery,
                              pId: widget.propertyId,
                              provider: provider,
                            ),
                            //tenants cart
                            PropertyTenantsContainer(
                              propertyDetails: provider.propertyDetailsResponse,
                            ),

                            ///facilites cart
                            PropertyFacilitiesCart(
                              facilities: provider
                                  .propertyDetailsResponse?.data?.facilities,
                              provider: provider,
                              pId: widget.propertyId,
                            ),
                            FloorPlanCart(
                              propertyFlorPlans: provider
                                  .propertyDetailsResponse?.data?.floorPlans,
                              provider: provider,
                              pId: widget.propertyId,
                            )
                          ],
                        ),
                      ),
                    ],
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
