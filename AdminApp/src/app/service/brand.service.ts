import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {Observable} from 'rxjs';
import {IBrand} from '../model/brand.model';
import {appConstrains} from '../constraints/app.constraints';

@Injectable({
  providedIn: 'root'
})
export class BrandService {

  constructor(private http: HttpClient) { }

  getAllBrand(brandName?: string): Observable<IBrand[]> {
    if (brandName) {
      return this.http.get<IBrand[]>(appConstrains.brandAPI.getAll + '?name=' + brandName);
    } else {
      return this.http.get<IBrand[]>(appConstrains.brandAPI.getAll);
    }
  }

  saveBrand(brand: IBrand, file: any) {
    if (brand.id) {
      return this.http.post(appConstrains.brandAPI.saveBrand + '?id=' + brand.id
        + '&brandName=' + brand.brandName + '&description=' + brand.description, file);
    } else {
      return this.http.post(appConstrains.brandAPI.saveBrand
        + '?brandName=' + brand.brandName + '&description=' + brand.description, file);
    }
  }
}
