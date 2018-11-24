import { Component, OnInit, NgModule } from '@angular/core';
import { UserService } from '../services/userservices';
@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  providers: [UserService]
})
export class HomeComponent implements OnInit {
  data: any;
  constructor(private userService: UserService) { }

  ngOnInit() {
    this.getUsers();
  }
  getUsers() {
    this.userService.getUsers().pipe().subscribe(data => {
      this.data = data;
    });
  }
}
