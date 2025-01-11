import 'package:atele_online/core/functions/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atele_online/core/cubits/cubit/shared_data_cubit.dart';
import 'package:atele_online/core/models/product_model.dart';
import 'package:atele_online/feature/store/presentation/views/items_view.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedDataCubit, Map<String, dynamic>>(
      builder: (context, state) {
        final isLoading = state["isLoadingFavorites"] ?? false;
        final favoriteProducts =
            state['favoriteProducts'] as List<ProductModel>? ?? [];

        return Scaffold(
          appBar:
              customAppBar(context: context, title: 'Favorites', actions: []),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.black),
                )
              : favoriteProducts.isEmpty
                  ? const Center(
                      child: Text(
                        'No favorites added.',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    )
                  : ListView.separated(
                      itemCount: favoriteProducts.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        final product = favoriteProducts[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: product.productImages.isNotEmpty
                                ? Image.network(
                                    product.productImages[0],
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.grey[300],
                                    child: const Icon(
                                      Icons.image_not_supported,
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                  ),
                          ),
                          title: Text(
                            product.productName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            product.categoryName,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle,
                                color: Colors.red),
                            onPressed: () async {
                              await context
                                  .read<SharedDataCubit>()
                                  .removeFromFavorites(product.productId);
                            },
                          ),
                          onTap: () {
                            context.read<SharedDataCubit>().setProduct(product);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ItemView(),
                              ),
                            );
                          },
                        );
                      },
                    ),
        );
      },
    );
  }
}
