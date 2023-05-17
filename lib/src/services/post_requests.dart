import 'network.dart';

class PostRequest {
  static final NetworkService network = NetworkService();

//   static Future<void> signUpuser(
//       CreateUserData data, BuildContext context) async {
//     const path = 'user/new';

//     await network.postRequestHandler(path, data.toJson()).then(
//       (value) async {
//         if (value != null) {
//           if (value.data["status"] == "error") {
//             await ShowFlushBar.showError(
//               value.data["message"],
//               context: context,
//             );
//           } else {
//             CreateUserResponse resonseData =
//                 CreateUserResponse.fromJson(value.data['data']['result']);
//             LocalStorage.instance.setTempUserInfo(resonseData);
//             ShowFlushBar.showSuccess(
//               message: value.data["message"],
//               context: context,
//             ).whenComplete(
//                 () => context.goNamed(VerificationScreen.name, extra: data));
//           }
//         } else {
//           showAppErrorModal(context);
//         }
//       },
//     );
//   }

//   static Future<void> verifyUser(String code, BuildContext context) async {
//     const path = 'user/email/verify';
//     final NetworkService network = NetworkService();
//     final token = await LocalStorage.instance.getToken();
//     await network
//         .postRequestHandler(path, {"token": code},
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
//             ).whenComplete(() => context.goNamed(LoginScreen.name));
//           }
//         } else {
//           showAppErrorModal(context);
//         }
//       },
//     );
//   }

//   static Future<void> loginUser(
//       LoginUserData data, BuildContext context) async {
//     const path = 'user/login';

//     await network.postRequestHandler(path, data.toJson()).then(
//       (value) async {
//         if (value != null) {
//           if (value.data["status"] == "error") {
//             await ShowFlushBar.showError(
//               value.data["message"],
//               context: context,
//             );
//           } else {
//             LoginUserResponse resonseData =
//                 LoginUserResponse.fromJson(value.data['data']);
//             LocalStorage.instance.setUserInfo(resonseData);

//             ShowFlushBar.showSuccess(
//               message: value.data["message"],
//               context: context,
//             ).whenComplete(() {
//               switch (resonseData.statusId) {
//                 case 2:
//                   context.goNamed(PinScreen.name);
//                   break;
//                 case 5:
//                   context.goNamed(MainScreen.name);
//                   break;
//                 default:
//               }
//             });
//           }
//         } else {
//           showAppErrorModal(context);
//         }
//       },
//     );
//   }

}
