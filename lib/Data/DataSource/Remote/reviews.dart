

import 'package:fasty_admin/Core/Classes/crud.dart';
import 'package:fasty_admin/Core/Constant/apilinks.dart';

class ReviewsData{
  Crud crud;
  ReviewsData(this.crud);

  showReviews() async{
  return await crud.postRequest(ApiLinks.showReviews, {});}

  deleteReviews(int id, int item) async{
    return await crud.postRequest(ApiLinks.deleteReviews, {
    "id" : id.toString(), "item" : item.toString()
    });
  }

  }

