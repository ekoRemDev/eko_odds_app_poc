import 'package:eko_assignment/config/app_constants.dart';
import 'package:eko_assignment/screens/games_screen/games_cubit/games_cubit.dart';
import 'package:eko_assignment/screens/splash_screen/splash_screen.dart';
import 'package:eko_assignment/services/dependency_injection.dart';
import 'package:eko_assignment/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GamesScreen extends StatefulWidget {
  const GamesScreen({super.key});

  static const routeName = 'gamesScreen';

  @override
  State<GamesScreen> createState() => _GamesScreenState();
}

class _GamesScreenState extends State<GamesScreen> {
  int? expandedIndex;
  final ScrollController _scrollController = ScrollController();

  final Map<int, GlobalKey> itemKeys = {};

  @override
  void initState() {
    super.initState();
    final gamesCubit = di<GamesCubit>();

    if (!gamesCubit.isClosed) {
      gamesCubit.gamesList();
    }
  }

  void _scrollToExpandedItem(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final key = itemKeys[index];
      if (key == null) return;

      final context = key.currentContext;
      if (context == null) return;

      final renderBox = context.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;
      final listViewOffset = _scrollController.offset;
      final itemHeight = renderBox.size.height;
      final listViewHeight = _scrollController.position.maxScrollExtent;
      final bottomPadding = MediaQuery.of(context).padding.bottom + 50;

      double scrollOffset = listViewOffset;

      if (position.dy < 0) {
        // If item is above the viewport, scroll up
        scrollOffset = listViewOffset + position.dy - 10;
      } else if (position.dy + itemHeight > screenHeight) {
        // If item is below the viewport, scroll down
        scrollOffset = listViewOffset + (position.dy + itemHeight - screenHeight + 20);

        // Ensure last item is fully visible
        if (index == itemKeys.length - 1) {
          final extraHeight = itemHeight + 40; // Buffer for expansion
          scrollOffset = listViewHeight + bottomPadding - extraHeight;
        }
      }

      _scrollController.animateTo(
        scrollOffset.clamp(0, listViewHeight), // Prevent scrolling beyond max limit
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => di<GamesCubit>(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text(AppConstants.appName),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  context.goNamed(SplashScreen.routeName);
                },
              ),
              const SizedBox(width: 16),
            ],
          ),
          body: BlocBuilder<GamesCubit, GamesState>(
            buildWhen: (p, c) =>
                p.games != c.games || p.errorMessage != c.errorMessage || p.isMatchListLoading != c.isMatchListLoading,
            builder: (context, gamesState) => Stack(
              children: [
                if (gamesState.errorMessage?.isEmpty ?? false)
                  ListView.builder(
                    controller: _scrollController,
                    itemCount: gamesState.games?.length ?? 0,
                    itemBuilder: (context, index) {
                      final game = gamesState.games?[index];
                      bool isExpanded = expandedIndex == index;
                      itemKeys.putIfAbsent(index, () => GlobalKey());
                      return AnimatedContainer(
                        key: itemKeys[index],
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                '${game?.homeTeam} vs ${game?.awayTeam}',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              trailing: AnimatedRotation(
                                turns: isExpanded ? 0.5 : 0, // Rotates arrow icon
                                duration: const Duration(milliseconds: 300),
                                child: const Icon(Icons.expand_more),
                              ),
                              onTap: () {
                                if (index == 0) {
                                  _scrollController.jumpTo(0);
                                }
                                setState(() {
                                  expandedIndex = isExpanded ? null : index;
                                });

                                if (!isExpanded) {
                                  _scrollToExpandedItem(index);
                                }
                              },
                            ),
                            AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: isExpanded
                                  ? BlocBuilder<GamesCubit, GamesState>(
                                      buildWhen: (previous, current) =>
                                          previous.games?[index].odds != current.games?[index].odds,
                                      builder: (context, updatedState) {
                                        final updatedGame = updatedState.games?[index];

                                        return _BlinkingOdds(
                                          homeOdds: updatedGame?.odds?.homeWin.toString() ?? '',
                                          drawOdds: updatedGame?.odds?.draw.toString() ?? '',
                                          awayOdds: updatedGame?.odds?.awayWin.toString() ?? '',
                                        );
                                      },
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                if (gamesState.errorMessage != null)
                  Center(
                    child: Text(
                      gamesState.errorMessage.toString(),
                    ),
                  ),
                if (gamesState.isMatchListLoading == true) const AppLoader(),
              ],
            ),
          ),
        ),
      );
}

class _BlinkingOdds extends StatefulWidget {
  const _BlinkingOdds({
    required this.homeOdds,
    required this.drawOdds,
    required this.awayOdds,
  });

  final String homeOdds;
  final String drawOdds;
  final String awayOdds;

  @override
  State<_BlinkingOdds> createState() => _BlinkingOddsState();
}

class _BlinkingOddsState extends State<_BlinkingOdds> {
  Color _bgColor = Colors.transparent;

  @override
  void didUpdateWidget(covariant _BlinkingOdds oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.homeOdds != widget.homeOdds ||
        oldWidget.drawOdds != widget.drawOdds ||
        oldWidget.awayOdds != widget.awayOdds) {
      _blinkEffect();
    }
  }

  void _blinkEffect() {
    setState(() {
      _bgColor = Colors.yellow.withOpacity(0.5); // Highlight color
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _bgColor = Colors.transparent; // Reset to normal
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _bgColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Home: ${widget.homeOdds}', style: const TextStyle(fontSize: 18)),
            Text('Draw: ${widget.drawOdds}', style: const TextStyle(fontSize: 18)),
            Text('Away: ${widget.awayOdds}', style: const TextStyle(fontSize: 18)),
          ],
        ),
      );
}
