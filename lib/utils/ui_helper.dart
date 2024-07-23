class UIHelper {
  static emailValidation(String s) {
    if (s.isEmpty) {
      return 'Please enter an email';
    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(s)) {
      return 'Enter valid email';
    } else {
      return null;
    }
  }
}
