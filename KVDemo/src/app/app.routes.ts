import { UploaddocumentComponent } from './uploaddocument/uploaddocument.component';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HomeComponent } from './home/home.component';
import { AboutComponent } from './about/about.component';
import { ContactComponent } from './contact/contact.component';
import { RouterModule, Routes } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import {DataTableModule} from 'angular-6-datatable';


const appRoutes: Routes = [
    { path: '', component: DashboardComponent },
    { path: 'home', component: HomeComponent },
    { path: 'about', component: AboutComponent },
    { path: 'contact', component: ContactComponent },
    { path: 'uploaddoc', component: UploaddocumentComponent },
];

@NgModule({
  declarations: [
    HomeComponent,
    AboutComponent,
    ContactComponent
  ],
  imports: [
    BrowserModule,
    DataTableModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [],
  bootstrap: [],
  exports: [RouterModule]
})
export class RoutingModule { }
