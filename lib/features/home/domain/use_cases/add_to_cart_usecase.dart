import 'package:dartz/dartz.dart';
import 'package:ecommerce_c9_monday/core/error/failuers.dart';
import 'package:ecommerce_c9_monday/features/home/data/models/CartModel.dart';
import 'package:ecommerce_c9_monday/features/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddCartUseCase {
  HomeRepo repo;

  AddCartUseCase(this.repo);

  Future<Either<Failures, CartModel>> call(String id) => repo.addToCart(id);
}
