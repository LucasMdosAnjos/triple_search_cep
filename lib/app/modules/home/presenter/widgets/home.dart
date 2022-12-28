import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:triple_search_cep/app/modules/home/presenter/blocs/search_cep_bloc/search_cep_bloc.dart';
import 'package:triple_search_cep/app/modules/home/presenter/blocs/search_cep_bloc/search_cep_event.dart';

import '../../domain/entity/params_search_cep.dart';
import '../../domain/errors/errors.dart';
import '../../domain/usecases/search_cep_usecase.dart';
import '../../external/http/http_search_cep.dart';
import '../../infra/repositories/search_cep_repository_impl.dart';
import '../blocs/search_cep_bloc/search_cep_state.dart';
import '../stores/search_cep_store.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  // final SearchCepStore store = Modular.get();
  final SearchCepBloc searchCepBloc = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search CEP')),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              // store.searchCep(ParamsSearchCep(cep: value));
              searchCepBloc
                  .add(LoadCepEvent(params: ParamsSearchCep(cep: value)));
            },
          ),
          Expanded(
              child: Center(
            child: BlocBuilder<SearchCepBloc, SearchCepState>(
              bloc: searchCepBloc,
              builder: (context, state) {
                if (state is SearchCepInitialState) {
                  return Container();
                }
                if (state is SearchCepLoadingState) {
                  return const CircularProgressIndicator();
                }
                if (state is SearchCepFailState) {
                  return Text(state.error);
                }
                if (state is SearchCepSuccessState) {
                  return Text(state.info);
                }
                return Container();
              },
            ),
          ))
        ],
      ),
    );
  }
}
