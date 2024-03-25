import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/tenant_row_item.dart';
import '../../../../../data/provider/tenant_provider.dart';

class SearchTenantList extends StatelessWidget {
  const SearchTenantList({
    super.key,
    required this.provider,
  });

  final TenantProvider provider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: provider.tenantModel?.data?.list?.length ?? 0,
      itemBuilder: (context, index) {
        final tenant = provider.tenantModel?.data?.list?[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0.h),
          child: TenantRowItem(
            tenant: tenant,
          ),
        );
      },
    );
  }
}
