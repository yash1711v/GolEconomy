import 'dart:convert';

import '../models/task/task.dart';
import '../routes/routes_helper.dart';
import 'api_services.dart';

class Repo {
  final _req = ApiCaller();

  Future<List<Task>> getAllProducts() async {
    var response = await _req.get("/posts",);
    debugPrint("response: $response");
    List jsonResponse = json.decode(response).toList();
    return jsonResponse.map((task) => Task.fromJson(task)).toList();
  }

  Future<void> postTask(List<Task> tasks) async {
    try {
      final response = await _req.post("/posts", tasks);
    } catch(e){
      debugPrint(e.toString());
    };
  }
}
