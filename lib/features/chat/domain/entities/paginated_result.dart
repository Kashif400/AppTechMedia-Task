import 'package:equatable/equatable.dart';

class PaginatedResult<T> extends Equatable {
  final List<T> items;
  final int? currentPage;
  final int? totalPages;
  final int? totalItems;
  final int? limit;
  final bool? hasNextPage;
  final bool? hasPreviousPage;

  const PaginatedResult({
    required this.items,
    this.currentPage,
    this.totalPages,
    this.totalItems,
    this.limit,
    this.hasNextPage,
    this.hasPreviousPage,
  });

  @override
  List<Object?> get props => [
    items,
    currentPage,
    totalPages,
    totalItems,
    limit,
    hasNextPage,
    hasPreviousPage,
  ];
}
