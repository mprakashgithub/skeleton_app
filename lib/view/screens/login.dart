import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/providers/login_provider.dart';
import '../app_data/app_colors.dart';
import '../app_data/app_strings.dart';
import '../app_data/app_text_style.dart';
import '../widgets/custom_buttom.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double? _height;
  double? _width;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginProvider? loginProvider;
  // String? userName, password;
  bool value = false;
  // bool isVisible = false;
  Icon? visibleIcon;
  final FocusNode unameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // isVisible = true;
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    visibleIcon = loginProvider!.isPasswordVisible == true
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Consumer<LoginProvider>(builder: (context, provider, child) {
          return Container(
            height: _height,
            width: _width,

            // margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.only(top: 70),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: _height! * 0.01),
                  appLogoWidget(),
                  SizedBox(height: _height! * 0.04),
                  userNamePasswordWidget(),
                  SizedBox(height: _height! * 0.01),
                  forgotPassword(),
                  SizedBox(height: _height! * 0.06),
                  CustomButton(
                    text: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.txtLogin,
                          style: AppTextStyle.font14OpensansBlueBold,
                        ),
                        Image.asset(
                          "assets/icons/click_ic.png",
                          height: 35,
                        ),
                      ],
                    ),
                    // buttonHeight: 45,
                    buttonColor: AppColors.orange,
                    onClick: () async {
                      debugPrint(
                          "username: ${provider.username} password: ${provider.password}");

                      if (provider.username != null &&
                          provider.password != null) {
                        Navigator.pushNamed(context, AppStrings.routeToHome);
                      } else {
                        final snackBar = SnackBar(
                          content: Text(
                            AppStrings.txtPleaseCheckUsernameOrPassword,
                            style: AppTextStyle.font14OpensansBlueBold,
                          ),
                          backgroundColor: (AppColors.black),
                          duration: const Duration(seconds: 1),
                          action: SnackBarAction(
                            label: AppStrings.txtDismiss,
                            textColor: AppColors.red,
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget appLogoWidget() {
    return const SizedBox(height: 150, width: 150, child: FlutterLogo());
  }

  Widget userNamePasswordWidget() {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(AppStrings.txtUsername),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 5, bottom: 10, left: 20, right: 20),
              height: 48,
              child: TextFormField(
                controller: userNameController,
                focusNode: unameFocus,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    // Request focus in case of error
                    unameFocus.requestFocus();
                    return "Username can't be null";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.orange,
                  ),
                  labelText: AppStrings.txtUsername,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(10)),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (input) {
                  provider.setUsername(input);
                  // setState(() {
                  //   userName = input;
                  // });
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(AppStrings.txtPassword),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
              height: 48,
              child: TextFormField(
                controller: passwordController,
                focusNode: passwordFocus,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    // Request focus in case of error
                    passwordFocus.requestFocus();
                    return "Password can't be null";
                  }
                  return null;
                },
                obscureText: !provider.isPasswordVisible,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.orange,
                    ),
                    labelText: AppStrings.txtPassword,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10)),
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      color: AppColors.grey,
                      icon: visibleIcon!,
                      onPressed: () {
                        provider.setPasswordVisible();

                        // setState(() {
                        //   isVisible = !isVisible;
                        visibleIcon = provider.isPasswordVisible == true
                            ? const Icon(
                                Icons.visibility,
                                color: AppColors.orange,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: AppColors.grey,
                              );
                        // });
                      },
                    )),
                onChanged: (input) {
                  provider.setPassword(input);
                  // setState(() {
                  //   password = input;
                  // });
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget forgotPassword() {
    return Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Text(
          AppStrings.txtForgotPassword,
          style: AppTextStyle.font14OpensansBlueBold,
        ));
  }
}
