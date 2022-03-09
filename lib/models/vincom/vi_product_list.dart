import 'package:online_croceries/models/vincom/vincom_news_product.dart';
import 'package:online_croceries/models/vincom/vincom_product.dart';
import 'package:online_croceries/models/vincom/vincom_store_product.dart';

class ViProducts{
  VincomOnly? vincom;
  NewsProduct? newsProduct;
  StoreProduct? storeProduct;

  ViProducts({
    this.vincom,
    this.newsProduct,
    this.storeProduct
});
}