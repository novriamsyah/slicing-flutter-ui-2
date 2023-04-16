import 'package:ecommerce_ui2/models/categories.dart';
import 'package:ecommerce_ui2/models/products.dart';
import 'package:ecommerce_ui2/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndexCategory = 0;
  List<Category> categories = Category.categories;
  List<Product> products = Product.products;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          child: ListView(
            children: [
              const _CustomAppbar(),
              const _CustomTextFormField(),
              const CustomTitleHeader(
                title1: 'Special offers',
                title2: 'See all',
                showTitle2: true,
              ),
              const _BannerBeatiful(),
              const SizedBox(height: 5.0),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: SizedBox(
                  height: 52,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndexCategory = index;
                          });
                        },
                        child: CustomCategoryList(
                          category: categories[index],
                          isSelected:
                              currentIndexCategory == categories[index].id,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const CustomTitleHeader(
                title1: 'Most Popular',
              ),
              const SizedBox(height: 18.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: width / (height * 0.53),
                    ),
                    itemCount: products.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/detail-product',
                            arguments: products[index],
                          );
                        },
                        child: CustomCardProduct(
                          product: products[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: GlassmorphicContainer(
          width: width,
          height: 85,
          borderRadius: 0,
          linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0.1),
              whiteColor.withOpacity(0.1),
            ],
          ),
          border: 0,
          blur: 15,
          borderGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0.1),
              whiteColor.withOpacity(0.1),
            ],
          ),
          child: BottomAppBar(
            color: Colors.transparent,
            notchMargin: 4,
            elevation: 0,
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icon/home.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icon/profile.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BannerBeatiful extends StatelessWidget {
  const _BannerBeatiful({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.22,
        margin: const EdgeInsets.only(top: 15.0),
        child: Stack(
          children: [
            Positioned(
              top: 14,
              right: 8,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.147,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            Positioned(
              top: 7,
              right: 20,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.17,
                decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/banner.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextFormField extends StatelessWidget {
  const _CustomTextFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(
                color: const Color(0xff1a1a1c),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xff1a1a1c),
                  hintText: 'search for your shoes',
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey.shade600,
                      ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width * 0.11,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff1a1a1c),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: SvgPicture.asset(
                'assets/icon/filter.svg',
                // fit: BoxFit.cover,
                width: 15,
                height: 15,
                color: const Color(0xff9ad14b),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      decoration: const BoxDecoration(
        color: Color(0xff060606),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromARGB(255, 82, 82, 82),
            backgroundImage: NetworkImage(
              'https://global-uploads.webflow.com/628f895fa40c756ee8d67d79/63319abea7c31c19c9ef2832_3d-avatar-male-amol.webp',
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning',
                style: greyTextStyle.copyWith(
                  fontSize: 14,
                  letterSpacing: 1.5,
                ),
              ),
              Text(
                'Novri',
                style: whiteTextStyle.copyWith(
                  fontSize: 15,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
          const Spacer(),
          const CustomIconButton(
            iconUrl: 'assets/icon/notification.svg',
            radius: 28,
            color: Colors.white,
            marginRight: 8,
          ),
          const CustomIconButton(
            iconUrl: 'assets/icon/wishlist.svg',
            radius: 28,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
