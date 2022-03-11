class GlobalFunction {
  bool checkingValidateEmail(String username) {
    bool isValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(username);
    return isValid;
  }
}
