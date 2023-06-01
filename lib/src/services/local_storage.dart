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

import 'package:acmc/src/model/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage instance = LocalStorage._init();
  static SharedPreferences? _prefs;
  LocalStorage._init();

  final String firstTime = 'firstTime';
  final String email = 'email';
  final String loggedIn = 'loggedIn';
  final String phone = 'phone';
  final String token = 'token';
  String staffId = 'staffId';
  String lastName = 'lastName';
  String firstName = 'firstName';
  String role = 'role';
  String status = 'status';
  String profilePicture = 'profilePicture';
  String isActive = 'isActive';
  String id = 'id';
  String department = 'department';
  String designation = 'designation';

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<bool> setFirstTime() async {
    var pref = await instance.prefs;
    return pref.setBool(firstTime, true);
  }

  Future<bool> getFirstTime() async {
    var pref = await instance.prefs;
    var isNotFirstTime = pref.getBool(firstTime) ?? false;
    if (isNotFirstTime) {
      return false;
    }
    await setFirstTime();
    return true;
  }

  Future<bool> setEmail(String value) async {
    var pref = await instance.prefs;
    return pref.setString(email, value);
  }

  Future<String?> getEmail() async {
    var pref = await instance.prefs;
    return pref.getString(email);
  }

  Future<String> getStaffId() async {
    var pref = await instance.prefs;
    return pref.getString(staffId)!;
  }

  Future<bool> setLoggedIn(bool value) async {
    var pref = await instance.prefs;
    return pref.setBool(loggedIn, value);
  }

  Future<bool> getLoggedIn() async {
    var pref = await instance.prefs;
    return pref.getBool(loggedIn) ?? false;
  }

  Future<bool> setPhone(String value) async {
    var pref = await instance.prefs;
    return pref.setString(phone, value);
  }

  Future<String?> getPhone() async {
    var pref = await instance.prefs;
    return pref.getString(phone);
  }

  Future<bool> setToken(String value) async {
    var pref = await instance.prefs;
    return pref.setString(token, value);
  }

  Future<String?> getToken() async {
    var pref = await instance.prefs;
    return pref.getString(token);
  }

  Future<void> saveUserData(LoginData data) async {
    var pref = await instance.prefs;
    await pref.setString(token, data.accessToken);
    await pref.setString(phone, data.userData.phone);
    await pref.setString(firstName, data.userData.firstName);
    await pref.setString(staffId, data.userData.staffId);
    await pref.setString(lastName, data.userData.lastName);
    await pref.setString(email, data.userData.email);
    await pref.setString(role, data.userData.role);
    await pref.setString(status, data.userData.status);
    await pref.setString(profilePicture, data.employeeData.profilePicture);
    await pref.setInt(isActive, data.employeeData.isActive);
    await pref.setString(department, data.department);
    await pref.setString(designation, data.designation);
    await pref.setInt(id, data.userData.id);
  }

  Future<LoginData> getUserData() async {
    var pref = await instance.prefs;
    var firstName_ = pref.getString(firstName)!;
    var email_ = pref.getString(email)!;
    var id_ = pref.getInt(id)!;
    var lastName_ = pref.getString(lastName)!;
    var role_ = pref.getString(role)!;
    var staffId_ = pref.getString(staffId)!;
    var status_ = pref.getString(status)!;
    var phone_ = pref.getString(phone)!;
    var profilePicture_ = pref.getString(profilePicture)!;
    var isActive_ = pref.getInt(isActive)!;

    var data_ = UserData(
      email: email_,
      firstName: firstName_,
      id: id_,
      lastName: lastName_,
      role: role_,
      staffId: staffId_,
      status: status_,
      phone: phone_,
    );

    var employeeData_ = EmployeeData(
      isActive: isActive_,
      profilePicture: profilePicture_,
    );

    var token_ = pref.getString(token)!;
    var department_ = pref.getString(department)!;
    var designation_ = pref.getString(designation)!;

    return LoginData(
      accessToken: token_,
      employeeData: employeeData_,
      userData: data_,
      department: department_,
      designation: designation_,
    );
  }
}
