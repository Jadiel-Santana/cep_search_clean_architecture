import 'package:cep_search_clean_architecture/app/core/domain/services/http_service.dart';
import 'package:http/http.dart';

class HttpClientImp implements HttpService {
  final _client = Client();

  @override
  Future<HttpResponse> get(String url) async {
    final response = await _client.get(Uri.parse(url));
    return HttpResponse(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}