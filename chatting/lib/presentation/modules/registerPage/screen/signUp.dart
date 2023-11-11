import 'package:chatting/core/themes/constantColor.dart';
import 'package:chatting/presentation/modules/registerPage/blocs/registeringBloc.dart';
import 'package:chatting/presentation/modules/registerPage/blocs/registeringEvent.dart';
import 'package:chatting/presentation/modules/registerPage/blocs/registeringState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeName = FocusNode();

  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeEmail.dispose();
    focusNodeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: ListView(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: SizedBox(
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: BlocBuilder<RegisteringBloc, RegisteringState>(
                            builder: (context, state) {
                              return TextField(
                                onChanged: (name) {
                                  context
                                      .read<RegisteringBloc>()
                                      .add(OnInputName(name: name));
                                },
                                focusNode: focusNodeName,
                                controller: signupNameController,
                                keyboardType: TextInputType.text,
                                textCapitalization: TextCapitalization.words,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.account_tree_outlined,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Name',
                                  hintStyle: TextStyle(fontSize: 16.0),
                                ),
                                onSubmitted: (_) {
                                  focusNodeEmail.requestFocus();
                                },
                              );
                            },
                          )),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: BlocBuilder<RegisteringBloc, RegisteringState>(
                            builder: (context, state) {
                              return TextField(
                                onChanged: (email) => context
                                    .read<RegisteringBloc>()
                                    .add(OnInputEmail(email: email)),
                                focusNode: focusNodeEmail,
                                controller: signupEmailController,
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.abc,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Email Address',
                                  hintStyle: TextStyle(fontSize: 16.0),
                                ),
                                onSubmitted: (_) {
                                  focusNodePassword.requestFocus();
                                },
                              );
                            },
                          )),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: BlocBuilder<RegisteringBloc, RegisteringState>(
                            builder: (context, state) {
                              return TextField(
                                onChanged: (password) {
                                  context
                                      .read<RegisteringBloc>()
                                      .add(OnInputPassword(password: password));
                                },
                                focusNode: focusNodePassword,
                                controller: signupPasswordController,
                                obscureText: _obscureTextPassword,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(fontSize: 16.0),
                                  suffixIcon: GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      _obscureTextPassword
                                          ? Icons.remove_red_eye
                                          : Icons.abc,
                                      size: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onSubmitted: (_) {
                                  focusNodeConfirmPassword.requestFocus();
                                },
                              );
                            },
                          )),
                      Container(
                        width: 250.0,
                        height: 1.0,
                        color: Colors.grey[400],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                          child: BlocBuilder<RegisteringBloc, RegisteringState>(
                            builder: (context, state) {
                              return TextField(
                                onChanged: (value) {
                                  return context.read<RegisteringBloc>().add(
                                      OnInputPasswordConfirm(
                                          passwordConfirm: value));
                                },
                                focusNode: focusNodeConfirmPassword,
                                controller: signupConfirmPasswordController,
                                obscureText: _obscureTextConfirmPassword,
                                autocorrect: false,
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                  ),
                                  hintText: 'Confirmation',
                                  hintStyle: const TextStyle(fontSize: 16.0),
                                  suffixIcon: GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      _obscureTextConfirmPassword
                                          ? Icons.remove_red_eye
                                          : Icons.abc_rounded,
                                      size: 15.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                onSubmitted: (_) {
                                  _toggleSignUpButton();
                                },
                                textInputAction: TextInputAction.go,
                              );
                            },
                          )),
                    ],
                  ),
                ),
              ),
              BlocBuilder<RegisteringBloc, RegisteringState>(
                builder: (context, state) {
                  return Container(
                    margin: const EdgeInsets.only(top: 340.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: state.isValid
                              ? AppColors.blueLight_01
                              : AppColors.grey_001,
                          offset: const Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                        BoxShadow(
                          color: state.isValid
                              ? AppColors.whiteMint_21
                              : AppColors.grey_002,
                          offset: const Offset(1.0, 6.0),
                          blurRadius: 20.0,
                        ),
                      ],
                      gradient: LinearGradient(
                          colors: state.isValid
                              ? <Color>[
                                  AppColors.blueLight_01,
                                  AppColors.whiteMint_21
                                ]
                              : <Color>[AppColors.grey_001, AppColors.grey_002],
                          begin: const FractionalOffset(0.2, 0.2),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: const <double>[0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: MaterialButton(
                        highlightColor: Colors.transparent,
                        splashColor: AppColors.whiteMint_21,
                        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 42.0),
                          child: state.status.isInProgress 
                              ? const CircularProgressIndicator(
                                  strokeWidth: 4,
                                  color: AppColors.white,
                                )
                              : const Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: 'WorkSansBold'),
                                ),
                        ),
                        onPressed: () {
                          context.read<RegisteringBloc>().add(
                              OnSubmittedRegistering(
                                  tcName: signupNameController,
                                  tcEmailAddress: signupEmailController,
                                  tcPassword: signupPasswordController,
                                  tcConfirm: signupConfirmPasswordController));
                        }),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _toggleSignUpButton() {
    // CustomSnackBar(context, const Text('SignUp button pressed'));
  }
}
