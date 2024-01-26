import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/pages/tenants/tickets/create_new_ticket.dart';

class TenantEditSecurity extends StatelessWidget {
  const TenantEditSecurity({super.key});

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
              "Email",
              style: TextStyle(fontSize: 18.r, fontWeight: FontWeight.w600),
            ),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              "Primary Email",
              style: TextStyle(fontSize: 16.r),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "demo@onesttech.com",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 18),
            Text(
              "Secondary Email",
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
              "Passwords",
              style: TextStyle(fontSize: 18.r, fontWeight: FontWeight.w600),
            ),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              "Old Password",
              style: TextStyle(fontSize: 16.r),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "*******",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 18),
            Text(
              "New Password",
              style: TextStyle(fontSize: 16.r),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "*******",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green.shade300),
                      borderRadius: BorderRadius.circular(12))),
            ),
            const SizedBox(height: 18),
            Text(
              "Re-Enter Password",
              style: TextStyle(fontSize: 16.r),
            ),
            const SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "*******",
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
                onPressed: (){}, child: const Text("Save & Update", style: TextStyle(color: Colors.white),)),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
