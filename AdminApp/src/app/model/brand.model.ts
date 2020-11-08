export interface IBrand {
  id?: number;
  brandName?: string;
  image?: string;
  description?: string;
  deletedAt?: any;
  createdAt?: any;
  updatedAt?: any;
}

export class BrandModel implements IBrand {
  constructor(
    id?: number,
    brandName?: string,
    image?: string,
    description?: string,
    deletedAt?: any,
    createdAt?: any,
    updatedAt?: any
  ) {
  }
}
