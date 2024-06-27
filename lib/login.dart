import 'package:batch730pm/screen1.dart';
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

  _clearData(){
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [

            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: (String s){
                emailText = s;
               setState(() {});
              },
              readOnly: true,
              // onSubmitted: (String s){
              //   print('on submitted');
              // },
              // onEditingComplete: (){
              //   print('Function called');
              //   // FocusManager.instance.primaryFocus?.unfocus();
              // },
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
            ),
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
                _emailController.text;
                _passwordController.text;
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
    );
  }
}
