import 'package:crypto_exchange_app/providers/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Consumer<HomeProvider>(builder: (_, homeProvider, __) {
        if (homeProvider.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (homeProvider.tickerList.isNotEmpty) {
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    final coin = homeProvider.tickerList[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(coin.symbol),
                              Text(coin.volume),
                            ],
                          ),
                          Column(
                            children: [
                              Text(coin.lastPrice),
                              Text(coin.priceChangePercent),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25,
                  ),
                  itemCount: homeProvider.tickerList.length,
                ),
              ),
            ],
          );
        }
        return const Center(
          child: Text("Nothing"),
        );
      }),
    );
  }
}
