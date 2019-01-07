import os
import time
import random
from django.core.files.storage import FileSystemStorage
from google.cloud import storage
from django.conf import settings


class ImageStorage(FileSystemStorage):

    def __init__(self, location=settings.MEDIA_ROOT, base_url=settings.MEDIA_URL):
        super(ImageStorage, self).__init__(location, base_url)
        self.img_url = ''

    # 重写_save方法
    def _save(self, name, content):

        # 文件扩展名
        ext = os.path.splitext(name)[1]

        # 文件目录
        d = os.path.dirname(name)

        # 定义文件名，年月日时分秒随机数
        fn = time.strftime('%Y%m%d%H%M%S')
        fn = fn + '_{}'.format(random.randint(0, 100))
        destination = fn + ext
        print(destination)

        # 实例化google cloud
        storage_client = storage.Client()

        # 使用goods-images仓库
        bucket = storage_client.get_bucket(settings.GOOGLE_CLOUD_BUCKET_NAME)
        blob = bucket.blob(destination)
        # 源文件
        blob.upload_from_file(content)
        blob.make_public()
        self.img_url = blob.public_url
        print(self.img_url)
        print('-----------------------')
        return self.img_url
