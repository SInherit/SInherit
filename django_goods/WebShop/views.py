import uuid
import json
from django.shortcuts import render
from django.core import serializers
from django.views.generic.base import View
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import EmptyPage, PageNotAnInteger
from django.db.models import Q
from django.views.decorators.csrf import csrf_exempt
# Create your views here.


class LoginRequiredMixin(object):
    """
    登陆限定，并指定登陆url
    """
    @classmethod
    def as_view(cls, **initkwargs):
        view = super(LoginRequiredMixin, cls).as_view(**initkwargs)
        return login_required(view, login_url='/custom-user/login')


class HomeView(LoginRequiredMixin, View):

    @csrf_exempt
    def dispatch(self, *args, **kwargs):
        return super(HomeView, self).dispatch(*args, **kwargs)

    def get(self, request):
        return render(request, 'home.html')