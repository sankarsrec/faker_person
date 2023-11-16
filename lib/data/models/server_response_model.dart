import '../../domain/entities/server_response_entity.dart';

class ServerResponseModel extends ServerResponseEntity {
  const ServerResponseModel({
    this.success = false,
    this.message = '',
    this.error = '',
  }) : super(
          isSuccess: success,
          message: message,
          error: error,
        );

  final bool success;
  final String message;
  final String error;

  factory ServerResponseModel.fromJson(Map<String, dynamic> json) =>
      ServerResponseModel(
        success: json['success'] ?? false,
        message: json['message'] ?? '',
        error: json['error'] is String
            ? (json['error'] ?? '')
            : json['error']?.toString() ?? '',
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'error': error,
      };
}
