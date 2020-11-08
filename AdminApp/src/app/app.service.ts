import { Injectable } from '@angular/core';
import {ToastrService} from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class AppService {

  constructor(private toastrService: ToastrService) { }

  showSuccess(message: string): void {
    this.toastrService.success(message);
  }

  showError(message: string): void {
    this.toastrService.error(message);
  }
}
