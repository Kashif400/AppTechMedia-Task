class RequestResponse {
  final bool success;
  final String? message;
  final String? error;
  final dynamic data;

  RequestResponse(this.success, {this.message, this.error, this.data});

  // Factory constructors for convenience
  factory RequestResponse.success({String? message, dynamic data}) {
    return RequestResponse(true, message: message, data: data);
  }

  factory RequestResponse.error({String? message, String? error}) {
    return RequestResponse(false, message: message, error: error);
  }

  factory RequestResponse.fromJson(Map<String, dynamic> json) {
    return RequestResponse(
      json['success'] ?? false,
      message: json['message'],
      error: json['error'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'error': error,
      'data': data,
    };
  }

  @override
  String toString() {
    return 'RequestResponse(success: $success, message: $message, error: $error, data: $data)';
  }
}
