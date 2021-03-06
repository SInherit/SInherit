"""
Django settings for django_goods project.

Generated by 'django-admin startproject' using Django 1.11.6.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.11/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'g_x(ok1a09gg+)dgx(m3)w=h@y=!y9%85g9-t5ow*8#%_2@&2h'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'WebShop',
    'custom_user'
]

AUTH_USER_MODEL = "custom_user.UserProfile"
AUTHENTICATION_BACKENDS = (
    'custom_user.views.CustomBackend',
)

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'django_goods.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS':[os.path.join(BASE_DIR, 'templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
            # "libraries": {
            #     "webshop_extras": "WebShop.templatetags.webshop_extras"
            # }
        },
    },
]

WSGI_APPLICATION = 'django_goods.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {
	'default': {
		'ENGINE': 'django.db.backends.mysql',
		'HOST': '35.198.160.22',
		# 'HOST': '127.0.0.1',
        'PORT': '3306',
		'NAME': 'django_goods',
		'USER': 'root',
		# 'PASSWORD': '',
		'PASSWORD': 'root',
	}
}

#if os.getenv('GAE_APPLICATION', None):
#    DATABASES = {
#        'default': {
#            'ENGINE': 'django.db.backends.mysql',
#            'HOST': '/cloudsql/django-goods:asia-east2:django',
#			'NAME': 'django_goods',
#            'USER': 'root',
#            'PASSWORD': 'root', 
#        }
#    }
#else:
#    DATABASES = {
#        'default': {
#            'ENGINE': 'django.db.backends.mysql',
#            'HOST': '127.0.0.1',
#            'PORT': '3306',
#            'NAME': 'django_goods',
#            'USER': 'root',
#            'PASSWORD': 'root',
#        }
#    }
	
# Password validation
# https://docs.djangoproject.com/en/1.11/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

LANGUAGE_CODE = 'zh-hans'

TIME_ZONE = 'Asia/Shanghai'
USE_I18N = True

USE_L10N = True

USE_TZ = False


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.0/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = 'static'

#STATICFILES_DIRS = (
#    os.path.join(BASE_DIR, "static"),
#)

# MEDIA_ROOT = os.path.join(BASE_DIR, 'static', 'media').replace('\\', '/')
# MEDIA_URL = "media/"

GOOGLE_APPLICATION_CREDENTIALS = os.path.join(
    os.path.dirname(
        os.path.dirname(
            os.path.abspath(__file__)
        )
    ), 'slnherit-53559c367579.json'
)

GOOGLE_CLOUD_BUCKET_NAME = 'goods_images'
# print(os.environ['GOOGLE_APPLICATION_CREDENTIALS'])