import 'package:flutter/material.dart';
import 'package:newapi/models/post.dart';
import 'package:newapi/services/remote_service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isloaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // untuk bisa call API kita buat file remote_service buat fetch data dari APInya
    // dan buat object dari si remoteService dan pakai method getPosts()
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isloaded = true;
      });
    } else {
      throw 'cannot get return from posts';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Test API'),
      ),
      body: Visibility(
        visible: isloaded,
        child: ListView.builder(
          // item count untuk show berapa banyak item yg mau di load
          // contoh disini kita munculkan semua data yang ada dari obj si RemoteService dari internet
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(posts![index].id.toString()),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
