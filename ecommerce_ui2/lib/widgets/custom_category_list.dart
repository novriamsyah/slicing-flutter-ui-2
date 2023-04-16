import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

import '../models/categories.dart';

class CustomCategoryList extends StatelessWidget {
  final Category category;
  final bool isSelected;
  const CustomCategoryList({
    Key? key,
    required this.category,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(right: 15.0),
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xff1a1a1c),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSelected
              ? Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xff9ad14b),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        category.imgUrl,
                      ),
                    ),
                  ),
                )
              : DashedCircle(
                  dashes: 20,
                  gapSize: 7,
                  color: Colors.white.withOpacity(0.3),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            category.imgUrl,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          const SizedBox(
            width: 10,
          ),
          Text(category.category,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.grey.shade200 : Colors.grey.shade400,
              )),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
