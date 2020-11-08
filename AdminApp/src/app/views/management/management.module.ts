import { NgModule } from '@angular/core';
import {ProductComponent} from './product/product.component';
import {ManagementRoutingModule} from './management-routing.module';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {CommonModule} from '@angular/common';
import {TranslateModule} from '@ngx-translate/core';
import { CategoryComponent } from './category/category.component';
import {MatFormFieldModule} from '@angular/material/form-field';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {MatButtonModule} from '@angular/material/button';
import {MatInputModule} from '@angular/material/input';
import {MatTooltipModule} from '@angular/material/tooltip';
import {MatDialogModule} from '@angular/material/dialog';
import {ProductDialogComponent} from './product/product-dialog.component';
import {MatSelectModule} from '@angular/material/select';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatIconModule} from '@angular/material/icon';
import { BrandComponent } from './brand/brand.component';
import {BrandDialogComponent} from './brand/brand-dialog.component';


@NgModule({
  imports: [
    ManagementRoutingModule,
    MatTableModule,
    MatPaginatorModule,
    CommonModule,
    TranslateModule,
    MatFormFieldModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatInputModule,
    FormsModule,
    MatTooltipModule,
    MatDialogModule,
    MatSelectModule,
    MatProgressSpinnerModule,
    MatIconModule
  ],
  declarations: [ ProductComponent, CategoryComponent, ProductDialogComponent, BrandComponent, BrandDialogComponent ],
  entryComponents: [ProductDialogComponent, BrandDialogComponent]
})
export class ManagementModule { }
