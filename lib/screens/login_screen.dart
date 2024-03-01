import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:login_with_custom_theme/utils/custom_theme/theme_provider.dart';
import 'package:login_with_custom_theme/utils/image_constants.dart';
import 'package:login_with_custom_theme/utils/string_constants.dart';
import 'package:login_with_custom_theme/utils/text_styles.dart';
import 'package:login_with_custom_theme/utils/validations.dart';
import 'package:login_with_custom_theme/view_models/login_screen_view_model.dart';
import 'package:login_with_custom_theme/widgets/common_button.dart';
import 'package:login_with_custom_theme/widgets/common_icon_button.dart';
import 'package:login_with_custom_theme/widgets/common_textformfield.dart';
import 'package:provider/provider.dart';

import '../utils/color_constants.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key, this.title}) : super(key: key);
  final String? title;
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
        SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: buildBody(context),
          ),
        );
      
    
  }

  Widget buildBody(context) {
    final provider = Provider.of<LoginViewModel>(context);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          // height: MediaQuery.of(context).size.height -
          //     MediaQuery.of(context).viewInsets.bottom,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Form(
            key: loginkey,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom * 0.99,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.welcomeBack,
                        style: TextStyles.textStyleFont36Weight700.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<ThemeProvider>(context,listen: false).toogleTheme();
                        },
                        child: 
                        Provider.of<ThemeProvider>(context,listen: false).isDark
                            ? const Icon(Icons.dark_mode)
                            : const Icon(Icons.sunny),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  TextFormFieldWidget(
                    controller: emailController,
                    obscureText: false,
                    hint: StringConstants.userNameOrEmail,
                    prefixIcon: Icons.person,
                    validator: (val) {
                      return Validations.isEmailValid(val);
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormFieldWidget(
                    controller: passwordController,
                    hint: StringConstants.password,
                    prefixIcon: Icons.lock,
                    obscureText: provider.passwordVisibility,
                    suffixIcon: IconButton(
                      onPressed: () {
                        provider.visible(provider.passwordVisibility);
                      },
                      icon: Icon(
                        provider.passwordVisibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: ColorConstants.grey676767,
                      ),
                    ),
                    validator: (val) {
                      return Validations.isPasswordValid(val);
                    },
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 9),
                    child: const Text(
                      StringConstants.forgotPassword,
                      style: TextStyles.textStyleFont14Weight400,
                    ),
                  ),
                  ButtonWidget(
                    text: StringConstants.login,
                    onPressed: () {
                      if (loginkey.currentState!.validate()) {
                        log("Validated");
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      StringConstants.or,
                      style: TextStyles.textStyleFont12Weight500.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButtonWidget(image: ImageConstants.googleImage),
                      IconButtonWidget(image: ImageConstants.appleImage),
                      IconButtonWidget(image: ImageConstants.facebookImage),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        StringConstants.createAnAccount,
                        style: TextStyles.textStyleFont14Weight400,
                      ),
                      Text(
                        StringConstants.signUp,
                        style: TextStyles.textStyleFont14Weight600.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red,
                          decorationThickness: 2,
                        ),
                      ),
                    ],
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
