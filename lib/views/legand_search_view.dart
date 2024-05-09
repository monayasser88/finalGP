import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jody/components/custom_appbar.dart';
import 'package:jody/components/search_field.dart';
import 'package:jody/cubit/search_cubit.dart';
import 'package:jody/pages/account.dart';
import 'package:jody/pages/legand.dart';
import 'package:jody/pages/not_found.dart';

class LegendSearchView extends StatelessWidget {
  LegendSearchView({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchError) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const NotFound();
          }));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 55,
                ),
                CustomAppBar(
                  title: 'Search',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Account()),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SearchField(
                  label: 'Search',
                  hint: 'search',
                  controller: _searchController,
                  onPressed: () {
                    if (_searchController.text.isNotEmpty) {
                      context
                          .read<SearchCubit>()
                          .legendSearch(_searchController.text);
                    }
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      // Clear search results when search text is empty
                      context.read<SearchCubit>().clearSearchResults();
                    } else {
                      context.read<SearchCubit>().legendSearch(value);
                    }
                  },
                ),
                if (state is SearchLoading)
                  const Center(child: CircularProgressIndicator())
                else if (state is SearchLoaded)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.results.length,
                      itemBuilder: (context, index) {
                        final result = state.results[index];
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              result['imgCover'],
                            ),
                          ),
                          title: Text(result['name']),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Legend(
                                    legend: state.results[
                                        index], // Pass the legend details to the Legend screen
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
