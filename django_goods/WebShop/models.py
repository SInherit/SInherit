from django.db import models
from custom_user.models import UserProfile
# Create your models here.


class GoodsRecord(models.Model):
    """
    每购买一次商品的记录
    """
    order_id = models.CharField(verbose_name = "订单编号", max_length = 128, unique = True)
    classification = models.IntegerField(choices = ((0, "服装首饰"), (1, "家电数码"),
                                                    (2, "美食生鲜"), (3, "运动乐器"),
                                                    (4, "日用百货"), (5, "美妆洗护")),
                                         verbose_name = "分类")
    name = models.CharField(verbose_name = "商品名称", max_length = 256)
    discription = models.TextField(verbose_name = "描述")
    pic = models.ImageField(upload_to = "img", verbose_name = "图片")
    price = models.IntegerField(verbose_name = "价格")
    status = models.IntegerField(verbose_name = "状态", choices = ((-1, "购物车中"), (0, "未收货"), (1, "已收货")))
    count = models.IntegerField(verbose_name = "购买数量")
    adress = models.CharField(verbose_name = "收货地址", max_length = 256, default = '')
    phone = models.CharField(verbose_name = "联系人手机号", max_length = 11)
    create_at = models.DateTimeField(verbose_name = "购买时间", auto_now_add = True)
    user = models.ForeignKey(UserProfile, related_name="goods_record", on_delete=models.CASCADE)

    class Meta:
        verbose_name = '购买记录'
        verbose_name_plural = verbose_name



class Goods(models.Model):
    """
    商品
    """
    classification = models.IntegerField(choices = ((0, "服装首饰"), (1, "家电数码"),
                                                    (2, "美食生鲜"), (3, "美食生鲜"),
                                                    (4, "日用百货"), (5, "美妆洗护")),
                                         verbose_name = "分类")
    name = models.CharField(verbose_name = "商品名称", max_length = 256)
    discription = models.TextField(verbose_name = "描述", blank = False)
    has_sale = models.IntegerField(verbose_name = '付款人数', default = 0)
    pic = models.ImageField(upload_to = "img", verbose_name = "图片")
    price = models.IntegerField(verbose_name = "价格")
    counts = models.IntegerField(verbose_name = "库存")
    create_at = models.DateTimeField(verbose_name = "创建时间", auto_now_add = True)

    class Meta:
        verbose_name = '商品'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class CommentModel(models.Model):
    user = models.CharField(verbose_name = "评论人", max_length = 256,default = "游客")
    discription = models.TextField(verbose_name = "描述", blank = False)
    create_at = models.DateTimeField(verbose_name = "创建时间", auto_now_add = True)

    class Meta:
        verbose_name = '留言'
        verbose_name_plural = verbose_name
        ordering = ['-create_at']

    def __str__(self):
        return self.discription
