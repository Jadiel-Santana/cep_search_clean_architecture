import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/entities/search_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/components/label_text.dart';
import '../../../../core/theme/app_colors.dart';

class ZipCodeCardItem extends StatelessWidget {
  final SearchEntity entity;

  const ZipCodeCardItem({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Resultado da Consulta',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelText(
                              label: 'CEP',
                              text: entity.zipCode,
                            ),
                            const SizedBox(height: 12),
                            LabelText(
                              label: 'Bairro',
                              text: GetUtils.capitalize(entity.district)!,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                          child: VerticalDivider(
                            color: AppColors.grey,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelText(
                              label: 'Cidade',
                              text: GetUtils.capitalize(entity.locality)!,
                            ),
                            const SizedBox(height: 12),
                            LabelText(
                              label: 'Logradouro',
                              text: GetUtils.capitalize(entity.publicPlace)!,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 60,
                          child: VerticalDivider(
                            color: AppColors.grey,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelText(
                              label: 'Estado',
                              text: entity.state,
                            ),
                            const SizedBox(height: 12),
                            LabelText(
                              label: 'DDD da Cidade',
                              text: entity.ddd,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    LabelText(
                      label: 'Complemento',
                      text: GetUtils.capitalize(entity.complement)!,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}