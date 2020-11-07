import {Component, Input, OnInit} from '@angular/core';
import {BreadcrumbModel} from '../../model/breadcrumb.model';

@Component({
  selector: 'app-breadcrumb',
  templateUrl: './breadcrumb.component.html',
  styleUrls: ['./breadcrumb.component.scss']
})
export class BreadcrumbComponent implements OnInit {

  @Input() title: string;
  @Input() breadcrumbs: BreadcrumbModel[];
  constructor() { }

  ngOnInit(): void {
  }

}
