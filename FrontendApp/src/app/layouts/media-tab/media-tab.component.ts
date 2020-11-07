import { Component, OnInit } from '@angular/core';
import {CategoryService} from '../../service/category.service';
import {ICategory} from '../../model/category.model';
import {ProductService} from '../../service/product.service';
import {IProduct} from '../../model/product.model';

@Component({
  selector: 'app-media-tab',
  templateUrl: './media-tab.component.html',
  styleUrls: ['./media-tab.component.scss']
})
export class MediaTabComponent implements OnInit {

  categories: ICategory[];
  categoryChosen: number;
  products: IProduct[];

  constructor(private categoryService: CategoryService,
              private productService: ProductService) { }

  ngOnInit(): void {
    this.getAllCategory();
  }

  getAllCategory(): void {
    this.categoryService.getAllCategory().subscribe((res) => {
      this.categories = res['data']['list'];
      this.categoryChosen = this.categories[0].id;
      this.getProductByCate(this.categoryChosen);
    });
  }

  activeCate(category: ICategory): void {
    this.categoryChosen = category.id;
    this.getProductByCate(this.categoryChosen);
  }

  getProductByCate(categoryId: number): void {
    this.productService.getAllProductByCate(categoryId).subscribe((res) => {
      this.products = res['data']['list'];
    });
  }
}
