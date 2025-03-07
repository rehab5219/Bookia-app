import 'package:bookia/core/constants/assets-manager.dart';
import 'package:bookia/core/extensions/navigator.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_Button.dart';
import 'package:bookia/core/widgets/dialogs.dart';
import 'package:bookia/feature/auth/data/models/request/register_params.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/feature/auth/presentation/cubit/auth_states.dart';
import 'package:bookia/feature/auth/presentation/pages/register_screen.dart';
import 'package:bookia/feature/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AssetsManager.back, width: 40, height: 40),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don’t have an account?', style: getSmallTextStyle()),
            const Gap(5),
            TextButton(
              onPressed: () {
                context.pushReplacement(
                  BlocProvider(
                    create: (context) => AuthCubit(),
                    child: RegisterScreen(),
                  ),
                );
              },
              child: Text(
                'Register Now',
                style: getSmallTextStyle(color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthErrorState) {
            Navigator.pop(context);
            showErrorToast(context, state.error);
          } else if (state is AuthSuccessState) {
            context.pushAndRemove(HomeScreen());
          } else if (state is AuthLoadingState) {
            showLoadingDialog(context);
          }
        },
        builder: (context, state) {
          return mainUi();
        },
      ),
    );
  }

  Padding mainUi() {
    var cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you, Again!',
                style: getHeadLineTextStyle(),
              ),
              const Gap(30),
              TextFormField(
                controller: cubit.emailController,
                decoration: InputDecoration(hintText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const Gap(15),
              TextFormField(
                obscureText: !cubit.showPassword,
                controller: cubit.passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIconConstraints: BoxConstraints(
                    maxHeight: 30,
                    maxWidth: 40,
                    minHeight: 30,
                    minWidth: 30,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(AssetsManager.eyeSvg),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              const Gap(30),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.login(
                      RegisterParams(
                        email: cubit.emailController.text,
                        password: cubit.passwordController.text,
                      ),
                    );
                  }
                },
              ),
              const Gap(30),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Gap(10),
                  Text('Or Login with', style: getSmallTextStyle()),
                  Gap(10),
                  Expanded(child: Divider()),
                ],
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: SvgPicture.asset(AssetsManager.facebookSvg),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: SvgPicture.asset(AssetsManager.googleSvg),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.borderColor),
                      ),
                      child: SvgPicture.asset(AssetsManager.appleSvg),
                    ),
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
