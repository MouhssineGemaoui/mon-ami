import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/teachers/home/controller/show_more_students_english_controller.dart';
import 'package:monami/core/class/handlingDataview.dart';
import 'package:monami/core/constant/app_color.dart';
import 'package:monami/students/auth/data/model/usersModel.dart';
import 'package:monami/teachers/home/views/widget/list_students_french.dart';

class prlntUsers_En extends StatelessWidget {
  const prlntUsers_En({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(viewpluslangenusresImp());
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 254, 250, 250),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        title: Text(
          "Vos Amis",
          style: TextStyle(
            color: AppColor.buttommonami,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
          color: AppColor.buttommonami,
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //   Color.fromARGB(255, 255, 255, 254),
        //   Color.fromARGB(255, 241, 199, 135)
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: ListView(
          children: [
            GetBuilder<viewpluslangenusresImp>(
                builder: (controller) => handlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: ListView.builder(
                          itemCount: controller.data.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: cstmLangEnusers(
                                usersmodel:
                                    usersModel.fromJson(controller.data[index]),
                              ),
                            );
                          }),
                    ))
          ],
        ),
      ),
    );
  }
}
