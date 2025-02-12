import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_apps/index.dart';
import 'package:wallet_apps/src/constants/db_key_con.dart';
import 'package:wallet_apps/src/models/digital_id_m.dart';
import 'package:wallet_apps/src/provider/home_p.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';

// import 'package:digital_id/all_export.dart';
// import 'package:digital_id/core/config/app_config.dart';
// import 'package:digital_id/models/digital_id_m.dart';
// import 'package:digital_id/provider/home_p.dart';
// import 'package:digital_id/services/storage.dart';
class DigitalIDProvider extends ChangeNotifier {
  DigitalIDModel? identifierModel = DigitalIDModel();

  Map<String, dynamic>? _dataToBlockchain = {};

  Map<String, dynamic> get blochainData => _dataToBlockchain!;
  set setBlockChainData(Map<String, dynamic> data) => _dataToBlockchain!;

  set setSetup(bool value) {
    fetchID();
    notifyListeners();
  }

  /// This Function used for fetch Cache Digital ID
  Future<void> fetchID() async {
    await StorageServices.fetchData(DbKey.idKey).then((value) {
      if (value != null) {
        identifierModel = DigitalIDModel().fromDb(value);
        print(identifierModel!.lsIDCard);
      }
    });
    notifyListeners();
  }

  bool isAbleSubmitToBlockchain({required BuildContext? context}) {
    try {
      HomeProvider _api = Provider.of(context!, listen: false);
      if (identifierModel!.backImage != "" &&
          identifierModel!.frontImage != "" &&
          identifierModel!.selfieImage != "" &&
          _api.homeModel.email != "" &&
          _api.homeModel.country != "" &&
          _api.homeModel.dob != "" &&
          _api.homeModel.name != "" &&
          _api.homeModel.nationality != "" &&
          _api.homeModel.phoneNum != "" &&
          // _api.homeModel.cover != "" &&
          _api.homeModel.profile != "") {
        _dataToBlockchain = toJson(_api.homeModel);

        Provider.of<HomeProvider>(context, listen: false).readyToSubmit = true;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Error isAbleSubmitToBlockchain $e");
    }
    notifyListeners();
    return false;
  }

  void notify() {
    notifyListeners();
  }

  Map<String, dynamic> toJson(DashBoardModel homeModel) {
    return {
      "backImage": identifierModel!.backImage,
      "frontImage": identifierModel!.frontImage,
      "selfieImage": identifierModel!.selfieImage,
      "email": homeModel.email,
      "country": homeModel.country,
      "dob": homeModel.dob,
      "name": homeModel.name,
      "nationality": homeModel.nationality,
      "phoneNum": homeModel.phoneNum,
      // "cover": homeModel.cover,
      "profile": homeModel.profile
    };
  }
}

class DigitalIdBSCProvider extends ChangeNotifier {
  
  final String _contract = didContract;

  DeployedContract? _deployedContract;

  ContractProvider? _contractProvider;

  String? _abi;

  /// Initialize Digital ID contract
  void initContract(BuildContext context) async {

    _contractProvider = Provider.of<ContractProvider>(context, listen: false);
    String abiCode = await rootBundle.loadString(AppConfig.abiPath + 'Identity.json');

    _deployedContract = DeployedContract(
      ContractAbi.fromJson(abiCode, 'Identity'),
      EthereumAddress.fromHex(_contract)
    );
  }

  Future<void> organizationLists() async {
    await _contractProvider!.bscClient.call(
      contract: _deployedContract!,
      // function: ContractFunction('lastID', []),
      function: ContractFunction('organizationLists', []),
      params: []
    );
  }

  Future<void> mintOrg() async {

    try{

      final function = _deployedContract!.function('createOrg');
      await _contractProvider!.bscClient.call(
        contract: _deployedContract!,
        function: function,
        params: [
          "Selendra org",
          "Selendra blockchain",
          "https://selendra.org/"
        ]
      );
    } catch (e) {
      print("Error mintOrg $e");
    }
  }
}

