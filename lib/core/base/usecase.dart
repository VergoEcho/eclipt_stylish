abstract class UseCase<T, Params> {
  Future<T> call(Params params);
}

/// Class to handle when useCase don't need params
class NoParams {}