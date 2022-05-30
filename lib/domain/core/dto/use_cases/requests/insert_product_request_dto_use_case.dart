import 'package:equatable/equatable.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';

class InsertProductRequestDtoUseCase extends Equatable {
  final String ProductName;
  final String ProductGroupID;
  final String? BrandID;
  final String? BrandName;
  final int Weight;
  final int Length;
  final int Width;
  final int Height;
  final int WeightType;
  final String? Description;
  final bool? Original;
  final VMProductGroup ProductGroup;
  final List<SectionOfInsertProductRequestDtoUseCase>? Sections;

  InsertProductRequestDtoUseCase(
      {required this.ProductName,
      required this.ProductGroupID,
      this.BrandID,
      this.BrandName,
      required this.Weight,
      required this.Length,
      required this.Width,
      required this.Height,
      required this.WeightType,
      this.Description,
      this.Original = false,
      required this.ProductGroup,
      this.Sections});

  @override
  List<Object?> get props => [
        ProductName,
        ProductGroupID,
        BrandID,
        BrandName,
        Weight,
        Length,
        Width,
        Height,
        WeightType,
        Description,
        Original,
        ProductGroup,
        Sections,
      ];
}

class SectionOfInsertProductRequestDtoUseCase extends Equatable {
  @override
  List<Object?> get props => [];
}
