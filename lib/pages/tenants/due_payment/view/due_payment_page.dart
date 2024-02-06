import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/data/model/tenant_deu_payment_model.dart';
import 'package:landlord/data/tenant_provider/tenant_due_payment_provider.dart';
import 'package:landlord/pages/tenants/due_payment/content/due_payment_cart.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class DuePaymentPage extends StatelessWidget {
  final bool? isBottomNav;

  const DuePaymentPage({super.key, this.isBottomNav});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => DeuPaymentProvider(),
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CustomAppBar(appBarName: "Due Payment".tr()),
          ),
          body: Consumer<DeuPaymentProvider>(
            builder: (BuildContext context, provider, _) {
              return FutureBuilder<DuePaymentModel?>(
                future: provider.duePaymentData(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.data?.list?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        final data = snapshot.data?.data?.list?[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.sp),
                          child: DuePaymentCart(list: data!),
                        );
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ));
  }
}
