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

import 'package:flutter/material.dart';

/// Pushes a new route onto the navigator that most tightly encloses the given context.
Future<dynamic> pushTo(BuildContext context, Widget page,
    [PushStyle? pushStyle]) async {
  return await Navigator.push(context, CustomRoutes.fadeIn(page));
}

/// Pushes the given [page] to the navigator and clears the current [page] from the stack
Future<dynamic> pushReplacementTo<T>(BuildContext context, Widget page,
    [PushStyle? pushStyle]) async {
  return await Navigator.of(context).pushReplacement(CustomRoutes.fadeIn(page));
}

/// Pushes the given [page] to the navigator and clears the stack
void pushToAndClearStack(BuildContext context, Widget page) {
  Navigator.of(context)
      .pushAndRemoveUntil(CustomRoutes.fadeIn(page), (route) => false);
}

/// Removes the current [page] from the stack
void pop<T>(BuildContext context, [T? value]) {
  return Navigator.pop(context, value);
}

enum PushStyle { material, cupertino }

class CustomRoutes {
  static Route fadeIn(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, page) {
        var begin = 0.0;
        var end = 1.0;
        var curve = Curves.easeInExpo;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: page,
        );
      },
    );
  }
}

GestureDetector backButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      pop(context);
    },
    child: const Align(
      alignment: Alignment.centerLeft,
      child: Icon(
        Icons.arrow_back,
        size: 24,
      ),
    ),
  );
}
