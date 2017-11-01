from django.shortcuts import redirect
from django.core.urlresolvers import reverse

import re

class AdminMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response
        # One-time configuration and initialization.
        #print("AdminMiddleware")

    def __call__(self, request):

        # 定义网站后台不用登录也可访问的路由url
        #定义需要的登录的网页
        urllist = ['/myweb/verify','/ordersform','/ordersconfirm','/ordersinsert','/ordersinfo','/ordersxiang','/orderstui']
        # 获取当前请求路径
        path = request.path
        #print("Hello World!"+path)
        print(re.match('',path),'真假')
        # 判断当前请求是否是访问网站后台,并且path不在urllist中
        # print(path in urllist,'这个到底是真还是假')
        if re.match('',path) and (path in urllist):
            # 判断当前用户是否没有登录
            if "vipuser" not in request.session:
                # 执行登录界面跳转
                return redirect(reverse('login'))


        response = self.get_response(request)

        # Code to be executed for each request/response after
        # the view is called.

        return response
