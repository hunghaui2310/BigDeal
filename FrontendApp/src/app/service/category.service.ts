import { Injectable } from '@angular/core';
import {Observable} from 'rxjs';
import {HttpClient} from '@angular/common/http';
import {appConstrains} from '../constrains/app.constrains';
import {ICategory} from '../model/category.model';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(private http: HttpClient) { }

  getAllCategory(): Observable<ICategory[]> {
    return this.http.get<ICategory[]>(appConstrains.categoryAPI.getAll);
  }
}
