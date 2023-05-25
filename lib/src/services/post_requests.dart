import 'network.dart';

class PostRequest {
  static final NetworkService network = NetworkService();
  static Future<void> signUp1(Map<String, String> data) async {
    const path = 'auth/register';

    await network.postRequestHandler(path, data).then(
      (value) async {
        if (value != null) {
          if (value.data["status"] == "error") {
            // await ShowFlushBar.showError(
            //   value.data["message"],
            //   context: context,
            // );
          } else {
            // RegisterUser resonseData =
            //     RegisterUser.fromMap(value.data['data']['result']);
            // LocalStorage.instance.setTempUserInfo(resonseData);
            // ShowFlushBar.showSuccess(
            //   message: value.data["message"],
            //   context: context,
            // ).whenComplete(
            //     () => context.goNamed(VerificationScreen.name, extra: data));
          }
        } else {
          // showAppErrorModal(context);
        }
      },
    );
  }
}
