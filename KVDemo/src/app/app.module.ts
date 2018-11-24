import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { AppComponent } from './app.component';
import { RoutingModule } from './app.routes';
import { UiModule } from './ui/ui.module';
import { AccountModule } from './account/account.module';
import { DashboardComponent } from './dashboard/dashboard.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { TransactionComponent } from './transaction/transaction.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { UploaddocumentComponent } from './uploaddocument/uploaddocument.component';
@NgModule({
   declarations: [
      AppComponent,
      DashboardComponent,
      TransactionComponent,
      UploaddocumentComponent,
   ],
   imports: [
      BrowserModule,
      RoutingModule,
      UiModule,
      BrowserAnimationsModule,
      FormsModule,
      HttpClientModule,
      AccountModule
   ],
   providers: [],
   bootstrap: [
      AppComponent
   ]
})
export class AppModule { }
