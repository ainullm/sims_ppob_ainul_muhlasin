import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/profile_controller.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/fill_button_widget.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/outline_button_widget.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/resources/rersources.dart';

import '../../../shared/components/app_bar.dart';
import '../../../shared/components/input_form_widget.dart';
import '../../../shared/style/app_colors.dart';
import '../../../shared/style/app_style.dart';
import '../../controllers/auth_controller.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final profileController = Provider.of<ProfileController>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: MyAppBar.primaryAppbar(
          titleString: 'Akun Saya',
          context: context,
          isBack: false,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  profileController.getProfile();
                },
                child: AppImages.imPhotoProfle.image(
                  height: 120,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '${profileController.profile?.firstName} ${profileController.profile?.lastName}',
                textAlign: TextAlign.center,
                style: AppStyle.subtitle1.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Email',
                style: AppStyle.subtitle3.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              MyInputForm(
                name: 'Email',
                enabled: false,
                hintText: profileController.profile?.email ?? '',
                hintStyle: AppStyle.body1.copyWith(
                  color: AppColors.greyDark,
                  fontWeight: FontWeight.w600,
                ),
                preffixWidget: const Icon(
                  Icons.alternate_email_rounded,
                  color: AppColors.greyDark,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Nama Depan',
                style: AppStyle.subtitle3.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              MyInputForm(
                name: 'Nama Depan',
                hintText: profileController.profile?.firstName ?? '',
                enabled: false,
                hintStyle: AppStyle.body1.copyWith(
                  color: AppColors.greyDark,
                  fontWeight: FontWeight.w600,
                ),
                preffixWidget: const Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.greyDark,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Nama Belakang',
                style: AppStyle.subtitle3.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              MyInputForm(
                name: 'Nama Belakang',
                hintText: profileController.profile?.lastName ?? '',
                enabled: false,
                hintStyle: AppStyle.body1.copyWith(
                  color: AppColors.greyDark,
                  fontWeight: FontWeight.w600,
                ),
                preffixWidget: const Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.greyDark,
                ),
              ),
              const SizedBox(height: 40),
              MyFillButton(
                onPressed: () {},
                expanded: false,
                height: 45,
                text: 'Edit Profil',
              ),
              const SizedBox(height: 15),
              MyOutlineButton(
                onPressed: () {
                  profileController.clearProfile();
                  authController.logoutHandle();
                },
                expanded: false,
                height: 45,
                color: AppColors.red,
                child: Text(
                  'Keluar',
                  style: AppStyle.body2.copyWith(
                    color: AppColors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
