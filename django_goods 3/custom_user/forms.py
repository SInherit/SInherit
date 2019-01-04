#!/usr/bin/env python
# -*- coding: utf-8 -*-
__version__ = '1.0.0.0'


import re
from django import forms
from django.core.exceptions import ValidationError

def mobile_validate(value):
    mobile_re = re.compile(r'^(07[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$')
    if not mobile_re.match(value):
        raise ValidationError('手机号码格式错误')


class RegisterForm(forms.Form):
    uname = forms.CharField(required=True, error_messages={"invalid": u"用户名格式错误", "required": "用户名不能为空"})
    email = forms.EmailField(required=True, error_messages={"invalid": u"邮箱格式错误", "required": "邮箱不能为空"})
    mobile = forms.CharField(required = True, validators=[mobile_validate, ], error_messages = {"required": "手机号不能为空"})
    pwd = forms.CharField(required=True, min_length=5, error_messages={"invalid": u"密码格式错误,必须大于5个字符",
                                                                       "required": "密码不能为空"})


class LoginForm(forms.Form):
    uname = forms.CharField(required=True)
    pwd = forms.CharField(required=True, min_length=5)

