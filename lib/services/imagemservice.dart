import 'dart:convert';

import 'package:nikutils/nikutils.dart';
import 'package:nikutils/utils/http/nk_http.dart';

List<String> imagemStrListFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

class ImagemService {
  final NkHttpService _httpService = Get.find();
  Future<NkResponse<List<String>>> getItemFotos({int id}) async {
    var requestData =
        RequestData<List<String>>(fromJson: imagemStrListFromJson);
    requestData.route = "foto";
    if (id != null) {
      requestData.queryParams = {"id": id.toString()};
    }
    requestData.type = RequestType.get;
    var res = await _httpService.requestNkBase(requestData);
    return res;
  }
}
