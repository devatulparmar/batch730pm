import 'dart:convert';

import 'package:batch730pm/repository/api_repository.dart';
import 'package:batch730pm/utils/common_snackbar.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:batch730pm/utils/const_colors.dart';
import 'package:batch730pm/utils/google_sign_in.dart';
import 'package:batch730pm/utils/ui_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  bool isLoading = false;
  late SharedPreferences _preferences;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  final FocusNode _confirmPassFocusNode = FocusNode();
  String emailText = '';
  final _formKey = GlobalKey<FormState>();

  Future _loginAPI() async {
    setState(() => isLoading = true);

    Response response = await ApiRepository().postDioRequest(
      'https://reqres.in/api/login',
      data: {"email": "eve.holt@reqres.in", "password": "cityslicka"},
    );

    // var response = await ApiRepository().postAPIRequest(
    //   'https://reqres.in/api/login',
    //   body: {
    //     // "email": _emailController.text,
    //     // "password": _passwordController.text,
    //
    //     "email": "eve.holt@reqres.in",
    //     "password": "cityslicka"
    //   },
    // ) as Response;

    // Response response = await http.post(
    //   Uri.parse('https://reqres.in/api/login'),
    //   body: {
    //     // "email": _emailController.text,
    //     // "password": _passwordController.text,
    //
    //     "email": "eve.holt@reqres.in",
    //     "password": "cityslicka"
    //   },
    //   // headers: {
    //   //   'Authorization': 'Bearer QpwL5tke4Pnpja7X4',
    //   //   'Content-Type': 'application/json',
    //   // },
    // );

    if (response.statusCode == 200) {
      setState(() => isLoading = false);

      // Response decodedData = jsonDecode(response.data);

      _preferences.setString(prefAuthToken, response.data['token']);
      _preferences.setBool(prefIsLogin, true);

      MySnackBar.showMySnackBar(
        content: "Success",
        backgroundColor: Colors.green,
        snackBarAction: SnackBarAction(
          label: "",
          onPressed: () {},
        ),
      );
      Navigator.pushNamedAndRemoveUntil(
        globalNavigatorKey.currentContext!,
        "/",
        (Route r) => false,
      );
    } else {
      setState(() => isLoading = false);
      print(response.data);
      // var decodedData = jsonDecode(response.data);
      MySnackBar.showMySnackBar(content: response.data['error']);
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _initSharedPreferences();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  _clearData() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  void _initSharedPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Login'),
      ),
      // drawer: const CommonDrawer(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!).save();
              },
              child: ListView(
                children: [
                  TextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintText: "Enter an Email",
                      label: const Text('This is label'),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.red,
                      ),
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? obj) => UIHelper.emailValidation(obj!),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscureText,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () {
                      _confirmPassFocusNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintText: "Enter a Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: isObscureText ? Colors.grey : Colors.blue,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide:
                              const BorderSide(color: Colors.green, width: 2)),
                    ),
                    // validator: (String? s) {
                    //   if (s == null || s.isEmpty) {
                    //     return 'Please enter password';
                    //   } else if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(s)) {
                    //     return "Should contain at least one upper case";
                    //   } else if (!RegExp(r'^(?=.*[a-z])').hasMatch(s)) {
                    //     return "Should contain at least one lower case";
                    //   } else if (!RegExp(r'^(?=.*?[0-9])').hasMatch(s)) {
                    //     return "Should contain at least one digit";
                    //   } else if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(s)) {
                    //     return "Should contain at least one Special character";
                    //   } else if (!RegExp(r'^.{8,}').hasMatch(s)) {
                    //     return "Must be at least 8 characters in length ";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // TextFormField(
                  //   controller: _confirmPasswordController,
                  //   obscureText: isObscureText,
                  //   focusNode: _confirmPassFocusNode,
                  //   textInputAction: TextInputAction.go,
                  //   onFieldSubmitted: (String s){
                  //     if(_formKey.currentState!.validate()){
                  //       _formKey.currentState!.save();
                  //       /// API call
                  //       print('onFieldSubmitted called');
                  //     }
                  //   },
                  //   decoration: InputDecoration(
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(35),
                  //     ),
                  //     hintText: "Enter Confirm Password",
                  //     suffixIcon: IconButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           isObscureText = !isObscureText;
                  //         });
                  //       },
                  //       icon: Icon(
                  //         Icons.remove_red_eye_outlined,
                  //         color: isObscureText ? Colors.grey : Colors.blue,
                  //       ),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(35),
                  //         borderSide:
                  //             const BorderSide(color: Colors.green, width: 2)),
                  //   ),
                  //   validator: (String? s) {
                  //     if (s == null || s.isEmpty) {
                  //       return 'Please enter password';
                  //     } else if (s != _passwordController.text) {
                  //       return "Both password must be same!";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  // ),
                  // const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      _loginAPI();
                      // if (_formKey.currentState!.validate() == true) {
                      //   _loginAPI();
                      // }
                      // setState(() {});
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _clearData();
                      setState(() {});
                    },
                    child: const Text('Reset'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      GoogleSignInProvider googleProvider =
                          GoogleSignInProvider();
                      var response = await googleProvider.signIn();
                      if (await googleProvider.isSignIn()) {
                        print('success ${response.user!.email}');
                      } else {
                        print('failed');
                      }
                    },
                    child: const Text('Sign in with Google'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      GoogleSignInProvider googleProvider = GoogleSignInProvider();
                      var response = await googleProvider.signOut();
                      if (await googleProvider.isSignIn()) {
                        print('success ${response.user!.email}');
                      } else {
                        print('failed');
                      }
                    },
                    child: const Text('Sign out Google'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Visibility(
            visible: isLoading,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child: const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
