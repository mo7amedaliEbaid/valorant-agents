
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constants/api_constants.dart';
import '../../domain/entities/agent_model.dart';
import '../../domain/repositories/agent_repository_interface.dart';

class AgentRepositoryImplimentation implements AgentRepository {
  @override
  Future<List<Agent>> getAgents() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.API_URL));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final agentList = jsonData['data'] as List<dynamic>;
        final agents = agentList.map((agentData) {
          try {
            return Agent.fromJson(agentData);
          } catch (e) {
            print('Error mapping agent: $e');
            return null;
          }
        }).toList();

        agents.removeWhere((agent) => agent == null);

        return agents.cast<Agent>();
      } else {
        throw Exception(
            'Failed to fetch agents. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch agents: $e');
    }
  }
}
