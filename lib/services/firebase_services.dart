import 'package:login_app/utils/common_imports.dart';

class MyFirebaseServices {
  static signup({
    required String email,
    required String password,
    required String role,
    required String name,
    required BuildContext context,
  }) async {
    try {
      final authResult =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .set({
        'name': name,
        'email': authResult.user!.email,
        'role': role,
      });
      Navigator.pop(context);

      MySnackBar().mySnackBarWidget(
          textToShow: "Signed up successfully", context: context);
    } on FirebaseAuthException catch (e) {
      String message =
          'An error occurred, please check your credentials and try again.';

      if (e.code == 'email-already-in-use') {
        message = 'The email address is already in use by another account.';
      }
      MySnackBar().mySnackBarWidget(textToShow: message, context: context);
    }
  }

  static login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user!.uid)
          .get();

      final role = userDoc.data();
      AppUser user = AppUser.fromJson(userDoc.data()!);
      print(user);
      navigator(user, context);
      MySnackBar().mySnackBarWidget(
          textToShow: "Logged-in successfully", context: context);
    } on FirebaseAuthException catch (e) {
      String message =
          'An error occurred, please check your credentials and try again.';

      if (e.code == 'user-not-found') {
        message = 'No user found with that email address.';
      } else if (e.code == 'wrong-password') {
        message = 'Incorrect password.';
      }

      MySnackBar().mySnackBarWidget(textToShow: message, context: context);
    }
  }

  static signout(context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
  }

  static navigator(AppUser user, BuildContext context) {
    if (user.role.toLowerCase() == 'admin') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => AdminHomeScreen(
            user: user,
          ),
        ),
        (route) => false,
      );
    } else if (user.role.toLowerCase() == 'manager') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => ManagerHomeScreen(user: user),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => CustomerHomeScreen(user: user),
        ),
        (route) => false,
      );
    }
  }
}
