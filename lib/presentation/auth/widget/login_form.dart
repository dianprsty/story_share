import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constant/general_state.dart';
import '../../../core/extension/build_context_extension.dart';
import '../../../core/route/go_router_config.dart';
import '../../shared/widget/custom_button.dart';
import '../../shared/widget/custom_text_field.dart';
import '../../../domain/usecase/login/login_param.dart';
import '../bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.login(
          params: LoginParam(
            email: emailController.text,
            password: passwordController.text,
          ),
        ),
      );
    } else {
      context.showSnackBar('Login Failed. Check your inputs.', success: false);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: emailController,
            labelText: 'Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              // final emailRegex = RegExp(
              //   r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\$',
              // );
              // if (!emailRegex.hasMatch(value)) {
              //   return 'Enter a valid email address';
              // }
              return null;
            },
          ),
          SizedBox(height: 15),
          CustomTextField(
            controller: passwordController,
            labelText: 'Password',
            icon: Icons.lock,
            obscureText: _obscurePassword,
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
               if (state.status == GeneralState.success) {
                context.showSnackBar('Login Success', success: true);
                context.goNamed(AppRoute.home.name);
              } else if (state.status == GeneralState.error) {
                context.showSnackBar(state.message, success: false);
              }
            },
            builder: (context, state) {
              return CustomButton(
                text: 'Login',
                isLoading: state.status == GeneralState.loading,
                onPressed: () => _login(context),
                buttonType: ButtonType.primary,
              );
            },
          ),
          SizedBox(height: 15),
          Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 10),
          CustomButton(
            text: 'Create an Account',
            onPressed: () {
              context.goNamed(AppRoute.register.name);
            },
            buttonType: ButtonType.outline,
          ),
        ],
      ),
    );
  }
}
