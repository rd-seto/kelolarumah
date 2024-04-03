import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/property_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/properties_details_screen.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_screen/components/properties_list_container.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/no_data_found_widget.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PropertiesListSearch extends StatefulWidget {
  const PropertiesListSearch({
    super.key,
  });

  @override
  State<PropertiesListSearch> createState() => _PropertiesListSearchState();
}

class _PropertiesListSearchState extends State<PropertiesListSearch> {
  @override
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PropertyProvider(context),
      child: Consumer<PropertyProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBar(appBarName: 'Search'),
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
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.h,
                      ),
                      CustomText(
                        text: 'Search Property List',
                        color: AppColors.titleTextColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
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
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Color(0xffBEBEBE),
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0.w, vertical: 15.h),
                              child: const Icon(
                                Icons.filter_list,
                                color: AppColors.colorPrimary,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      provider.propertyListResponse?.data?.properties != null
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.propertyListResponse?.data
                                      ?.properties?.list?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                final data = provider.propertyListResponse?.data
                                    ?.properties?.list?[index];
                                return Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 8.0.h),
                                  child: PropertiesListContainer(
                                    image: data?.image,
                                    title: data?.name,
                                    tenanted: data?.totalRent.toString(),
                                    vacant: data?.totalOccupied.toString(),
                                    containerColor: AppColors.colorWhite,
                                    onTap: () {
                                      NavUtil.navigateScreen(
                                          context,
                                          PropertiesDetailsScreen(
                                            propertyId: data.id!,
                                          ));
                                    },
                                    onSave: () {
                                      provider.propertyData(context);
                                    },
                                    id: data!.id,
                                  ),
                                );
                              },
                            )
                          : const NoDataFoundWidget()
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
