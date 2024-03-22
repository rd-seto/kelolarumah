import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/landlord/drawer/tenants/components/tenant_row_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../data/provider/tenant_provider.dart';

class TenantList extends StatelessWidget {
  const TenantList({
    super.key,
    required this.provider,
  });

  final TenantProvider provider;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      footer: CustomFooter(
        builder: ( context, mode){
          Widget body ;
          if(mode==LoadStatus.idle){
            body =  const Text("Pull up load");
          }
          else if(mode==LoadStatus.loading){
            body =  const CupertinoActivityIndicator();
          }
          else if(mode == LoadStatus.failed){
            body = const Text("Load Failed!Click retry!");
          }
          else if(mode == LoadStatus.canLoading){
            body = const Text("release to load more");
          }
          else{
            body = const Text("No more Data");
          }
          return SizedBox(
            height: 55.0,
            child: Center(child:body),
          );
        },
      ),
      controller: provider.refreshController,
      onRefresh: ()=> provider.loadItems(context),
      onLoading: ()=>provider.loadMoreItems(context),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount:
        provider.listOfTenants.length ?? 0,
        itemBuilder: (context, index) {
          final tenant =
          provider.listOfTenants[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: TenantRowItem(
              tenant: tenant,
            ),
          );
        },
      ),
    );
  }
}