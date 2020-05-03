import 'package:http/http.dart' as http;

String url = "localhost:4000/login";

Future<List<String>> getProductsFromDb(int id) async{
  Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"id": $id}';

    http.Response response = await http.post(url + "/getProduct", headers: headers, body: json);
    int statusCode = response.statusCode;

    List<String> body = [response.body];

    if(statusCode == 200){
      return body;
    }

}

Future<List<String>> getCategoryFromDb(int id) async{
  Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"id": $id}';

    http.Response response = await http.post(url + "/getCategory", headers: headers, body: json);
    int statusCode = response.statusCode;

    List<String> body = [response.body];

    if(statusCode == 200){
      return body;
    }
}

Future<String> placeOrder(order) async{
  Map<String, String> headers = {"Content-type": "application/json"};
    String json = '{"order": $order}';

    http.Response response = await http.post(url + "/getCategory", headers: headers, body: json);
    int statusCode = response.statusCode;

    if(statusCode == 200){
      return "order succesfull";
    }
}