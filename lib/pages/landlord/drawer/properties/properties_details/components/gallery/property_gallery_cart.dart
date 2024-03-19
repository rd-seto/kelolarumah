import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/model/tenant_property_details.dart';
import 'package:landlord/data/provider/property_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_details/components/gallery/add_gallery.dart/add_gallery_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PropertyGalleryCart extends StatelessWidget {
  final PropertyDetailsProvider? provider;

  final int? pId;
  const PropertyGalleryCart(
      {super.key,  this.pId, this.provider});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, __, _) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  provider?.propertyDetailsResponse?.data?.gallery == null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: CustomText(
                            height: 1,
                            text: 'No Gallery Found Please add some',
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      : GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: provider?.propertyDetailsResponse?.data
                                  ?.gallery?.length ??
                              0,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 150,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20.0,
                                  mainAxisSpacing: 4.0),
                          itemBuilder: (BuildContext context, int index) {
                            final data = provider?.propertyDetailsResponse?.data
                                ?.gallery?[index];
                            return Image.network(data!.path!);
                          },
                        ),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //       border: Border.all(color: AppColors.mainColorsh1),
                  //       color: AppColors.colorWhite,
                  //       borderRadius: BorderRadius.circular(8)),
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: 10.0.w, vertical: 8.h),
                  //     child: CustomText(
                  //       text: 'Load_More',
                  //       color: AppColors.mainColorsh1,
                  //       fontSize: 16.sp,
                  //       fontWeight: FontWeight.w700,
                  //       height: 1.75,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  NavUtil.navigateScreen(
                      context,
                      AddGalleryScreen(
                        onSave: () {
                          provider?.propertyDetails(context, pId);
                        },
                        propertyId: pId,
                      ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16.sp),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.colorPrimary),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.colorWhite,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
