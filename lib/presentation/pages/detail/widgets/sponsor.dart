import 'package:flutter/material.dart';

class Sponsor extends StatelessWidget {
  final List<String> productionCompanies;

  const Sponsor({
    required this.productionCompanies,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productionCompanies.length,
        itemBuilder: (context, index) {
          String? logoUrl = productionCompanies[index];
          if (logoUrl.isEmpty) {
            logoUrl = 'wwemzKWzjKYJFfCeiB57q3r4Bcm.png';
          }
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(250), // 투명도!
              ),
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/$logoUrl',
                fit: BoxFit.fitHeight,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
