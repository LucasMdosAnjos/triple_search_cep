import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entity/params_search_cep.dart';
import '../../domain/errors/errors.dart';
import '../../domain/usecases/search_cep_usecase.dart';
import '../../external/http/http_search_cep.dart';
import '../../infra/repositories/search_cep_repository_impl.dart';
import '../stores/search_cep_store.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final SearchCepStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search CEP')),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              store.searchCep(ParamsSearchCep(cep: value));
            },
          ),
          Expanded(
              child: Center(
            child: ScopedBuilder<SearchCepStore, SearchCepException, String>(
              store: store,
              onError: (context, error) {
                if (error == null) {
                  return Container();
                }
                return Text(error.message);
              },
              onLoading: (context) => const CircularProgressIndicator(),
              onState: ((context, state) {
                return Text(state);
              }),
            ),
          ))
        ],
      ),
    );
  }
}
