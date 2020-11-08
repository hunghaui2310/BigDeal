import { Component, OnInit } from '@angular/core';
import {TranslateService} from '@ngx-translate/core';

@Component({
  selector: 'app-languages',
  templateUrl: './languages.component.html',
  styleUrls: ['./languages.component.css']
})
export class LanguagesComponent implements OnInit {
  constructor(public translate: TranslateService) {
    translate.addLangs(['en', 'vi']);

    const browserLang = translate.getBrowserLang();
    translate.use(browserLang.match(/en|vi/) ? browserLang : 'en');
  }

  ngOnInit(): void {
  }

}
