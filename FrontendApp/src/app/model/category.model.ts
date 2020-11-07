export interface ICategory {
  id?: number;
  categoryName?: string;
  image?: string;
  description?: string;
  deletedAt?: string;
  createdAt?: string;
  updatedAt?: string;
}

export class CategoryModel implements ICategory{
  constructor(
    id?: number,
    categoryName?: string,
    image?: string,
    description?: string,
    deletedAt?: string,
    createdAt?: string,
    updatedAt?: string,
  ) {
  }
}
