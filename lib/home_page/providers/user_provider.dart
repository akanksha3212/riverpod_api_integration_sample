
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:home_page_repository/home_page_repository.dart';

final userProvider = FutureProvider.autoDispose<List<UserModel>>((ref) async {
  return ref.read(homePageProvider).getUser();
});
final userDetailsProvider=FutureProvider.autoDispose<UserModel>((ref) {
  return ref.read(homePageProvider).getUserDetails();
});