import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data_sources/utils/error_handler/error_handler.dart';

abstract class UseCase<Type, Params> {
  Future<Either<ErrorHandler, Type>> call({required Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
