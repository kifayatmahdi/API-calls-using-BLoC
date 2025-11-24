import 'package:flutter/material.dart';
import 'post_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final PostBloc bloc = PostBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "API Call BLoC",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: StreamBuilder<PostState>(
          stream: bloc.stream,
          builder: (context, snapshot) {
            final state = snapshot.data;

            if (state is PostLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is PostLoaded) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ID: ${state.post.id}",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Title:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(state.post.title, style: TextStyle(fontSize: 16)),
                    SizedBox(height: 10),
                    Text(
                      "Body:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(state.post.body, style: TextStyle(fontSize: 16)),
                  ],
                ),
              );
            }

            if (state is PostError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: Colors.red, fontSize: 18),
                ),
              );
            }

            return Center(
              child: ElevatedButton(
                onPressed: () => bloc.fetchPost(),
                child: Text("Load Post"),
              ),
            );
          },
        ),
      ),
    );
  }
}
