import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  Failure({required this.errmessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errmessage});

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errmessage: 'Connection Timeout');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errmessage: 'Send Timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errmessage: 'Receive Timeout');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errmessage: 'Request Cancelled');
      case DioExceptionType.unknown:
        if (e.message!.contains('SocketException')) {
          return ServerFailure(errmessage: 'No Internet Connection');
        } else {
          return ServerFailure(errmessage: 'Unknown Error, please try later');
        }
      default:
        return ServerFailure(errmessage: 'No Internet Connection');
    }
  }
  factory ServerFailure.fromResponse(int statuisCode, dynamic response) {
    if (statuisCode == 400 || statuisCode == 401 || statuisCode == 403) {
      return ServerFailure(errmessage: response['error']['message']);
    } else if (statuisCode == 404) {
      return ServerFailure(errmessage: 'requist Not Found, please try later');
    } else if (statuisCode == 500) {
      return ServerFailure(
          errmessage: 'Internal Server Error, please try later');
    } else {
      return ServerFailure(errmessage: 'there was an error, please try later');
    }
  }
}




/**
 

switch (statuisCode) {
      case 400:
        return ServerFailure(errmessage: 'Bad Request');
      case 401:
        return ServerFailure(errmessage: 'Unauthorized');
      case 403:
        return ServerFailure(errmessage: 'Forbidden');
      case 404:
        return ServerFailure(errmessage: 'Not Found');
      case 500:
        return ServerFailure(errmessage: 'Internal Server Error');
      default:
        return ServerFailure(errmessage: 'Unknown Error');
    }




 */
