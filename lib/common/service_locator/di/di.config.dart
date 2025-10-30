// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../features/articles/data/data_source/articles_api_data_source.dart'
    as _i526;
import '../../../features/articles/data/data_source/articles_data_source.dart'
    as _i543;
import '../../../features/articles/data/repository/articles_repository_impl.dart'
    as _i919;
import '../../../features/articles/domain/repository/articles_repository.dart'
    as _i411;
import '../../../features/articles/domain/usecase/get_articles_usecase.dart'
    as _i395;
import '../../../features/articles/domain/usecase/get_sources_usecase.dart'
    as _i744;
import '../../../features/articles/presentation/viewModel/articles_cubit.dart'
    as _i742;
import 'dio_injectable.module.dart' as _i29;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjectable = _$DioInjectable();
    gh.factory<_i361.Dio>(() => dioInjectable.dio);
    gh.lazySingleton<_i543.ArticlesDataSource>(
      () => _i526.ArticlesApiDataSource(dio: gh<_i361.Dio>()),
    );
    gh.factory<_i411.ArticlesRepository>(
      () => _i919.ArticlesRepositoryImpl(
        articlesDataSource: gh<_i543.ArticlesDataSource>(),
      ),
    );
    gh.factory<_i395.GetArticlesUsecase>(
      () => _i395.GetArticlesUsecase(
        articlesRepository: gh<_i411.ArticlesRepository>(),
      ),
    );
    gh.factory<_i744.GetSourcesUsecase>(
      () => _i744.GetSourcesUsecase(
        articlesRepository: gh<_i411.ArticlesRepository>(),
      ),
    );
    gh.factory<_i742.ArticlesCubit>(
      () => _i742.ArticlesCubit(
        gh<_i395.GetArticlesUsecase>(),
        gh<_i744.GetSourcesUsecase>(),
      ),
    );
    return this;
  }
}

class _$DioInjectable extends _i29.DioInjectable {}
