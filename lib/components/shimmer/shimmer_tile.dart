import 'package:flutter/material.dart';
import 'package:landlord/components/shimmer/shimmer_placeholders.dart';

class ShimmerTile extends StatelessWidget {
  const ShimmerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: const Row(
        children: [
          TitlePlaceholder(width: 200.0)
        ],
      ),
    );
  }
}
