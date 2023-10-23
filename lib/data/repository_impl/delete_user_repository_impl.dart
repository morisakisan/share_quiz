// Project imports:
import '../../domain/repository/delete_user_repository.dart';
import '../delete_user/delete_user_data_store.dart';

class DeleteUserRepositoryImpl extends DeleteUserRepository {

  @override
  Future<void> delete() {
    return DeleteUserDataStore().deleteUserAccount();
  }
}
