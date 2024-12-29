import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sims_ppob_ainul_muhlasin/modules/controllers/profile_controller.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/fill_button_widget.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/components/outline_button_widget.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/resources/rersources.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/components/app_bar.dart';
import '../../../shared/components/input_form_widget.dart';
import '../../../shared/style/app_colors.dart';
import '../../../shared/style/app_style.dart';
import '../../controllers/auth_controller.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);
    final profileController = Provider.of<ProfileController>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: MyAppBar.primaryAppbar(
          titleString: 'Edit Profil',
          context: context,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 10),
              AppImages.imPhotoProfle.image(
                height: 120,
              ),
              const SizedBox(height: 10),
              Text(
                '${profileController.profile?.firstName ?? 'Nama Tidak Ditemukan'} '
                '${profileController.profile?.lastName ?? ''}',
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
                hintText:
                    profileController.profile?.email ?? 'Email tidak tersedia',
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
                controller: profileController.firstNameController,
                hintText: profileController.profile?.firstName ??
                    'Nama depan tidak tersedia',
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
                controller: profileController.lastNameController,
                hintText: profileController.profile?.lastName ??
                    'Nama belakang tidak tersedia',
                preffixWidget: const Icon(
                  Icons.person_outline_rounded,
                  color: AppColors.greyDark,
                ),
              ),
              SizedBox(height: 15.h),
              MyFillButton(
                onPressed: () {
                  profileController.updateProfile({
                    'first_name': profileController.firstNameController.text,
                    'last_name': profileController.lastNameController.text,
                  });
                },
                expanded: false,
                enabled:
                    profileController.firstNameController.text.isNotEmpty &&
                        profileController.lastNameController.text.isNotEmpty,
                height: 45,
                text: 'Simpan',
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
