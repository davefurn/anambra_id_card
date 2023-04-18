// Copyright 2023 Davefurn
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter valid email";
const String kPassNullError = "Please enter your password";
const String kPassNull2Error = "Atleast a capital, small letter, special character, and digit are needed";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kdetailsNullError = "Your suggestion is empty";
const String kDetailNumberError =
    "Your suggestion should be at least 20 characters";
const String kNotSimilarPasswordError = "Not Similar Password";
final RegExp passWordalidatorExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*.:;+=-?&])[A-Za-z\d@$!%*.?&]{8,}$');
const String kvalidatePhoneNumber = "Phone number is not valid";
final RegExp nameRegExp =
    RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
final RegExp phoneRegExp = RegExp(r'^\+?0[0-9]{10}$');
const String kInvalidNameError = "Please enter valid name";
const String kInvalidPhoneNumberError = "Please enter valid phone number";
const String confirmPassowrd = "Password not similar";
