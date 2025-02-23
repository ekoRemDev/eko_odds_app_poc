bool validateEmail(String email) {
  const String pattern = r'^(?!.*\.\.)[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  final RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}
