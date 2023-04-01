import 'package:login_app/utils/common_imports.dart';

class CustomerHomeScreen extends StatelessWidget {
  AppUser user;
  CustomerHomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: AppColors.cAppBarColor,
          title: Text(
            "HOME",
            style: AppFonts.w500white16,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  "Hello ${user.name},",
                  style: AppFonts.w500black16,
                ),
                const SizedBox(height: 20),
                Text(
                  "Email: ${user.email} ",
                  style: AppFonts.w500black16,
                ),
                const SizedBox(height: 20),
                Text(
                  "Logged in as CUSTOMER",
                  style: AppFonts.w500black16,
                ),
                const Spacer(),
                PrimaryButton(
                  foregroundColor: ButtonColors.whiteButtonColor,
                  backgroundColor: ButtonColors.cButtonColor,
                  title: "Logout",
                  function: () {
                    MyFirebaseServices.signout(context);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
