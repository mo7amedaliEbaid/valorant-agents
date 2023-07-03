import '../../domain/entities/agent_model.dart';
import '../repositories/agent_repository_interface.dart';

class AgentUseCase {
  final AgentRepository agentRepository;

  AgentUseCase({required this.agentRepository});

  Future<List<Agent>> getAgents() {
    return agentRepository.getAgents();
  }
}
