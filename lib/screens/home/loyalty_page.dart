import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class LoyaltyPage extends StatelessWidget {
  const LoyaltyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Cabeçalho
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: AppColors.primary),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(height: 10),
                    Text('Fidelidade',
                        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                    const Text('Clube Barbú ⭐',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Cartão de Progresso
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.white.withOpacity(0.05)),
                ),
                child: Column(
                  children: [
                    const Text("Você está quase lá!",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    const Text("Complete 10 cortes e ganhe um por nossa conta.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54, fontSize: 14)),
                    const SizedBox(height: 30),
                    
                    // Barra de Progresso Visual
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 12,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: 0.7, // 70% de progresso
                              backgroundColor: Colors.white10,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("7 de 10 cortes", style: TextStyle(color: Colors.white70, fontSize: 12)),
                        Text("Faltam 3", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Grid de Selos (Representação visual dos cortes)
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    bool isCompleted = index < 7; // Simulação de 7 cortes feitos
                    return Container(
                      decoration: BoxDecoration(
                        color: isCompleted ? primaryColor.withOpacity(0.2) : AppColors.cardBackground,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isCompleted ? primaryColor : Colors.white10,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        isCompleted ? Icons.content_cut : Icons.star_border,
                        size: 20,
                        color: isCompleted ? Colors.white : Colors.white10,
                      ),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ),

            // Informativo de Prêmio
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [primaryColor.withOpacity(0.1), Colors.transparent]),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: primaryColor.withOpacity(0.3)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.card_giftcard, color: AppColors.primary),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          "Próximo prêmio: Corte de Cabelo Grátis ou Hidratação.",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}