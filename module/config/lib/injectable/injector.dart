import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

typedef AsyncFunc<T> = Future<T> Function();
typedef DisposableFunc<T> = FutureOr Function(T param);

abstract class Injector {

  GetIt get instance;

  GetItHelper get helper;

  void registerLazySingleton<T extends Object>(T Function() function);

  Future<void> registerSingletonAsync<T extends Object>(
    AsyncFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    DisposableFunc<T>? dispose,
  });

  void registerSingleton<T extends Object>(T instance);

  void registerFactory<T extends Object>(T Function() function);

  bool isRegistered<T extends Object>({Object? instance, String? instanceName});

  void resetLazySingleton<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T)? disposingFunction,
  });

  T get<T extends Object>({String? instanceName});

  Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  });

  void unregister<T extends Object>();

  Future<void> reset({bool dispose = true});
}
