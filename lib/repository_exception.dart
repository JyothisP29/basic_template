import 'dart:async';
import 'dart:io';

import 'package:basic_template/app_error.dart';
import 'package:dartz/dartz.dart';

import 'logger.dart';

mixin RepositoryExceptionMixin {
  Future<Either<AppError, T>> exceptionHandler<T>(
    FutureOr computation,
  ) async {
    try {
      final result = await computation;
      return Right(result);
    } on SocketException {
      logger.severe("Check Network Connection");
      return const Left(AppError(AppErrorType.network));
    } on Exception {
      logger.severe("Something went wrong");
      return const Left(AppError(AppErrorType.api));
    }
  }
}
