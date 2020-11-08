export interface IProduct {
  code?: string;
  name?: string;
  price?: number;
  categoryId?: number;
  brandId?: number;
  categoryName?: string;
  brandName?: string;
  discount?: number;
  urlImage?: string;
  lstFileName?: any;
  createDate?: any;
  rating?: number;
}

export class ProductModel implements IProduct {
  constructor(
    code?: string,
    name?: string,
    price?: number,
    categoryId?: number,
    brandId?: number,
    categoryName?: string,
    brandName?: string,
    discount?: number,
    urlImage?: string,
    lstFileName?: any,
    createDate?: any,
    rating?: number
  ) {
  }
}
