import 'package:mobile/models/vegetal.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/utils/http/nk_http.dart';

class VegetalRepository extends GetxController {
  // Api
  final NkHttpService _httpService = Get.find();

  Future<NkResponse<List<Vegetal>>?> _get({int? id}) async {
    var requestData = RequestData<List<Vegetal>>(fromJson: vegetalListFromJson);
    requestData.route = "oleovegetal";
    requestData.queryParams = {};
    if (id != null) {
      requestData.queryParams = {"id": id.toString()};
    }
    requestData.type = RequestType.get;
    var res = await _httpService.requestNkBase(requestData);
    return res;
  }

  // Controller

  NkResponse? apiResponse;

  List<Vegetal> vegetais = [];

  Vegetal? vegetal;

  bool success = true;

  bool isBusy = false;

  Future loadListData() async {
    isBusy = true;
    var res = await _get();
    success = res!.success!;
    if (success) {
      vegetais = res.data!;
    }
    isBusy = false;
    update();
  }
}
