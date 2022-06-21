
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm/domain/models.dart';
import 'package:flutter_mvvm/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../resourcese/assets_manager.dart';
import '../../resourcese/color_manager.dart';
import '../../resourcese/constants_manager.dart';
import '../../resourcese/routs_manager.dart';
import '../../resourcese/strings_manager.dart';
import '../../resourcese/values_manager.dart';






class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

_bind(){
  _viewModel.start();
}
@override
  void initState() {
     _bind();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
 return StreamBuilder<SliderViewObject>(
     stream: _viewModel.outputSliderViewObject,
     builder: (context,snapshot){
       return _getContentWidget(snapshot.data);
     });
  }
  Widget _getContentWidget(SliderViewObject? sliderViewObject){
    if(sliderViewObject == null){
      return Container();
          }
    else{
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.darkPrimary,
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: PageView.builder(
            itemCount: sliderViewObject.numOfSlides,
            onPageChanged: (index){
               _viewModel.onPageChanged(index);
            },
            controller: _pageController,
            itemBuilder: (context,index){
              return OnBoardingPage(sliderViewObject.sliderObject);
            }),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, Routes.loginRoute);
                    },
                    child:  Text (AppStrings.skip,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.end,
                    )
                ),
              ),

              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }

  }
  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject){
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: EdgeInsets.all(AppPadding.p14),
          child: GestureDetector(
            child: SizedBox(
              width: AppSize.s20,
              height: AppSize.s20,
              child: SvgPicture.asset(ImageAssets.leftArrow),
            ),
            onTap: (){
              _pageController.animateToPage(_viewModel.goPrevious(),
                  duration: Duration(milliseconds: AppConstants.SliderAnimtionTime),
                  curve: Curves.bounceInOut);
            },
          ),),

          Row(
            children: [
              for(int i=0 ; i < sliderViewObject.numOfSlides; i++)
                Padding(padding: EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i , sliderViewObject.currentIndex),
                ),

            ],
          )


          ,Padding(padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrow),
              ),
              onTap: (){
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: Duration(microseconds: AppConstants.SliderAnimtionTime),
                    curve: Curves.bounceInOut);
              },
            ),),
        ],
      ),
    );
  }



  Widget _getProperCircle(int index , int currentIndex){
    if (index == currentIndex){
      return SvgPicture.asset(ImageAssets.hollowCircle);
    }else {
      return SvgPicture.asset(ImageAssets.solidCircle);
    }
  }
  void dispose(){
   _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;
 const OnBoardingPage(this._sliderObject ,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title,textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle,textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

