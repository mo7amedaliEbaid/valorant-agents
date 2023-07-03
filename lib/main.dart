
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant/presentation/screens/home_screen.dart';
import 'package:valorant/presentation/screens/splashe_screen.dart';

import 'blocs/agent_bloc/agent_bloc.dart';
import 'blocs/agent_selection_bloc/agent_selection_bloc.dart';
import 'data/repositories/agent_repository_impl.dart';
import 'domain/entities/agent_model.dart';
import 'domain/usecases/agent_usecase_interface.dart';

void main() {
  final agentRepository = AgentRepositoryImplimentation();
  final agentUseCase = AgentUseCase(agentRepository: agentRepository);

  runApp(MyApp(agentUseCase: agentUseCase));
}

class MyApp extends StatelessWidget {
  final AgentUseCase agentUseCase;

  const MyApp({Key? key, required this.agentUseCase}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Agents',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AgentBloc>(
              create: (context) =>
                  AgentBloc(agentUseCase: agentUseCase)..add(FetchAgents())),
          BlocProvider<AgentSelectionBloc>(
              create: (context) => AgentSelectionBloc(
                  agents: agentUseCase.getAgents() as List<Agent>)),
        ],
        child: HomeScreen()//SplashScreen(),
      ),
    );
  }
}