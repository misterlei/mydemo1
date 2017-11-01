from django.conf.urls import url
# from django.contrib import admin
from . import views,types,goods,centers
urlpatterns = [
	#后台首页
    url(r'^$',views.index,name='myadmin_index'),
   # url(r'^(?P<index>\w+)$',views.index,name='index'),
   #后台管理
    url(r'^users$',views.usersindex,name='myadmin_users'),
    url(r'^usersadd$', views.usersadd, name="myadmin_usersadd"),

    url(r'^users$', views.usersindex, name="myadmin_usersindex"),
    url(r'^usersadd$', views.usersadd, name="myadmin_usersadd"),
    url(r'^usersinsert$', views.usersinsert, name="myadmin_usersinsert"),
    url(r'^usersdel/(?P<uid>[0-9]+)$', views.usersdel, name="myadmin_usersdel"),
    url(r'^usersedit/(?P<uid>[0-9]+)$', views.usersedit, name="myadmin_usersedit"),
    url(r'^usersupdate/(?P<uid>[0-9]+)$', views.usersupdate, name="myadmin_usersupdate"),
    # url(r'^$',views.userstype,name='myadmin_userstype'),

    #登录路由
    url(r'^login$', views.login, name="myadmin_login"),
    url(r'^dologin$', views.dologin, name="myadmin_dologin"),
    url(r'^logout$', views.logout, name="myadmin_logout"),
    url(r'^verify$', views.verify, name="myadmin_verify"),



    #商品类别
    url(r'^types$',types.index,name='myadmin_type'),
    url(r'^typesadd$',types.add,name='myadmin_typeadd'),
    url(r'^typesinsert$',types.insert,name='myadmin_typeinsert'),

    #类型添加子类
    url(r'^typesadds/(?P<uid>[0-9]+)$',types.typeadds,name='myadmin_typeadds'),
    url(r'^typesadds$',types.addsinsert,name='myadmin_addsinsert'),

    url(r'^typesdel/(?P<uid>[0-9]+)$',types.dels,name='myadmin_typedel'),
    url(r'^typesedit/(?P<uid>[0-9]+)$',types.edit,name='myadmin_typeedit'),
    url(r'^typesupdate/(?P<uid>[0-9]+)$',types.update,name='myadmin_typeupdate'),



    #商品详情
    url(r'^goods$',goods.index,name='myadmin_goods'),
    url(r'^goodsadd$',goods.goodsadd,name='myadmin_goodsadd'),
    url(r'^goodsinsert$',goods.goodsinsert,name='myadmin_goodsinsert'),
    url(r'^goodsdel/(?P<uid>[0-9]+)$',goods.goodsdel,name='myadmin_goodsdel'),
    url(r'^goodsedit/(?P<uid>[0-9]+)$', goods.goodsedit, name="myadmin_goodsedit"),
    url(r'^goodsupdate/(?P<uid>[0-9]+)$', goods.goodsupdate, name="myadmin_goodsupdate"),

    #订单详情
    url(r'^centers$',centers.centers,name='myadmin_centers'),
    url(r'^centersdel/(?P<uid>[0-9]+)$',centers.centersdel,name='myadmin_centersdel'),
    url(r'^centersedit/(?P<uid>[0-9]+)$',centers.centersedit,name='myadmin_centersedit'),
    url(r'^xiangqing/(?P<uid>[0-9]+)$',centers.xiangqing,name='myadmin_xiangqing'),



]
