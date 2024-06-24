part of 'all_order_bloc.dart';

abstract class AllorderEvent extends Equatable {
  const AllorderEvent();

  @override
  List<Object> get props => [];
}

class GetInitialAllOrderListEvent extends AllorderEvent {}

class LogoutEvent extends AllorderEvent {}
