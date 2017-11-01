from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse

from myadmin.models import Users,Orders,Detail,Goods
import time

#后台首页
def centers(request):
    lists=Orders.objects.filter()
    # # for i in request.session['shoplist'].items():
    # #     print(i,'a456sdsdsd')
    # for i in request.session['shoplist'].values():
    #     for k in lists:
    #         if k.id==i['id']:
    #             k.picname=i["picname"]
    # lists=request.session['shoplist'].values()
    a=Orders.objects.filter()
    # b=Detail.objects.filter()   
    # for i in a:
    #     for j in b:
    #         if i.id==j.id:
    #             for k in lists:
    #                 i.picname=k.picname

    # lists=request.session['shoplist'].values()
    # for i in a:
    #     for j in lists:
    #         if i.id==j['id']:
    #             i.picname=j['picname']
    # lists.update(a)
    # print(a)
    	# lists['picname']=i["picname"]

    	#print(lists)
    	#print(lists['id'])
    	#for q in lists.values():
    		    
    # for i,j in request.session['shoplist'].items():
    # 	print(j['picname'])
    # 	for k in lists:
    # 		if k.id==j['id']:
    # 			k.picname=j['picname']
    # 			lists['picname']=j['picname']
    print(len(lists))
    leng=len(lists)
    wei=0
    yi=0
    qu=0

    for i in lists:
        time_local = time.localtime(i.addtime)
        i.addtime=time.strftime("%Y-%m-%d %H:%M:%S",time_local)
        if i.status == 0 :
            wei+=1
        if i.status == 1 :
            yi +=1
        if i.status == 2:
            qu +=1
    # global context
    
    print(wei)
    context={'lists':lists,'a':a,'leng':leng,'wei':wei,'yi':yi,'qu':qu}
    return render(request,'myadmin/center.html',context)
def centersdel(request,uid):
    order=Orders()
    lists=Orders.objects.filter(id=uid).update(status='1')
    # status=Orders.objects.filter().values('status')
    # print(status)
    # ob = Orders.objects.get(id=uid)
    # print(ob.status)
    # # ob.status=1
    # # order.save()
    # print(uid)
    # lists=Orders.objects.filter()
    # lists.status=1
    # lists.save()
    lists=Orders.objects.filter()
    print(order.status)

    # order.id=request.POST['uid']
    # for i in lists:
    #     print(i.id,'ididdi')
    #     print(i.status,'准备改')
    #     print(uid,'uid')
    #     if i.id == int(uid):
    #         i.status=1
    #         print(i.status,'为什么')
    # for k in lists:
    #     if k.id == int(uid):
    #         print(k.status,'改后的值')
    leng=len(lists)
    wei=0
    yi=0
    qu=0

    for i in lists:
        time_local = time.localtime(i.addtime)
        i.addtime=time.strftime("%Y-%m-%d %H:%M:%S",time_local)
        if i.status == 0 :
            wei+=1
        if i.status == 1 :
            yi +=1
        if i.status == 2:
            qu +=1
    context={'lists':lists,'leng':leng,'wei':wei,'yi':yi,'qu':qu}
    # ob = Orders.objects.get(id=uid)
    # print(ob.status)
    return render(request,'myadmin/center.html',context)
    return render(request,'myadmin/center.html',context)

def centersedit(request,uid):
    lists=Orders.objects.filter(id=uid).update(status='2')
    lists=Orders.objects.filter()
    leng=len(lists)
    wei=0
    yi=0
    qu=0

    for i in lists:
        time_local = time.localtime(i.addtime)
        i.addtime=time.strftime("%Y-%m-%d %H:%M:%S",time_local)
        print(i.addtime)
        if i.status == 0 :
            wei+=1
        if i.status == 1 :
            yi +=1
        if i.status == 2:
            qu +=1  

    context={'lists':lists,'leng':leng,'wei':wei,'yi':yi,'qu':qu}
    return render(request,'myadmin/center.html',context)

def xiangqing(request,uid):
    print('uid=',uid,)
    lists=Detail.objects.get(id=uid)
    print('lists=',lists.goodsid)
    print('数量',lists.num)

    types=Goods.objects.get(id=lists.goodsid)
    print(types.picname) 
    time_local = time.localtime(types.addtime)
    types.addtime=time.strftime("%Y-%m-%d %H:%M:%S",time_local)

    context={'list':lists,'types':types}
    return render(request,'myadmin/xiangqing.html',context)
