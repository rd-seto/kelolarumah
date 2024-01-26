import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_text.dart';
import 'package:landlord/pages/tenants/tickets/create_new_ticket.dart';
import 'package:landlord/pages/tenants/tickets/ticket_detail.dart';
import 'package:landlord/utils/nav_utail.dart';
import 'package:landlord/utils/theme/app_colors.dart';

enum SampleItem { edit, delete }

class Tickets extends StatelessWidget {
  const Tickets({super.key});

  @override
  Widget build(BuildContext context) {
    SampleItem? selectedMenu;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tickets"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.stockColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/dashboard/add_tennats_icon.png",
                          height: 20.h,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        CustomText(
                          text: '0',
                          color: AppColors.paraTxt1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.75,
                        ),
                        CustomText(
                          text: 'All Tickets',
                          color: AppColors.paraTxt1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.75,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.stockColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/dashboard/add_tennats_icon.png",
                          height: 20.h,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        CustomText(
                          text: '0',
                          color: AppColors.paraTxt1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.75,
                        ),
                        CustomText(
                          text: 'Open',
                          color: AppColors.paraTxt1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.75,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: AppColors.stockColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/dashboard/add_tennats_icon.png",
                          height: 20.h,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        CustomText(
                          text: '0',
                          color: AppColors.paraTxt1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.75,
                        ),
                        CustomText(
                          text: 'Closed',
                          color: AppColors.paraTxt1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          height: 1.75,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            FilledButton(
                style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                onPressed: () {
                  NavUtil.navigateScreen(context, const CreateNewTicket());
                },
                child: const Text('Open New Ticket')),
            const SizedBox(height: 12),
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Open Tickets",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                )),
            const SizedBox(height: 8),
            Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  NavUtil.navigateScreen(context, const TicketsDetails());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Open Tickets",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 6.0),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 18,
                              children: [
                                const Text(
                                  "10 Jul 2024",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: const Text(
                                    "Pending",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      // const Icon(Icons.more_vert),
                      PopupMenuButton<SampleItem>(
                        initialValue: selectedMenu,
                        // Callback that sets the selected popup menu item.
                        onSelected: (SampleItem item) {
                          // setState(() {
                          //   selectedMenu = item;
                          // });
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<SampleItem>>[
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.edit,
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem<SampleItem>(
                            value: SampleItem.delete,
                            child: Text('Delete'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
