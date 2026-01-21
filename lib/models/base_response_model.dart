class BaseApiResponseModel<T> {
  final bool success;
  final String message;
  final T? data;

  const BaseApiResponseModel({
    required this.success,
    required this.message,
    this.data,
  });

  factory BaseApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return BaseApiResponseModel<T>(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  /// For APIs that don’t wrap data
  factory BaseApiResponseModel.raw({required T data, String message = ''}) {
    return BaseApiResponseModel<T>(success: true, message: message, data: data);
  }
}
