/* tslint:disable:no-unused-variable */
import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { By } from '@angular/platform-browser';
import { DebugElement } from '@angular/core';

import { PragimComponent } from './pragim.component';

describe('PragimComponent', () => {
  let component: PragimComponent;
  let fixture: ComponentFixture<PragimComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PragimComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PragimComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
