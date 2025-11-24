
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class PostBloc {
  final _controller = StreamController<PostState>();

  Stream<PostState> get stream => _controller.stream;

  // Call API
  Future<void> fetchPost() async {
    _controller.add(PostLoading());

    try {
      final response = await http.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final post = Post.fromJson(data);
        _controller.add(PostLoaded(post));
      } else {
        _controller.add(PostError("Server error: ${response.statusCode}"));
      }
    } catch (e) {
      _controller.add(PostError("Error: $e"));
    }
  }

  void dispose() {
    _controller.close();
  }
}

abstract class PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final Post post;
  PostLoaded(this.post);
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
}
