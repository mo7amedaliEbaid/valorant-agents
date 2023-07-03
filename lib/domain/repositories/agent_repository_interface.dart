import '../../domain/entities/agent_model.dart';

abstract class AgentRepository {
  Future<List<Agent>> getAgents();
}
