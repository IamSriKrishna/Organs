import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchShimmer extends StatelessWidget {
  const SearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 10
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              height: MediaQuery.of(context).size.height * 0.16,
              width: double.infinity,
              child: Card(),
              )
          ),
        );
      }
    );
  }
}