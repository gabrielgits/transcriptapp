abstract class RepositoryRemoteAuth {
  Future<Map<String, dynamic>> signinWithPhone({
    required String phone,
    required String password,
  });

  Future<Map<String, dynamic>> signUp(Map<String, dynamic> json);

  Future<Map<String, dynamic>> forgotPassword(String phone);

  Future<Map<String, dynamic>> updatePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Map<String, dynamic>> logout();

  Future<Map<String, dynamic>> profile(int id);
  Future<Map<String, dynamic>> updateProfile({
    required int id,
    required Map<String, dynamic> json,
  });
}
