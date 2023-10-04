import 'package:api_practice_2/models/post.dart';
import 'package:api_practice_2/services/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<userModel>? _userModel = [];
  bool _isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    _userModel = await ApiService().getPosts();
    if (_userModel != null) {
      setState(() {
        _isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http package'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10)),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              _userModel![index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _userModel![index].body ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
