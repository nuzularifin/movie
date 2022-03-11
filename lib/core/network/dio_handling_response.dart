import 'package:dio/dio.dart';
import 'package:testcase/core/error/exceptions.dart';

class DioHandlingResponse {
  final DioError dioError;

  DioHandlingResponse(this.dioError);

  setThrow() {
    if (dioError.type == DioErrorType.connectTimeout) {
      // throw ServerException();
      // int code = dioError.response!.statusCode!;
      // String message = dioError.response!.statusMessage!;
      return ServerException(
          errorMessage: dioError.message, code: dioError.response!.statusCode!);
    } else if (dioError.type == DioErrorType.other) {
      print(
          'Error Type - OTHER - Get Response Code -> ${dioError.response!.statusCode}');
      if (dioError.response!.statusCode == 401) {
        return ServerException(
            errorMessage: dioError.message,
            code: dioError.response!.statusCode!);
      } else {
        return ServerException(
            errorMessage: dioError.message,
            code: dioError.response!.statusCode!);
      }
    } else if (dioError.type == DioErrorType.response) {
      if (dioError.response!.statusCode == 402) {
        return ServerException(
            errorMessage: dioError.message,
            code: dioError.response!.statusCode!);
      } else if (dioError.response!.statusCode == 401) {
        print(
            'Error Type - ${dioError.type} - Get Response Code -> ${dioError.response!.statusCode}');
        return ServerException(
            errorMessage: dioError.message,
            code: dioError.response!.statusCode!);
      } else {
        print(
            'Error Type - ${dioError.type} - Get Response Code -> ${dioError.response!.statusCode}');
        return ServerException(
            errorMessage: dioError.message,
            code: dioError.response!.statusCode!);
      }
    }
  }
}
