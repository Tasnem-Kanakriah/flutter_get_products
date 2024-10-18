// import 'package:demo/bloc_manager/bloc_search/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../bloc_manager/bloc/product_bloc.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(GetProductEvent()),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding:
                const EdgeInsets.only(top: 30, bottom: 40, right: 10, left: 10),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(
                        enabledMouseCursor: MouseCursor.uncontrolled,
                        fixedSize: const Size(360, 40),
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        backgroundColor: const Color(0xfffb9a0d)),
                    onPressed: () {},
                    child: const Text(
                      'All Products',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    autofocus: true,
                    controller: search,
                    onChanged: (value) {
                      // print(value);
                      if (search.text == '') {
                        print('emmmmpty');
                        context.read<ProductBloc>().add(GetProductEvent());
                      } else {
                        context
                            .read<ProductBloc>()
                            .add(ProductOnSearchEvent(word: search.text));
                      }
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is SuccessToGetData) {
                          return ListView.builder(
                            itemCount: state.listProduct.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10, right: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xfffba220),
                                        blurRadius: 10,
                                        spreadRadius: -4,
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          state.listProduct[index].images![0],
                                          width: 40,
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              // softWrap: true,
                                              maxLines: 2,
                                              state.listProduct[index].title
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              state.listProduct[index].category
                                                  .toString(),
                                              // snapshot.data![index].category!,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              state.listProduct[index].price
                                                  .toString(),
                                              // snapshot.data![index].price!.toString(),
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.disabled_by_default_rounded,
                                          color: Color(0xfffc5561),
                                          size: 30,
                                        )),
                                  ],
                                ),
                              );
                            },
                          );
                        } else if (state is ProductHasSearch) {
                          return ListView.builder(
                            itemCount: state.productHasFound.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 10, left: 10, right: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0xfffba220),
                                        blurRadius: 10,
                                        spreadRadius: -4,
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.network(
                                          state.productHasFound[index]
                                              .images![0],
                                          width: 40,
                                          height: 40,
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              // softWrap: true,
                                              maxLines: 2,
                                              state.productHasFound[index].title
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              state.productHasFound[index]
                                                  .category
                                                  .toString(),
                                              // snapshot.data![index].category!,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              state.productHasFound[index].price
                                                  .toString(),
                                              // snapshot.data![index].price!.toString(),
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.disabled_by_default_rounded,
                                          color: Color(0xfffc5561),
                                          size: 30,
                                        )),
                                  ],
                                ),
                              );
                            },
                          );
                        } 
                        else if (state is DoesNotHasAnyProductByThisName) {
                          return const Center(
                            child: Text('No Product Found With This Name'),
                          );
                        }
                        else if (state is EmptyData) {
                          return const Center(
                            child: Text('Data is Empty'),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
