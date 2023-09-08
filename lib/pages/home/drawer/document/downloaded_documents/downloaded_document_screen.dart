import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/provider/document_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class DownloadedDocumentScreen extends StatelessWidget {
  const DownloadedDocumentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DocumentProvider>(context, listen: true);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: const CustomAppBar(
          appBarName: 'Document',
        ),
      ),
      body: Consumer(
        builder: (context, __, _) {
          provider.getCacheDocuments(context);
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ...provider.cacheList
                      .map(
                        (e) => InkWell(
                          onTap: () {
                            provider.openPdf(e.file);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              color: AppColors.colorWhite,
                              child: Padding(
                                padding: EdgeInsets.all(10.0.sp),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/dashboard/pdf_img.png',
                                      height: 38.h,
                                      width: 30.w,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.filename ?? '',
                                          style: TextStyle(
                                            color: AppColors.titleTextColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            height: 1.75,
                                          ),
                                        ),
                                        Text(
                                          '7 Days Ago',
                                          style: TextStyle(
                                            color: AppColors.titleTextColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.75,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      e.size ?? '',
                                      style: TextStyle(
                                        color: AppColors.titleTextColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1.75,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
