import 'package:firebase_auth/firebase_auth.dart';
import 'error.dart';

mixin BaseRepository {
  Future<T> handleRequest<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on FirebaseAuthException catch (e) {
      throw AuthError(e.message ?? 'Authentication error occurred');
    } on FirebaseException catch (e) {
      throw ServerError(e.message ?? 'Server error occurred');
    } catch (e) {
      throw DefaultError(e.toString());
    }
  }
}
