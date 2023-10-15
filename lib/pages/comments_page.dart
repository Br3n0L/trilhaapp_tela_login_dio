import 'package:flutter/material.dart';

class CommentsPage extends StatefulWidget {
  final int postid;
  const CommentsPage({super.key, required this.postid});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Comentários do Post: ${widget.postid}'),
        ),
        body: Container(),
      ),
    );
  }
}
