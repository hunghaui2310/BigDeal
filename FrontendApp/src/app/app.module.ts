import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TopNavComponent } from './layouts/top-nav/top-nav.component';
import { HomeComponent } from './component/home/home.component';
import { HeaderComponent } from './layouts/header/header.component';
import { NavbarComponent } from './layouts/navbar/navbar.component';
import { SliderStartComponent } from './layouts/slider-start/slider-start.component';
import { CollectionBannerStartComponent } from './layouts/collection-banner-start/collection-banner-start.component';
import { BrandPanelComponent } from './layouts/brand-panel/brand-panel.component';
import { ServiceStartComponent } from './layouts/service-start/service-start.component';
import { MediaBannerComponent } from './layouts/media-banner/media-banner.component';
import { DiscountBannerComponent } from './layouts/discount-banner/discount-banner.component';
import { CollectionBannerComponent } from './layouts/collection-banner/collection-banner.component';
import { MediaTabComponent } from './layouts/media-tab/media-tab.component';
import { DealBannerComponent } from './layouts/deal-banner/deal-banner.component';
import { RoundedCategoryComponent } from './layouts/rounded-category/rounded-category.component';
import { BlogStartComponent } from './layouts/blog-start/blog-start.component';
import { BoxCategoryComponent } from './layouts/box-category/box-category.component';
import { ProductComponent } from './layouts/product/product.component';
import { TestimonialComponent } from './layouts/testimonial/testimonial.component';
import { InstagramComponent } from './layouts/instagram/instagram.component';
import { NewsleatterComponent } from './layouts/newsleatter/newsleatter.component';
import { ContactBannerComponent } from './layouts/contact-banner/contact-banner.component';
import { FooterComponent } from './layouts/footer/footer.component';
import { TapToTopComponent } from './layouts/tap-to-top/tap-to-top.component';
import { AddToCartBarComponent } from './layouts/add-to-cart-bar/add-to-cart-bar.component';
import { NewsletterModalPopupComponent } from './layouts/newsletter-modal-popup/newsletter-modal-popup.component';
import { QuickViewModalPopupComponent } from './layouts/quick-view-modal-popup/quick-view-modal-popup.component';
import { MyAccountBarComponent } from './layouts/my-account-bar/my-account-bar.component';
import { AddToWishlistBarComponent } from './layouts/add-to-wishlist-bar/add-to-wishlist-bar.component';
import { AddToSettingBarComponent } from './layouts/add-to-setting-bar/add-to-setting-bar.component';
import { NotificationProductComponent } from './layouts/notification-product/notification-product.component';
import { CartComponent } from './component/cart/cart.component';
import { BreadcrumbComponent } from './layouts/breadcrumb/breadcrumb.component';
import {HttpClientModule} from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent,
    TopNavComponent,
    HomeComponent,
    HeaderComponent,
    NavbarComponent,
    SliderStartComponent,
    CollectionBannerStartComponent,
    BrandPanelComponent,
    ServiceStartComponent,
    MediaBannerComponent,
    DiscountBannerComponent,
    CollectionBannerComponent,
    MediaTabComponent,
    DealBannerComponent,
    RoundedCategoryComponent,
    BlogStartComponent,
    BoxCategoryComponent,
    ProductComponent,
    TestimonialComponent,
    InstagramComponent,
    NewsleatterComponent,
    ContactBannerComponent,
    FooterComponent,
    TapToTopComponent,
    AddToCartBarComponent,
    NewsletterModalPopupComponent,
    QuickViewModalPopupComponent,
    MyAccountBarComponent,
    AddToWishlistBarComponent,
    AddToSettingBarComponent,
    NotificationProductComponent,
    CartComponent,
    BreadcrumbComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
