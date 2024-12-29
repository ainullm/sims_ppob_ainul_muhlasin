import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/auth_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../routes/routes.dart';
import '../../../shared/components/fill_button_widget.dart';
import '../../../shared/components/input_form_widget.dart';
import '../../../shared/resources/rersources.dart';
import '../../../shared/style/app_colors.dart';
import '../../../shared/style/app_style.dart';
import '../../controllers/profile_controller.dart';
import 'widgets/logo_title_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final profileController = Provider.of<ProfileController>(context);

    return Consumer<AuthController>(
      builder: (context, auth, child) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: ListView(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                  onTap: () {
                    // log('Token: ${}');
                  },
                  child: MyLogoTitle(
                    image: AppImages.icLogo.image(
                      width: 40,
                    ),
                    textLogo: ' SIMS PPOB',
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Masuk atau buat akun untuk memulai',
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
                            authController.togglePasswordVisibility();
                            log('Show Password');
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Lupa Password?',
                            style: AppStyle.body2.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        height: 45,
                        width: double.infinity,
                        child: MyFillButton(
                          expanded: false,
                          onPressed: () async {
                            // ignore: avoid_print
                            log('Login');
                            authController.loginHandle(context, {
                              'email': authController.emailController.text,
                              'password':
                                  authController.passwordController.text,
                            });
                          },
                          text: 'Masuk',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'belum punya akun? registrasi',
                            style: AppStyle.body2,
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              // ignore: avoid_print
                              log('Registrasi');
                              authController.clearController();
                              Navigator.pushNamed(
                                  context, AppRoutes.registrasi);
                            },
                            child: Text(
                              'di sini',
                              style: AppStyle.body2.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
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
      },
    );
  }
}
