import { environment } from './../../environments/environment';
import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
// import {User} from "../model/user.model";

@Injectable()
export class UserService {
  constructor(private http: HttpClient) { }
  // baseUrl: string = 'http://localhost:8080/user-portal/users';
  headers = new HttpHeaders().set('Content-Type', 'application/json');

  getUsers() {
    return this.http.get(environment.apiUrl + 'User/GetAllUser');
  }
  Login(model: any) {
    return this.http.post(environment.apiUrl + 'Account/Login', model);
  }
  SaveUser(obj: any) {
    return this.http.post(environment.apiUrl + 'User/SaveUser', obj);
  }

  // UploadFile(obj: any) {
  //   const objData = { 'id': 1 , 'name' : 'gnu' };
  //   return this.http.post(environment.apiUrl + 'User/UploadFile', objData);
  // }
  PostList() {
    const obj = [{ 'id': 1, 'name': 'gnu' }, { 'id': 2, 'name': 'gnu2' }, { 'id': 3, 'name': 'gnu3' }];
    return this.http.post(environment.apiUrl + 'User/PostList', obj);
  }
  UploadFile(file: any) {
    return this.http.post(environment.apiUrl + 'User/UploadFile', file);
  }

  //   getUserById(id: number) {
  //     return this.http.get<User>(this.baseUrl + '/' + id);
  //   }

  //   createUser(user: User) {
  //     return this.http.post(this.baseUrl, user);
  //   }

  //   updateUser(user: User) {
  //     return this.http.put(this.baseUrl + '/' + user.id, user);
  //   }

  //   deleteUser(id: number) {
  //     return this.http.delete(this.baseUrl + '/' + id);
  //   }
}
