import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    // Lista fictícia de produtos
    final List<Map<String, String>> products = [
      {'name': 'Pomada Matte', 'price': 'R\$ 45,90', 'desc': 'Fixação forte e efeito seco.'},
      {'name': 'Óleo de Barba', 'price': 'R\$ 38,00', 'desc': 'Hidratação e brilho natural.'},
      {'name': 'Shampoo 3 em 1', 'price': 'R\$ 52,00', 'desc': 'Cabelo, barba e corpo.'},
      {'name': 'Balm Modelador', 'price': 'R\$ 35,00', 'desc': 'Alinhamento dos fios.'},
      {'name': 'Pente de Madeira', 'price': 'R\$ 25,00', 'desc': 'Anti-estático e durável.'},
      {'name': 'Pós Barba Ice', 'price': 'R\$ 29,90', 'desc': 'Refrescância imediata.'},
    ];

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
                    Text('Loja',
                        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                    const Text('Produtos Premium 🧴',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ),

            // Grid de Produtos
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = products[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white.withOpacity(0.05)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Placeholder de Imagem
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.03),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(Icons.inventory_2_outlined, color: primaryColor.withOpacity(0.3), size: 40),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(item['name']!, 
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          const SizedBox(height: 4),
                          Text(item['desc']!, 
                              style: const TextStyle(color: Colors.white38, fontSize: 11),
                              maxLines: 1, overflow: TextOverflow.ellipsis),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(item['price']!, 
                                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 14)),
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.add, size: 16, color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  childCount: products.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}