import 'dart:async';
import 'dart:io';

import 'package:batch730pm/utils/assets.dart';
import 'package:batch730pm/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final StreamController _streamController = StreamController();

  Stream get _stream {
    return _streamController.stream;
  }

  final ImagePicker picker = ImagePicker();
  XFile? pickedImage;
  List<XFile> pickedMultipleImage = [];
  DateTime currentDate = DateTime.now();
  int radioGroupValue = 0;
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isDancingChecked = false;
  bool isReadingChecked = false;
  bool isPaintingChecked = false;
  bool isTextVisible = true;

  String? dropDownValue;

  final List<String> _dropDownListItems = [
    "Vadodara",
    "Surat",
    "Ahmedabad",
    "Rajkot",
    "Mumbai",
  ];

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;

  Future showDate() async {
    var pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970, 6, 10),
      lastDate: DateTime.now(),
    );

    currentDate = pickedDate!;
    setState(() {});
  }

  Future selectImageFromGallery() async {
    pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    setState(() {});
  }

  Future selectImageFromCamera() async {
    pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      preferredCameraDevice: CameraDevice.rear,
    );
    setState(() {});
  }

  Future selectMultipleImageFromGallery() async {
    pickedMultipleImage = await picker.pickMultiImage(
      imageQuality: 100,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();

    _stream.listen(
          (value) {
        print("value $value");
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
  }

  Widget _profileImageWidget() {
    return pickedImage != null
        ? Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.blue,
                backgroundImage: FileImage(File(pickedImage!.path)),
              ),
              Positioned(
                right: 100,
                bottom: 30,
                child: InkWell(
                  onTap: () {
                    selectImageFromGallery();
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
            ],
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage(localImage),
              ),
              Positioned(
                right: 100,
                bottom: 30,
                child: InkWell(
                  onTap: () {
                    selectImageFromGallery();
                  },
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.edit),
                  ),
                ),
              ),
            ],
          );
  }

  Widget _hobbies(){
    return Column(
      children: [
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            _profileImageWidget(),
            ListView.builder(
                itemCount: pickedMultipleImage.length,
                shrinkWrap: true,
                // scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.blue,
                      backgroundImage: FileImage(
                        File(pickedMultipleImage[index].path),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 20),
            TextFormField(
              controller: _firstNameController,
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
              controller: _lastNameController,
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
            // const Divider(
            //   color: Colors.black,
            //   height: 1,
            // ),
            const SizedBox(height: 20),
            const Text('Hobbies'),
            _hobbies(),

            ///Drop-Down
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
                  items: _dropDownListItems.map(
                    (dynamic obj) {
                      return DropdownMenuItem(
                        value: obj,
                        child: Text(obj),
                      );
                    },
                  ).toList(),
                  hint: const Text('Select City'),
                  isExpanded: true,
                  onChanged: (value) {
                    dropDownValue = value.toString();
                    setState(() {});
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            ///Date Picker
            Row(
              children: [
                Text(
                    'Date of Birth: ${DateFormat.yMMMd().format(currentDate)}'),
                IconButton(
                  onPressed: () {
                    /// open date picker
                    showDate();
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),

            Text('Year only: ${DateFormat.y().format(currentDate)}'),
            Text('Year and month only: ${DateFormat.yM().format(currentDate)}'),
            const SizedBox(height: 20),
            // const Divider(
            //   color: Colors.black,
            //   height: 1,
            // ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, routeUserDetailsScreen,
                    arguments: {
                      "first_name": _firstNameController.text,
                      "last_name": _lastNameController.text,
                      "gender": radioGroupValue == 1 ? "Male" : "Female",
                      "dancing": isDancingChecked ? "Dancing" : "",
                      "reading": isReadingChecked ? "Reading" : "",
                      "painting": isPaintingChecked ? "Painting" : "",
                      "city": dropDownValue,
                      "dob": DateFormat.yMMMd().format(currentDate).toString(),
                    });
              },
              child: const Text('Register'),
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: isTextVisible,
              child: const Text('This Text will be hide'),
            ),
            ElevatedButton(
              onPressed: () {
                isTextVisible = !isTextVisible;
                setState(() {});
              },
              child: const Text('Show / Hide'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

                Navigator.pushNamed(context, routeLogin);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
