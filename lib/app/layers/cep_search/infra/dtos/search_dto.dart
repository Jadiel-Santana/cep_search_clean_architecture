import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/entities/search_entity.dart';

class SearchDto extends SearchEntity {
  SearchDto({
    required String zipCode,
    required String publicPlace,
    required String complement,
    required String district,
    required String locality,
    required String state,
    required String ddd,
  }) : super(
    zipCode: zipCode,
    publicPlace: publicPlace,
    complement: complement,
    district: district,
    locality: locality,
    state: state,
    ddd: ddd,
  );

  factory SearchDto.fromJson(Map<String, dynamic> json) =>
      SearchDto(
        zipCode: json['cep'],
        publicPlace: json['logradouro'],
        complement: json['complemento'],
        district: json['bairro'],
        locality: json['localidade'],
        state: json['uf'],
        ddd: json['ddd'],
      );

  Map<String, dynamic> toJson() => {
    'cep': zipCode,
    'logradouro': publicPlace,
    'complemento': complement,
    'bairro': district,
    'localidade': locality,
    'uf': state,
    'ddd': ddd,
  };
}