import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:online_croceries/stores/category/category_store.dart';
import 'package:online_croceries/widgets/progress_indicator_widget.dart';
import 'package:provider/provider.dart';

class APIUsing extends StatefulWidget {
  const APIUsing({Key? key}) : super(key: key);

  @override
  _APIUsingState createState() => _APIUsingState();
}

late CategoryStore _categoryStore;

class _APIUsingState extends State<APIUsing> {
  String? aha="wow";
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  void initState() {
    super.initState();
    print("chạy lần đầu nè");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _categoryStore = Provider.of<CategoryStore>(context);
    if (!_categoryStore.loading) {
      _categoryStore.getCategoriess().then((value) => {
        print("Có thể có gì đó: ${_categoryStore.categoryList}")
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: (Text("Alternative clothes")),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Observer(builder: (context) {
      return _categoryStore.loading
          ? CustomProgressIndicatorWidget()
          : Column(
            children: [
              Text(aha!),
              ElevatedButton(
                style: style,
                onPressed: () {
                  setState(() {
                    print("Hàng nè ${_categoryStore.categoryList!.categories!.length}");
                    aha="ko biết đâu ak";
                  });
                },
                child: const Text('Enabled'),
              ),
              Expanded(
                child: Container(
                    child: _categoryStore.categoryList != null
                        ? ListView.separated(
                            itemBuilder: (context, position) {
                              return _buildListItem(position);
                            },
                            separatorBuilder: (context, position) {
                              return Divider();
                            },
                            itemCount:
                                _categoryStore.categoryList!.categories!.length)
                        : Center(
                            child: Text("Éo đc rùi"),
                          )),
              ),
            ],
          );
    });
  }

  Widget _buildListItem(int position) {
    var item = _categoryStore.categoryList?.categories?[position];
    return ListTile(
      dense: true,
      leading: Image.network(
        '${item?.image}',
        loadingBuilder: (_, child, progress) {
          return progress == null
              ? child
              : LinearProgressIndicator(
                  backgroundColor: Colors.grey,
                );
        },
      ),
      title: Text(
        '${item?.name}',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        softWrap: false,
        // style: Theme.of(context).textTheme.title,
      ),
    );
  }


}
