import 'package:bookia/core/extensions/navigator.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/feature/home/data/models/best_sellers_response/product.dart';
import 'package:bookia/feature/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/feature/home/presentation/cubit/home_states.dart';
import 'package:bookia/feature/home/presentation/pages/book_details_screen.dart';
import 'package:bookia/feature/home/presentation/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class PopularBooksBuilder extends StatefulWidget {
  const PopularBooksBuilder({super.key});

  @override
  State<PopularBooksBuilder> createState() => _PopularBooksBuilderState();
}

class _PopularBooksBuilderState extends State<PopularBooksBuilder> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getbestSeller();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Popular Books', style: getTitleTextStyle()),
          Gap(10),
          bookList(),
        ],
      ),
    );
  }

  BlocBuilder<HomeCubit, HomeState> bookList() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen:
          (_, state) =>
              state is BestSellerSuccessState ||
              state is BestSellerLoadingState ||
              state is BestSellerErrorState,
      builder: (context, state) {
        if (state is! BestSellerSuccessState) {
          return const Center(child: CircularProgressIndicator());
        }
        List<Product> books =
            context.read<HomeCubit>().bestSellersResponse?.data?.products ?? [];
        return GridView.builder(
          itemCount: books.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 280,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                context.pushTo(BookDetailsScreen(product: books[index]));
              },
              child: BookItem(product: books[index]),
            );
          },
        );
      },
    );
  }
}
