// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view/widget/form_logout.dart';
import 'package:tast_flutter_mochammad_agatha/screen/view_model/view_model_home.dart';

import 'widget/form_add_data.dart';
import 'widget/form_delete_data.dart';
import 'widget/form_update_data.dart';
import 'widget/show_content_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ViewModelHome viewModel;
  @override
  void initState() {
    viewModel = Provider.of<ViewModelHome>(
      context,
      listen: false,
    );
    viewModel.getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              showDialogLogOut(
                context: context,
              );
            },
            icon: const Icon(
              Icons.logout_outlined,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Consumer<ViewModelHome>(
        builder: (context, _, child) {
          if (viewModel.isLoading == true) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    for (final data in viewModel.modelGetAllData!)
                      GestureDetector(
                        onTap: () {
                          showDialogContent(
                            context: context,
                            name: data.name,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFF293066),
                                    child: Text(
                                      data.name[0],
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(data.name),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialogUpdateData(
                                        context: context,
                                        name: data.name,
                                        id: data.id,
                                      );
                                    },
                                    child: const Icon(
                                      Icons.edit,
                                      size: 24.0,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialogDeleteData(
                                        context: context,
                                        name: data.name,
                                        id: data.id,
                                      );
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialogAddData(
            context: context,
          );
        },
        backgroundColor: const Color(0xFF293066),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
