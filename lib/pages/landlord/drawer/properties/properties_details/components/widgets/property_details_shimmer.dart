import 'package:flutter/material.dart';
import 'package:landlord/components/shimmer/shimmers.dart';

class PropertyDetailsShimmer extends StatelessWidget {
  const PropertyDetailsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            RectangularCardShimmer(
              height: 250,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            RectangularCardShimmer(
              height: 30,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            RectangularCardShimmer(
              height: 30,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            RectangularCardShimmer(
              height: 50,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            RectangularCardShimmer(
              height: 50,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            RectangularCardShimmer(
              height: 50,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            RectangularCardShimmer(
              height: 50,
              width: double.infinity,
            ),
            SizedBox(
              height: 10,
            ),
            RectangularCardShimmer(
              height: 50,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
