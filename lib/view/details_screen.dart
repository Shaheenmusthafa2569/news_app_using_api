import 'package:flutter/material.dart';
import 'package:news_app_using_api/model/news_model.dart';
import 'package:news_app_using_api/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
// If you use url_launcher to open links, import it here:
// import 'package:url_launcher/url_launcher.dart';

class MyNewsDetailPage extends StatelessWidget {
  // 1. Pass the selected article directly through the constructor
  final NewsModel article;

  const MyNewsDetailPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: Text(article.name), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Article Image ──
            if (article.urlToImage.isNotEmpty)
              Image.network(
                article.urlToImage,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: isDark
                      ? NewsColors.bgDarkElevated
                      : NewsColors.bgLightSoft,
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Source & Date Tag ──
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? NewsColors.bgDarkElevated
                              : NewsColors.bgLightSoft,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          article.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? NewsColors.accentCoral
                                : NewsColors.accentCyan,
                          ),
                        ),
                      ),
                      Text(
                        article.publishedAt.substring(
                          0,
                          10,
                        ), // Simple date format extraction
                        style: TextStyle(
                          color: isDark
                              ? NewsColors.textOnDarkSub
                              : NewsColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // ── Title ──
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark
                          ? NewsColors.textOnDark
                          : NewsColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // ── Divider ──
                  Divider(
                    color: isDark
                        ? NewsColors.borderDark
                        : NewsColors.borderLight,
                  ),
                  const SizedBox(height: 12),

                  // ── Description / Content ──
                  Text(
                    article.description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: isDark
                          ? NewsColors.textOnDarkSub
                          : NewsColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // ── Action Button to Visit Original Page ──
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (article.url.isNotEmpty) {
                          launchUrl(Uri.parse(article.url));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Link unavailable for this article.",
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.open_in_new_rounded),
                      label: const Text("Read Full Article on Web"),
                      style: Theme.of(context).elevatedButtonTheme.style,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
