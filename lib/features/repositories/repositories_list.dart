import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/static/style.dart';
import 'package:test_app/core/extensions/str_ext.dart';
import 'package:test_app/features/repositories/cubit/repositories_cubit.dart';
import 'package:test_app/features/repositories/data/repository.dart';

class RepositoriesList extends StatefulWidget {
  const RepositoriesList(this.login, {super.key});

  final String login;

  @override
  State<RepositoriesList> createState() => _RepositoriesListState();
}

class _RepositoriesListState extends State<RepositoriesList> {
  @override
  void initState() {
    BlocProvider.of<RepositoriesCubit>(context).getRepositories(
      widget.login,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            thickness: 1.5,
            color: Color(0xFFE8E8E8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              const Text(
                'Repositories',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 34),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'View all',
                  style: TextStyles.medium17.copyWith(
                      fontSize: 15, decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 18),
        BlocBuilder<RepositoriesCubit, RepositoriesState>(
          builder: (context, state) {
            if (state is! RepositoriesLoaded) {
              return const SizedBox.shrink();
            }

            return SizedBox(
              height: 167,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => _RepositoryCard(
                  repository: state.repositories[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(width: 25),
                itemCount: state.repositories.length,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _RepositoryCard extends StatelessWidget {
  const _RepositoryCard({
    required this.repository,
  });

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF7DF1E),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 15, top: 30, bottom: 10),
                child: Text(
                  repository.language.toABR,
                  textAlign: TextAlign.end,
                  style: TextStyles.medium17
                      .copyWith(fontSize: 50, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 49,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xFFE5E5EA)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xFFFFCB55),
                    size: 15,
                  ),
                  const SizedBox(
                    width: 2.5,
                  ),
                  Text(
                    repository.stargazersCount.toString(),
                    style: TextStyles.bold10
                        .copyWith(color: const Color(0xFFFFCB55)),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Container(
              width: 90,
              padding: const EdgeInsets.all(1),
              child: Text(
                repository.name,
                style: TextStyles.medium17,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 54,
              height: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xFF2B2B2B)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_tree_rounded,
                    color: Color(0xFFFFFFFF),
                    size: 15,
                  ),
                  const SizedBox(
                    width: 2.5,
                  ),
                  Text(
                    repository.forks.toString(),
                    style: TextStyles.bold10
                        .copyWith(color: const Color(0xFFFFFFFF)),
                  )
                ],
              ),
            )
          ],
        ),
        Text(
          repository.id.toString(),
        ),
      ],
    );
  }
}
