import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/controller/users/homePage_controller.dart';
import 'package:monami/core/class/handlingDataview.dart';
import 'package:monami/core/constant/colorApp.dart';
import 'package:monami/data/model/profModel.dart';
import 'package:monami/linkapi.dart';
import 'package:monami/view/widget/cstmappbarsearch.dart';
import 'package:monami/view/widget/search/listitemshome.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: ((controller) => Scaffold(
                body: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(
                      Duration(seconds: 1),
                    );
                    controller.searchData();
                    setState(() {});
                  },
                  child: ListView(children: [
                    cstmappbarsearch(
                      titleappbar: '13'.tr,
                      onPressedSearch: () {
                        controller.onSearchitems();
                      },
                      mycontroller: controller.search!,
                      onChanged: (val) {
                        controller.checkSearch(val);
                      },
                    ),
                    SizedBox(height: 10),
                    // ListCategorysearch(),
                    handlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: controller.isSearch
                            ? ListSearch(listdatasearch: controller.listdata)
                            : Text("data"))
                  ])),
            ))));
  }
}

class ListSearch extends GetView<HomeControllerImp> {
  final List<profModel> listdatasearch;
  const ListSearch({super.key, required this.listdatasearch});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return ListView.builder(
        itemCount: listdatasearch.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
   controller.goToPageProductDetails(listdatasearch[index]);            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                // color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:  NetworkImage(
                                                '${AppLink.imagesprof}/${listdatasearch[index].profImage}',
                                              ),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    bottomRight: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                  border: Border.all(
                                      color: AppColor.green, width: 1)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${listdatasearch[index].profName}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: AppColor.black),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                               
                                  ],
                                ),
                                Text(
                                  '${listdatasearch[index].profCuntry}',
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    icon: const Icon(
                                      Icons.arrow_circle_right_outlined,
                                      size: 24,
                                      color: AppColor.buttommonami,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('profile');
                                    }),
                                // Text('followers'),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "${listdatasearch[index].profDesc}",
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // GetBuilder<Favoritecontroller>(
                      //     builder: (controller) => Row(
                      //           children: [
                      //             IconButton(
                      //                 onPressed: () {
                      //                   if (controller.isFavorite[listdatasearch[index]..profId] ==
                      //                       "1") {
                      //                     controller.setFavorite(
                      //                         profmodel.profId.toString(), "0");
                      //                     controller
                      //                         .removeFavorite(profmodel.profId.toString());
                      //                   } else {
                      //                     controller.setFavorite(
                      //                         profmodel.profId.toString(), "1");
                      //                     controller.addFavorite(profmodel.profId.toString());
                      //                   }
                      //                 },
                      //                 icon: Icon(
                      //                   controller.isFavorite[profmodel.profId].toString() == "1"
                      //                       ? Icons.favorite
                      //                       : Icons.favorite_border_outlined,
                      //                   color: AppColor.primaryColor,
                      //                 )),
                      // Text("followers"),
                      //   ],
                      // )),
                      // Center(
                      //   child: InkWell(
                      //     onTap: () {
                      //       // controller.gotoeditedata(
                      //       //     controller.data[index]);
                      //     },
                      //     child: Container(
                      //         height: 30,
                      //         width: 120,
                      //         decoration: BoxDecoration(
                      //           color: AppColor.appelvideo,
                      //           borderRadius: BorderRadius.only(
                      //               bottomLeft: Radius.circular(10),
                      //               bottomRight: Radius.circular(10),
                      //               topRight: Radius.circular(10),
                      //               topLeft: Radius.circular(10)),
                      //         ),
                      //         child: Container(
                      //             margin: EdgeInsets.symmetric(horizontal: 5),
                      //             child: Row(
                      //               children: [
                      //                 Text(
                      //                   " Appel video ",
                      //                   style: TextStyle(
                      //                       color: AppColor.white,
                      //                       fontWeight: FontWeight.w500),
                      //                 ),
                      //                 Image(
                      //                     image:
                      //                         AssetImage("images/Vector.png"))
                      //               ],
                      //             ))),
                      //   ),
                      // ),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset('images/chat.png')),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 0.11,
                    color: AppColor.buttommonami,
                  )
                ],
              ),
            ),
          );
        });
  }
}
//            Container(
//             child: GestureDetector(
//                 onTap: () {
//                 controller.goToPageProductDetails(listdatasearch[index]);
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(top: 10),
//                   child: Column(
//                     children: [
//                       Column(
//                         children: [
//                           Container(
//                             height: 60,
//                             padding: EdgeInsets.symmetric(horizontal: 10),
//                             margin: EdgeInsets.only(top: 10),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Container(
//                                       height: 60,
//                                       width: 60,
//                                       decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                               image: NetworkImage(
//                                                 '${AppLink.imagesprof}/${listdatasearch[index].profImage}',
//                                               ),
//                                               fit: BoxFit.fill),
//                                           borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(30.0),
//                                             bottomRight: Radius.circular(30.0),
//                                             topRight: Radius.circular(30.0),
//                                             bottomLeft: Radius.circular(30.0),
//                                           ),
//                                           border: Border.all(
//                                               // color: Color(0xff0ACD69),
//                                                width: 1)),
//                                     ),
//                                     SizedBox(
//                                       width: 20,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Text(
//                                                 '${listdatasearch[index].profName}',
//                                                 style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: AppColor.black,
//                                                 )),

//                                             SizedBox(
//                                               width: 10,
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(top: 7),
//                                               child: CircleAvatar(
//                                                 radius: 10,
//                                                 backgroundImage: AssetImage(
//                                                     "images/brazil.png"),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 3,
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text('English'),
//                                           ],
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 Container(
//                                   height: 80,
//                                   child: Column(
//                                     children: [
//                                       Row(
//                                         children: [
//                                           IconButton(
//                                               icon: const Icon(
//                                                 Icons.video_call_outlined,
//                                                 color: Color(0xff0ACD69),
//                                               ),
//                                               onPressed: () {
//                                                 Navigator.of(context)
//                                                     .pushNamed('att_call');
//                                               }),
//                                          // Text('followers'),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       Divider(
//                         color: AppColor.primaryColormonami,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//           );
          
//         });
//   }
// }
