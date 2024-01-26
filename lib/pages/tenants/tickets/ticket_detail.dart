import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketsDetails extends StatelessWidget {
  const TicketsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Tickets"),
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
              ),
              const SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all()
                ),
                child: Row(
                  children: [
                    FilledButton(
                        style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            backgroundColor: const Color(0xFF5B5B5B)),
                        onPressed: (){
                          FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['jpg', 'pdf', 'doc'],
                          );
                        }, child: const Text("Choose", style: TextStyle(color: Colors.white),)),
                    const SizedBox(width: 12,),
                    const Text("Docs.PDF")
                  ],
                ),
              ),
              const SizedBox(height: 28),
              FilledButton(
                  style: FilledButton.styleFrom(
                      fixedSize: const Size(400, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      backgroundColor: const Color(0xFF007170)),
                  onPressed: (){}, child: const Text("Submit", style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      ),
    );
  }
}
