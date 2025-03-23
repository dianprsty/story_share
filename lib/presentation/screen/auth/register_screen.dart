import 'package:flutter/material.dart';
import '../../widget/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: RegisterForm(),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            controller: nameController,
            labelText: 'Name',
            icon: Icons.person,
          ),
          SizedBox(height: 15),
          CustomTextField(
            controller: emailController,
            labelText: 'Email',
            icon: Icons.email,
          ),
          SizedBox(height: 15),
          CustomTextField(
            controller: passwordController,
            labelText: 'Password',
            icon: Icons.lock,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
