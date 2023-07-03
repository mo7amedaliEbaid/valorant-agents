import 'package:bloc/bloc.dart';

import '../../domain/entities/agent_model.dart';

part 'agent_selection_event.dart';
part 'agent_selection_state.dart';

class AgentSelectionBloc
    extends Bloc<AgentSelectionEvent, AgentSelectionState> {
  AgentSelectionBloc({
    required List<Agent> agents,
  }) : super(AgentSelectionState(agents, 0)) {
    on<AgentSelectionEvent>((event, emit) {
      emit(AgentSelectionState(state.agents, event.selectedIndex));
    });
  }
}
