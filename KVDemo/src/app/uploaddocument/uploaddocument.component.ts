import { Component } from '@angular/core';
import { HttpClient, HttpRequest, HttpEventType, HttpResponse } from '@angular/common/http';

@Component({
  selector: 'app-uploaddocument',
  templateUrl: './uploaddocument.component.html'
})
export class UploaddocumentComponent {
  public progress: number;
  public message: string;
  constructor(private http: HttpClient) { }
  isDisabled = true;
  upload(files) {
    if (files.length === 0) {
      return;
    }
    const formData = new FormData();

    for (const file of files) {
      formData.append(file.name, file);
    }
    const uploadReq = new HttpRequest('POST', `api/upload`, formData, {
      reportProgress: true,
    });

    this.http.request(uploadReq).subscribe(event => {
      if (event.type === HttpEventType.UploadProgress) {
        this.progress = Math.round(100 * event.loaded / event.total);
      } else if (event.type === HttpEventType.Response) {
        this.message = event.body.toString();
      }
    });
  }
}

// import { Component, OnInit } from '@angular/core';

// @Component({
//   selector: 'app-uploaddocument',
//   templateUrl: './uploaddocument.component.html',
//   styles: []
// })
// export class UploaddocumentComponent implements OnInit {

//   constructor() { }

//   ngOnInit() {
//   }

// }
