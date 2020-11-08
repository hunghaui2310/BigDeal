import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {appConstrains} from '../constraints/app.constraints';
import {Observable} from 'rxjs';
import {IProduct, ProductModel} from '../model/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(private http: HttpClient) { }

  getAllProduct(productName: string): Observable<IProduct[]> {
    if (productName) {
      return this.http.get<IProduct[]>(appConstrains.productAPI.getAll + '?name=' + productName);
    } else {
      return this.http.get<IProduct[]>(appConstrains.productAPI.getAll);
    }
  }

  deleteProduct(code: string) {
    return this.http.get(appConstrains.productAPI.deleteProduct + '?code=' + code);
  }

  saveProduct(product: IProduct) {
    return this.http.get(appConstrains.productAPI.saveProduct + '?brandId=' + product.brandId + '&categoryId=' + product.categoryId +
            '&code=' + product.code + '&discount=' + product.discount + '&name=' + product.name + '&price=' + product.price);
  }
}
