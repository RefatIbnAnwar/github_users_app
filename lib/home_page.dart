import 'package:flutter/material.dart';
import 'package:github_users_app/Models/UsersModel.dart';
import 'package:github_users_app/ViewModels/UserViewModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User>? users;

  bool isLoaded = false;
  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  Future<void> loadUsers() async {
    final viewModel = Userviewmodel();
    users = await viewModel.getAllGithubUsers();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return isLoaded ? Container() : const CircularProgressIndicator();
    return Scaffold(
        body: isLoaded && users != null
            ? SafeArea(
                child: Column(
                children: [
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(child: Text('ID', textAlign: TextAlign.center)),
                      Expanded(
                          child: Text('UserID', textAlign: TextAlign.center)),
                      Expanded(
                          child: Text('Type', textAlign: TextAlign.center)),
                      Expanded(
                          child: Text('Avatar', textAlign: TextAlign.center)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: users!
                            .map(
                              (user) => Column(
                                children: [
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                              user.id?.toStringAsPrecision(2) ??
                                                  '0')),
                                      Expanded(
                                          child:
                                              Text(user.login ?? 'no user id')),
                                      Expanded(
                                          child: Text(
                                              user.type?.name ?? 'no type')),
                                      Expanded(
                                          child: user.avatarUrl != null
                                              ? Image.network(user.avatarUrl!)
                                              : const Icon(Icons.flag_circle))
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  const Divider(),
                                ],
                              ),
                            )
                            .toList()),
                  )))
                ],
              ))
            : const Center(child: CircularProgressIndicator()));
  }
}
