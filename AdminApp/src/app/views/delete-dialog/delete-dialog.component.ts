import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from '@angular/material/dialog';
import {ProductService} from '../../service/product.service';
import {AppService} from '../../app.service';

@Component({
  selector: 'app-delete-dialog',
  templateUrl: './delete-dialog.component.html',
  styleUrls: ['./delete-dialog.component.css']
})
export class DeleteDialogComponent implements OnInit {

  constructor(
    private dialogRef: MatDialogRef<DeleteDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private productService: ProductService,
    private appService: AppService
  ) { }

  ngOnInit(): void {
  }

  onBack(): void {
    this.dialogRef.close();
  }

  removeItem() {
    switch (this.data.type) {
      case 'product':
        this.deleteProduct();
        break;
    }
  }

  deleteProduct(): void {
    this.productService.deleteProduct(this.data.id).subscribe((res) => {
      if (res['status']) {
        this.appService.showSuccess('Delete Product Success!');
      } else {
        this.appService.showError('Delete Product Error!');
      }
      this.onBack();
    });
  }
}
