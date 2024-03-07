import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:remixicon/remixicon.dart';

class WishlistContent extends StatelessWidget {
  const WishlistContent({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.size,
    required this.price,
    required this.type,
    required this.vacant,
    required this.flatNo,
    required this.completion,
    required this.dealType,
    required this.category,
  });

  final String thumbnail;
  final String title;
  final String address;
  final String bedrooms;
  final String bathrooms;
  final String size;
  final String price;
  final String type;
  final String vacant;
  final String flatNo;
  final String completion;
  final String dealType;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            child: Stack(
              children: [
                Image.network(
                  thumbnail,
                  fit: BoxFit.cover,
                  height: 200.h,
                  width: double.infinity,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        color: const Color(0xff087c7c),
                        child: const Text(
                          "-50%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        color: Colors.orange.shade600,
                        child: Text(
                          dealType,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    color: const Color(0xff087c7c),
                    child: const Icon(
                      Remix.delete_bin_2_line,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Remix.map_pin_2_line,
                            color: Color(0xff087c7c),
                            size: 18,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          CustomText(
                            text: address,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Remix.walk_line,
                            color: Color(0xff087c7c),
                            size: 18,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          CustomText(
                            text: '$bathrooms bath'.tr(),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Remix.hotel_bed_line,
                            color: Color(0xff087c7c),
                            size: 18,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          CustomText(
                            text: '$bedrooms bed'.tr(),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Remix.building_line,
                            color: Color(0xff087c7c),
                            size: 18,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          CustomText(
                            text: '$size sqft',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 0.6,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 18.r,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    CustomText(
                      text: completion,
                      fontSize: 14.r,
                      color: Colors.black,
                    ),
                    const Spacer(),
                    CustomText(
                      text: price,
                      fontSize: 14.r,
                      color: const Color(0xff087c7c),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            backgroundColor: const Color(0xff087c7c),
                          ),
                          child: Text(
                            "call".tr(),
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.black.withOpacity(0.6)),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              backgroundColor: Colors.white),
                          child: Text(
                            "email".tr(),
                            style: const TextStyle(
                              color: Color(0xff087c7c),
                            ),
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
