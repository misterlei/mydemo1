from django.shortcuts import render

from myadmin.models import Users,Type,Goods
import time
from django.http import HttpResponse
from django.shortcuts import redirect
from django.core.urlresolvers import reverse


# Create your views here.

#公共的函数
def loadContext(request):
    context={}
    context['typelist'] = Type.objects.filter(pid=0)
    return context

#商品首页
def index (request):
    types=Type.objects.filter(pid=0)
    lists=Goods.objects.filter()
    # b=Goods.objects.filter(clicknum=35)
    k=0
    b=[]
    for i in lists:
        k+=1
        if i.clicknum > 20:
            a=Goods.objects.filter(clicknum=i.clicknum)
            b.append(a)
            print(b,'bbbbbbbbbbbbbbb')
    for j in b:
        for q in j:

            print(q.goods,'jjjjjjjjjjjjjj')        
    # print(lists)
    context={'types':types,'a':a,'b':b}
    return render(request,'myweb/index.html',context)


#商品列表页
def lists(request,uid=0):
    # context = loadContext(request)
    context={}
    print(uid=='0' )
    # 获取所需商品列表信息并放置到context
    if uid == '0':
        context['goodslist'] = Goods.objects.all()
        context['types'] = Type.objects.filter(pid=uid)
    else:
        #获取当前类别下的所有子类别信息
        context['types'] = Type.objects.filter(pid=uid)
        # 判断参数ttid是否有值
        if request.GET.get('ttid',None):
            context['goodslist'] = Goods.objects.filter(typeid=request.GET['ttid'])
        else:
            # 获取指定商品类别下的所有商品信息
            context['goodslist'] = Goods.objects.filter(typeid__in=Type.objects.only('id').filter(path__contains=','+str(uid)+','))
    # 如tid=1的sql：select * from myweb_goods where typeid in(select id from myweb_type where path like '%,1,%')
    return render(request,'myweb/lists/shangpin.html',context)
#商品详情页

def detail(request,gid):
    print(gid)
    context = loadContext(request)
    # 获取对应商品详情信息并放置到context
    ob = Goods.objects.get(id=gid)
    ob.clicknum += 1
    ob.save()
    context['goods'] = ob
    # return render(request,'myweb/detail.html',context)
    return render(request,'myweb/detail/xiangqing.html',context)


#======================================
#登录界面
def login(request):

	return render(request,'myweb/login.html')

def dologin(request):

    #校验验证码
    verifycode = request.session['verifycode']
    # print(request.POST['codeqian'])
    code = request.POST['codeqian']
    verifycode = verifycode.lower()
    print(code)
    if verifycode != code:
        context = {'info':'验证码错误！'}
        return render(request,"myweb/login.html",context)
    

    try:
        user=Users.objects.get(username=request.POST['username'])
    # if user.name not in Users.name:
    #     context={'info':'没有该用户'}
    #     return render(reqeest,'myadmin/info.html',context)  

    # 不用上面的还没能够实现，必须遍历Users.name，而直接用整体的try 和except 就能很好的完成此次操作 
    
        if user.state==1:
            import hashlib
            m=hashlib.md5()
            m.update(bytes(request.POST['password'],encoding='utf8'))
            if user.password==m.hexdigest():
                request.session['vipuser']=user.toDict()
                return redirect(reverse('index'))
            else:
                context={'info':'密码错误'}
        else:
            context={'info':'非会员用户'}
    except:
        context={'info':'登录帐号错误'}
    # return render(request,'myadmin/login.html',context)

    return render(request,'myweb/login.html',context)



def loginout(request):
    del request.session['vipuser']
    context={'info':'退出成功'}
    return render(request,'myweb/info.html',context)

def zhuce(request):

	return render(request,'myweb/zhuce.html')



def zhucego(request):
    try:
        ob = Users()
        ob.username = request.POST['username']
        ob.name = request.POST['name']
        if request.POST['password']==request.POST['repassword']:

            #获取密码并md5
            import hashlib
            m = hashlib.md5() 
            m.update(bytes(request.POST['password'],encoding="utf8"))
            ob.password = m.hexdigest()
            ob.sex = request.POST['sex']
            ob.address = request.POST['address']
            ob.code = request.POST['code']
            ob.phone = request.POST['phone']
            ob.email = request.POST['email']
            ob.state = 1
            ob.addtime = time.time()
            ob.save()
            context = {'info':'添加成功！'}
        else:
            context={'info':'密码不一致'}
    except:
        context = {'info':'添加失败！'}

    #return render(request,"myadmin/info.html",context)
    return render(request,"myweb/info.html",context)

	# return render(request,'myweb/login.html')





