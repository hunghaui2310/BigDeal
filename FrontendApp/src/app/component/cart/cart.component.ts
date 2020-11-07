import { Component, OnInit } from '@angular/core';
import {BreadcrumbModel} from '../../model/breadcrumb.model';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss']
})
export class CartComponent implements OnInit {

  titleCart = 'Cart';
  breadcrumbs: BreadcrumbModel[] = [
    { link: 'home', value: 'Home'},
    { link: 'cart', value: 'Cart'}
  ];
  constructor() { }

  ngOnInit(): void {
  }

}
