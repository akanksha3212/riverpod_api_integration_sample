import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample/home_page/home_page.dart';
import 'package:flutter_riverpod_sample/shared_constants/shared_constants.dart';

class UserDetailsPage extends ConsumerWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(userDetailsProvider);
    return Scaffold(
        appBar: appBar("User Details"),
        body: ChangingColorBody(
            child: data.when(
                data: (dataValue) {
                  return SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              radius: 150,
                              backgroundImage: NetworkImage(
                                dataValue.avatar,
                              ),
                            ),
                            Column(children: [
                              Text(
                                  "${dataValue.firstname} ${dataValue.lastname}",
                                  style: const TextStyle(fontSize: 42)),
                              Text(dataValue.email,
                                  style: const TextStyle(fontSize: 22)),
                            ]),
                          ]));
                },
                error: (err, str) => Text(err.toString()),
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                })));
  }
}
