import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:valorant/presentation/screens/splash_screen.dart';

import 'blocs/agent_bloc/agent_bloc.dart';
import 'blocs/agent_selection_bloc/agent_selection_bloc.dart';
import 'blocs/network_bloc/network_bloc.dart';
import 'blocs/network_bloc/network_event.dart';
import 'data/repositories/agent_repository_impl.dart';
import 'domain/entities/agent_model.dart';
import 'domain/usecases/agent_usecase_interface.dart';

AudioPlayer? player;

void main() {
  player = AudioPlayer();
  final agentRepository = AgentRepositoryImplimentation();
  final agentUseCase = AgentUseCase(agentRepository: agentRepository);

  runApp(MultiBlocProvider(providers: [
    BlocProvider<NetworkBloc>(
        create: (context) => NetworkBloc()..add(NetworkObserve())),
    BlocProvider<AgentBloc>(
        create: (context) =>
            AgentBloc(agentUseCase: agentUseCase)..add(FetchAgents())),
    BlocProvider<AgentSelectionBloc>(
        create: (context) => AgentSelectionBloc(
            agents: agentUseCase.getAgents() as List<Agent>)),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Valorant Agents',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: SplashScreen());
  }
}
