// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddProductToCart extends CartEvent {
  final Product product;
  AddProductToCart({
    required this.product,
  });
}

class DeleteProduct extends CartEvent {
  final Product product;
  DeleteProduct({
    required this.product,
  });
}
