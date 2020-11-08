import { Injectable } from '@angular/core';
import {Observable} from 'rxjs';
import {ICategory} from '../model/category.model';
import {appConstrains} from '../constraints/app.constraints';
import {HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  constructor(private http: HttpClient) { }

  getAllCategory(): Observable<ICategory[]> {
    return this.http.get<ICategory[]>(appConstrains.categoryAPI.getAll);
  }
}
