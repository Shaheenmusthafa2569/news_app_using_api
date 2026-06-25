import 'package:flutter/material.dart';
import 'package:news_app_using_api/providers/news_provider.dart';
import 'dart:ui';
import 'package:news_app_using_api/theme/app_colors.dart';
import 'package:provider/provider.dart';

// ═══════════════════════════════════════════════════════════
//  NEWS SEARCH DIALOG WITH BACKDROP BLUR
// ═══════════════════════════════════════════════════════════

/// Show search dialog when search button is tapped
Future<String?> showNewsSearchDialog(BuildContext context) {
  return showDialog<String?>(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.3), // Dark overlay
    builder: (context) => const NewsSearchDialog(),
  );
}

class NewsSearchDialog extends StatefulWidget {
  const NewsSearchDialog({super.key});

  @override
  State<NewsSearchDialog> createState() => _NewsSearchDialogState();
}

class _NewsSearchDialogState extends State<NewsSearchDialog> {
  late TextEditingController _searchController;
  // Change this to store the filtered live Article/News objects instead of strings
  List<dynamic> _suggestions = []; 

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterSearch(String query, List<dynamic> realNewsList) {
    if (query.isEmpty) {
      setState(() => _suggestions = []);
      return;
    }

    setState(() {
      // Filter matching items from your real API data structure
      _suggestions = realNewsList
          .where((article) => 
              article.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      Navigator.pop(context, query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    // 1. Access your news list from your provider
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);
    final realNewsList = newsProvider.newslist;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        elevation: 0,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? NewsColors.bgDarkCard : NewsColors.bgLightCard,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Header ──
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isDark ? NewsColors.bgDarkElevated : NewsColors.bgLightSoft,
                    border: Border(
                      bottom: BorderSide(
                        color: isDark ? NewsColors.borderDark : NewsColors.borderLight,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Search News',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: isDark ? NewsColors.textOnDark : NewsColors.textPrimary,
                              ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: isDark ? NewsColors.bgDarkElevated.withOpacity(0.5) : NewsColors.bgLightSoft,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.close_rounded,
                            size: 20,
                            color: isDark ? NewsColors.textOnDarkSub : NewsColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Search Input ──
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _searchController,
                        // 2. Pass the real news list into the filter function
                        onChanged: (query) => _filterSearch(query, realNewsList),
                        onSubmitted: _performSearch,
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Search articles, topics...',
                          hintStyle: TextStyle(
                            color: isDark ? NewsColors.textOnDarkSub.withOpacity(0.5) : NewsColors.textTertiary,
                          ),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: isDark ? NewsColors.accentCoral : NewsColors.accentCyan,
                            size: 20,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? GestureDetector(
                                  onTap: () {
                                    _searchController.clear();
                                    setState(() => _suggestions = []);
                                  },
                                  child: Icon(
                                    Icons.clear_rounded,
                                    color: isDark ? NewsColors.textOnDarkSub : NewsColors.textSecondary,
                                    size: 18,
                                  ),
                                )
                              : null,
                          filled: true,
                          fillColor: isDark ? NewsColors.bgDarkElevated : NewsColors.bgLightSoft,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: isDark ? NewsColors.borderDark : NewsColors.borderLight),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: isDark ? NewsColors.borderDark : NewsColors.borderLight, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: isDark ? NewsColors.accentCoral : NewsColors.accentCyan, width: 2),
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                        ),
                        style: TextStyle(
                          color: isDark ? NewsColors.textOnDark : NewsColors.textPrimary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 12),
                      // ── Quick filters ──
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildQuickFilter('Technology', NewsColors.catTechnology, isDark, realNewsList),
                            const SizedBox(width: 8),
                            _buildQuickFilter('Business', NewsColors.catBusiness, isDark, realNewsList),
                            const SizedBox(width: 8),
                            _buildQuickFilter('Sports', NewsColors.catSports, isDark, realNewsList),
                            const SizedBox(width: 8),
                            _buildQuickFilter('Health', NewsColors.catHealth, isDark, realNewsList),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Search Results / Suggestions ──
                if (_suggestions.isNotEmpty) ...[
                  Divider(color: isDark ? NewsColors.borderDark : NewsColors.borderLight, height: 0),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _suggestions.length,
                      itemBuilder: (ctx, idx) {
                        final article = _suggestions[idx];
                        return GestureDetector(
                          // 3. Return the exact title back when tapped
                          onTap: () => _performSearch(article.title), 
                          child: Container(
                            color: idx.isEven
                                ? Colors.transparent
                                : isDark
                                    ? NewsColors.bgDarkElevated.withOpacity(0.3)
                                    : NewsColors.bgLightSoft.withOpacity(0.3),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.article_rounded, // Swapped to an article icon
                                  size: 16,
                                  color: isDark ? NewsColors.textOnDarkSub : NewsColors.textTertiary,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    article.title, // 4. Display live title
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: isDark ? NewsColors.textOnDark : NewsColors.textPrimary,
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Icon(
                                  Icons.arrow_outward,
                                  size: 14,
                                  color: isDark ? NewsColors.accentCoral : NewsColors.accentCyan,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ] else if (_searchController.text.isNotEmpty) ...[
                  Divider(color: isDark ? NewsColors.borderDark : NewsColors.borderLight, height: 0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    child: Column(
                      children: [
                        Icon(Icons.search_off_rounded, size: 32, color: isDark ? NewsColors.textOnDarkSub : NewsColors.textTertiary),
                        const SizedBox(height: 12),
                        Text('No results found', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ] else ...[
                  Divider(color: isDark ? NewsColors.borderDark : NewsColors.borderLight, height: 0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Popular Searches', style: Theme.of(context).textTheme.labelSmall),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: ['Breaking News', 'Technology', 'AI News', 'Markets', 'Global News']
                              .map((tag) => GestureDetector(
                                    onTap: () {
                                      _searchController.text = tag;
                                      _filterSearch(tag, realNewsList);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        color: isDark ? NewsColors.bgDarkElevated : NewsColors.bgLightSoft,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: isDark ? NewsColors.borderDark : NewsColors.borderLight, width: 0.5),
                                      ),
                                      child: Text(
                                        tag,
                                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                              color: isDark ? NewsColors.textOnDark : NewsColors.textPrimary,
                                            ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],

                // ── Footer Action ──
                if (_searchController.text.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isDark ? NewsColors.bgDarkElevated : NewsColors.bgLightSoft,
                      border: Border(top: BorderSide(color: isDark ? NewsColors.borderDark : NewsColors.borderLight, width: 0.5)),
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () => _performSearch(_searchController.text),
                        icon: const Icon(Icons.search_rounded),
                        label: Text('Search "${_searchController.text}"', overflow: TextOverflow.ellipsis),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isDark ? NewsColors.accentCoral : NewsColors.accentCyan,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickFilter(String label, Color color, bool isDark, List<dynamic> realNewsList) {
    return GestureDetector(
      onTap: () {
        _searchController.text = label;
        _filterSearch(label, realNewsList);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3), width: 0.5),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}