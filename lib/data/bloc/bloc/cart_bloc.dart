import 'package:bloc/bloc.dart';
import 'package:e_commerce_shop/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, List<Product>> {
  CartBloc() : super(<Product>[]) {
    on<AddProductToCart>((event, emit) {
      final updatedState = List<Product>.from(state);
      if (!updatedState.contains(event.product)) {
        updatedState.add(event.product);
      }
      emit(updatedState);
    });
    on<DeleteProduct>((event, emit) {
      final updatedState = List<Product>.from(state);
      updatedState.removeWhere((element) => element == event.product);
      emit(updatedState);
    });
  }
}
