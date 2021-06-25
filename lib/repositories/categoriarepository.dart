import 'package:mobile/models/categoria.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/utils/http/nk_http.dart';

class CategoriaRepository extends GetxController {
  // Api

  final NkHttpService _httpService = Get.find();

  Future<NkResponse<List<Categoria>>?> _get(int id) async {
    var requestData =
        RequestData<List<Categoria>>(fromJson: categoriaListFromJson);
    requestData.route = "categoria";
    requestData.queryParams = {"catpaiid": id.toString()};
    requestData.type = RequestType.get;
    var res = await _httpService.requestNkBase(requestData);
    return res;
  }

  // Controller

  NkResponse? apiResponse;

  List<Categoria> categorias = [];

  bool success = true;

  bool isBusy = false;

  Future loadData() async {
    isBusy = true;
    var res = await _get(2);
    success = res!.success!;
    if (success) {
      categorias = res.data!;
    }
    isBusy = false;
    update();
  }
}
