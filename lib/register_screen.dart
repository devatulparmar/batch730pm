import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int radioGroupValue = 0;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              // controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: "First Name",
                // label: const Text('This is label'),
                // prefixIcon: const Icon(
                //   Icons.person,
                //   color: Colors.red,
                // ),
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
            const SizedBox(height: 20),
            TextFormField(
              // controller: _emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: "Last Name",
                // label: const Text('This is label'),
                // prefixIcon: const Icon(
                //   Icons.person,
                //   color: Colors.red,
                // ),
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
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: radioGroupValue,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    radioGroupValue = value!;
                    setState(() {});
                  },
                ),
                const Text('Male'),
                Radio(
                  value: 2,
                  groupValue: radioGroupValue,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    radioGroupValue = value!;
                    setState(() {});
                  },
                ),
                const Text('Female'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    value: 3,
                    groupValue: radioGroupValue,
                    activeColor: Colors.red,
                    title: const Text('Male'),
                    subtitle: const Text('Male are always wrong.'),
                    selected: isMaleSelected,
                    selectedTileColor: Colors.blue.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onChanged: (value) {
                      radioGroupValue = value!;
                      isMaleSelected = true;
                      isFemaleSelected = false;
                      setState(() {});
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile(
                    value: 4,
                    groupValue: radioGroupValue,
                    activeColor: Colors.red,
                    selectedTileColor: Colors.blue.shade100,
                    selected: isFemaleSelected,
                    subtitle: const Text('Female are always right.'),
                    title: const Text('Female'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    onChanged: (value) {
                      radioGroupValue = value!;
                      isMaleSelected = false;
                      isFemaleSelected = true;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
