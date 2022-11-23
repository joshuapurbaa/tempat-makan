import 'package:app_state_manager/app_state_manager.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:resources/resources.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // 1
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppPalette.greyColor,
      body: PaddingSymetricWithDimens(
        horizontal: 30,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Hello Again!',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const GapsWithDimens(h: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.text,
                    cursorColor: AppPalette.darkBlue,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                    controller: _usernameController,
                  ),
                  const GapsWithDimens(h: 20),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: AppPalette.darkBlue,
                    obscureText: true,
                    textCapitalization: TextCapitalization.none,
                    autocorrect: false,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    controller: _passwordController,
                  ),
                ],
              ),
            ),
            const GapsWithDimens(h: 40),
            FilledButton(
              onTap: () {
                Provider.of<AppStateManager>(context, listen: false)
                    .signIn(_usernameController.text, _passwordController.text);
              },
              buttonType: 'Sign In',
            ),
            const GapsWithDimens(h: 40),
            Center(
              child: Text(
                AppStrings.or,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            const GapsWithDimens(h: 40),
            const LoginOption(),
            const GapsWithDimens(h: 40),
            TextRow(
              textRow1: AppStrings.loginTextRow1,
              textRow2: AppStrings.loginTextRow2,
              onTap: () {
                context.goNamed('signUp');
              },
            ),
          ],
        ),
      ),
    );
  }
}
