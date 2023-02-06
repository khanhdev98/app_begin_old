import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injector.dart';

class AppInjector implements Injector {
  final GetIt _getIt = GetIt.instance;

  GetItHelper? _getHelper;

  AppInjector._();

  static final Injector _internal = AppInjector._();

  static Injector get I => _instance;

  static Injector get _instance {
    return _internal;
  }

  @override
  GetIt get instance => _getIt;

  @override
  GetItHelper get helper {
    _getHelper ??= GetItHelper(_getIt, Environment.test);
    return _getHelper!;
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() function) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerLazySingleton<T>(
        () => function.call(),
      );
    }
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingleton<T>(instance);
    }
  }

  @override
  T get<T extends Object>({String? instanceName}) {
    if (instanceName == null) {
      return _getIt.get<T>();
    } else {
      return _getIt.get<T>(instanceName: instanceName);
    }
  }

  @override
  Future<T> getAsync<T extends Object>({String? instanceName, param1, param2}) {
    if (instanceName != null) {
      return _getIt.getAsync<T>(param1: param1, param2: param2);
    } else {
      return _getIt.getAsync<T>(
          instanceName: instanceName, param1: param1, param2: param2);
    }
  }

  @override
  void unregister<T extends Object>() => _getIt.unregister<T>();

  @override
  void registerFactory<T extends Object>(T Function() function) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerFactory<T>(() => function.call());
    }
  }

  @override
  Future<void> registerSingletonAsync<T extends Object>(
    AsyncFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    DisposableFunc<T>? dispose,
  }) async {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingletonAsync<T>(
        factoryFunc,
        instanceName: instanceName,
        dependsOn: dependsOn,
        signalsReady: signalsReady,
        dispose: dispose,
      );
    }
  }

  @override
  bool isRegistered<T extends Object>(
          {Object? instance, String? instanceName}) =>
      _getIt.isRegistered<T>(instanceName: instanceName, instance: instance);

  @override
  void resetLazySingleton<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T)? disposingFunction,
  }) =>
      _getIt.resetLazySingleton<T>(
          instance: instance,
          instanceName: instanceName,
          disposingFunction: disposingFunction);

  @override
  Future<void> reset({bool dispose = true}) => _getIt.reset(dispose: dispose);
}
