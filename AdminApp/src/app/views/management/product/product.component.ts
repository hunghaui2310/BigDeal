import {Component, OnInit, ViewChild} from '@angular/core';
import {IProduct} from '../../../model/product.model';
import {MatTableDataSource} from '@angular/material/table';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {ProductService} from '../../../service/product.service';
import {FormControl} from '@angular/forms';
import {MatDialog} from '@angular/material/dialog';
import {DeleteDialogComponent} from '../../delete-dialog/delete-dialog.component';
import {ProductDialogComponent} from './product-dialog.component';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.css']
})
export class ProductComponent implements OnInit {

  displayedColumns: string[] = ['index', 'code', 'name', 'price', 'categoryName', 'brandName', 'createDate', 'discount', 'action'];
  products: MatTableDataSource<IProduct>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  productName = new FormControl();
  constructor(private productService: ProductService,
              public dialog: MatDialog) { }

  ngOnInit(): void {
    this.getAllProduct();
  }

  getAllProduct(name?: string): void {
    this.productService.getAllProduct(name).subscribe((res) => {
      // @ts-ignore
      this.products = new MatTableDataSource<IProduct>(res['data']['list']);
      this.products.paginator = this.paginator;
      this.products.sort = this.sort;
    });
  }

  openProduct(product?: IProduct): void {
    if (!product) {
      const dialog = this.dialog.open(ProductDialogComponent, {
        maxWidth: '85vw',
        maxHeight: '100vh',
        width: '60vw',
        data: {
        }
      });
      dialog.afterClosed().subscribe(result => {
        this.getAllProduct();
      });
    } else {
      const dialog = this.dialog.open(ProductDialogComponent, {
        maxWidth: '85vw',
        maxHeight: '100vh',
        width: '60vw',
        data: {
          product: product
        }
      });
      dialog.afterClosed().subscribe(result => {
        this.getAllProduct();
      });
    }
  }

  openConfirm(code: string) {
    const dialogRef = this.dialog.open(DeleteDialogComponent, {
      maxWidth: '85vw',
      maxHeight: '100vh',
      width: '40vw',
      data: {
        type: 'product',
        id: code
      }
    });
    dialogRef.afterClosed().subscribe(result => {
        this.getAllProduct();
    });
  }
}
