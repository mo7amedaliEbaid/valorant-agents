import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:valorant/blocs/network_bloc/network_state.dart';
import 'package:valorant/presentation/widgets/drawer_widget.dart';
import 'package:valorant/presentation/widgets/offline_body.dart';

import '../../blocs/agent_bloc/agent_bloc.dart';
import '../../blocs/agent_selection_bloc/agent_selection_bloc.dart';
import '../../blocs/network_bloc/network_bloc.dart';
import '../widgets/navigate.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  _toggleAnimation() {
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final rightSlide = size.width * 0.4;

    return AnimatedBuilder(
        animation: _animationController,
        builder: (context,child) {
          double slide = rightSlide * _animationController.value;
          double scale = 1 - (_animationController.value * 0.3);
          return Stack(
            children: [
              Scaffold(
                backgroundColor:Colors.black, //const Color(0xff22a6b3),
                body:Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Colors.indigoAccent,Colors.purpleAccent])
                    ),
                    child: const DrawerData()),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.center,
                child: Scaffold(
                    backgroundColor: Colors.black,
                    body: BlocBuilder<NetworkBloc, NetworkState>(
                        builder: (context, state) {
                          if (state is NetworkFailure) {
                            return offlinewidget(context);
                          } else if (state is NetworkSuccess) {
                            return BlocBuilder<AgentBloc, AgentState>(
                              builder: (context, state) {
                                if (state is AgentLoading) {
                                  return Center(
                                      child: SpinKitHourGlass(
                                        color: Colors.red,
                                        size: 70,
                                      ));
                                } else if (state is AgentLoaded) {
                                  return BlocProvider(
                                    create: (context) =>
                                        AgentSelectionBloc(agents: state.agents),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        BlocBuilder<
                                            AgentSelectionBloc,
                                            AgentSelectionState>(
                                          builder: (context, state) {
                                            return AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              curve: Curves.ease,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    state
                                                        .agents[state.selectedIndex]
                                                        .background,
                                                  ),
                                                  scale: 2.5,
                                                  opacity: 0.5,
                                                ),
                                                gradient: LinearGradient(
                                                  colors: state.agents[state
                                                      .selectedIndex]
                                                      .backgroundGradientColors
                                                      .map((color) =>
                                                      Color(int.parse(
                                                          color, radix: 16)))
                                                      .toList(),
                                                  begin: Alignment.topCenter,
                                                  end: Alignment.bottomCenter,
                                                ),
                                              ),
                                              child: BlocBuilder<AgentSelectionBloc,
                                                  AgentSelectionState>(
                                                builder: (context, state) {
                                                  return AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    curve: Curves.ease,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        push(
                                                          context: context,
                                                          widget: DetailScreen(
                                                            agent: state
                                                                .agents[state
                                                                .selectedIndex],
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: state
                                                            .agents[state
                                                            .selectedIndex].name,
                                                        child: Image.network(
                                                          state.agents[state
                                                              .selectedIndex]
                                                              .fullPortrait,
                                                          height: 580.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                        BlocBuilder<
                                            AgentSelectionBloc,
                                            AgentSelectionState>(
                                          builder: (context, state) {
                                            return Positioned(
                                              top: 80.0,
                                              child: Text(
                                                state.agents[state.selectedIndex]
                                                    .name,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 40.0,
                                                  fontFamily: 'Valorant',
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        BlocBuilder<
                                            AgentSelectionBloc,
                                            AgentSelectionState>(
                                          builder: (context, state) {
                                            return Positioned(
                                              bottom: 0.0,
                                              child: SizedBox(
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                height: 100.0,
                                                child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: state.agents.length,
                                                  physics: const BouncingScrollPhysics(),
                                                  itemBuilder: (context, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        context
                                                            .read<
                                                            AgentSelectionBloc>()
                                                            .add(AgentSelectionEvent(
                                                            index));
                                                      },
                                                      child: AnimatedContainer(
                                                        duration:
                                                        const Duration(
                                                            milliseconds: 400),
                                                        curve: Curves.ease,
                                                        margin: const EdgeInsets.all(
                                                            8.0),
                                                        width: 90.0,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                            color: state
                                                                .selectedIndex ==
                                                                index
                                                                ? Colors.red
                                                                : Colors.transparent,
                                                            width: 2.0,
                                                          ),
                                                          image: DecorationImage(
                                                            image: NetworkImage(
                                                              state.agents[index]
                                                                  .displayIcon,
                                                            ),
                                                            opacity:
                                                            state.selectedIndex ==
                                                                index
                                                                ? 1.0
                                                                : 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Positioned(
                                          top: size.height * .08,
                                          left: size.width * .08,
                                          child: InkWell(
                                              onTap: () => _toggleAnimation(),
                                              child: SpinKitPulsingGrid(
                                                color: Colors.red,
                                                size: 37,
                                                boxShape: BoxShape.circle,)
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                } else {
                                  return const Center(
                                    child: Text('No agents found'),
                                  );
                                }
                              },
                            );
                          } else {
                            return Container();
                          }
                        })),
              ),
            ],
          );
        } );
  }
}
