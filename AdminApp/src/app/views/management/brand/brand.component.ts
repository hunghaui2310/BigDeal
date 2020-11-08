import {Component, OnInit, ViewChild} from '@angular/core';
import {FormControl} from '@angular/forms';
import {BrandService} from '../../../service/brand.service';
import {IBrand} from '../../../model/brand.model';
import {MatTableDataSource} from '@angular/material/table';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatDialog} from '@angular/material/dialog';
import {BrandDialogComponent} from './brand-dialog.component';
import {DeleteDialogComponent} from '../../delete-dialog/delete-dialog.component';

@Component({
  selector: 'app-brand',
  templateUrl: './brand.component.html',
  styleUrls: ['./brand.component.css']
})
export class BrandComponent implements OnInit {

  displayedColumns: string[] = ['index', 'brandName', 'image', 'description', 'deletedAt', 'createdAt', 'updatedAt', 'action'];
  brandName = new FormControl('');
  brands: MatTableDataSource<IBrand>;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort, { static: true }) sort: MatSort;
  constructor(private brandService: BrandService,
              public dialog: MatDialog) { }

  ngOnInit(): void {
    this.getAllBrand();
  }

  getAllBrand(brandName?: string) {
    this.brandService.getAllBrand(brandName).subscribe((res) => {
      // @ts-ignore
      this.brands = new MatTableDataSource<IBrand>(res['data']['list']);
      this.brands.paginator = this.paginator;
      this.brands.sort = this.sort;
    });
  }

  openBrand(brand?: IBrand): void {
    if (!brand) {
      const dialog = this.dialog.open(BrandDialogComponent, {
        maxWidth: '85vw',
        maxHeight: '100vh',
        width: '60vw',
        data: {
        }
      });
      dialog.afterClosed().subscribe(result => {
        this.getAllBrand();
      });
    } else {
      const dialog = this.dialog.open(BrandDialogComponent, {
        maxWidth: '85vw',
        maxHeight: '100vh',
        width: '60vw',
        data: {
          brand: brand
        }
      });
      dialog.afterClosed().subscribe(result => {
        this.getAllBrand();
      });
    }
  }

  openConfirm(id: number) {
    const dialogRef = this.dialog.open(DeleteDialogComponent, {
      maxWidth: '85vw',
      maxHeight: '100vh',
      width: '40vw',
      data: {
        type: 'brand',
        id: id
      }
    });
    dialogRef.afterClosed().subscribe(result => {
      this.getAllBrand();
    });
  }
}
