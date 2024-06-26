import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:monami/core/shared/custom_text_from_field.dart';
import 'package:monami/teachers/auth/controller/login_page_tearchers_controller_prof.dart';
import 'package:monami/core/class/statusrequest.dart';
import 'package:monami/core/constant/app_color.dart';
import 'package:monami/core/constant/app_image_assets.dart';
import 'package:monami/core/function/validinput.dart';
import 'package:monami/core/shared/LogoAuth.dart';
import 'package:monami/students/auth/views/widget/cstmBottomAuth.dart';
import 'package:share_plus/share_plus.dart';

class LoginProf extends StatelessWidget {
  const LoginProf({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginProfcontrollerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0,
           leading : IconButton(onPressed: () {
          }, icon: Icon(Icons.arrow_back),color: AppColor.buttommonami,)
        ),
        body: GetBuilder<LoginProfcontrollerImp>(
              builder: (controller) => controller.statusRequest ==
                      StatusRequest.loading
                  ? Center(
                      child: Lottie.asset(AppImageAsset.loading,
                          width: 250, height: 250))
                  : Container(
                   color: AppColor.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 30),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            const LogoProf(),
                            const SizedBox(height: 10),
                            const SizedBox(height: 20),
                            CustomTextFromFieldauth(
                              valid: (val) {
                                return ValidInput(val!, 5, 100, 'email');
                              },
                              mycontroller: controller.email,
                              hinttext: 'Enter Your Email',
                              labeltext: ' Email',
                              iconData: Icons.email,
                              // mycontroller: mycontroller
                            ),
                            GetBuilder<LoginProfcontrollerImp>(
                              builder: (controller) => CustomTextFromFieldauth(
                                ObscureText: controller.isshowpassword,
                                valid: (val) {
                                  return ValidInput(val!, 5, 100, 'password');
                                },
                                mycontroller: controller.password,
                                hinttext: 'Enter Your ID',
                                labeltext: 'ID',
                                iconData: Icons.remove_red_eye,
                                // ignore: body_might_complete_normally_nullable
                                onTapIcon: () {
                                  controller.showPassword();
                                },
                              ),
                            ),
                            SizedBox(height:15 ),
                         
                            cstmBottomAuth(
                              text: "s'inscrire",
                              onPressed: () {
                                controller.LoginProf();
                              },
                            ),
                           SizedBox(
                              height: 55,
                            ),
                            TextButton(
                              onPressed: () {
                                Share.share('https://monami.cloud/index.php/formulaire/'); 
                              },
                              child: Text('go to formulaire'),),
                          ],
                        ),
                    )
                ),
            )
      );
   }
}
