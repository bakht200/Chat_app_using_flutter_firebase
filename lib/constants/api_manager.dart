import 'package:http/http.dart' as http;

class ApiManager {
  getRequest(var url) async {
    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      return response;
    }
  }
}
