# encoding: utf-8

from django.db import models
from custom_user.models import UserProfile
from .system.storage import ImageStorage

# Create your models here.


class GoodsRecord(models.Model):
    """
    每购买一次商品的记录
    """
    order_id = models.CharField(verbose_name = "order id", max_length = 128, unique = True)
    classification = models.IntegerField(choices = ((0, "Clothing and Accessories"), (1, "Eletricals"),
                                                    (2, "Food"), (3, "Sport and Leisure"),
                                                    (4, "Furniture"), (5, "Beauty")),
                                         verbose_name = "category")
    name = models.CharField(verbose_name = "product name", max_length = 256)
    discription = models.TextField(verbose_name = "description")
    pic = models.ImageField(upload_to = "img", verbose_name = "image")
    price = models.IntegerField(verbose_name = "price")
    status = models.IntegerField(verbose_name = "state", choices = ((-1, "in the list"), (0, "not receive"), (1, "received")))
    count = models.IntegerField(verbose_name = "purchase amount")
    adress = models.CharField(verbose_name = "trading address", max_length = 256, default = '')
    phone = models.CharField(verbose_name = "phone", max_length = 11)
    create_at = models.DateTimeField(verbose_name = "purchsing time", auto_now_add = True)
    user = models.ForeignKey(UserProfile, related_name="goods_record", on_delete=models.CASCADE)

    class Meta:
        verbose_name = 'purchase record'
        verbose_name_plural = verbose_name



class Goods(models.Model):
    """
    商品
    """
    classification = models.IntegerField(choices = ((0, "Clothing and Accessories"), (1, "Eletricals"),
                                                    (2, "Food"), (3, "Sport and Leisure"),
                                                    (4, "Furniture"), (5, "Beauty")),
                                         verbose_name = "category")
    name = models.CharField(verbose_name = "product name", max_length = 256)
    discription = models.TextField(verbose_name = "description", blank = False)
    has_sale = models.IntegerField(verbose_name = 'purchase num', default = 0)
    # pic = models.ImageField(upload_to = "img", verbose_name = "图片")
    pic = models.ImageField(upload_to = "img/%Y/%m/%d", verbose_name = "image", storage=ImageStorage())
    price = models.IntegerField(verbose_name = "price")
    counts = models.IntegerField(verbose_name = "inventory")
    create_at = models.DateTimeField(verbose_name = "create time", auto_now_add = True)

    class Meta:
        verbose_name = 'product'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CommentModel(models.Model):
    user = models.CharField(verbose_name = "Commentator", max_length = 256,default = "visitor")
    discription = models.TextField(verbose_name = "description", blank = False)
    create_at = models.DateTimeField(verbose_name = "create time", auto_now_add = True)

    class Meta:
        verbose_name = 'comment'
        verbose_name_plural = verbose_name
        ordering = ['-create_at']

    def __str__(self):
        return self.discription


class GoodsImage(models.Model):
    goods = models.OneToOneField(GoodsRecord, on_delete=models.CASCADE)
    online_image_url = models.URLField(verbose_name='third party url address')

    def __str__(self):
        return self.online_image_url