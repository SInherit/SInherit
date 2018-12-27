#!/usr/bin/env python
# -*- coding: utf-8 -*-
__version__ = '1.0.0.0'

"""
@brief 简介 
@details 详细信息
@author  wuhuafeng
@data    2018-03-02 
"""
from django.conf.urls import url
from .views import RegisterView, LoginView, LogoutView

urlpatterns = [
    url('register/', RegisterView.as_view(), name="register"),
    url('login/', LoginView.as_view(), name="login"),
    url('logout/', LogoutView.as_view(), name="logout"),
]