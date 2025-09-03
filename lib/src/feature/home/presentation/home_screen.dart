import 'package:app/src/common/constant/image_app.dart';
import 'package:app/src/feature/errors/no_data.dart';
import 'package:app/src/feature/home/presentation/widgets/home_cat_card.dart';
import 'package:app/src/feature/home/state/bloc/home_bloc.dart';
import 'package:app/src/shared/widgets/text_field/custom_products_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc homeBloc;
  TextEditingController controller = TextEditingController();
  @override
  // ignore: always_declare_return_types, type_annotate_public_apis
  initState() {
    homeBloc = HomeBloc()..add(GetHomeEvent());
    super.initState();
  }

  @override
  // ignore: always_declare_return_types, type_annotate_public_apis
  dispose() {
    homeBloc.close();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          tag: 'Catbreeds',
          child: Text(
            'Catbreeds',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomTextFieldSearch(
              controller: controller,
              callback: (value) {
                homeBloc.add(SearchHomeEvent(value));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              bloc: homeBloc,
              builder: (context, state) {
                // Estado para mostar carga de datos
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                  // estado para mostrar error
                } else if (state is HomeErrorState) {
                  return NoData(
                    message: state.message,
                    onPressed: () {
                      homeBloc.add(GetHomeEvent());
                    },
                  );
                  // estado para mostrar busqueda
                } else if (state is HomeSearchState) {
                  // en caso de que no haya datos
                  if (state.catModelSearch.isEmpty) {
                    return const NoData(
                      image: ImageApp.imageNotFound,
                      message: 'No hay datos',
                    );
                  }
                  return ListView.builder(
                    itemCount: state.catModelSearch.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: HomeCatCard(
                          catModel: state.catModelSearch[index],
                        ),
                      );
                    },
                  );
                } else if (state.data.isEmpty) {
                  return NoData(
                    image: ImageApp.imageNotFound,
                    message: 'No hay datos',
                    onPressed: () {
                      homeBloc.add(GetHomeEvent());
                    },
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: HomeCatCard(
                          catModel: state.data[index],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
