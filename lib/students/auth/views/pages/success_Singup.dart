import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/students/auth/controller/success_singup_controller.dart';
import 'package:monami/core/constant/app_color.dart';
import 'package:monami/students/auth/views/widget/cstmBottomAuth.dart';

class SuccessSignup extends StatelessWidget {
  const SuccessSignup({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessSingupcontrollerImp controller =
        Get.put(SuccessSingupcontrollerImp());
        
    return Scaffold(
      appBar: AppBar( 
         centerTitle: true,
          backgroundColor: AppColor.primaryColormonami,
          elevation: 0,
          title: Text('Success Signup',
              style: Theme.of(context)
                  .textTheme
      // ignore: deprecated_member_use
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
      body: Container(
          color: AppColor.primaryColormonami,
          padding: const EdgeInsets.all(10),
          child: Column(
                 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 201,),
           Center(
                  child: Icon(Icons.check_circle_outline_rounded,
                      size: 200, color: AppColor.buttommonami),
                ),
            const  Spacer(),
                 Container(
                  width: double.infinity,
                   child: cstmBottomAuth(
                    text: 'Go To Login',
                    onPressed: () {
                    controller.goToPageLogin();
                    },
                ),
                 ),
              const    SizedBox(height: 20,)
            ],
          )),
    );
  }
}
