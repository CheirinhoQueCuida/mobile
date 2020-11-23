import 'dart:convert';

import 'package:nikutils/utils/http/nk_http.dart';

List<String> fotoStrListFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

class FotoService {
  final NkHttpService _httpService = Ioc().use<NkHttpService>('NkHttpService');
  Future<NkResponse<List<String>>> getItemFotos({int id}) async {
    var requestData = RequestData<List<String>>(fromJson: fotoStrListFromJson);
    requestData.route = "foto";
    if (id != null) {
      requestData.queryParams = {"id": id.toString()};
    }
    requestData.type = RequestType.get;
    var res = await _httpService.requestNkBase(requestData);
    return res;
  }
}
