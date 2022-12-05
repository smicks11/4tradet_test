class ApiResponse<T> {
  ApiResponse({
    this.status,
    this.message,
    this.data,
    this.token
  });

  int? status;
  String? message;
  T? data;
  String? token;
}
