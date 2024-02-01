import 'package:clean_architecture_demo/features/users_info/presentation/bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const String myHomePage = 'myHomePage';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<UsersBloc>().add(UsersInfoEvent('4'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Clean Architecture'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<UsersBloc, UsersState>(
                    builder: (context, userState) {
                  if (userState is UsersLoading || userState is UsersInitial) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (userState is UsersLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: userState.result.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('Name: ${userState.result[index].name}'),
                          subtitle: Text('Id: ${userState.result[index].id}'),
                        );
                      },
                    );
                  }

                  if (userState is UsersError) {
                    return Center(child: Text(userState.message));
                  } else {
                    return Container();
                  }
                })
              ],
            ),
          )),
    );
  }
}
