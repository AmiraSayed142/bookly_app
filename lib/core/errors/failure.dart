import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioExeption(DioException dioExeption) {
    switch (dioExeption.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout ");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receive timeout");

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioExeption.response!.statusCode!,
          dioExeption.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure("Response Canceled");

      case DioExceptionType.connectionError:
        return ServerFailure("Connection error");

      case DioExceptionType.unknown:
        if (dioExeption.message!.contains("SocketException")) {
          return ServerFailure("No internet connection");
        }
        return ServerFailure("Unknown error");
    }
  }

  factory ServerFailure.fromResponse(int statesCode, dynamic response) {
    if (statesCode == 400 || statesCode == 401 || statesCode == 402) {
      return ServerFailure(response['error']['message']);
    } else if (statesCode == 404) {
      return ServerFailure("Your Request Not Found, try later!");
    } else if (statesCode == 500) {
      return ServerFailure("Server Error, try later");
    } else {
      return ServerFailure("Opps There was an error , try later");
    }
  }
}
