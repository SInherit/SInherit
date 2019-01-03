# encoding: utf-8
from django.contrib import admin
from .models import Goods, GoodsRecord
from django.forms import TextInput, Textarea
from django.db import models
from django.utils.html import format_html
# Register your models here.


class GoodsAdmin(admin.ModelAdmin):
    list_display = ('classification', 'name', 'discription', 'show_image', 'has_sale', 'price', 'counts', 'create_at')
    search_fields = ('name',)
    list_filter = ('classification', 'create_at')
    list_per_page = 20
    ordering = ('-create_at',)
    list_editable = ('name', 'discription')
    formfield_overrides = {
        models.CharField: {'widget': TextInput(attrs={'size': '20'})},
        models.TextField: {'widget': Textarea(attrs={'rows': 3, 'cols': 40})},
    }

    def show_image(self, obj):
        """自定义列表字段"""
        return format_html("<a href='{0}'><img src='{0}' style='width:50px;height:50px;'></img> </a>".format(obj.pic))
    show_image.short_description = '图片'


class GoodsRecordAdmin(admin.ModelAdmin):
    list_display = ('order_id', 'name', 'discription', 'show_image', 'price', 'count',
                    'status', 'adress', 'phone', 'user', 'create_at')
    search_fields = ('name', 'user__username')
    list_filter = ('create_at',)
    list_per_page = 20
    ordering = ('-create_at',)
    list_editable = ('name', 'discription')
    formfield_overrides = {
        models.CharField: {'widget': TextInput(attrs={'size': '20'})},
        models.TextField: {'widget': Textarea(attrs={'rows': 3, 'cols': 30})},
    }
    def show_image(self, obj):
        """自定义列表字段"""
        return format_html("<a href='{0}'><img src='{0}' style='width:50px;height:50px;'></img> </a>".format(obj.pic))

    show_image.short_description = '图片'

admin.site.site_header = '在线web购物管理系统'
admin.site.site_title = '在线web购物管理系统'
admin.site.register(Goods, GoodsAdmin)
admin.site.register(GoodsRecord, GoodsRecordAdmin)
