import 'package:app_state_manager/app_state_manager.dart';
import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:resources/resources.dart';

import '../cubit/register_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  // Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  final bool _isPasswordHide = true;
  final bool _isPasswordRepeatHide = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _conEmail.dispose();
    _conPassword.dispose();
    _conPasswordRepeat.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (_, state) {
        switch (state.status) {
          case RegisterStatus.loading:
            context.show();
            break;
          default:
        }
      },
      child: Scaffold(
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
              const ResponsiveGaps(h: 40),
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
                      controller: _conEmail,
                    ),
                    const ResponsiveGaps(h: 20),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: AppPalette.darkBlue,
                      obscureText: true,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      controller: _conPassword,
                    ),
                  ],
                ),
              ),
              const ResponsiveGaps(h: 40),
              FilledButton(
                onTap: () {
                  Provider.of<AppStateManager>(context, listen: false)
                      .signIn(_conEmail.text, _conPassword.text);
                },
                buttonType: 'Sign Up',
              ),
              const ResponsiveGaps(h: 40),
              Center(
                child: Text(
                  AppStrings.or,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              const ResponsiveGaps(h: 40),
              const LoginOption(),
              const ResponsiveGaps(h: 40),
              TextRow(
                textRow1: AppStrings.loginTextRow1,
                textRow2: AppStrings.loginTextRow2,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
