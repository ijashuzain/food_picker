// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:food_picker/src/core/constants/api_endpoints.dart' as _i410;
import 'package:food_picker/src/core/services/api_services/api_service.dart'
    as _i955;
import 'package:food_picker/src/core/services/api_services/config/url_config.dart'
    as _i532;
import 'package:food_picker/src/data/repositories/auth_repository_impl.dart'
    as _i1070;
import 'package:food_picker/src/domain/repositories/auth_repository.dart'
    as _i651;
import 'package:food_picker/src/presentation/blocs/auth_bloc/auth_bloc.dart'
    as _i969;
import 'package:food_picker/src/presentation/blocs/home_bloc/home_bloc.dart'
    as _i324;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

const String _dev = 'dev';
const String _local = 'local';
const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i324.HomeBloc>(() => _i324.HomeBloc());
    gh.factory<_i651.AuthRepository>(() => _i1070.AuthRepositoryImpl());
    gh.lazySingleton<_i532.UrlConfiguration>(
      () => _i532.DevelopmentUrlConfiguration(),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i532.UrlConfiguration>(
      () => _i532.LocalUrlConfiguration(),
      registerFor: {_local},
    );
    gh.lazySingleton<_i532.UrlConfiguration>(
      () => _i532.ProductionUrlConfiguration(),
      registerFor: {_prod},
    );
    gh.factory<_i969.AuthBloc>(
        () => _i969.AuthBloc(gh<_i651.AuthRepository>()));
    gh.singleton<_i410.ApiEndpoints>(
        () => _i410.ApiEndpoints(gh<_i532.UrlConfiguration>()));
    gh.singleton<_i955.Api>(() => _i955.Api(gh<_i532.UrlConfiguration>()));
    return this;
  }
}
