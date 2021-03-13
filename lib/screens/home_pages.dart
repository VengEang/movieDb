import 'package:e_sala/models/UsersPost.dart';
import 'package:e_sala/repos/home_page_repos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }
  get _buildAppBar{
    return AppBar(
      title: Text("E learning for everybody"),
      centerTitle: true,
    );
  }
  get _buildBody{
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: FutureBuilder(
        future: getPost,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Text("Something wrong while loading...");
          }
          else{
            if(snapshot.connectionState==ConnectionState.done){
              return _buildListView(snapshot.data.results);
            }
            else{
              return CircularProgressIndicator();
            }
          }
        },
      ),
    );
  }
  _buildListView(List<Result>data){
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context,index){
       return _buildItem(data[index]);
      }
    );
  }
  _buildItem(Result item){
    return Card(
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text("${item.title}"),
        subtitle: Text("${item.overview}"),
      ),
    );
  }
}
