import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {ProductComponent} from './product/product.component';
import {CategoryComponent} from './category/category.component';
import {BrandComponent} from './brand/brand.component';

const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Management'
    },
    children: [
      {
        path: 'product',
        component: ProductComponent,
        data: {
          title: 'Product'
        }
      },
      {
        path: 'category',
        component: CategoryComponent,
        data: {
          title: 'Category'
        }
      },
      {
        path: 'brand',
        component: BrandComponent,
        data: {
          title: 'Brand'
        }
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ManagementRoutingModule {}
