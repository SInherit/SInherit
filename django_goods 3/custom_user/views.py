# encoding: utf-8
from django.shortcuts import render
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from .forms import RegisterForm, LoginForm
from .models import UserProfile
from django.contrib.auth import authenticate, login, logout
from django.urls import reverse
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.contrib.auth.models import Group

# Create your views here.
class RegisterView(View):

    def get(self, request):
        return render(request, "register.html")

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get("uname")
            if UserProfile.objects.filter(username=user_name):
                return render(request, "register.html", {"register_form": register_form, "msg": "User already exists"})
            email = request.POST.get("email")
            if email.find('@soton.ac.uk')==-1:
                return render(request, "register.html", {"register_form": register_form,"msg":"The mailbox format is incorrect."})
            mobile = request.POST.get("mobile")
            pwd = request.POST.get("pwd")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = email
            user_profile.mobile = mobile
            user_profile.is_active = True
            user_profile.set_password(pwd)
            user_profile.is_staff = True
            # user_profile.password = make_password(pwd)
            user_profile.save()
            mygroup = Group.objects.get(name='sell')
            user_profile.groups.add(mygroup)
            return render(request, "login.html")
        else:
            return render(request, "register.html", {"register_form": register_form})


class LogoutView(View):
    """
    用户登出
    """
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("home"))


class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LoginView(View):
    def get(self, request):
        return render(request, "login.html", {})

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("uname", "")
            pass_word = request.POST.get("pwd", "")
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect(reverse("home"))
                else:
                    return render(request, "login.html", {"msg": "user not active！"})
            else:
                return render(request, "login.html", {"msg": "error with id/password！"})
        else:
            return render(request, "login.html", {"login_form": login_form})
