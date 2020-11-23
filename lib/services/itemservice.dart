import 'package:mobile/models/Item.dart';
import 'package:nikutils/utils/http/nk_http.dart';

class ItemService {
  final NkHttpService httpService = Ioc().use<NkHttpService>('NkHttpService');
  Future<NkResponse<List<Item>>> get({int id, int catId}) async {
    var requestData = RequestData<List<Item>>(fromJson: itemListFromJson);
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
