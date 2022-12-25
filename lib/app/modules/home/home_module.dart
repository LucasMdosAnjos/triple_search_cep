import 'package:flutter_modular/flutter_modular.dart';
import 'package:triple_search_cep/app/modules/home/domain/usecases/search_cep_usecase.dart';
import 'package:triple_search_cep/app/modules/home/external/http/http_search_cep.dart';
import 'package:triple_search_cep/app/modules/home/infra/repositories/search_cep_repository_impl.dart';
import 'package:triple_search_cep/app/modules/home/presenter/stores/search_cep_store.dart';
import 'package:triple_search_cep/app/modules/home/presenter/widgets/home.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HttpSearchCep()),
    Bind.lazySingleton((i) => SearchCepRepositoryImpl(i())),
    Bind.lazySingleton((i) => SearchCepUsecase(i())),

    //store
    Bind.lazySingleton((i) => SearchCepStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomeWidget()),
  ];
}
