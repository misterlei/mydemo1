from django.db import models

class Users(models.Model):
    username = models.CharField(max_length=32)
    name = models.CharField(max_length=16)
    password = models.CharField(max_length=32)
    sex = models.IntegerField(default=1)
    address = models.CharField(max_length=255)
    code = models.CharField(max_length=6)
    phone = models.CharField(max_length=16)
    email = models.CharField(max_length=50)
    state = models.IntegerField(default=1)
    addtime = models.IntegerField()

    def toDict(self):
        return {'id':self.id,'username':self.username,'name':self.name,'address':self.address,'phone':self.phone,'code':self.code}

    class Meta:
        db_table = "myweb_users"






class Type(models.Model):
	name = models.CharField(max_length=32)
	pid = models.IntegerField(max_length=11,default=0)
	path =  models.CharField(max_length=255)

	class Meta:
		db_table='myweb_type'

class Goods(models.Model):
    typeid = models.IntegerField(max_length=11)
    goods = models.CharField(max_length=32)
    company = models.CharField(max_length=50)
    descr = models.TextField()
    price = models.FloatField()
    picname = models.CharField(max_length=255)
    state = models.IntegerField(max_length=1,default=1)
    store = models.IntegerField(max_length=11,default=0)
    num = models.IntegerField(max_length=11,default=0)
    clicknum = models.IntegerField(max_length=11,default=0)
    addtime = models.IntegerField()

    def toDict(self):
        return {'id':self.id,'goods':self.goods,'picname':self.picname,'price':self.price,'store':self.store,'m':1}



    class Meta:
        db_table='myweb_goods'


	

# class Type(models.model):
# 	name=models.CharField(max_length=32)
# 	pid=models.InTegerField(default=1)
# 	path=models.CharField(max_length=255)

# 	class Meta:
# 		db_table='myweb_type'


class Orders(models.Model):
    uid = models.IntegerField()
    linkman = models.CharField(max_length=32)
    address = models.CharField(max_length=255)
    code = models.CharField(max_length=6)
    phone = models.CharField(max_length=16)
    addtime = models.IntegerField()
    total = models.FloatField()
    status = models.IntegerField()

    class Meta:
        db_table='myweb_orders'

class Detail(models.Model):
    orderid = models.IntegerField()
    goodsid = models.IntegerField()
    name = models.CharField(max_length=32)
    price = models.FloatField()
    num = models.IntegerField()

    class Meta:
        db_table='myweb_detail'

