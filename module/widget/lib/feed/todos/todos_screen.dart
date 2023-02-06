import 'package:flutter/material.dart';

import '../model/model.dart';
import '../service/api_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const Divider(
                  height: 1,
                ),
                _searchField(context),
              ],
            ),
          ),
        ),
      ),
      body: _controller.text.isNotEmpty ? FutureBuilder<List<Todos>>(
          future: NewApiService().fetchData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  if(snapshot.data == null) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(
                        snapshot.data?[index].title ?? "",
                        style: const TextStyle(fontSize: 16),
                      )
                      ],
                    ),
                  );
                },
              );
            }
          }): const SizedBox.shrink(),
    );
  }
  Widget _searchField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {
          setState(() {});
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(13),
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 16, right: 10),
            child: Icon(Icons.search),
          ),
          suffixIcon: Visibility(
            visible: _controller.text.isNotEmpty,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.clear();
                  });
                },
                child: const Icon(Icons.close)),
          ),
          enabledBorder: outlineInputBorder(),
          border: outlineInputBorder(),
          focusedBorder: outlineFocusedBorder(),
          hintText: "search list todo..",
        ),
      ),
    );
  }
  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(0.6)),
      borderRadius: BorderRadius.circular(50),
    );
  }

  OutlineInputBorder outlineFocusedBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: Colors.blue),
      borderRadius: BorderRadius.circular(50),
    );
  }
}