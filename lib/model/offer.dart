class Offer {
  final int uid;
  final String imageUri;
  final String location;
  final String title;
  final String accommodationName;
  final String priceDetail;
  final bool isFavorite;

  Offer({
    required this.uid,
    required this.imageUri,
    required this.location,
    required this.title,
    required this.accommodationName,
    required this.priceDetail,
    required this.isFavorite,
  });

  Offer copyWithInverseFavorite() {
    return Offer(
      uid: this.uid,
      imageUri: this.imageUri,
      location: this.location,
      title: this.title,
      accommodationName: this.accommodationName,
      priceDetail: this.priceDetail,
      isFavorite: !this.isFavorite,
    );
  }
}
