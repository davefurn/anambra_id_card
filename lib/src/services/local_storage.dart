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

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage instance = LocalStorage._init();
  static SharedPreferences? _prefs;
  LocalStorage._init();

  final String firstTime = 'firstTime';
  final String email = 'email';
  final String phone = 'phone';
  final String token = 'token';

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
}
