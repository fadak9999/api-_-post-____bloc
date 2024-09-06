import 'package:api_bloc/bloc/api_bloc.dart';
import 'package:api_bloc/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> posts = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        centerTitle: true,
        title: const Text(
          "API",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // إرسال الحدث لإضافة post جديد
              BlocProvider.of<ApiBloc>(context).add(AddPostEvent(Post(
               // userId:
                title: 'fadak',
                body: 'I am shy',
              )));
            },
            child: const Text("ADD POST"),
          ),
          BlocBuilder<ApiBloc, ApiState>(
            builder: (context, state) {
              if (state is ApiLoading) {
                return const CircularProgressIndicator();
              } else if (state is ApiPostAdded) {
                posts.add(state.post);
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(
                          posts[i].title,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        subtitle: Text(
                          posts[i].body,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is ApiError) {
                return Center(child: Text(state.message));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}