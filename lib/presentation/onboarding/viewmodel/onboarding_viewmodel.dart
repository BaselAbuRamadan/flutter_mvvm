import 'dart:async';

import 'package:flutter_mvvm/domain/models.dart';
import 'package:flutter_mvvm/presentation/base/baseviewmodel.dart';

import '../../resourcese/assets_manager.dart';
import '../../resourcese/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs , OnBoardingViewModelOutputs{
  // stream controllers outputs
  final  StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list ;
  int _currentIndex = 0;

  // onBording view model inputs
  @override
  void dispose() {
    // TODO: implement dispose
 _streamController.close();
  }

  @override
  void start() {
    // TODO: implement start
    // view model start job
    _list = _getSliderData();
    _postDataView();
  }

  @override
  int goPrevious() {
    int prviousIndex = -- _currentIndex;
    if(prviousIndex == -1){
      prviousIndex = _list.length-1;
    }
    return prviousIndex;
    // TODO: implement getPrevious
  }

  @override
  int goNext() {
    // TODO: implement goNext
    int nextIndex = ++ _currentIndex;
    if(nextIndex == _list.length){
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
    _currentIndex = index;
    _postDataView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  //onbording privets
void  _postDataView(){
inputSliderViewObject.add(SliderViewObject(_list[_currentIndex],_list.length,_currentIndex));
}

  List<SliderObject> _getSliderData()=> [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4),
  ];




}

//orders  view model receive from view
abstract class OnBoardingViewModelInputs{
int goNext() ;//right arrow
int goPrevious();//left arrow
void onPageChanged(int index);

//Stream controller input
Sink get inputSliderViewObject;
}


abstract class OnBoardingViewModelOutputs{

  Stream<SliderViewObject> get outputSliderViewObject;
}

