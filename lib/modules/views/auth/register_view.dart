import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/routes.dart';
import '../../../shared/components/fill_button_widget.dart';
import '../../../shared/components/input_form_widget.dart';
import '../../../shared/resources/rersources.dart';
import '../../../shared/style/app_colors.dart';
import '../../../shared/style/app_style.dart';
import '../../controllers/auth_controller.dart';
import 'widgets/logo_title_widget.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 8.h,
            ),
            MyLogoTitle(
              image: AppImages.icLogo.image(
                width: 40,
              ),
              textLogo: ' SIMS PPOB',
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'Lengkapi data untuk membuat akun',
                style: AppStyle.headline2.copyWith(
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  MyInputForm(
                    name: 'Email',
                    hintText: 'Masukan email anda',
                    controller: authController.emailController,
                    preffixWidget: const Icon(
                      Icons.alternate_email_rounded,
                      color: AppColors.grey,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  MyInputForm(
                    name: 'Nama Depan',
                    hintText: 'Nama depan anda',
                    controller: authController.firstNameController,
                    preffixWidget: const Icon(
                      Icons.person_outline_rounded,
                      color: AppColors.grey,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  MyInputForm(
                    name: 'Nama Belakanag',
                    hintText: 'Nama belakang anda',
                    controller: authController.lastNameController,
                    preffixWidget: const Icon(
                      Icons.person_outline_rounded,
                      color: AppColors.grey,
                      size: 20,
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  MyInputForm(
                    name: 'Password',
                    hintText: 'Masukan password anda',
                    controller: authController.passwordController,
                    obscureText:
                        authController.isPasswordVisible ? false : true,
                    preffixWidget: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.grey,
                      size: 20,
                    ),
                    suffixWidget: GestureDetector(
                      onTap: () {
                        // ignore: avoid_print
                        log('Show Password');
                        authController.togglePasswordVisibility();
                      },
                      child: authController.isPasswordVisible
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: AppColors.grey,
                              size: 20,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: AppColors.grey,
                              size: 20,
                            ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyInputForm(
                    name: 'Password',
                    hintText: 'Masukan password anda',
                    controller: authController.confirmPasswordController,
                    obscureText:
                        authController.isConfirmPasswordVisible ? false : true,
                    preffixWidget: const Icon(
                      Icons.lock_outline_rounded,
                      color: AppColors.grey,
                      size: 20,
                    ),
                    suffixWidget: GestureDetector(
                      onTap: () {
                        // ignore: avoid_print
                        log('Show Password');
                        authController.toggleConfirmPasswordVisibility();
                      },
                      child: authController.isConfirmPasswordVisible
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: AppColors.grey,
                              size: 20,
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: AppColors.grey,
                              size: 20,
                            ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: MyFillButton(
                      expanded: false,
                      onPressed: () {
                        // ignore: avoid_print
                        log('Register');
                        authController.registrasiHandle({
                          'email': authController.emailController.text,
                          'first_name': authController.firstNameController.text,
                          'last_name': authController.lastNameController.text,
                          'password': authController.passwordController.text,
                        }, context);
                      },
                      text: 'Registrasi',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'sudah punya akun? login',
                        style: AppStyle.body2,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          // ignore: avoid_print
                          log('Registrasi');
                          authController.clearController();
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                        child: Text(
                          'di sini',
                          style: AppStyle.body2.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
