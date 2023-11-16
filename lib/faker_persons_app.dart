import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/data_sources/persons_data_source.dart';
import 'data/repositories_impl/persons_repository_impl.dart';
import 'domain/use_cases/persons_use_case.dart';
import 'presentation/features/persons/cubit/persons_cubit.dart';
import 'presentation/features/persons/persons_screen.dart';

class FakerPersonsApp extends StatelessWidget {
  const FakerPersonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonsCubit(
        personsUseCase: PersonsUseCase(
          personsRepository: PersonsRepositoryImpl(
            personsDataSource: PersonsDataSourceImpl(),
          ),
        ),
      ),
      child: MaterialApp(
        title: 'Faker Persons',
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const PersonsScreen(),
      ),
    );
  }
}
