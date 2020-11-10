import {Component, Inject, OnInit} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef} from '@angular/material/dialog';
import {FormControl, Validators} from '@angular/forms';
import {BrandModel, IBrand} from '../../../model/brand.model';
import {AppService} from '../../../app.service';
import {BrandService} from '../../../service/brand.service';

@Component({
  selector: 'app-brand-dialog',
  templateUrl: './brand-dialog.component.html',
  styleUrls: ['brand.component.css']
})
export class BrandDialogComponent implements OnInit {

  brandName = new FormControl('', [Validators.required]);
  description = new FormControl('');
  myFiles: any = [];
  imageChoose: any = [];

  constructor(private dialogRef: MatDialogRef<BrandDialogComponent>,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private appService: AppService,
              private brandService: BrandService) {
  }

  ngOnInit(): void {
    this.setDataForm();
  }

  onBack(): void {
    this.dialogRef.close();
  }

  setDataForm() {
    if (this.data.brand) {
      const brand = this.data.brand as IBrand;
      this.brandName.setValue(brand.brandName);
      this.description.setValue(brand.description);
    }
  }

  onClick(): void {
    const fileUpload = document.getElementById('fileUpload') as HTMLInputElement;
    fileUpload.click();
    this.myFiles = [];
  }

  actionDialog(): void {
    const brand = this.createFrom();
    const file = new FormData();
    file.append('files', this.myFiles);
    console.log('brand to save', this.myFiles);
    this.brandService.saveBrand(brand, file).subscribe((res) => {
      if (res['status']) {
        if (this.data.product) {
          this.appService.showSuccess('Edit Brand Success');
        } else {
          this.appService.showSuccess('Create Brand Success');
        }
      } else {
        this.appService.showError('Error');
      }
      this.onBack();
    });
  }

  private createFrom(): IBrand {
    if (this.data.brand) {
      return {
        ...new BrandModel(),
        id: this.data.brand.id,
        brandName: this.brandName.value,
        description: this.description.value,
      };
    } else {
      return {
        ...new BrandModel(),
        brandName: this.brandName.value,
        description: this.description.value
      };
    }
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
