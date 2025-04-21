String? validateEmail(String? val) {
  if (val == null || !val.contains('@')) return "Enter a valid email";
  return null;
}

String? validatePassword(String? val) {
  if (val == null || val.length < 6) return "Minimum 6 characters";
  return null;
}
