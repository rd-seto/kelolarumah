import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/provider/update_profile_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../components/elevated_button_widget.dart';
import '../../../../../components/text_form_field.dart';
import '../../../../../data/model/profile_details_model.dart';

class ProfileEditBasicInfo extends StatefulWidget {
  final ProfileInfo? profileData;
  final VoidCallback onSave;

  const ProfileEditBasicInfo({Key? key, this.profileData, required this.onSave})
      : super(key: key);

  @override
  State<ProfileEditBasicInfo> createState() => _ProfileEditBasicInfoState();
}

class _ProfileEditBasicInfoState extends State<ProfileEditBasicInfo> {
  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController occupation;
  late TextEditingController institution;
  late TextEditingController gender;
  late TextEditingController nid;
  late TextEditingController passport;

  @override
  void initState() {
    name = TextEditingController(text: widget.profileData?.name);
    email = TextEditingController(text: widget.profileData?.email);
    phone = TextEditingController(text: widget.profileData?.phone);
    occupation = TextEditingController(text: widget.profileData?.occupation);
    institution = TextEditingController(text: widget.profileData?.institution);
    gender = TextEditingController(text: widget.profileData?.gender);
    nid = TextEditingController(text: widget.profileData?.nid);
    passport = TextEditingController(text: widget.profileData?.passport);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UpdateProfileProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          FromField(
            hintText: "name",
            controller: name,
            onChange: (name) {
              provider.profileBasicInfo.name = name;
            },
            title: "name",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            title: "Email",
            controller: email,
            onChange: (email) {
              provider.profileBasicInfo.email = email;
            },
            hintText: "enter your email",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            title: "Phone_Number",
            controller: phone,
            onChange: (phone) {
              provider.profileBasicInfo.phone = phone;
            },
            hintText: "Enter Your phone number",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            title: "Occupation",
            controller: occupation,
            onChange: (occupation) {
              provider.profileBasicInfo.occupation = occupation;
            },
            hintText: "enter your Occupation",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            title: "Institution",
            controller: institution,
            onChange: (institution) {
              provider.profileBasicInfo.institution = institution;
            },
            hintText: "enter your Institution name",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            title: "NID",
            controller: nid,
            onChange: (nid) {
              provider.profileBasicInfo.nid = nid;
            },
            hintText: "enter your nid number",
          ),
          SizedBox(
            height: 16.h,
          ),
          FromField(
            title: "Gender",
            controller: gender,
            onChange: (gender) {
              provider.profileBasicInfo.gender = gender;
            },
            hintText: "",
          ),
          SizedBox(
            height: 16.h,
          ),
          ElevatedButtonWidget(
            text: "Save",
            onPressed: () {
              provider.postProfileData(context, () {
                widget.onSave();
              });
            },
          )
        ],
      ),
    );
  }
}
