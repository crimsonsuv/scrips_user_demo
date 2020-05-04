part of 'core_bloc.dart';

@immutable
abstract class CoreState {}

class InitialCoreState extends CoreState {}

class GetLocaleState extends CoreState {
  final Global data;

  GetLocaleState({@required this.data});
}

class SetNewLocalState extends CoreState {
  final Global data;

  SetNewLocalState(this.data);
}
