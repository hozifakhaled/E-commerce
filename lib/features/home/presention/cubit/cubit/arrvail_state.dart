part of 'arrvail_cubit.dart';

sealed class ArrvailState {}


final class ArrvailInitial extends ArrvailState {}
final class ArrvailLoading extends ArrvailState {}
final class ArrvailError extends ArrvailState {
  final String errorMessage;
  ArrvailError({
    required this.errorMessage,
  });
}
final class ArrvailSuccess extends ArrvailState {
  final List<ProductEntitiy> productModelList;
 ArrvailSuccess({
    required this.productModelList,
  });
}
