import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_sample/shared_constants/shared_constants.dart';
import 'package:flutter_riverpod_sample/user_details_page/user_details_page.dart';
import '../providers/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar("Riverpod Sample"),
        body: ChangingColorBody(child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final data = ref.watch(userProvider);
          return data.when(
              data: (dataValue) {
               return buildUserListTiles(dataValue);
              },
              error: (err, str) => Text(err.toString()),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ));
        })));
  }
  Widget  buildUserListTiles(dataValue) {
    return  Column(
      children: [
        ...dataValue.map((e) => ListView(
          shrinkWrap: true,
          children: [
            ListTile(
                title: Text(e.firstname),
                subtitle: Text(e.lastname),
                trailing: Text(e.email),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(e.avatar),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const UserDetailsPage(),
                      ));
                })
          ],
        )),
      ],
    );
  }
}
