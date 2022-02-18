
import 'package:extended_image/extended_image.dart';
import 'package:junagadh/app/data/entity/res_dailydarshan.dart';
import 'package:junagadh/app/data/entity/res_darshanfilter.dart';
import 'package:junagadh/app/data/entity/res_date.dart';
import 'package:junagadh/app/data/entity/res_donation.dart';
import 'package:junagadh/app/data/entity/res_event.dart';
import 'package:junagadh/app/data/entity/res_gallery.dart';
import 'package:junagadh/app/data/entity/res_homeslider.dart';
import 'package:junagadh/app/data/entity/res_timing.dart';
import 'package:junagadh/app/providers/base_notifier.dart';
import 'package:junagadh/app/repository/home_repo.dart';
import 'package:junagadh/app/utils/api_response.dart';
import 'package:junagadh/app/utils/enums.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeProvider {
  Future getSlider() async {}

  Future getGallery() async {}

  Future getDailyDarshan() async {}

  Future getEvent() async {}

  Future getDonation() async {}

  Future getDarshanFilter({String? date}) async {}

  Future getTiming() async {}

  Future getDailyDarshanDate() async {}

  Future<String> getYoutubeUrl () async{
    return '';
  }
}

class HomeProviderImpl extends BaseNotifier implements HomeProvider {
  late HomeRepository repo;

  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();

  HomeProviderImpl(this.repo) {
    _res = ApiResponse();
    _resGallery = ApiResponse();
    _resDailyDarshan = ApiResponse();
    _resEvent = ApiResponse();
    _resDonation = ApiResponse();
    _resDarshanFilter = ApiResponse();
    _resTime = ApiResponse();
    _resDailyDarshanDate = ApiResponse();
    _resDarshanWithDate = ApiResponse();
    youtubeURL = ApiResponse();
  }

  ApiResponse<String>? youtubeURL;

  ApiResponse<ResHomeSlider>? _res;

  ApiResponse<ResHomeSlider>? get res => _res;

  ApiResponse<ResGallery>? _resGallery;

  ApiResponse<ResGallery>? get resGallery => _resGallery;

  ApiResponse<ResDate>? _resDailyDarshan;

  ApiResponse<ResDate>? get resDailyDarshan => _resDailyDarshan;


  ApiResponse<ResDate>? _resDailyDarshanDate;

  ApiResponse<ResDate>? get resDailyDarshanDate => _resDailyDarshanDate;

  ApiResponse<List<ResEvents>>? _resEvent;

  ApiResponse<List<ResEvents>>? get resEvent => _resEvent;

  ApiResponse<ResDonation>? _resDonation;

  ApiResponse<ResDonation>? get resDonation => _resDonation;

  List<DonationData>? donationList = [];

  ApiResponse<ResDarshanFilter>? _resDarshanFilter;

  ApiResponse<ResDarshanFilter>? get resDarshanFilter => _resDarshanFilter;

  ApiResponse<List<ResList>>? _resDarshanWithDate;

  ApiResponse<List<ResList>>? get resDarshanWithDate => _resDarshanWithDate;

  ApiResponse<ResTiming>? _resTime;

  ApiResponse<ResTiming>? get resTime => _resTime;

  List<String> donationCatList = [];


  String? selectedValueDonation;

  DonationData? selectedDonationListForCustomDonation;


  List<String> darshanDates = [];

  String selectedDates = '';
  String selectedTithi = '';

  List<ListElement>? selectedDarshan;

  @override
  Future getSlider() async {
    try {
      apiResIsLoading(_res!);

      final res = await repo.getSlider();
      print('DATA:');
      print(res.data?.imageurl);

      if (res.status != 1) {
        apiResIsFailed(_res!, res.message ?? '');
      } else {
        apiResIsSuccess(_res!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_res!, e.toString());
    }
  }

  @override
  Future getGallery() async {
    try {
      apiResIsLoading(_resGallery!);

      final res = await repo.getGallery();
      print('DATA:');
      print(res.data?.imageurl);

      if (res.status != 1) {
        apiResIsFailed(_resGallery!, res.message ?? '');
      } else {
        apiResIsSuccess(_resGallery!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resGallery!, e.toString());
    }
  }

  @override
  Future getDailyDarshan() async {
     try {
      apiResIsLoading(_resDailyDarshanDate!);

      final res = await repo.getDailyDarshan();

      if (res.status != 1) {

        print(res.data?.date);
        apiResIsFailed(_resDailyDarshanDate!, res.message ?? '');
      } else {
        apiResIsSuccess(_resDailyDarshanDate!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resDailyDarshanDate!, e.toString());
    }
  }

  @override
  Future getEvent() async {
    try {
      apiResIsLoading(_resEvent!);

      final res = await repo.getEvent();

      if (res == null) {
        apiResIsFailed(_resEvent!, 'No Data Found');
      } else {
        apiResIsSuccess(_resEvent!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resEvent!, e.toString());
    }
  }

  @override
  Future getDonation() async {
    try {
      apiResIsLoading(_resDonation!);

      final res = await repo.getDonation();

      if (res.status != 1) {
        apiResIsFailed(_resDonation!, res.message ?? '');
      } else {
        apiResIsSuccess(_resDonation!, res);

        donationCatList = [];
        res.data?.forEach((element) {
          if(!donationCatList.contains(element.cat)){
            donationCatList.add(element.cat ?? '');
          }
        });
        setDonationList(donationCatList.first);

        notifyListeners();

      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resDonation!, e.toString());
    }
  }

  setDonationList(String cat){
    donationList = _resDonation?.data?.data?.reversed.where((element) => element.cat == cat).toList();

    selectedValueDonation = cat;

    selectedDonationListForCustomDonation = null;

    notifyListeners();
  }


  setDonationType(DonationData name){
    selectedDonationListForCustomDonation = name;
    notifyListeners();
  }

  @override
  Future getDarshanFilter({String? date}) async {
    try {
      apiResIsLoading(_resDarshanFilter!);

      final res = await repo.getDrashanFilter(date: date);

      if (res.response?.status != 1) {
        apiResIsFailed(_resDarshanFilter!, res.response?.message ?? '');
      } else {
        apiResIsSuccess(_resDarshanFilter!, res);
      }
    } catch (e) {
      print(e);
      apiResIsFailed(_resDarshanFilter!, e.toString());
    }
  }

  @override
  Future getTiming() async {
   try{
     apiResIsLoading(_resTime!);


     final res = await repo.getTimimg();

     if(res.status != 1){
       apiResIsFailed(_resTime!, res.message ?? '');
     } else {
       apiResIsSuccess(_resTime!, res);
     }
   } catch (e){
     print(e);
     apiResIsFailed(_resTime!, e.toString());

   }
  }

  @override
  Future getDailyDarshanDate() async {

    try{
      apiResIsLoading(_resDarshanWithDate!);

      final res = await repo.getDailyDarshanDate();

      if(res.first.response?.status != 1){
        apiResIsFailed(_resDarshanWithDate!, res.first.response?.message ?? '');
      } else {
        apiResIsSuccess(_resDarshanWithDate!, res);

        print('wow');
        print(res.length);

        darshanDates = [];

        res.forEach((element) {
          darshanDates.add(element.response?.data?.dateOfIssueFormat ?? '');
        });

        print(darshanDates);

        selectedDates = darshanDates.first;
        setDateForDarshan(selectedDates);
        notifyListeners();
      }
    } catch (e){
      print(e);
      apiResIsFailed(_resDarshanWithDate!, e.toString());
    }
  }

  setDateForDarshan(String date) async {

    selectedDates = date;

    final data = _resDarshanWithDate?.data?.where((element) => element.response?.data?.dateOfIssueFormat == date).first.response?.data;

    selectedDarshan = data?.list;

    selectedTithi = data?.tithi ?? '';

        notifyListeners();

    selectedDarshan?.forEach((element) {
      if(element.imageurl != null){
        getNetworkImageData(element.imageurl!, useCache: true);
      }
    });

  }

  @override
  Future<String> getYoutubeUrl() async {
    try {
      apiResIsLoading(youtubeURL!);
      final res = await repo.getYoutubeUrl();

      apiResIsSuccess(youtubeURL!, res);


      return res;
    } on Exception catch (e) {
      apiResIsSuccess(youtubeURL!, "https://www.youtube.com/embed/VfjQHQgTFTI");
      return "https://www.youtube.com/embed/VfjQHQgTFTI";
    }
  }

}
