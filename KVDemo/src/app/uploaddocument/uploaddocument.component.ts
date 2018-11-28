import { UserService } from './../services/userservices';
import { HttpEventType } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-uploaddocument',
  templateUrl: './uploaddocument.component.html'
})
export class UploaddocumentComponent implements OnInit  {

  constructor(private userService: UserService) { }

  ngOnInit() {
    this.getUsers();
  }
  PostList() {
    this.userService.PostList().subscribe(event => {
      console.log(event);
   });
  }
  upload (files) {
    if (files.length === 0) {
      return;
    }
    const formData = new FormData();
    for (const file of files) {
      formData.append(file.name, file);
    }
    this.userService.UploadFile(formData).subscribe(event => {
       console.log(event);
    });
  }
  getUsers() {
    this.userService.getUsers().pipe().subscribe(data => {
      console.log(data);
    });
  }
}
