import 'package:flutter/material.dart';

import '../widgets/custom_buttom.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class AppDialogs {
  ///Thank You Dialog
  static Future openThankYouDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.lightGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)), //this right here
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.orange),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // height: 0,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Thank you",
                        style: AppTextStyle.font12OpensansRedExtrabold,
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButton(
                      buttonHeight: 30,
                      buttonWidth: 80,
                      buttonColor: AppColors.orange,
                      onClick: () {
                        Navigator.pop(context);
                      },
                      text: Text(
                        "OK",
                        style: AppTextStyle.font12OpensansRedExtrabold,
                      ))
                ],
              ),
            ),
          );
        });
  }

  ///Setting Dialog
  static Future openLocationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: AppColors.lightGreen,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)), //this right here
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width * 0.90,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.orange),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      // height: 0,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.90,
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        "Please enable location service",
                        style: AppTextStyle.font12OpensansRedExtrabold,
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          buttonHeight: 30,
                          buttonWidth: 80,
                          buttonColor: AppColors.orange,
                          onClick: () {
                            Navigator.pop(context);
                          },
                          text: Text(
                            "Cancel",
                            style: AppTextStyle.font12OpensansWhiteExtrabold,
                          )),
                      CustomButton(
                          buttonHeight: 30,
                          buttonWidth: 80,
                          buttonColor: AppColors.orange,
                          onClick: () {
                            // AppSettings.openLocationSettings();
                            Navigator.pop(context);
                          },
                          text: Text(
                            "Open",
                            style: AppTextStyle.font12OpensansWhiteExtrabold,
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
