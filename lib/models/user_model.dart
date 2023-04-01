class AppUser {
  String name;
  String email;
  String role;

  AppUser({required this.name, required this.email, required this.role});

  factory AppUser.fromJson(Map<String, dynamic> appUser) {
    return AppUser(
      name: appUser["name"],
      email: appUser["email"],
      role: appUser["role"],
    );
  }
  toJson() {
    return {
      "name": name,
      "email": email,
      "role": role,
    };
  }
}
