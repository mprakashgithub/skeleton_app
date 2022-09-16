import 'package:flutter/material.dart';

import '../app_data/app_colors.dart';
import '../app_data/app_text_style.dart';
import '../widgets/custom_buttom.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SizedBox(
          height: _height,
          width: _width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: CustomButton(
                        buttonHeight: 50,
                        buttonWidth: 120,
                        buttonColor: AppColors.orange,
                        onClick: () {},
                        text: FittedBox(
                          child: Text("Home",
                              style: AppTextStyle.font12OpensansWhiteExtrabold),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
