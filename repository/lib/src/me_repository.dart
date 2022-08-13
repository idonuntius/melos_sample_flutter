import 'package:model/model.dart';
import 'package:riverpod/riverpod.dart';

final meRepositoryProvider = FutureProvider((_) => MeRepositoryImpl().getMe());

abstract class MeRepository {
  Future<Me> getMe();
}

class MeRepositoryImpl implements MeRepository {
  @override
  Future<Me> getMe() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return Me(id: 1, name: 'name');
  }
}
