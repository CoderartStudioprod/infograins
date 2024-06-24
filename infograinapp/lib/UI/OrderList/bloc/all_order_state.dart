part of 'all_order_bloc.dart';

abstract class AllOrderState extends Equatable {
  const AllOrderState();

  @override
  List<Object> get props => [];
}

class AllProductsInitial extends AllOrderState {}

class GetAllorder extends AllOrderState {
  List<Map<String, dynamic>>? list;
  GetAllorder({this.list});
}

class LogoutState extends AllOrderState {}

class AllOrdersLoadingState extends AllOrderState {}

class AllProductsFailureState extends AllOrderState {}
