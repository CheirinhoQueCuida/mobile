import 'package:mobile/models/categoria.dart';
import 'package:nikutils/utils/http/nk_http.dart';

class CategoriaService {
  final NkHttpService httpService = Ioc().use<NkHttpService>('NkHttpService');
  Future<NkResponse<List<Categoria>>> get({int id}) async {
    var requestData =
        RequestData<List<Categoria>>(fromJson: categoriaListFromJson);
    requestData.route = "categoria";
    if (id != null) {
      requestData.queryParams = {"id": id.toString()};
    }
    requestData.type = RequestType.get;
    var res = await httpService.requestNkBase(requestData);
    return res;
  }
}
