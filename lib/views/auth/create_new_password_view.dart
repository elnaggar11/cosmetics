import 'package:cosmetics/core/logic/input_validator.dart';
import 'package:cosmetics/core/ui/app_button.dart';
import 'package:cosmetics/core/ui/app_image.dart';
import 'package:cosmetics/core/ui/app_input.dart';
import 'package:cosmetics/core/ui/success_massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordView extends StatefulWidget {
  const CreateNewPasswordView({super.key});

  @override
  State<CreateNewPasswordView> createState() => _CreateNewPasswordViewState();
}

class _CreateNewPasswordViewState extends State<CreateNewPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 13.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40.h),
                AppImage(image: 'logo_icon.png', height: 62.h, width: 67.w),
                SizedBox(height: 40.h),
                Text(
                  'Create Password',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Please enter your phone number below \n       to recovery your password.',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: 45.h),
                AppInput(
                  label: 'New Password',
                  isPassword: true,
                  validator: InputValidator.passwordValidator,
                  controller: newPasswordController,
                ),
                SizedBox(height: 16.h),
                AppInput(
                  label: 'Confirm Password',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    return InputValidator.confirmPasswordValidator(
                      value,
                      newPasswordController.text,
                    );
                  },
                ),
                SizedBox(height: 70.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.h),
                  child: AppButton(
                    text: 'Confirm',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return SuccessMassage(isRegister: false);
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
