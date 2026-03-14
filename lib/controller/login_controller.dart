import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view/home_page.dart';
import '../view/login_page.dart';

class LoginController extends GetxController {

  final box = GetStorage();

  final GoogleSignIn googleSignIn = GoogleSignIn();

  RxBool isLoggedIn = false.obs;

  /// Default login credentials
  final String defaultUser = "mor_2314";
  final String defaultPass = "83r5^_";

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = box.read("login") ?? false;
  }

  /// Default username + password login
  void login(String username, String password) {

    if (username == defaultUser && password == defaultPass) {

      box.write("login", true);

      box.write("name", "Nexa User");
      box.write("email", "user@nexa.com");
      box.write("photo", "");

      isLoggedIn.value = true;

      Get.offAll(() => HomePage());

    } else {

      Get.snackbar(
        "Login Failed",
        "Invalid username or password",
        snackPosition: SnackPosition.BOTTOM,
      );

    }

  }

  /// Google login
  Future<void> googleLogin() async {

    try {

      final GoogleSignInAccount? account =
      await googleSignIn.signIn();

      /// User cancelled login
      if (account == null) {
        return;
      }

      await account.authentication;

      box.write("login", true);
      box.write("name", account.displayName ?? "Google User");
      box.write("email", account.email);
      box.write("photo", account.photoUrl ?? "");

      isLoggedIn.value = true;

      Get.offAll(() => HomePage());

    } catch (e) {

      Get.snackbar(
        "Google Login Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );

    }

  }

  /// Logout
  void logout() async {

    await googleSignIn.signOut();

    box.erase();

    isLoggedIn.value = false;

    Get.offAll(() => LoginPage());

  }

}