#!/usr/bin/env python
# -*- coding: utf-8 -*-
__version__ = '1.0.0.0'


import re
from django import forms
from django.core.exceptions import ValidationError

def mobile_validate(value):
    mobile_re = re.compile(r'^(07[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$')
    if not mobile_re.match(value):
        raise ValidationError('Wrong format of phone number')


class RegisterForm(forms.Form):
    uname = forms.CharField(required=True, error_messages={"invalid": u"User name format error", "required": "username cannot be null"})
    email = forms.EmailField(required=True, error_messages={"invalid": u"Incorrect mailbox format", "required": "email cannot be null"})
    mobile = forms.CharField(required = True, validators=[mobile_validate, ], error_messages = {"required": "phone cannot be null"})
    pwd = forms.CharField(required=True, min_length=5, error_messages={"invalid": u"The password is in the wrong format and must be greater than 5 characters.",
                                                                       "required": "password cannot be null"})


class LoginForm(forms.Form):
    uname = forms.CharField(required=True)
    pwd = forms.CharField(required=True, min_length=5)

