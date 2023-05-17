// import 'package:dio/dio.dart';
// import '../utils/utils.dart';

// class PatchRequest {
//   static final NetworkService network = NetworkService();

//   static Future<void> resendCode(
//       CreateUserData data, BuildContext context) async {
//     const path = 'user/email/resend';
//     final token = await LocalStorage.instance.getToken();
//     await network
//         .patchRequestHandler(path, data.toJson(),
//             options: Options(headers: {"Authorization": "Bearer $token"}))
//         .then(
//       (value) async {
//         if (value != null) {
//           if (value.data["status"] == "error") {
//             await ShowFlushBar.showError(
//               value.data["message"],
//               context: context,
//             );
//           } else {
//             ShowFlushBar.showSuccess(
//               message: value.data["data"],
//               context: context,
//             );
//           }
//         } else {
//           showAppErrorModal(context);
//         }
//       },
//     );
//   }

//   static Future<void> setPin(String pin, BuildContext context) async {
//     const path = 'user/pin/set';
//     final token = await LocalStorage.instance.getToken();
//     await network
//         .patchRequestHandler(path, {"pin": pin},
//             options: Options(headers: {"Authorization": "Bearer $token"}))
//         .then(
//       (value) async {
//         if (value != null) {
//           if (value.data["status"] == "error") {
//             await ShowFlushBar.showError(
//               value.data["message"],
//               context: context,
//             );
//           } else {
//             LocalStorage.instance.savePin(pin);
//             ShowFlushBar.showSuccess(
//               message: value.data["message"],
//               context: context,
//             ).whenComplete(() => context.goNamed(LoginScreen.name));
//           }
//         } else {
//           showAppErrorModal(context);
//         }
//       },
//     );
//   }
// }
