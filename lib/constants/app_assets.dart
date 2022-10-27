class ImageAssets {
  static const String logoImage = "assets/appLogo.png";
  static const String appBarLogoImage = 'assets/images/logo_small.png';
}

class LoginStrings {
  static const String emailHint = "Email ";
  static const String appTitle = "Beweries";

  static const String passwordHint = "Password";
  static const String loadingText = "Loading...";
  static const String loginButtonText = "Login";
  static const String signupButtonText = "SignUp";

  static const String forgetPasswordText = "Forgot your password?";
  static const String dontHaveAnAccount = "Don't have an account? SignUp";
  static const String alreadyHaveAnAccount = "Already have an account? Login";

  static const String emailEmptyValidationText =
      'Please enter an email address';
  static const String passwordEmptyValidationText = 'Please enter a password';
  static const String emailValidationText =
      'Please enter a valid email address';
  static const String passwordValidationText =
      'Your password length should be greater than 7';
  static const String confirmPasswordValidationText =
      'Confirm password must be match';
  static RegExp regexEmailValidation =
      RegExp(r'^[a-zA-Z0-9][a-zA-Z0-9_.-]+@[a-zA-Z]');
}
