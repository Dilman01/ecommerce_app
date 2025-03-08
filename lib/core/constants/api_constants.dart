class ApiConstants {
  const ApiConstants._();

  static const baseUrl = 'https://api.escuelajs.co/api/v1';
  static const users = '$baseUrl/users';
  static const login = '$baseUrl/auth/login/';
  static const profile = '$baseUrl/auth/profile';
  static const refreshToken = '$baseUrl/auth/refresh-token';
  static const upload = '$baseUrl/files/upload';
  static const categories = '$baseUrl/categories';
}
