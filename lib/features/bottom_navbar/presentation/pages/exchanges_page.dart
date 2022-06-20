import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_steps_tracker/di/injection_container.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/data/models/exchange_history_model.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/exchanges_history/exchanges_history_cubit.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/manager/exchanges_history/exchanges_history_state.dart';
import 'package:flutter_steps_tracker/features/bottom_navbar/presentation/widgets/exchanges_item.dart';
import 'package:flutter_steps_tracker/generated/l10n.dart';

class ExchangesHistoryPage extends StatelessWidget {
  const ExchangesHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExchangesHistoryCubit>(
      create: (context) {
        final cubit = getIt<ExchangesHistoryCubit>();
        cubit.getExchangesHistory();
        return cubit;
      },
      child: Builder(builder: (context) {
        return BlocBuilder<ExchangesHistoryCubit, ExchangesHistoryState>(
          bloc: BlocProvider.of<ExchangesHistoryCubit>(context),
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => _buildExchangesList(context, isLoading: false),
              loaded: (exchanges) => _buildExchangesList(
                context,
                exchanges: exchanges,
              ),
              orElse: () => _buildExchangesList(context),
            );
          },
        );
      }),
    );
  }

  /// TODO: Refactor this to a separate class
  Widget _buildExchangesList(BuildContext context,
      {bool isLoading = false, List<ExchangeHistoryModel>? exchanges}) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return exchanges != null && exchanges.isNotEmpty
        ? SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              child: Column(
                children: exchanges
                    .map(
                      (e) => Column(
                        children: [
                          ExchangesItem(
                            exchangeHistoryItem: e,
                          ),
                          const Divider(),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        : Center(
            child: Text(
              S.of(context).emptyState,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          );
  }
}
