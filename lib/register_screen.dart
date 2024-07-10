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

  bool isDancingChecked = false;
  bool isReadingChecked = false;
  bool isPaintingChecked = false;

  String? dropDownValue;

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
                    subtitle: const Text('All Males are not the same!.'),
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
            const SizedBox(height: 20),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(height: 20),
            const Text('Hobbies'),
            Row(
              children: [
                // Checkbox(
                //   value: isChecked,
                //   activeColor: Colors.black,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(35),
                //   ),
                //   checkColor: Colors.green,
                //   onChanged: (bool? value) {
                //     isChecked = value!;
                //     setState(() {});
                //   },
                // ),
                Flexible(
                  flex: 1,
                  child: CheckboxListTile(
                    value: isDancingChecked,
                    activeColor: Colors.black,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    checkColor: Colors.green,
                    // checkboxShape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Dancing'),
                    onChanged: (bool? value) {
                      isDancingChecked = value!;
                      setState(() {});
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: CheckboxListTile(
                    value: isReadingChecked,
                    activeColor: Colors.black,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    checkColor: Colors.green,
                    // checkboxShape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Reading'),
                    onChanged: (bool? value) {
                      isReadingChecked = value!;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: CheckboxListTile(
                    value: isPaintingChecked,
                    activeColor: Colors.black,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    checkColor: Colors.green,
                    // checkboxShape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(35),
                    // ),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text('Painting'),
                    subtitle: const Text('I am an Artist.'),
                    onChanged: (bool? value) {
                      isPaintingChecked = value!;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton(
                  value: dropDownValue,
                  icon: const Icon(Icons.arrow_circle_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(),
                  items: const [
                    DropdownMenuItem(
                      value: "Vadodara",
                      child: Text('Vadodara City'),
                    ),
                    DropdownMenuItem(
                      value: "Ahmedabad",
                      child: Text('Ahmedabad City'),
                    ),
                    DropdownMenuItem(
                      value: "Surat",
                      child: Text('Surat City'),
                    ),
                    DropdownMenuItem(
                      value: "Rajkot",
                      child: Text('Rajkot City'),
                    ),
                  ],
                  hint: const Text('Select City'),
                  isExpanded: true,
                  onChanged: (value) {
                    dropDownValue = value!;
                    setState(() {});
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
