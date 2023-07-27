
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomDialogImagePicker extends StatelessWidget {
  final Function? onCameraClick;
  final Function? onGalleryClick;

  const CustomDialogImagePicker(
      {Key? key, this.onCameraClick, this.onGalleryClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child:  Text(
                "Select Options",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    if (onCameraClick != null) onCameraClick!();
                  },
                  child: Column(
                    children: [
                      Lottie.asset("assets/images/ic_camera.json",height: 50,width: 50),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Camera",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    if (onGalleryClick != null) onGalleryClick!();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      children: [
                        Lottie.asset("assets/images/ic_gallery.json",height: 50,width: 50),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text(
                          "Gallery",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric( horizontal: 20),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
