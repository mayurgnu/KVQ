// import { BsDatepickerModule } from '@ngx-bootstrap/datepicker';
import { Component, OnInit } from '@angular/core';
import { User } from '../../shared/model';
import { BsDatepickerConfig } from 'ngx-bootstrap/datepicker';
import { FormGroup, FormControl, FormBuilder, Validators } from '@angular/forms';
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
    { id: '', name: '--Select department--' },
    { id: 1, name: 'Help Desk' },
    { id: 2, name: 'HR' },
    { id: 3, name: 'IT' },
    { id: 4, name: 'Payroll' }
  ];
  department = '';
  employeeForm: FormGroup;
  constructor(private fb: FormBuilder) {
    this.datePickerConfig = Object.assign({},
      {
        containerClass: 'theme-dark-blue',
        showWeekNumbers: false,
        dateInputFormat: 'DD/MM/YYYY'
      });
  }
  gender: string;

  // Simple Syntax Of Reactive Forms using FormGroup & FormControl().
  // ngOnInit() {
  //   this.employeeForm = new FormGroup({
  //     fullName: new FormControl(),
  //     email: new FormControl(),
  //   })
  // }

  // Example Using FormBuilder
  ngOnInit() {
    this.employeeForm = this.fb.group({
      fullName: ['', [Validators.required, Validators.minLength(2), Validators.maxLength(10)]],
      email: ['', [Validators.required]],
      phoneNumber: ['', [Validators.required]],
      contactPreference: ['', [Validators.required]],
      gender: ['', [Validators.required]],
      isActive: ['', [Validators.required]],
      department: ['', [Validators.required]],
      dateOfBirth: ['', [Validators.required]],
      profilepicture: ['', [Validators.required]],
      birthdate: ['', [Validators.required]],
      isloginallowed: ['', [Validators.required]],
      isemailverified: ['', [Validators.required]],
      rememberme: ['', [Validators.required]],
      photo: ['', [Validators.required]]
    });

    // <==========================KV Part :- Part-7======================>
    // if we use this.employeeForm.setValue than
    // we must have to pass value for all controls of this.employeeForm.
    // this.employeeForm.setValue({department: ''});

    // while in this.employeeForm.patchValue we can set value
    // particular controls of this.employeeForm.
    this.employeeForm.patchValue({ department: '' });
    // <==========================KV Part :- Part-7=======================>

    // <==========================KV Part :- Part-10======================>
    // Subscribe to valueChanges observable
    this.employeeForm.get('fullName').valueChanges.subscribe(
      value => {
        console.log(value);
        alert(value);
      }
    );
    // <==========================KV Part :- Part-10======================>

  }

  checked(e) {
    console.log(e);
  }
  saveEmployee(employeeForm: User) {
    console.log(this.employeeForm);
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
