import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/landlord/drawer/properties/properties_screen/components/properties_list_container.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../../../data/provider/property_provider.dart';
import '../../../../../../utils/nav_utail.dart';
import '../../../../../../utils/theme/app_colors.dart';
import '../../properties_details/properties_details_screen.dart';

class PropertyListScreen extends StatelessWidget {
  final PropertyProvider provider;
  const PropertyListScreen({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        footer: CustomFooter(
          builder: (context, mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("Pull up load");
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = const Text("release to load more");
            } else {
              body = const Text("No more Data");
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: provider.refreshController,
        onRefresh: () => provider.loadItems(context),
        onLoading: () => provider.loadMoreItems(context),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: provider.listOfProperties.length,
          itemBuilder: (context, index) {
            final data = provider.listOfProperties[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0.h),
              child: PropertiesListContainer(
                image: data.image,
                title: data.name,
                tenanted: data.totalRent.toString(),
                vacant: data.totalOccupied.toString(),
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
                id: data.id,
              ),
            );
          },
        ));
  }
}
