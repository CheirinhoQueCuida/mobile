import 'package:mobile/models/oleo.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/utils/http/nk_http.dart';

class OleoService {
  final NkHttpService httpService = Get.find();
  Future<NkResponse<List<Oleo>>> get({int id, int catId}) async {
    var requestData = RequestData<List<Oleo>>(fromJson: oleoListFromJson);
    requestData.route = "item";
    requestData.queryParams = {};
    if (id != null) {
      requestData.queryParams = {"id": id.toString()};
    }
    if (catId != null) {
      requestData.queryParams.addAll({"catid": catId.toString()});
    }
    requestData.type = RequestType.get;
    var res = await httpService.requestNkBase(requestData);
    return res;
  }
}
