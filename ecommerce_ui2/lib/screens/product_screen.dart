import 'package:carousel_slider/carousel_slider.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:ecommerce_ui2/models/products.dart';
import 'package:ecommerce_ui2/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  CarouselController carouselController = CarouselController();
  int indexCarousel = 0;
  int currentIndexqty = 1;
  int indexSize = 0;
  int indexColor = 0;

  @override
  Widget build(BuildContext context) {
    Product? product = ModalRoute.of(context)!.settings.arguments as Product?;
    product = product ??= Product.products[0];

    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: heightScreen * 0.39,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 56,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(
                                'assets/icon/chevron-down.svg',
                                color: whiteColor,
                                width: 40,
                              ),
                            ),
                            SvgPicture.asset(
                              'assets/icon/wishlist.svg',
                              color: whiteColor,
                              width: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        width: widthScreen * 0.8,
                        child: CarouselSlider(
                          items: [
                            Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/title2.png'),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: widthScreen * 0.64,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: const RadialGradient(
                                        radius: 0.57,
                                        colors: [
                                          Color(0xff9ad14b),
                                          Colors.black,
                                        ],
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          product.imgProduct,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height * 0.41,
                            viewportFraction: 1.4,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              setState(() {
                                indexCarousel++;
                                if (indexCarousel == 4) {
                                  indexCarousel = 0;
                                }
                              });
                            },
                          ),
                          carouselController: carouselController,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              _CustomListSlider(
                indexPageChange: indexCarousel,
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: whiteTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Container(
                            width: widthScreen * 0.15,
                            height: 20,
                            decoration: BoxDecoration(
                              color: blackColor,
                            ),
                            child: Center(
                              child: Text(
                                'score',
                                style: greyTextStyle.copyWith(fontSize: 12.0),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '9.8',
                            style: greyTextStyle.copyWith(fontSize: 12.0),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Text(
                            '(6,249 Reviews)',
                            style: greyTextStyle.copyWith(fontSize: 12.0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Description',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16.0,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        "Streamlined sneakers with classic style a 70's style reborn. this shoes take inspiration from iconic sport styles of the past and move them into feature.",
                        style: greyTextStyle.copyWith(
                          fontSize: 13.0,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 18.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Size',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16.0,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: product.size.map((sizeItem) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        indexSize =
                                            product!.size.indexOf(sizeItem);
                                      });
                                    },
                                    child: CustomCircleContent(
                                      color: product!.size.indexOf(sizeItem) ==
                                              indexSize
                                          ? Colors.white
                                          : const Color(0xff14193F),
                                      radius: 30,
                                      content: Text(
                                        sizeItem.toString(),
                                        style: product.size.indexOf(sizeItem) ==
                                                indexSize
                                            ? blackTextStyle.copyWith(
                                                fontWeight: extraBold,
                                                fontSize: 13.0,
                                              )
                                            : whiteTextStyle.copyWith(
                                                fontWeight: extraBold,
                                                fontSize: 13.0,
                                              ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'colors',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16.0,
                                  fontWeight: bold,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: product.colors.map((idxColor) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        indexColor =
                                            product!.colors.indexOf(idxColor);
                                      });
                                    },
                                    child: CustomCircleContent(
                                      color: idxColor,
                                      radius: 28,
                                      content:
                                          product!.colors.indexOf(idxColor) ==
                                                  indexColor
                                              ? Icon(
                                                  Icons.check,
                                                  color: whiteColor,
                                                )
                                              : Icon(
                                                  Icons.check,
                                                  color: idxColor,
                                                ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 25.0),
                      Row(
                        children: [
                          Text(
                            'Quantity',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16.0,
                              fontWeight: bold,
                            ),
                          ),
                          const Spacer(),
                          DashedCircle(
                            dashes: 20,
                            gapSize: 7,
                            color: Colors.white.withOpacity(0.8),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (currentIndexqty == 1) {
                                      currentIndexqty = 1;
                                    } else {
                                      currentIndexqty--;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 16.7,
                                  height: 16.7,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    color: whiteColor,
                                    size: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            currentIndexqty.toString(),
                            style: whiteTextStyle.copyWith(fontSize: 20.0),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndexqty++;
                              });
                            },
                            child: Container(
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: Color(0xff9ad14b),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: whiteColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total price',
                                style: greyTextStyle.copyWith(fontSize: 16.0),
                              ),
                              Text(
                                '\$${product.price}',
                                style: whiteTextStyle.copyWith(fontSize: 20.0),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Container(
                            width: widthScreen * 0.40,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xff9ad14b),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.shopping_cart,
                                  color: whiteColor,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Add to cart',
                                  style: whiteTextStyle.copyWith(
                                    fontWeight: black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListSlider extends StatelessWidget {
  const _CustomListSlider({
    required this.indexPageChange,
    Key? key,
  }) : super(key: key);

  final int indexPageChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(
            right: 5.0,
          ),
          width: indexPageChange == 0 ? 40 : 7,
          height: 7,
          decoration: indexPageChange == 0
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff9ad14b),
                )
              : BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 5.0,
          ),
          width: indexPageChange == 1 ? 40 : 7,
          height: 7,
          decoration: indexPageChange == 1
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff9ad14b),
                )
              : BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 5.0,
          ),
          width: indexPageChange == 2 ? 40 : 7,
          height: 7,
          decoration: indexPageChange == 2
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff9ad14b),
                )
              : BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
        ),
        Container(
          margin: const EdgeInsets.only(
            right: 5.0,
          ),
          width: indexPageChange == 3 ? 40 : 7,
          height: 7,
          decoration: indexPageChange == 3
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff9ad14b),
                )
              : BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
        ),
      ],
    );
  }
}
