import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/components/custom_app_bar.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class PurchaseHistoryDetails extends StatelessWidget {
  const PurchaseHistoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, __, _) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: CustomAppBar(appBarName: "Purchase History Details".tr()),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.pinimg.com/474x/98/51/1e/98511ee98a1930b8938e42caf0904d2d.jpg"),
                    ),
                    title: Text(
                      'Cameron Williamson',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Subject: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            height: 1.6
                          ),
                        ),
                        TextSpan(
                          text: 'How To Install Laragon In Windows',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Departments: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            height: 1.6
                          ),
                        ),
                        TextSpan(
                          text: 'Bug Fix',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(
                        label: const Text(
                          'OPEN',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green.shade300,
                        shape: const StadiumBorder(),
                        side: BorderSide(color: Colors.green.shade300),
                      ),
                      Chip(
                        label: Text(
                          '4 HOURS AGO',
                          style: TextStyle(color: Colors.green[300]),
                        ),
                        shape: const StadiumBorder(),
                        side: BorderSide(color: Colors.green.shade300),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text.rich(
                    TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Description: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        TextSpan(
                          text:
                              'Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit. Repellat Necessitatibus Amet Suscipit, Reprehenderit Laudantium, Harum Maxime Doloribus Consequatur Cum At Tempore Quam Aliquid Similique Ullam Temporibus Reiciendis, Distinctio Facere Sed. Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit. Repellat Necessitatibus Amet Suscipit, Reprehenderit Laudantium, Harum Maxime Doloribus Consequatur Cum At Tempore Quam Aliquid Similique Ullam Temporibus Reiciendis, Distinctio Facere Sed.',
                          style: TextStyle(fontSize: 16.0, height: 1.6),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 40,),
                  Text.rich(
                    TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'File: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              height: 1.6
                          ),
                        ),
                        TextSpan(
                          text: 'Documentation.PDF',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 40),

                  const Text("Reply Message", style: TextStyle(fontWeight: FontWeight.w600, height: 1.6)),
                  const SizedBox(height: 18,),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Write Here",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade300)
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
