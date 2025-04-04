import 'package:fpdart/fpdart.dart';

import 'package:ecommerce_app/core/errors/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
