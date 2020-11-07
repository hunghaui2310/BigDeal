const URL = 'https://localhost:8443';
const URL_BASE = URL + '/api/';

export const appConstrains = {
  categoryAPI: {
    getAll: URL_BASE + 'category/getAll'
  },
  productAPI: {
    getByCategory: URL_BASE + 'product/getByCategory'
  }
};
