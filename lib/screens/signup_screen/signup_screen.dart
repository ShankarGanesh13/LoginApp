import 'package:login_app/utils/common_imports.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _nameController = TextEditingController();

  String role = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                Center(
                    child: Text(
                  "Sign-up",
                  style: AppFonts.w600black24,
                )),
                const SizedBox(height: 50),
                textField(
                    controller: _nameController,
                    label: "Name",
                    error: "Please enter your name",
                    type: TextInputType.name,
                    password: false),
                const SizedBox(height: 16),
                textField(
                    controller: _emailController,
                    label: "Email",
                    error: "Please enter an email",
                    type: TextInputType.emailAddress,
                    password: false),
                const SizedBox(height: 16),
                textField(
                    controller: _passwordController,
                    label: "Password",
                    error: "Please enter a password",
                    type: TextInputType.text,
                    password: true),
                const SizedBox(height: 30),
                Text(
                  "Select Role",
                  style: AppFonts.w500black16,
                ),
                const SizedBox(height: 12),
                SelectRole(
                  getRole: (value) {
                    role = value;
                    print(role);
                  },
                ),
                const SizedBox(height: 50),
                PrimaryButton(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  title: "SignUp",
                  function: () {
                    if (_formKey.currentState!.validate()) {
                      MyFirebaseServices.signup(
                          name: _nameController.text,
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          role: role,
                          context: context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField({
    required TextEditingController controller,
    required String label,
    required String error,
    required TextInputType type,
    required bool password,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: password,
      decoration: InputDecoration(
        labelText: label,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return error;
        }
        return null;
      },
    );
  }
}
