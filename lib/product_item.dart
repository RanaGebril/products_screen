import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:products_screen/app_theme_data.dart';
import 'package:products_screen/models/Product.dart';
import 'App_colors.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final discountPrice = product.price! * 1.2;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white_color,
        border: Border.all(color: AppColors.blue_color4, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: CachedNetworkImage(
                  imageUrl: product.image.toString(),
                  placeholder:
                      (context, url) =>
                          Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: MediaQuery.of(context).size.height * 0.16,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                child: Material(
                  elevation: 10,
                  shape: CircleBorder(),
                  // shadowColor: ,
                  child: CircleAvatar(
                    backgroundColor: AppColors.white_color,
                    child: Image.asset("assets/images/love.png"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 2),
          Text(
            product.title.toString(),
            maxLines: 1,
            style: AppThemeData.lightTheme.textTheme.displayLarge,
          ),
          Text(
            product.description.toString(),
            overflow: TextOverflow.ellipsis,
            style: AppThemeData.lightTheme.textTheme.displayLarge,
          ),
          SizedBox(height: 3),
          Row(
            children: [
              Text(
                "EGP ${product.price!.toStringAsFixed(0)}",
                style: AppThemeData.lightTheme.textTheme.displayLarge,
              ),
              SizedBox(width: 10),
              Text(
                "${discountPrice.toStringAsFixed(0)} EGP",
                style: AppThemeData.lightTheme.textTheme.displaySmall,
              ),
            ],
          ),

          Row(
            children: [
              Text(
                "Review (${product.rating!.rate})",
                style: AppThemeData.lightTheme.textTheme.displayMedium,
              ),
              SizedBox(width: 2),
              Icon(Icons.star_rounded, color: AppColors.yellow_color),
              Spacer(),
              CircleAvatar(
                backgroundColor: AppColors.blue_color2,
                minRadius: 17,
                child: Icon(
                  Icons.add_rounded,
                  size: 30,
                  color: AppColors.white_color,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
