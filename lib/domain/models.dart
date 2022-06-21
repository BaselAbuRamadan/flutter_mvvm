
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides, this.currentIndex);
}

//login models
class Customer{
  int id;
  String name;
  int numOfNotifications;
  Customer(this.id,this.name,this.numOfNotifications);
}
class Contacts{
  int phone;
  String email;
  int link;
  Contacts(this.phone,this.email,this.link);
}

class Authentication{
  Customer customer;
  Contacts contacts;
  Authentication(this.customer,this.contacts);
}