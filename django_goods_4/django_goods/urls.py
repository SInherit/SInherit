"""django_goods URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url,include
from django.contrib import admin
from WebShop.views import *

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url('^$', HomeView.as_view(), name='home'),
    url('^custom-user/', include('custom_user.urls')),
    url('goods-item/', GoodsDetail.as_view(), name='goods-item'),
    url('gouwuche/', GouWuCheView.as_view(), name='gouwuche'),
    url('dingdan/', DingDanView.as_view(), name='dingdan'),
    url('liuyan_save/', CommentView.as_view(), name='liuyan_save'),
    url('help/', HelpView.as_view(), name="help"),
]

# from django.views.static import serve
# from .settings import MEDIA_ROOT
# urlpatterns += [url(r'^media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),]