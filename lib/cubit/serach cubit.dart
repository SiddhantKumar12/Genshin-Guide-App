import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<List<dynamic>> {
  SearchCubit() : super([]);

  void search(String query, List<dynamic> types) {
    final filteredList = types.where((type) => type.toString().toLowerCase().contains(query.toLowerCase())).toList();
    emit(filteredList);
  }
}
