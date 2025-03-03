import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mexpertztest/core/app_assets.dart';
import 'package:mexpertztest/core/helper.dart';
import 'package:mexpertztest/feature/home/home_controller.dart';
import 'package:mexpertztest/firebase/firebase.dart';
import 'package:mexpertztest/routes/routes.dart';
import 'package:mexpertztest/theme/colors.dart';
import 'package:mexpertztest/widgets/loader.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KAppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Image.asset(
          AppAssets.image.appLogo,
          width: 80,
          height: 80,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.qr_code_scanner_sharp,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () async {
              Loader().loader();
              await GoogleSignIn().signOut();
              Get.back();
              Get.offAllNamed(Routes.login);
            },
            icon: Icon(
              Icons.logout,
              size: 28,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, ${appPrefs.name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: Get.width * 0.75,
                    child: Text(
                      'What are you looking for today?',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: 4,
                onPageChanged: (value) => controller.pageIndex.value = value,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Image.asset(
                    AppAssets.image.banner,
                    width: Get.width,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      4,
                      (index) => Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.pageIndex.value == index
                                  ? KAppColor.secondaryColor
                                  : KAppColor.mediumGrey,
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 10),
                          )),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.recomandation.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: index == 1
                                          ? KAppColor.secondaryColor
                                          : Colors.transparent,
                                      width: 2))),
                          child: Text(
                            controller.recomandation[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "See more",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: KAppColor.secondaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      height: 200,
                      child: StreamBuilder(
                        stream: Firebase.categoryStream,
                        builder: (context, snapshot) {
                          List categoryList = [];
                          if (snapshot.hasData) {
                            snapshot.data!.docs.map((document) {
                              Map data =
                                  document.data() as Map<String, dynamic>;
                              categoryList = data['category'];
                            }).toList();
                          }
                          if (categoryList.isNotEmpty) {
                            return GridView.count(
                              crossAxisCount: 4,
                              physics: NeverScrollableScrollPhysics(),
                              children: List.generate(
                                categoryList.length,
                                (index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                              color: KAppColor.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: KAppColor
                                                      .secondaryColor
                                                      .withValues(
                                                          alpha: 0.15))),
                                          child: CachedNetworkImage(
                                              errorWidget:
                                                  (context, url, error) =>
                                                      SizedBox(),
                                              imageUrl: categoryList[index]
                                                  ['image'])),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        categoryList[index]['name'],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: KAppColor.blueGrey),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }

                          return SizedBox();
                        },
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  StreamBuilder(
                    stream: Firebase.productStream,
                    builder: (context, snapshot) {
                      List productList = [];
                      if (snapshot.hasData) {
                        snapshot.data!.docs.map((document) {
                          Map data = document.data() as Map<String, dynamic>;
                          productList = data['productList'];
                        }).toList();
                      }

                      if (productList.isNotEmpty) {
                        return GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.8,
                          physics: NeverScrollableScrollPhysics(),
                          children: List.generate(
                            productList.length,
                            (index) {
                              final data = productList[index];
                              return Column(
                                spacing: 5,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: data['image'],
                                    height: 120,
                                    errorWidget: (context, url, error) =>
                                        SizedBox(),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data['name'],
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            data['price'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: KAppColor.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_cart_outlined,
                                              size: 18,
                                              color: KAppColor.white,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Add',
                                              style: TextStyle(
                                                color: KAppColor.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            data['rating'],
                                          )
                                        ],
                                      ),
                                      Text("${data['review_count']} Reviews"),
                                      Icon(Icons.more_vert)
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        );
                      }

                      return SizedBox();
                    },
                  )
                  // GridView.count(
                  //   crossAxisCount: 2,
                  //   shrinkWrap: true,
                  //   crossAxisSpacing: 25,
                  //   mainAxisSpacing: 20,
                  //   childAspectRatio: 0.8,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   children: List.generate(
                  //     controller.productList.length,
                  //     (index) {
                  //       final data = controller.productList[index];
                  //       return Column(
                  //         spacing: 5,
                  //         children: [
                  //           Image.asset(
                  //             data['image'],
                  //             height: 120,
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Column(
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     data['name'],
                  //                     style: TextStyle(
                  //                       fontSize: 18,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     data['price'],
                  //                     style: TextStyle(
                  //                         fontWeight: FontWeight.bold),
                  //                   )
                  //                 ],
                  //               ),
                  //               Container(
                  //                 padding: EdgeInsets.symmetric(
                  //                     vertical: 4, horizontal: 10),
                  //                 decoration: BoxDecoration(
                  //                   color: KAppColor.secondaryColor,
                  //                   borderRadius: BorderRadius.circular(6),
                  //                 ),
                  //                 child: Row(
                  //                   children: [
                  //                     Icon(
                  //                       Icons.shopping_cart_outlined,
                  //                       size: 18,
                  //                       color: KAppColor.white,
                  //                     ),
                  //                     SizedBox(
                  //                       width: 5,
                  //                     ),
                  //                     Text(
                  //                       'Add',
                  //                       style: TextStyle(
                  //                         color: KAppColor.white,
                  //                       ),
                  //                     )
                  //                   ],
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Icon(
                  //                     Icons.star,
                  //                     color: Colors.amber,
                  //                     size: 15,
                  //                   ),
                  //                   SizedBox(
                  //                     width: 3,
                  //                   ),
                  //                   Text(
                  //                     data['rating'],
                  //                   )
                  //                 ],
                  //               ),
                  //               Text("${data['review_count']} Reviews"),
                  //               Icon(Icons.more_vert)
                  //             ],
                  //           )
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
