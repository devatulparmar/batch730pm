import 'package:batch730pm/screen1.dart';
import 'package:batch730pm/utils/common_snackbar.dart';
import 'package:batch730pm/widgets/common_drawer.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscureText = true;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  String emailText = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  _clearData() {
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Login'),
      ),
      drawer: const CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            Form.of(primaryFocus!.context!).save();
          },
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
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
                validator: (String? s) {
                  if (s == null || s.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

              // const SizedBox(
              //   height: 20,
              // ),
              // TextField(
              //   controller: _emailController,
              //   keyboardType: TextInputType.emailAddress,
              //   textInputAction: TextInputAction.next,
              //   onChanged: (String s){
              //     emailText = s;
              //    setState(() {});
              //   },
              //   // onSubmitted: (String s){
              //   //   print('on submitted');
              //   // },
              //   // onEditingComplete: (){
              //   //   print('Function called');
              //   //   // FocusManager.instance.primaryFocus?.unfocus();
              //   // },
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(35),
              //     ),
              //     hintText: "Enter an Email",
              //     label: const Text('This is label'),
              //     prefixIcon: const Icon(
              //       Icons.email,
              //       color: Colors.red,
              //     ),
              //   ),
              // ),

              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                obscureText: isObscureText,
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
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() == true) {
                    MySnackBar.showMySnackBar(
                      content: "Success",
                      backgroundColor: Colors.green,
                      context: context,
                    );
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //   content: Text('Success'),
                    //   backgroundColor: Colors.green,
                    //   padding: EdgeInsets.all(10),
                    // ));
                  } else {

                  }
                  setState(() {});
                },
                child: const Text('Click'),
              ),
              const SizedBox(height: 20),
              Text('Email : ${_emailController.text}'),
              const SizedBox(height: 20),
              Text('Password : ${_passwordController.text}'),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _clearData();
                  setState(() {});
                },
                child: const Text('Reset'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
