import 'package:mobile/models/oleo.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/utils/http/nk_http.dart';

class OleoRepository extends GetxController {
  // Api
  final NkHttpService _httpService = Get.find();
  Future<NkResponse<List<Oleo>>?> _get({int? catId}) async {
    var requestData = RequestData<List<Oleo>>(fromJson: oleoListFromJson);
    requestData.route = "oleo";
    requestData.queryParams = {};
    if (catId != null) {
      requestData.queryParams!.addAll({"catid": catId.toString()});
    }
    requestData.type = RequestType.get;
    var res = await _httpService.requestNkBase(requestData);
    return res;
  }

  // Controller

  NkResponse? apiResponse;

  List<Oleo> oleos = [];

  Oleo? oleo;

  bool success = true;

  bool isBusy = false;

  Future loadListData(int catId) async {
    isBusy = true;
    var res = await _get(catId: catId);
    success = res!.success!;
    if (success) {
      oleos = res.data!;
    }
    isBusy = false;
    update();
  }
}
