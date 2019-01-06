# encoding: utf-8
import uuid
import json
from django.shortcuts import render
from django.core import serializers
from django.views.generic.base import View
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from .models import Goods, GoodsRecord, CommentModel
from common.custom_paginator import CustomPaginator
from django.core.paginator import EmptyPage, PageNotAnInteger
from django.db.models import Q
from django.views.decorators.csrf import csrf_exempt
import os
# Create your views here.


class HomeView(View):
    def get(self, request):
        good_type = request.GET.get('type', 0)
        goods = Goods.objects.filter(classification = good_type)
        commends = CommentModel.objects.all()[0:8]
        return render(request, 'home.html', {'goods': goods, "commends": commends})


class GoodsDetail(View):
    def get(self, request):
        good_id = int(request.GET.get("id"))
        good_item = Goods.objects.get(id = good_id)
        return render(request, 'good_item.html', {'good_item': good_item})

    def post(self, request):
        _type = int(request.POST.get("type"))
        good_id = int(request.POST.get("good_id"))
        good_item = Goods.objects.get(id = good_id)
        user = request.user
        adress = request.POST.get("adress")
        phone_number = int(request.POST.get("phone_number"))
        buy_count = int(request.POST.get("buy_count"))
        order_id = uuid.uuid1()
        data = {"order_id": order_id, "classification": good_item.classification, "name": good_item.name,
                "discription": good_item.discription, "pic": good_item.pic, "price": good_item.price,
                "status": _type, "count": buy_count, "adress": adress, "phone": phone_number, "user": user
                }
        try:
            GoodsRecord.objects.create(**data)
            if _type == 0:
                good_item.counts -= buy_count
                good_item.save()
        except Exception as e:
            return HttpResponse(json.dumps({"code": -1, "msg": "%s" % e}), content_type = 'application/json')
        if _type == 0:
            return HttpResponse(json.dumps({"code": 0, "msg": "purchase successfully,wait for reply"}), content_type = 'application/json')#wogai
        return HttpResponse(json.dumps({"code": 0, "msg": "adding list successfully"}), content_type = 'application/json')#wogai


class LoginRequiredMixin(object):
    """
    登陆限定，并指定登陆url
    """
    @classmethod
    def as_view(cls, **initkwargs):
        view = super(LoginRequiredMixin, cls).as_view(**initkwargs)
        return login_required(view, login_url='/custom-user/login')


class HelpView(LoginRequiredMixin, View):
    def get(self, request):
        return render(request, "help.html")


class GouWuCheView(LoginRequiredMixin, View):
    def get(self, request):
        user = request.user
        goods_records = user.goods_record.order_by('-create_at').all().filter(status=-1)
        return render(request, 'gouwuche.html', {"goods_records": goods_records})

    def delete(self, request):
        good_id = request.GET.get("id")
        GoodsRecord.objects.filter(id=good_id).delete()
        return HttpResponse(json.dumps({"code": 0, "msg": "success"}),content_type = 'application/json')

    @csrf_exempt
    def dispatch(self, *args, **kwargs):
        return super(GouWuCheView, self).dispatch(*args, **kwargs)


class DingDanView(LoginRequiredMixin, View):
    def get(self, request):
        user = request.user
        goods_records = user.goods_record.order_by('-create_at').all().filter(~Q(status= 1))
        current_page = request.GET.get("page", '1')
        paginator = CustomPaginator(current_page, 9, goods_records, 10)
        try:
            paginator = paginator.page(current_page)  #获取前端传过来显示当前页的数据
        except PageNotAnInteger:
            # 如果有异常则显示第一页
            paginator = paginator.page(1)
        except EmptyPage:
            # 如果没有得到具体的分页内容的话,则显示最后一页
            paginator = paginator.page(paginator.num_pages)
        return render(request, 'dingdan.html', {"goods_records": goods_records,"paginator":paginator})


class CommentView(View):
    def get(self, request):
        # comment_id = int(request.GET.get("id"))
        # commends = CommentModel.objects.filter(id__gt=comment_id)
        commends = CommentModel.objects.all()[0:8]
        json_data = serializers.serialize("json", commends)
        return HttpResponse(json.dumps(json_data), content_type = 'application/json')

    @csrf_exempt
    def dispatch(self, *args, **kwargs):
        return super(CommentView, self).dispatch(*args, **kwargs)

    def post(self, request):
        try:
            user_name = "visitor"   #wogai
            if request.user.is_authenticated:
                user_name = request.user.username
            des = request.POST.get("des")
            CommentModel.objects.create(user=user_name, discription = des)
        except Exception as e:
            return HttpResponse(json.dumps({"code": -1, "msg": "error:%s" % e}), content_type = 'application/json')
        return HttpResponse(json.dumps({"code": 0, "msg": "success"}), content_type = 'application/json')

