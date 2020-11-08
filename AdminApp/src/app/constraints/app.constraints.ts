const URL = 'https://localhost:8443';
const URL_BASE = URL + '/api/';

export const appConstrains = {
  categoryAPI: {
    getAll: URL_BASE + 'category/getAll'
  },
  productAPI: {
    getByCategory: URL_BASE + 'product/getByCategory',
    getAll: URL_BASE + 'product/getAll',
    deleteProduct: URL_BASE + 'product/delete',
    saveProduct: URL_BASE + 'product/saveProduct'
  },
  brandAPI: {
    getAll: URL_BASE + 'brand/getAll',
    saveBrand: URL_BASE + 'brand/save'
  }
};
