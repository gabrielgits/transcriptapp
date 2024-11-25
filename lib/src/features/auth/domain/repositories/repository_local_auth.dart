
/// An abstract class that defines the contract for a local repository of Student items.
/// This repository provides methods for CRUD operations on Student items and lists.
abstract class RepositoryLocalAuth {

  Future<int> updateConfigStudent({
    required int studentId,
    required String token,
  });

    Future<int> deleteConfigStudent();
}
