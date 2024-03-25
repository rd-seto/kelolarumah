import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/model/tenant_wishlist_model.dart';
import 'package:landlord/data/tenant_provider/tenant_wishlist_provider.dart';
import 'package:landlord/pages/tenants/my_wishlist/content/wishlist_content.dart';
import 'package:landlord/pages/tenants/property_details/view/tenant_property_details_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class MyWishlistPage extends StatelessWidget {
  const MyWishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TenantWishlistProvider(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: CustomAppBar(appBarName: "my_wishlist".tr()),
        ),
        body: Consumer<TenantWishlistProvider>(
          builder: (BuildContext context, provider, _) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<TenantWishlistModel?>(
                future: provider.getTenantWishlist(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return snapshot.data?.data?.list?.isEmpty == false
                        ? ListView.builder(
                            itemCount: snapshot.data?.data?.list?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              final data = snapshot.data?.data?.list?[index];
                              final property = data?.property;
                              return InkWell(
                                onTap: () {
                                  NavUtil.navigateScreen(
                                      context,
                                      TenantPropertyDetailsScreen(
                                        propertyId: property!.id!,
                                        slug: property.slug,
                                      ));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: WishlistContent(
                                    thumbnail: property?.image ?? '',
                                    title: property?.name ?? '',
                                    address: property?.address ?? '',
                                    bedrooms: property?.bedrooms ?? '',
                                    bathrooms: property?.bathrooms ?? '',
                                    size: property?.size ?? '',
                                    price: property?.price ?? '',
                                    type: property?.type ?? '',
                                    vacant: property?.vacant ?? '',
                                    flatNo: property?.flatNo ?? '',
                                    completion: property?.completion ?? '',
                                    dealType: property?.dealType ?? '',
                                    category: property?.category ?? '',
                                  ),
                                ),
                              );
                            },
                          )
                        : const NoDataFoundWidget();
                  }
                  return const Center(child: CircularProgressIndicator());
                },
                // child: Padding(
                //   padding: EdgeInsets.all(20.0.sp),
                //   child: const Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [WishlistContent()],
                //   ),
                // ),
              ),
            );
          },
        ),
      ),
    );
  }
}
