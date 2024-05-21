import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/students/home/controller/home_page_controller.dart';
import 'package:monami/core/class/handlingDataview.dart';
import 'package:monami/core/constant/app_color.dart';
import 'package:monami/teachers/auth/data/model/teachers_model.dart';
import 'package:monami/app_link.dart';
import 'package:monami/students/search/views/widget/custom_appbar_search.dart';

class SearchPageStudents extends StatefulWidget {
  const SearchPageStudents({super.key});

  @override
  State<SearchPageStudents> createState() => _SearchPageStudentsState();
}

class _SearchPageStudentsState extends State<SearchPageStudents> {
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
                    handlingDataView(
                        statusRequest: controller.statusRequest,
                        widget: controller.isSearch
                            ? ListSearchPageStudents(listdatasearch: controller.listdata)
                            : Center(child: Text("There are no search results")))
                  ])),
            ))));
  }
}

class ListSearchPageStudents extends GetView<HomeControllerImp> {
  final List<profModel> listdatasearch;
  const ListSearchPageStudents({super.key, required this.listdatasearch});

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
   controller.goToPageProfileProf(listdatasearch[index]);            },
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