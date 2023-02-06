import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

import '../feed/model/model.dart';
import '../feed/service/api_service.dart';
import 'package:theme/material3/icons/app_icon.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key, required this.title});

  final String title;

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  String newText = '';
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.surfaceColor,
        title: Text(widget.title),
        leading: InkWell(child: AppIcons.back,onTap: () => Navigator.pop(context)),
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
              return Container(
                color: context.surfaceColor,
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    if(snapshot.data == null) {
                      return const SizedBox.shrink();
                    }
                    newText = snapshot.data?[index].title ?? "";
                    return _filter(_controller.text, newText) ? Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(
                          newText,
                          style: const TextStyle(fontSize: 16),
                        )
                        ],
                      ),
                    ) : const SizedBox.shrink();
                  },
                ),
              );
            }
          }): const Center(child: Icon(Icons.adb_sharp)),
    );
  }
  Widget _searchField(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {
          _filter(_controller.text, newText);
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

  bool _filter(String textField, String newText) {
    if(textField.isEmpty) {
      return false;
    }
    if(newText.contains(textField)) {
      return true;
    }
    return false;

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