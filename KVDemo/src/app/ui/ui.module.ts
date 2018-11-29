
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LayoutComponent } from './layout/layout.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { RouterModule, Routes } from '@angular/router';
import { ArticlesComponent } from './articles/articles.component';
import { PragimComponent } from './pragim/pragim.component';
import { ReactiveFormsModule } from '../../../node_modules/@angular/forms';
import { SidebarComponent } from './sidebar/sidebar.component';

import { BsDatepickerModule } from 'ngx-bootstrap/datepicker';

const component = [ArticlesComponent, FooterComponent, HeaderComponent, LayoutComponent, PragimComponent, SidebarComponent];

const appRoutes: Routes = [
  { path: 'articles', component: ArticlesComponent },
  { path: 'pragim', component: PragimComponent }
];


@NgModule({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    BsDatepickerModule.forRoot(),
    RouterModule.forRoot(appRoutes)
  ],
  declarations: [...component, SidebarComponent],
  exports: [...component],
})
export class UiModule { }
