import 'package:dainsleif_journal/repositiory/local_storage/storage_strings.dart';
import 'package:get_storage/get_storage.dart';

import '../../modals/g_modal.dart';

class MyStorage {
  static GetStorage storage = GetStorage();
  static GModal? genshinLocalModal;

  ///Genshin Data Storage
  static setGenshinData(GModal genshinmodal) async {
    Map<String, dynamic> data = Map<String, dynamic>.from(genshinmodal.toJson());
    await storage.write(MyStorageString.genshinData, data);
    Map<String, dynamic> value = storage.read(MyStorageString.genshinData) ?? {};
    genshinmodal = GModal.fromJson(value);
  }

  static GModal? getGenshinData() {
    Map<String, dynamic> data = storage.read(MyStorageString.genshinData) ?? {};
    genshinLocalModal = GModal.fromJson(data);
    return genshinLocalModal;
  }
}
