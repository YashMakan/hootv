import 'package:hootv/app/shared/config/constants/strings.dart';

class StringsEn implements Strings {
  @override
  String loginPageHeading = 'Log in to HooTV';

  @override
  String loginPageSubHeading =
      'Enter your phone number to continue, we will send you OTP to verify.';

  @override
  String loginPageTextFieldHintText = 'Phone Number';

  @override
  String loginPageButton = 'Request OTP';

  @override
  String loginPageTrailingText1 = 'Already have an account?';

  @override
  String loginPageTrailingText2 = 'Login';

  @override
  String otpPageButton = 'Verify';

  @override
  String otpPageHeading = 'OTP Verification';

  @override
  String otpPageSubheading(String phone) {
    return 'We have sent an otp on $phone';
  }
}
