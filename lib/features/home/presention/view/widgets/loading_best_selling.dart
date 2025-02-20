import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingBestSelling extends StatelessWidget {
  const LoadingBestSelling({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade400,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(8),
            height: 150,
          ),
        );
      },
    );
  }
}
