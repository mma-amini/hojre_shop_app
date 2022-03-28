import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../helpers/failure.dart';

abstract class IUseCase<Type, Params> {
  Future<Either<Failure, Type>> Handler({Params params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
