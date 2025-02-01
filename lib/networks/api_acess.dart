import 'package:rxdart/subjects.dart';
import 'package:training_app/features/restaurant_info_home/data/rx_get_category_result/rx.dart';
import 'package:training_app/features/restaurant_info_home/data/rx_get_category_tab/rx.dart';
import 'package:training_app/features/restaurant_info_home/data/rx_get_food_details/rx.dart';
import 'package:training_app/features/restaurant_info_home/data/rx_get_offer_card/rx.dart';
import 'package:training_app/features/restaurant_info_home/data/rx_get_restaurant_info/rx.dart';
import 'package:training_app/features/restaurant_info_home/model/category_result.dart';
import 'package:training_app/features/restaurant_info_home/model/category_tab_response_model.dart';
import 'package:training_app/features/restaurant_info_home/model/food_details_model.dart';
import 'package:training_app/features/restaurant_info_home/model/offer_card_model.dart';
import 'package:training_app/features/restaurant_info_home/model/restaurant_info_model.dart';

GetRestaurantInfoRx getRestaurantInfoRxObj = GetRestaurantInfoRx(
    empty: RestaurantInfoResponseModel(),
    dataFetcher: BehaviorSubject<RestaurantInfoResponseModel>());


GetOfferCardRx getOfferCardRxObj = GetOfferCardRx(
    empty: OfferCardModel(),
    dataFetcher: BehaviorSubject<OfferCardModel>());



GetCategoryTabRx getCategoryTabRxObj = GetCategoryTabRx(
    empty: CategoryTabResponseModel(),
    dataFetcher: BehaviorSubject<CategoryTabResponseModel>());


GetCategoryResultRx getCategoryResultRxObj = GetCategoryResultRx(
    empty: CategoryResultResponseModel(),
    dataFetcher: BehaviorSubject<CategoryResultResponseModel>());




GetFoodDetailsRx getFoodDetailsRxObj = GetFoodDetailsRx(
    empty: FoodDetailsResponseModel(),
    dataFetcher: BehaviorSubject<FoodDetailsResponseModel>());






// GetSignupResponseRX getSignupRxObj = GetSignupResponseRX(
//     empty: SignUpModel(), dataFetcher: BehaviorSubject<SignUpModel>());

// GetVerifyResponseRX getVerifyRxObj =
//     GetVerifyResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// GetResendResponseRX getResendRxObj = GetResendResponseRX(
//     empty: ResendModel(), dataFetcher: BehaviorSubject<ResendModel>());

// GetLoginResponseRX getLoginRxObj = GetLoginResponseRX(
//     empty: LoginModel(), dataFetcher: BehaviorSubject<LoginModel>());

// PostVerifyEmailRX postverifyemailRxObj =
//     PostVerifyEmailRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// PostForgetPassRX PostForgetPassRXObj =
//     PostForgetPassRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// GetCategoryResponseRxRX getCategoryResponseRXObj = GetCategoryResponseRxRX(
//     empty: CategoryModel(), dataFetcher: BehaviorSubject<CategoryModel>());

// GetAllCategoryResponseRxRX getAllCategoryResponseRXObj =
//     GetAllCategoryResponseRxRX(
//         empty: AllCategoryModel(),
//         dataFetcher: BehaviorSubject<AllCategoryModel>());

// GetAddsResponseRx getAddsResponseRXObj = GetAddsResponseRx(
//     empty: AddsModel(), dataFetcher: BehaviorSubject<AddsModel>());

// GetMyAddsResponseRx getAMyAddsResponseRXObj = GetMyAddsResponseRx(
//     empty: AddsModel(), dataFetcher: BehaviorSubject<AddsModel>());

// GetSingleAddsResponseRx GetSingleAddsResponseRxObj = GetSingleAddsResponseRx(
//     empty: SingleAddsModel(), dataFetcher: BehaviorSubject<SingleAddsModel>());

// PostBookmarkapiRX PostBookmarkapiRXObj =
//     PostBookmarkapiRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// GetBookmarksResponseRx GetBookmarksResponseRxObj = GetBookmarksResponseRx(
//     empty: GetBookmarkModel(),
//     dataFetcher: BehaviorSubject<GetBookmarkModel>());

// PostSearchResponseRX postSearchResponseRXObj = PostSearchResponseRX(
//     empty: SearchModel(), dataFetcher: BehaviorSubject<SearchModel>());

// GetCategorywiseAddResponseRx getCategorywiseAddResponseRxObj =
//     GetCategorywiseAddResponseRx(
//         empty: CategoryWiseAddModel(),
//         dataFetcher: BehaviorSubject<CategoryWiseAddModel>());

// GetLogoutResponseRX getLogoutResponseRXObj =
//     GetLogoutResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// GetProfileResponseRx getProfileResponseRxObj = GetProfileResponseRx(
//     empty: ProfileModel(), dataFetcher: BehaviorSubject<ProfileModel>());

// GetEditProfileResponseRX getEditProfileResponseRXObj =
//     GetEditProfileResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// PostAddsResponseRX postAddsResponseRXObj =
//     PostAddsResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// PostEditAddsResponseRX postEditAddsResponseRXObj =
//     PostEditAddsResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// DeleteResponseRX deleteResponseRXObj =
//     DeleteResponseRX(empty: {}, dataFetcher: BehaviorSubject<Map>());

// GetSocialLoginResponseRX getSocialLoginResponseRXObj = GetSocialLoginResponseRX(
//     empty: SocialLoginModel(),
//     dataFetcher: BehaviorSubject<SocialLoginModel>());

// PostAddressResponseRX postAddressResponseRXObj = PostAddressResponseRX(
//     empty: SaveAddressModel(),
//     dataFetcher: BehaviorSubject<SaveAddressModel>());

// GetNotificationResponseRx getNotificationResponseRxObj =
//     GetNotificationResponseRx(
//         empty: NotificationModel(),
//         dataFetcher: BehaviorSubject<NotificationModel>());
