import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class CreateNewTicket extends StatelessWidget {
  const CreateNewTicket({super.key});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subject",
                style: TextStyle(fontSize: 16.r),
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Write Here",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(12))),
              ),
              const SizedBox(height: 18),
              Text(
                "Departments",
                style: TextStyle(fontSize: 16.r),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: const SizedBox(),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                "Select Item",
                style: TextStyle(fontSize: 16.r),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12)
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: const SizedBox(),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    // setState(() {
                    //   dropdownValue = value!;
                    // });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 18),
              Text(
                "Subject",
                style: TextStyle(fontSize: 16.r),
              ),
              const SizedBox(height: 12),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "Write Here",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(12))),
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
                  onPressed: (){}, child: const Text("Create Ticket", style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      ),
    );
  }
}
