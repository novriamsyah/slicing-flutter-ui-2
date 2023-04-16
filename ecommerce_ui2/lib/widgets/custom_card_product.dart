import 'package:ecommerce_ui2/models/products.dart';
import 'package:ecommerce_ui2/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardProduct extends StatelessWidget {
  final Product product;
  const CustomCardProduct({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.42,
          decoration: BoxDecoration(
            color: const Color(0xff1a1a1c),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: const Color(0xff1a1a1c),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(product.imgProduct),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BEST SELLER',
                          style: GoogleFonts.poppins(
                            color: const Color(0xff9ad14b).withOpacity(0.8),
                            fontSize: 12.6,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          product.productName,
                          style: whiteTextStyle.copyWith(
                            fontSize: 11,
                            letterSpacing: 1.5,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 1),
                        Row(
                          children: [
                            Text(
                              'Colors',
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                letterSpacing: 1.5,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: product.colors[0],
                                  ),
                                ),
                                Container(
                                  width: 13,
                                  height: 13,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: product.colors[1],
                                  ),
                                ),
                                Container(
                                  width: 13,
                                  height: 13,
                                  margin: const EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: product.colors[2],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${product.price}',
                          style: whiteTextStyle.copyWith(
                            fontSize: 12,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.08,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: const BoxDecoration(
                    color: Color(0xff9ad14b),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
