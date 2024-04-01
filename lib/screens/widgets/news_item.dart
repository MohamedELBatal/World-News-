import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataModel.dart';

class NewsItem extends StatelessWidget {
  Articles article;

  NewsItem({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.grey.shade200
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage??"",
              height: 250,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.source?.name ?? "",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
                Text(
                  article.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Text(
                  article.description ?? "",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
