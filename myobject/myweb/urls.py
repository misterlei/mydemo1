"""myobject URL Configuration

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
from django.conf.urls import url
from django.contrib import admin

from .  import views,shops

urlpatterns = [
    url(r'^$',views.index,name='index'),
    url(r'^lists/(?P<uid>[0-9]*)$',views.lists,name='lists'),
    # url(r'^lists/(?P<uid>[0-9]*)/(?P<uid>[0-9]*)$',views.lists,name='lists'),
    url(r'^detail/(?P<gid>[0-9]*)$',views.detail,name='detail'),
    #登录注册页
    url(r'^login$',views.login,name='login'),
    url(r'^dologin$',views.dologin,name='dologin'),
    url(r'^loginout$',views.loginout,name='loginout'),
    url(r'^zhuce$',views.zhuce,name='zhuce'),
    url(r'^zhucego$',views.zhucego,name='zhucego'),


    #购物车
    url(r'^shops$',shops.shops,name='shopcart'),
    url(r'^shopcartadd/(?P<sid>[0-9]+)$', shops.shopcartadd,name='shopcartadd'), #添加购物车
    url(r'^shopcartdel/(?P<sid>[0-9]+)$', shops.shopcartdel,name='shopcartdel'), #从购物车中删除一个商品
    url(r'^shopcartclear$', shops.shopcartclear,name='shopcartclear'), #清空购物车
    url(r'^shopcartchange$', shops.shopcartchange,name='shopcartchange'), #更改购物车中商品数量
    # url(r'^shopcartadd/(?P<sid>[0-9]*)$',shops.shopcartadd,name='shopcartadd')


    url(r'^ordersform$', shops.ordersform,name='ordersform'), #订单表单
    url(r'^ordersconfirm$', shops.ordersconfirm,name='ordersconfirm'), #订单确认
    url(r'^ordersinsert$', shops.ordersinsert,name='ordersinsert'), #执行订单添加
    url(r'^ordersinfo$', shops.ordersinfo,name='ordersinfo'), #订单信息
    url(r'^orderstui/(?P<uid>[0-9]+)$', shops.orderstui,name='orderstui'), #订单信息
    url(r'^ordersxiang/(?P<uid>[0-9]+)$', shops.ordersxiang,name='ordersxiang'), #订单信息


]
