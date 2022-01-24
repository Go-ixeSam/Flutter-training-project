
import 'package:online_croceries/data/local/constants/db_constants.dart';
import 'package:online_croceries/models/category/category.dart';
import 'package:online_croceries/models/category/category_list.dart';
import 'package:sembast/sembast.dart';

class CategoryDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _categoryStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
//  Future<Database> get _db async => await AppDatabase.instance.database;
  // database instance
  final Database _db;


  // Constructor
  CategoryDataSource(this._db);

  // DB functions:--------------------------------------------------------------
  Future<int> insert(Category categorie) async {
    return await _categoryStore.add(_db, categorie.toJson());
  }

  Future<int> count() async {
    return await _categoryStore.count(_db);
  }

  Future<List<Category>> getAllSortedByFilter({List<Filter>? filters}) async {
    //creating finder
    final finder = Finder(
        filter: filters != null ? Filter.and(filters) : null,
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _categoryStore.find(
      _db,
      finder: finder,
    );

    // Making a List<Category> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final category = Category.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      category.id = snapshot.key.toString();
      return category;
    }).toList();
  }

  Future<CategoryList> getPostsFromDb() async {

    print('Loading from database');

    // categorie list
    var categoriesList;

    // fetching data
    final recordSnapshots = await _categoryStore.find(
      _db,
    );

    // Making a List<Post> out of List<RecordSnapshot>
    if(recordSnapshots.length > 0) {
      categoriesList = CategoryList(
          categories:  recordSnapshots.map((snapshot) {
            final categorie = Category.fromJson(snapshot.value);
            // An ID is a key of a record from the database.
            categorie.id = snapshot.key.toString();
            return categorie;
          }).toList());
    }

    return categoriesList;
  }

  Future<int> update(Category category) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(category.id));
    return await _categoryStore.update(
      _db,
      category.toJson(),
      finder: finder,
    );
  }

  Future<int> delete(Category categorie) async {
    final finder = Finder(filter: Filter.byKey(categorie.id));
    return await _categoryStore.delete(
      _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _categoryStore.drop(
      _db,
    );
  }

}
