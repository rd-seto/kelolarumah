import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/provider/tenant_property_provider.dart';
import 'package:landlord/pages/tenants/my_wishlist/content/wishlist_content.dart';
import 'package:landlord/pages/tenants/property_details/view/tenant_property_details_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class SearchProperty extends StatefulWidget {
  const SearchProperty({super.key});

  @override
  State<SearchProperty> createState() => _SearchPropertyState();
}

class _SearchPropertyState extends State<SearchProperty> {
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
              child: const CustomAppBar(appBarName: 'Property Search'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.0.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                color: AppColors.colorWhite,
                                borderRadius: BorderRadius.circular(8),
                                border:
                                    Border.all(color: AppColors.stockColor)),
                            child: TextFormField(
                              onChanged: (val) {
                                provider.searchPropertyData(context, val);
                              },
                              decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(5),
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Color(0xffBEBEBE),
                                  ),
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    provider.searchData?.data != null
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: provider.searchData?.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              final data = provider.searchData?.data?[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: InkWell(
                                  onTap: () {
                                    NavUtil.navigateScreen(
                                        context,
                                        TenantPropertyDetailsScreen(
                                          propertyId: data!.advertiseId!,
                                          slug: data.slug,
                                        ));
                                  },
                                  child: WishlistContent(
                                    thumbnail: data?.image ?? '',
                                    title: data?.name ?? "",
                                    address: data?.address ?? "",
                                    bedrooms: data?.bathrooms.toString() ?? '',
                                    bathrooms: data?.bathrooms.toString() ?? '',
                                    size: data?.size ?? '',
                                    price: data?.price ?? '',
                                    type: data?.type.toString() ?? '',
                                    vacant: data?.vacant ?? '',
                                    flatNo: data?.flatNo ?? '',
                                    completion: data?.completion ?? '',
                                    dealType: data?.dealType ?? '',
                                    category: data?.category ?? '',
                                  ),
                                ),
                              );
                            },
                          )
                        : const NoDataFoundWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
