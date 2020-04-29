part of 'core_bloc.dart';

@immutable
abstract class CoreEvent {}

class GetLocaleEvent extends CoreEvent {}

class SetNewLocalEvent extends CoreEvent {
  final String localeCode;
  final String localeCountry;

  SetNewLocalEvent({this.localeCode, this.localeCountry});
}
