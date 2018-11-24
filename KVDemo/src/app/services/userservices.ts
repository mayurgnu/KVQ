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
