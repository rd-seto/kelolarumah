import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/components/elevated_button_widget.dart';
import 'package:landlord/data/model/tenants_details_model.dart';
import 'package:landlord/data/provider/tenant_edit_provider.dart';
import 'package:landlord/data/provider/tenants_details_provider.dart';
import 'package:landlord/pages/landlord/drawer/tenants/tenants_details/components/basic_info/edit_basic_info_content.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class EditBasicInfo extends StatefulWidget {
  final TenantsDetailsModel? tenantsDetailsResponse;
  final BasicInfo? basicInfo;
  final int? tenantsId;
  final VoidCallback onSave;
  final TenantsDetailsProvider? provider;

  const EditBasicInfo(
      {super.key,
      this.basicInfo,
      this.tenantsId,
      this.tenantsDetailsResponse,
      required this.onSave,
      this.provider});

  @override
  State<EditBasicInfo> createState() => _EditBasicInfoState();
}

class _EditBasicInfoState extends State<EditBasicInfo> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          TenantEditProvider(context, widget.tenantsDetailsResponse),
      child: Consumer<TenantEditProvider>(builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBar(appBarName: 'Edit_Basic_Info'),
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
              EditBasicInfoContent(provider: provider),

              /// Content///
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: ElevatedButtonWidget(
                  text: "Save",
                  onPressed: () {
                    provider.tenantEditApi(context, widget.tenantsId, () {
                      widget.onSave();
                    });
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
