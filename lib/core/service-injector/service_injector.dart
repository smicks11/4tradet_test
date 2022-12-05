import '../services/authentication_service.dart';
import '../services/base-service/api_service.dart';
import '../services/storage_service.dart';

class Injector {
  late ApiService apiService;
  final storageService = StorageService();
  AuthenticationService? authenticationService;

  Future<bool> init() async {
    await storageService.initStorage();

    apiService = const ApiService();
    authenticationService =
        AuthenticationService(storageService: storageService);

    return true;
  }
}

Injector si = Injector();
