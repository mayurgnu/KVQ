// import { BsDatepickerModule } from '@ngx-bootstrap/datepicker';
import { Component, OnInit } from '@angular/core';
import { User } from '../../shared/model';
import { BsDatepickerConfig } from 'ngx-bootstrap/datepicker';
// E:\MyComplteDemo\KV\KVDemo\node_modules\ngx-date-picker\datepicker
@Component({
  selector: 'app-pragim',
  templateUrl: './pragim.component.html',
  styleUrls: ['./pragim.component.css'],
  providers: [User]
})
export class PragimComponent implements OnInit {
  datePickerConfig: Partial<BsDatepickerConfig>;
  previewPhoto = false;
  photoPath = '';
  departments = [
    { id: 1, name: 'Help Desk' },
    { id: 2, name: 'HR' },
    { id: 3, name: 'IT' },
    { id: 4, name: 'Payroll' }
  ];
  constructor(private _user: User) {
    this.user = _user;
    this.datePickerConfig = Object.assign({},
      {
        containerClass: 'theme-dark-blue',
        showWeekNumbers: false,
        dateInputFormat: 'DD/MM/YYYY'
      });
  }
  gender: string;
  user: User;
  ngOnInit() {
    this.user.department = undefined;
  }
  checked(e) {
    console.log(e);
  }
  saveEmployee(employeeForm: User) {
    console.log(this.user);
  }
  photoBrowse(event) {
    this.previewPhoto = true;
    if (event.target.files && event.target.files[0]) {
      const reader = new FileReader();
      reader.onload = (evt: ProgressEvent) => {
        this.photoPath = (<FileReader>evt.target).result;
        // this.user.photo = event.target.files[0].name;
      };
      reader.readAsDataURL(event.target.files[0]);
    }
  }
}
