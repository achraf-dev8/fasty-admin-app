import 'package:fasty_admin/Core/Classes/statuts_request.dart';
import 'package:fasty_admin/Core/Functions/handlingrequest.dart';
import 'package:fasty_admin/Data/DataSource/Remote/home/alldata.dart';
import 'package:fasty_admin/Data/DataSource/Remote/reviews.dart';
import 'package:fasty_admin/Data/Model/review_model.dart';
import 'package:fasty_admin/View/Widgets/Functions/dialogs.dart';
import 'package:get/get.dart';

class ReviewsController extends GetxController{
  ReviewsData reviewsData = ReviewsData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<ReviewModel> reviews = [];
  bool firstDelete = true;

  @override
  void onInit() async{
    await getData();
    super.onInit();
  }
       getData() async{
    if(statusRequest != StatusRequest.loading){
    statusRequest = StatusRequest.loading;
    update();
    }
    var response = await reviewsData.showReviews();
    statusRequest = handlingData(response);
    if(statusRequest == StatusRequest.sucsses){
      List reviewsList = response["reviews"];
      reviews.addAll(reviewsList.map((review) => ReviewModel.fromJson(review)));
      reviews = reviews.reversed.toList();
      update();
    }else{
      update();
    }}

   delete(ReviewModel review) async{
          if(firstDelete){
            orderDialog("Are you sure you want to delete this review?", ()async{await confirmDelete(review);});
          }else{
          await confirmDelete(review);
          }}
  
  confirmDelete(ReviewModel review) async{
    statusRequest = StatusRequest.loading;
    update();
    if(firstDelete){
      Get.back();
    }
    
    var response = await reviewsData.deleteReviews(review.id!, review.item!);
    statusRequest = handlingData(response);
    if(StatusRequest.sucsses == statusRequest){
      reviews.removeWhere((checkedOffer)=> checkedOffer.id == review.id);
      firstDelete = false;
    }
    update();
  }

  String getItemName(ReviewModel review){
    return AllData().items.firstWhere((item)=>item.id == review.item).name!;
  }

}