import 'package:get_it/get_it.dart';
import 'package:scrips_ua/core/bloc/core_bloc.dart';
import 'package:scrips_ua/features/Questionnaire/data/datasources/forms_data_source.dart';
import 'package:scrips_ua/features/Questionnaire/data/datasources/forms_data_source_impl.dart';
import 'package:scrips_ua/features/Questionnaire/data/repository/questionnaire_response_impl.dart';
import 'package:scrips_ua/features/Questionnaire/domain/repository/questionnaire_repository.dart';
import 'package:scrips_ua/features/Questionnaire/domain/usecases/get_form_data_use_case.dart';
import 'package:scrips_ua/features/Questionnaire/domain/usecases/save_form_response_use_case.dart';
import 'package:scrips_ua/features/Questionnaire/presentation/bloc/questionnaire_bloc.dart';
import 'package:scrips_ua/features/Signup/data/datasources/signup_data_source.dart';
import 'package:scrips_ua/features/Signup/data/datasources/signup_data_source_impl.dart';
import 'package:scrips_ua/features/Signup/data/repository/signup_repository_impl.dart';
import 'package:scrips_ua/features/Signup/domain/repository/signup_repository.dart';
import 'package:scrips_ua/features/Signup/domain/usecases/get_patient_user_use_case.dart';
import 'package:scrips_ua/features/Signup/presentation/bloc/signup_bloc.dart';
import 'package:scrips_ua/features/landing/data/datasources/landing_data_source.dart';
import 'package:scrips_ua/features/landing/data/datasources/landing_data_source_impl.dart';
import 'package:scrips_ua/features/landing/data/datasources/landing_dummy_data_source_impl.dart';
import 'package:scrips_ua/features/landing/data/repository/landing_repository_impl.dart';
import 'package:scrips_ua/features/landing/domain/repository/landing_repository.dart';
import 'package:scrips_ua/features/landing/domain/usecases/get_logged_user_use_case.dart';
import 'package:scrips_ua/features/landing/presentation/bloc/landing/landing_bloc.dart';


final uaSl = GetIt.instance;
const bool USE_FAKE_IMPLEMENTATION = true;

Future<void> initUAServiceLocator() async {
  /// Core
  // bloc
  uaSl.registerFactory(() => CoreBloc());

  /// Landing
  //bloc
  uaSl.registerFactory(
          () => LandingBloc(getLoggedUserUseCase: uaSl(), oAuthLoginUseCase: uaSl()));

  // use cases
  uaSl.registerLazySingleton(() => GetLoggedUserUseCase(landingRepository: uaSl()));

  // Data sources
  uaSl.registerLazySingleton<LandingDataSource>(() => USE_FAKE_IMPLEMENTATION
      ? LandingDummyDataSourceImpl()
      : LandingDataSourceImpl());

  // repository
  uaSl.registerLazySingleton<LandingRepository>(
          () => LandingRepositoryImpl(landingDataSource: uaSl()));

  /// Signup
  //bloc
  uaSl.registerFactory(
          () => SignupBloc(getPatientUseCase: uaSl(), fetchGenderUseCase: uaSl()));

  // use cases
  uaSl.registerLazySingleton(() => GetPatientUseCase(signupRepository: uaSl()));

  // Data sources
  uaSl.registerLazySingleton<SignupDataSource>(() => SignupDataSourceImpl());

  // repository
  uaSl.registerLazySingleton<SignupRepository>(
          () => SignupRepositoryImpl(signupDataSource: uaSl()));

  /// Questionnaire
  //bloc
  uaSl.registerFactory(
          () => QuestionnaireBloc(fetchFormDataUseCase: uaSl(), saveFormResponseUseCase: uaSl()));

  // use cases
  uaSl.registerLazySingleton(() => SaveFormResponseUseCase(repository: uaSl()));
  uaSl.registerLazySingleton(() => FetchFormDataUseCase(repository: uaSl()));

  // Data sources
  uaSl.registerLazySingleton<QuestionnaireDataSource>(() => QuestionnaireDataSourceImpl());

  // repository
  uaSl.registerLazySingleton<QuestionnaireRepository>(
          () => QuestionnaireRepositoryImpl(questionnaireDataSource: uaSl()));

}
