import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from '@angular/material/dialog';
import {ProductService} from '../../../service/product.service';
import {FormControl, Validators} from '@angular/forms';
import {CategoryService} from '../../../service/category.service';
import {ICategory} from '../../../model/category.model';
import {IBrand} from '../../../model/brand.model';
import {BrandService} from '../../../service/brand.service';
import {IProduct, ProductModel} from '../../../model/product.model';
import {AppService} from '../../../app.service';

@Component({
  selector: 'app-product-dialog',
  templateUrl: './product-dialog.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductDialogComponent implements OnInit {

  productCode = new FormControl('', [Validators.required]);
  productName = new FormControl('');
  category = new FormControl('', [Validators.required]);
  brand = new FormControl('', [Validators.required]);
  productPrice = new FormControl('', [Validators.required]);
  discount = new FormControl('', [Validators.required]);
  categories: ICategory[];
  brands: IBrand[];
  myFiles: any = [];
  imageChoose: any = [];

  constructor(private dialogRef: MatDialogRef<ProductDialogComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private productService: ProductService,
              private categoryService: CategoryService,
              private brandService: BrandService,
              private appService: AppService) {
  }

  ngOnInit(): void {
    this.getAllCate();
    this.getAllBrand();
    this.setDataForm();
  }

  setDataForm() {
    if (this.data.product) {
      const product = this.data.product as IProduct;
      this.productCode.setValue(product.code);
      this.productName.setValue(product.name);
      this.productPrice.setValue(product.price);
      this.category.setValue(product.categoryId);
      this.brand.setValue(product.brandId);
      this.discount.setValue(product.discount);
    }
  }

  onBack(): void {
    this.dialogRef.close();
  }

  actionDialog(): void {
    const product = this.createFrom();
    this.productService.saveProduct(product).subscribe((res) => {
      if (res['status']) {
        if (this.data.product) {
          this.appService.showSuccess('Edit Product Success');
        } else {
          this.appService.showSuccess('Create Product Success');
        }
      } else {
        this.appService.showError('Error');
      }
      this.onBack();
    });
  }

  private createFrom(): IProduct {
    if (this.data.product) {
      return {
        ...new ProductModel(),
        code: this.productCode.value,
        name: this.productName.value,
        price: this.productPrice.value,
        categoryId: this.category.value,
        brandId: this.brand.value,
        discount: this.discount.value
      };
    } else {
      return new ProductModel();
    }
  }

  getAllCate(): void {
    this.categoryService.getAllCategory().subscribe((res) => {
      this.categories = res['data']['list'];
    });
  }

  getAllBrand(): void {
    this.brandService.getAllBrand().subscribe((res) => {
      this.brands = res['data']['list'];
    });
  }

  onClick(): void {
    const fileUpload = document.getElementById('fileUpload') as HTMLInputElement;
    fileUpload.click();
    this.myFiles = [];
  }

  importImage(event: any): void {
    if (event.target['files'].length > 0) {
      for (let i = 0; i < event.target['files'].length; i++) {
        this.myFiles.push(event.target['files'][i]);
        const reader = new FileReader();
        reader.onload = e => (this.imageChoose.push(reader.result));
        reader.readAsDataURL(event.target['files'][i]);
      }
      if (this.myFiles) {
        const formData = new FormData();
        formData.append('image', this.myFiles);
      }
    }
  }

  deleteImage(image: any) {
    this.imageChoose = this.imageChoose.filter(item => item !== image);
  }
}
