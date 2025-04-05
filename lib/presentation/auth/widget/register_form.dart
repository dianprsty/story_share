import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/general_state.dart';
import '../../../core/route/go_router_config.dart';
import '../../shared/widget/custom_button.dart';
import '../../shared/widget/custom_text_field.dart';
import '../../../domain/usecase/register/register_param.dart';
import '../bloc/auth_bloc.dart';
import '../../../core/extension/build_context_extension.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _obscurePassword = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.register(
          params: RegisterParam(
            name: nameController.text,
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
    nameController.dispose();
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
            controller: nameController,
            labelText: 'Name',
            icon: Icons.person,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }

              return null;
            },
          ),
          SizedBox(height: 15),

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
                context.showSnackBar(state.message, success: true);
                context.goNamed(AppRoute.home.name);
              } else if (state.status == GeneralState.error) {
                context.showSnackBar(state.message, success: false);
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state.status == GeneralState.loading,
                text: 'Register',
                onPressed: () => _register(context),
                buttonType: ButtonType.primary,
              );
            },
          ),
          SizedBox(height: 15),
          Text(
            'Already have an account?',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 10),
          CustomButton(
            text: 'Login',
            onPressed: () {
              context.goNamed(AppRoute.login.name);
            },
            buttonType: ButtonType.outline,
          ),
        ],
      ),
    );
  }
}
