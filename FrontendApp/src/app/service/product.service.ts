import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {appConstrains} from '../constrains/app.constrains';
import {IProduct} from '../model/product.model';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  constructor(private http: HttpClient) { }

  getAllProductByCate(categoyId: number): Observable<IProduct[]> {
    return this.http.get<IProduct[]>(appConstrains.productAPI.getByCategory + '?categoryId=' + categoyId);
  }
}
