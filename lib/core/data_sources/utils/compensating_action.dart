class CompensatingAction {
  /// Runs a remote operation, then a local operation.
  /// If the local operation fails, runs the compensation (e.g., delete remote).
  static Future<T> runWithCompensation<T>({
    required Future<T> Function() remoteOperation,
    required Future<void> Function() localOperation,
    required Future<void> Function() compensateRemote,
    required String operationName,
  }) async {
    try {
      final remoteResult = await remoteOperation();
      try {
        await localOperation();
        return remoteResult;
      } catch (localError) {
        // Local failed, try to compensate
        try {
          await compensateRemote();
        } catch (compensateError) {
          throw Exception(
              '$operationName: Local failed ( localError), compensation also failed ( compensateError)');
        }
        throw Exception(
            '$operationName: Local failed ( localError), remote compensated');
      }
    } catch (remoteError) {
      throw Exception('$operationName: Remote failed ( remoteError)');
    }
  }
}
