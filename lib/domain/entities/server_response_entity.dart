import 'package:equatable/equatable.dart';

class ServerResponseEntity extends Equatable {
  const ServerResponseEntity({
    this.isSuccess = false,
    this.message = '',
    this.error = '',
  });

  final bool isSuccess;
  final String message;
  final String error;

  @override
  List<Object?> get props => [
        isSuccess,
        message,
        error,
      ];
}
