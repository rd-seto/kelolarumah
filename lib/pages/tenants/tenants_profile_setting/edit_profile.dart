import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/tenants/tickets/create_new_ticket.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Name",
              style: TextStyle(fontSize: 16.r),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Your Name",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 18),
            Text(
              "Email",
              style: TextStyle(fontSize: 16.r),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "info@onesttech.com",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 18),
            Text(
              "Address",
              style: TextStyle(fontSize: 16.r),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "address",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 18),
            Text(
              "Country",
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
              "City",
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
              "My Self",
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
            FilledButton(
                style: FilledButton.styleFrom(
                    fixedSize: const Size(400, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),
                    backgroundColor: const Color(0xFF007170)),
                onPressed: (){}, child: const Text("Create Ticket", style: TextStyle(color: Colors.white),)),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
