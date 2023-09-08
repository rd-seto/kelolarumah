import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/data/provider/document_provider.dart';
import 'package:landlord/pages/home/drawer/document/add_document/add_document_screen.dart';
import 'package:landlord/pages/home/drawer/document/downloaded_documents/downloaded_document_screen.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DocumentProvider(context),
      child: Consumer<DocumentProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.h),
              child: CustomAppBar(
                appBarName: 'Document',
                actions: [
                  IconButton(
                      onPressed: () {
                        NavUtil.navigateScreen(
                            context, const DownloadedDocumentScreen());
                      },
                      icon: const Icon(Icons.download))
                ],
              ),
            ),
            body: Stack(
              children: [
                Positioned(
                  // top: MediaQuery.of(context).size.height / 4,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    'assets/dashboard/backgorund_img.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Documents List',
                        color: AppColors.titleTextColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        height: 1.75,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.colorWhite,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.stockColor)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Color(0xffBEBEBE),
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: provider.documentListModel?.data?.items
                                  ?.list?.length ??
                              0,
                          itemBuilder: (BuildContext context, int index) {
                            final data = provider
                                .documentListModel?.data?.items?.list?[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Container(
                                color: AppColors.colorWhite,
                                child: Padding(
                                  padding: EdgeInsets.all(10.0.sp),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        height: 30.h,
                                        width: 30.w,
                                        fit: BoxFit.cover,
                                        imageUrl: data?.icon ?? '',
                                        placeholder: (context, url) => Center(
                                          child: Image.asset(
                                              "assets/dashboard/placeholder_image.png"),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
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
                                          CustomText(
                                            text: data?.filename ??
                                                'No Name Found',
                                            color: AppColors.titleTextColor,
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w600,
                                            height: 1.75,
                                          ),
                                          CustomText(
                                            text: data?.date ?? '7 Days Ago',
                                            color: AppColors.titleTextColor,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            height: 1.75,
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      CustomText(
                                        text: data?.size ?? '',
                                        color: AppColors.titleTextColor,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        height: 1.75,
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        onPressed: () {
                                          provider.downloadPdf(data!);
                                        },
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: AppColors.colorPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                NavUtil.navigateScreen(context, const AddDocumentsScreen());
              },
              child: Image.asset(
                'assets/dashboard/add_float_button.png',
                height: 64.h,
                width: 64.w,
              ),
            ),
          );
        },
      ),
    );
  }
}
