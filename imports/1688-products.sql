begin;

insert into public.products (
  id, title, category, description, price, compare_at_price, cost_per_item,
  stock, sales, published, image, images, vendor, sku, tags, source_url,
  source_currency, source_price, source_variants, source_attributes, updated_at
)
select
  product.id, product.title, product.category, product.description, product.price,
  product.compare_at_price, product.cost_per_item, product.stock, product.sales,
  product.published, product.image, product.images, product.vendor, product.sku,
  product.tags, product.source_url, product.source_currency, product.source_price,
  product.source_variants, product.source_attributes, now()
from jsonb_to_recordset($products$
[
  {
    "id": "1688-1001564175479",
    "title": "奔跑小猫适用iphone17pro软糯16pro苹果15手机壳14/13Pro防摔耐脏",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市华禧数码科技有限公司\n\n材质: 软胶\n工艺: 彩绘\n款式: 全包防摔\n品牌: 其他\n功能: 防摔\n适用机型: 苹果\n流行元素: 卡通\n颜色: 糯米壳【黄色】奔跑小猫10-亲肤手感-立体大孔设计,糯米壳【蓝色】奔跑小猫10-亲肤手感-立体大孔设计,糯米壳【粉色】奔跑小猫10-亲肤手感-立体大孔设计\n适用型号: 苹果 17AIR,苹果 17 Pro Max,苹果 17 Pro,苹果 17,苹果 16,苹果 16 pro,苹果 16 Pro Max【自带ai按键】,苹果15,苹果 15 Pro,苹果 15 Pro Max,苹果 14,苹果 14 Pro,苹果14 Pro Max,苹果 13,苹果 13 Pro,苹果 13 Pro Max,苹果 12,苹果 12 Pro,苹果 12 Pro Max,苹果 11 Pro Max,苹果 11\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA\n是否跨境出口专供货源: 否\n支持订制: 支持\n是否专利货源: 否\n风格: 日韩,可爱,少女,日式风,简约风,卡通风,极简风,小清新,撞色风,轻奢风,ins风,潮玩风\n可爱趣味小狗: 可爱趣味小狗手机壳\n防摔软壳保护套: 防摔软壳保护套\n苹果型号: iPhone 11,iPhone 12,iPhone 7,iPhone X,iPhone14,iPhone 6s,iPhone Xs,iPhone 6 Plus,iPhone Xr,iPhone 7 Plus,iPhone 8 Plus,iPhone Xs Max,iPhone 13,iPhone 11 Pro,iPhone 11 Pro Max,iPhone 12 Pro,iPhone 12 Pro Max,iPhone 12 mini,iPhone13 Pro Max,iPhone13 Pro,iPhone14 Pro,iPhone14 Pro Max,iPhone14 Max,其他\n卡通可爱糯米壳: 卡通可爱糯米手机壳\n颜色分类: 黄色\n\n苹果 17AIR: CNY 3.61, stock 1999\n苹果 17 Pro Max: CNY 3.61, stock 1992\n苹果 17 Pro: CNY 3.61, stock 1996\n苹果 17: CNY 3.61, stock 1996\n苹果 16: CNY 3.61, stock 1996\n苹果 16 pro: CNY 3.61, stock 1996\n苹果 16 Pro Max【自带ai按键】: CNY 3.61, stock 1996\n苹果15: CNY 3.61, stock 1995\n苹果 15 Pro: CNY 3.61, stock 1994\n苹果 15 Pro Max: CNY 3.61, stock 1997\n苹果 14: CNY 3.61, stock 1999\n苹果 14 Pro: CNY 3.61, stock 1998\n苹果14 Pro Max: CNY 3.61, stock 1998\n苹果 13: CNY 3.61, stock 1994\n苹果 13 Pro: CNY 3.61, stock 2000\n苹果 13 Pro Max: CNY 3.61, stock 1998\n苹果 12: CNY 3.61, stock 2000\n苹果 12 Pro: CNY 3.61, stock 2000\n苹果 12 Pro Max: CNY 3.61, stock 2000\n苹果 11 Pro Max: CNY 3.61, stock 1999\n苹果 11: CNY 3.61, stock 2000\n\nSource: https://detail.1688.com/offer/1001564175479.html",
    "price": 6.23,
    "compare_at_price": 0,
    "cost_per_item": 0.9,
    "stock": 36,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1001564175479/01.webp",
    "images": [
      "assets/1688/1001564175479/01.webp",
      "assets/1688/1001564175479/02.webp",
      "assets/1688/1001564175479/03.webp",
      "assets/1688/1001564175479/04.webp",
      "assets/1688/1001564175479/05.webp",
      "assets/1688/1001564175479/06.webp"
    ],
    "vendor": "深圳市华禧数码科技有限公司",
    "sku": "1688-1001564175479",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1001564175479.html",
    "source_currency": "CNY",
    "source_price": 3.61,
    "source_variants": [
      {
        "image": "",
        "name": "苹果 17AIR",
        "priceCny": 3.61,
        "stock": 1999
      },
      {
        "image": "",
        "name": "苹果 17 Pro Max",
        "priceCny": 3.61,
        "stock": 1992
      },
      {
        "image": "",
        "name": "苹果 17 Pro",
        "priceCny": 3.61,
        "stock": 1996
      },
      {
        "image": "",
        "name": "苹果 17",
        "priceCny": 3.61,
        "stock": 1996
      },
      {
        "image": "",
        "name": "苹果 16",
        "priceCny": 3.61,
        "stock": 1996
      },
      {
        "image": "",
        "name": "苹果 16 pro",
        "priceCny": 3.61,
        "stock": 1996
      },
      {
        "image": "",
        "name": "苹果 16 Pro Max【自带ai按键】",
        "priceCny": 3.61,
        "stock": 1996
      },
      {
        "image": "",
        "name": "苹果15",
        "priceCny": 3.61,
        "stock": 1995
      },
      {
        "image": "",
        "name": "苹果 15 Pro",
        "priceCny": 3.61,
        "stock": 1994
      },
      {
        "image": "",
        "name": "苹果 15 Pro Max",
        "priceCny": 3.61,
        "stock": 1997
      },
      {
        "image": "",
        "name": "苹果 14",
        "priceCny": 3.61,
        "stock": 1999
      },
      {
        "image": "",
        "name": "苹果 14 Pro",
        "priceCny": 3.61,
        "stock": 1998
      },
      {
        "image": "",
        "name": "苹果14 Pro Max",
        "priceCny": 3.61,
        "stock": 1998
      },
      {
        "image": "",
        "name": "苹果 13",
        "priceCny": 3.61,
        "stock": 1994
      },
      {
        "image": "",
        "name": "苹果 13 Pro",
        "priceCny": 3.61,
        "stock": 2000
      },
      {
        "image": "",
        "name": "苹果 13 Pro Max",
        "priceCny": 3.61,
        "stock": 1998
      },
      {
        "image": "",
        "name": "苹果 12",
        "priceCny": 3.61,
        "stock": 2000
      },
      {
        "image": "",
        "name": "苹果 12 Pro",
        "priceCny": 3.61,
        "stock": 2000
      },
      {
        "image": "",
        "name": "苹果 12 Pro Max",
        "priceCny": 3.61,
        "stock": 2000
      },
      {
        "image": "",
        "name": "苹果 11 Pro Max",
        "priceCny": 3.61,
        "stock": 1999
      },
      {
        "image": "",
        "name": "苹果 11",
        "priceCny": 3.61,
        "stock": 2000
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "软胶"
      },
      {
        "name": "工艺",
        "value": "彩绘"
      },
      {
        "name": "款式",
        "value": "全包防摔"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "功能",
        "value": "防摔"
      },
      {
        "name": "适用机型",
        "value": "苹果"
      },
      {
        "name": "流行元素",
        "value": "卡通"
      },
      {
        "name": "颜色",
        "value": "糯米壳【黄色】奔跑小猫10-亲肤手感-立体大孔设计,糯米壳【蓝色】奔跑小猫10-亲肤手感-立体大孔设计,糯米壳【粉色】奔跑小猫10-亲肤手感-立体大孔设计"
      },
      {
        "name": "适用型号",
        "value": "苹果 17AIR,苹果 17 Pro Max,苹果 17 Pro,苹果 17,苹果 16,苹果 16 pro,苹果 16 Pro Max【自带ai按键】,苹果15,苹果 15 Pro,苹果 15 Pro Max,苹果 14,苹果 14 Pro,苹果14 Pro Max,苹果 13,苹果 13 Pro,苹果 13 Pro Max,苹果 12,苹果 12 Pro,苹果 12 Pro Max,苹果 11 Pro Max,苹果 11"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "支持订制",
        "value": "支持"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "风格",
        "value": "日韩,可爱,少女,日式风,简约风,卡通风,极简风,小清新,撞色风,轻奢风,ins风,潮玩风"
      },
      {
        "name": "可爱趣味小狗",
        "value": "可爱趣味小狗手机壳"
      },
      {
        "name": "防摔软壳保护套",
        "value": "防摔软壳保护套"
      },
      {
        "name": "苹果型号",
        "value": "iPhone 11,iPhone 12,iPhone 7,iPhone X,iPhone14,iPhone 6s,iPhone Xs,iPhone 6 Plus,iPhone Xr,iPhone 7 Plus,iPhone 8 Plus,iPhone Xs Max,iPhone 13,iPhone 11 Pro,iPhone 11 Pro Max,iPhone 12 Pro,iPhone 12 Pro Max,iPhone 12 mini,iPhone13 Pro Max,iPhone13 Pro,iPhone14 Pro,iPhone14 Pro Max,iPhone14 Max,其他"
      },
      {
        "name": "卡通可爱糯米壳",
        "value": "卡通可爱糯米手机壳"
      },
      {
        "name": "颜色分类",
        "value": "黄色"
      }
    ]
  },
  {
    "id": "1688-1002575439432",
    "title": "娃三岁萌粒植绒卡通挂件书包包可爱公仔钥匙扣学生挂饰礼物闺蜜",
    "category": "1688 Imports",
    "description": "Supplier: 浦江县可兔工艺有限公司\n\n材质: 滴胶\n钥匙配饰分类: 钥匙扣挂件\n品牌: 其它\n风格: 可爱风\n货号: 【甜点三岁】钥匙扣\n颜色: 娃三岁之萌娃（咖色）,娃三岁之萌娃（紫色）,娃三岁之萌娃（湖蓝）,娃三岁之萌娃（粉色）,娃三岁之萌娃（黄色）,娃三岁之萌娃（橙色）,娃三岁之萌娃（绿色）,娃三岁之萌娃（蓝色）,娃三岁之萌娃（玫红）\n是否IP授权: 否\n是否属于礼品: 是，个人礼品\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他\n是否专利货源: 否\n适用节日: 春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节,其他\n送礼用途: 会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他\n适用送礼场合: 旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他\n\n娃三岁之萌娃（咖色）: CNY 1.49, stock 978599\n娃三岁之萌娃（紫色）: CNY 1.49, stock 952946\n娃三岁之萌娃（湖蓝）: CNY 1.49, stock 979207\n娃三岁之萌娃（粉色）: CNY 1.49, stock 962727\n娃三岁之萌娃（黄色）: CNY 1.49, stock 987390\n娃三岁之萌娃（橙色）: CNY 1.49, stock 985312\n娃三岁之萌娃（绿色）: CNY 1.49, stock 975817\n娃三岁之萌娃（蓝色）: CNY 1.49, stock 973503\n娃三岁之萌娃（玫红）: CNY 1.49, stock 937552\n\nSource: https://detail.1688.com/offer/1002575439432.html",
    "price": 2.57,
    "compare_at_price": 0,
    "cost_per_item": 0.37,
    "stock": 45,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1002575439432/01.webp",
    "images": [
      "assets/1688/1002575439432/01.webp",
      "assets/1688/1002575439432/02.webp",
      "assets/1688/1002575439432/03.webp",
      "assets/1688/1002575439432/04.webp",
      "assets/1688/1002575439432/05.webp",
      "assets/1688/1002575439432/06.webp",
      "assets/1688/1002575439432/07.webp",
      "assets/1688/1002575439432/08.webp",
      "assets/1688/1002575439432/09.webp",
      "assets/1688/1002575439432/10.webp",
      "assets/1688/1002575439432/11.webp",
      "assets/1688/1002575439432/12.webp",
      "assets/1688/1002575439432/13.webp",
      "assets/1688/1002575439432/14.webp",
      "assets/1688/1002575439432/15.webp",
      "assets/1688/1002575439432/16.webp",
      "assets/1688/1002575439432/17.webp",
      "assets/1688/1002575439432/18.webp",
      "assets/1688/1002575439432/19.webp",
      "assets/1688/1002575439432/20.webp",
      "assets/1688/1002575439432/21.webp"
    ],
    "vendor": "浦江县可兔工艺有限公司",
    "sku": "1688-1002575439432",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1002575439432.html",
    "source_currency": "CNY",
    "source_price": 1.49,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01BR1hEJ2FwPWXMsov0_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（咖色）",
        "priceCny": 1.49,
        "stock": 978599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01j3S3dP2FwPWYdFyxg_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（紫色）",
        "priceCny": 1.49,
        "stock": 952946
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016A9W1Y2FwPWYDW1sL_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（湖蓝）",
        "priceCny": 1.49,
        "stock": 979207
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ezE7jy2FwPWY3Apnd_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（粉色）",
        "priceCny": 1.49,
        "stock": 962727
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ehZhvH2FwPWZ5bqwq_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（黄色）",
        "priceCny": 1.49,
        "stock": 987390
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01oJfOrr2FwPWY2vC36_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（橙色）",
        "priceCny": 1.49,
        "stock": 985312
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01h3X3H22FwPWXMtDth_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（绿色）",
        "priceCny": 1.49,
        "stock": 975817
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01LFoM0h2FwPWYGuKIH_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（蓝色）",
        "priceCny": 1.49,
        "stock": 973503
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01je9cRv2FwPWZ5d85U_!!2219570468944-0-cib.jpg_sum.jpg",
        "name": "娃三岁之萌娃（玫红）",
        "priceCny": 1.49,
        "stock": 937552
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "滴胶"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣挂件"
      },
      {
        "name": "品牌",
        "value": "其它"
      },
      {
        "name": "风格",
        "value": "可爱风"
      },
      {
        "name": "货号",
        "value": "【甜点三岁】钥匙扣"
      },
      {
        "name": "颜色",
        "value": "娃三岁之萌娃（咖色）,娃三岁之萌娃（紫色）,娃三岁之萌娃（湖蓝）,娃三岁之萌娃（粉色）,娃三岁之萌娃（黄色）,娃三岁之萌娃（橙色）,娃三岁之萌娃（绿色）,娃三岁之萌娃（蓝色）,娃三岁之萌娃（玫红）"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节,其他"
      },
      {
        "name": "送礼用途",
        "value": "会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他"
      },
      {
        "name": "适用送礼场合",
        "value": "旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他"
      }
    ]
  },
  {
    "id": "1688-1006946837387",
    "title": "潮玩爆炸头小新钥匙扣小挂件带编织绳小新公仔书包挂件精品店挂件",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市致物工艺品有限公司\n\n材质: pvc+植绒\n钥匙配饰分类: 钥匙扣\n风格: 卡通\n品牌: 致物\n货号: MX-81819\n包装: 独立包装\n适用送礼场合: 婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问\n是否专利货源: 否\n颜色: 挂件-植绒爆炸头小新【黄色】,挂件-植绒爆炸头小新【白色】,挂件-植绒爆炸头小新【粉色】,挂件-植绒爆炸头小新【蓝色】,植绒春游小新-【黄色】,植绒春游小新-【红色】,植绒高达小新-【白色】,植绒高达小新-【红色】,植绒小新牛仔-【蓝色】,植绒小新牛仔-【咖色】,入油-爆炸头小新-【紫色】,入油-爆炸头小新-【绿色】,入油-爆炸头小新-【粉色】,入油-爆炸头小新-【蓝色】,入油-爆炸头小新-【橘色】,入油-爆炸头小新-【白色】,马里奥小新【绿色】,马里奥小新【红色】,挂件-植绒蝙蝠侠小新【灰色】,挂件-植绒蝙蝠侠小新【红色】,挂件-植绒蝙蝠侠小新【蓝色】,挂件-植绒蝙蝠侠小新【紫色】,植绒漫威小新【红色】,植绒漫威小新【蓝色】,挂件-小新回力车【粉色】,挂件-小新回力车【黄色】,小新和小白【蓝色】,小新和小白【红色】\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师\n送礼用途: 积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品\n是否属于礼品: 是，个人礼品\n是否IP授权: 否\n2: 包包挂饰\n3: 抓娃机挂件\n适用节日: 圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节\n1: 钥匙配件\n\n挂件-植绒爆炸头小新【黄色】: CNY 3.50, stock 880\n挂件-植绒爆炸头小新【白色】: CNY 3.50, stock 2081\n挂件-植绒爆炸头小新【粉色】: CNY 3.50, stock 298\n挂件-植绒爆炸头小新【蓝色】: CNY 3.50, stock 659\n植绒春游小新-【黄色】: CNY 2.80, stock 2907\n植绒春游小新-【红色】: CNY 2.80, stock 3493\n植绒高达小新-【白色】: CNY 2.70, stock 956\n植绒高达小新-【红色】: CNY 2.70, stock 953\n植绒小新牛仔-【蓝色】: CNY 2.80, stock 1907\n植绒小新牛仔-【咖色】: CNY 2.80, stock 1003\n入油-爆炸头小新-【紫色】: CNY 3.80, stock 199\n入油-爆炸头小新-【绿色】: CNY 3.80, stock 217\n入油-爆炸头小新-【粉色】: CNY 3.80, stock 234\n入油-爆炸头小新-【蓝色】: CNY 3.80, stock 114\n入油-爆炸头小新-【橘色】: CNY 3.80, stock 202\n入油-爆炸头小新-【白色】: CNY 3.80, stock 111\n马里奥小新【绿色】: CNY 2.60, stock 4862\n马里奥小新【红色】: CNY 2.60, stock 3135\n挂件-植绒蝙蝠侠小新【灰色】: CNY 2.60, stock 1051\n挂件-植绒蝙蝠侠小新【红色】: CNY 2.60, stock 1350\n挂件-植绒蝙蝠侠小新【蓝色】: CNY 2.60, stock 3162\n挂件-植绒蝙蝠侠小新【紫色】: CNY 2.60, stock 3773\n植绒漫威小新【红色】: CNY 2.60, stock 2396\n植绒漫威小新【蓝色】: CNY 2.60, stock 1608\n挂件-小新回力车【粉色】: CNY 3.20, stock 1732\n挂件-小新回力车【黄色】: CNY 3.20, stock 1798\n小新和小白【蓝色】: CNY 2.60, stock 1651\n小新和小白【红色】: CNY 2.60, stock 1371\n\nSource: https://detail.1688.com/offer/1006946837387.html",
    "price": 4.48,
    "compare_at_price": 0,
    "cost_per_item": 0.65,
    "stock": 18,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1006946837387/01.webp",
    "images": [
      "assets/1688/1006946837387/01.webp",
      "assets/1688/1006946837387/02.webp",
      "assets/1688/1006946837387/03.webp",
      "assets/1688/1006946837387/04.webp",
      "assets/1688/1006946837387/05.webp",
      "assets/1688/1006946837387/06.webp",
      "assets/1688/1006946837387/07.webp",
      "assets/1688/1006946837387/08.webp",
      "assets/1688/1006946837387/09.webp",
      "assets/1688/1006946837387/10.webp",
      "assets/1688/1006946837387/11.webp",
      "assets/1688/1006946837387/12.webp",
      "assets/1688/1006946837387/13.webp",
      "assets/1688/1006946837387/14.webp",
      "assets/1688/1006946837387/15.webp",
      "assets/1688/1006946837387/16.webp",
      "assets/1688/1006946837387/17.webp",
      "assets/1688/1006946837387/18.webp",
      "assets/1688/1006946837387/19.webp",
      "assets/1688/1006946837387/20.webp",
      "assets/1688/1006946837387/21.webp",
      "assets/1688/1006946837387/22.webp",
      "assets/1688/1006946837387/23.webp",
      "assets/1688/1006946837387/24.webp",
      "assets/1688/1006946837387/25.webp",
      "assets/1688/1006946837387/26.webp",
      "assets/1688/1006946837387/27.webp",
      "assets/1688/1006946837387/28.webp",
      "assets/1688/1006946837387/29.webp",
      "assets/1688/1006946837387/30.webp",
      "assets/1688/1006946837387/31.webp",
      "assets/1688/1006946837387/32.webp",
      "assets/1688/1006946837387/33.webp",
      "assets/1688/1006946837387/34.webp",
      "assets/1688/1006946837387/35.webp",
      "assets/1688/1006946837387/36.webp",
      "assets/1688/1006946837387/37.webp",
      "assets/1688/1006946837387/38.webp",
      "assets/1688/1006946837387/39.webp",
      "assets/1688/1006946837387/40.webp",
      "assets/1688/1006946837387/41.webp",
      "assets/1688/1006946837387/42.webp",
      "assets/1688/1006946837387/43.webp",
      "assets/1688/1006946837387/44.webp",
      "assets/1688/1006946837387/45.webp",
      "assets/1688/1006946837387/46.webp",
      "assets/1688/1006946837387/47.webp",
      "assets/1688/1006946837387/48.webp",
      "assets/1688/1006946837387/49.webp",
      "assets/1688/1006946837387/50.webp",
      "assets/1688/1006946837387/51.webp",
      "assets/1688/1006946837387/52.webp",
      "assets/1688/1006946837387/53.webp",
      "assets/1688/1006946837387/54.webp",
      "assets/1688/1006946837387/55.webp",
      "assets/1688/1006946837387/56.webp",
      "assets/1688/1006946837387/57.webp",
      "assets/1688/1006946837387/58.webp",
      "assets/1688/1006946837387/59.webp",
      "assets/1688/1006946837387/60.webp",
      "assets/1688/1006946837387/61.webp"
    ],
    "vendor": "义乌市致物工艺品有限公司",
    "sku": "1688-1006946837387",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1006946837387.html",
    "source_currency": "CNY",
    "source_price": 2.6,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01RZVrzN1ZEFTLnxYVR_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-植绒爆炸头小新【黄色】",
        "priceCny": 3.5,
        "stock": 880
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PBowsb1ZEFTLnw9Cl_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-植绒爆炸头小新【白色】",
        "priceCny": 3.5,
        "stock": 2081
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ytaF051ZEFTLnw9Dq_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-植绒爆炸头小新【粉色】",
        "priceCny": 3.5,
        "stock": 298
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0161GqfD1ZEFTLsm2c1_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-植绒爆炸头小新【蓝色】",
        "priceCny": 3.5,
        "stock": 659
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01loNMWH1ZEFVUG4Kez_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "植绒春游小新-【黄色】",
        "priceCny": 2.8,
        "stock": 2907
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01lYvV6Y1ZEFVSs8asy_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "植绒春游小新-【红色】",
        "priceCny": 2.8,
        "stock": 3493
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WfNKYi1ZEFVSUGlGj_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "植绒高达小新-【白色】",
        "priceCny": 2.7,
        "stock": 956
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015UvMeL1ZEFVSsB50j_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "植绒高达小新-【红色】",
        "priceCny": 2.7,
        "stock": 953
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01AMgTMq1ZEFVSlBpqb_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "植绒小新牛仔-【蓝色】",
        "priceCny": 2.8,
        "stock": 1907
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01roA2Pt1ZEFVSkyM9m_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "植绒小新牛仔-【咖色】",
        "priceCny": 2.8,
        "stock": 1003
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01dye6hh1ZEFVUGDjUg_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "入油-爆炸头小新-【紫色】",
        "priceCny": 3.8,
        "stock": 199
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IlRklr1ZEFVSqDhAl_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "入油-爆炸头小新-【绿色】",
        "priceCny": 3.8,
        "stock": 217
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01V9bKHl1ZEFVSWNusX_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "入油-爆炸头小新-【粉色】",
        "priceCny": 3.8,
        "stock": 234
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01vtVp2i1ZEFVSsKXrQ_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "入油-爆炸头小新-【蓝色】",
        "priceCny": 3.8,
        "stock": 114
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN012cHCWi1ZEFVSqEu4d_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "入油-爆炸头小新-【橘色】",
        "priceCny": 3.8,
        "stock": 202
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01N145Zq1ZEFVSqE6Co_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "入油-爆炸头小新-【白色】",
        "priceCny": 3.8,
        "stock": 111
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01S7OuIw1ZEFVSlTrlw_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "马里奥小新【绿色】",
        "priceCny": 2.6,
        "stock": 4862
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01RXqkyI1ZEFVSpd4cB_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "马里奥小新【红色】",
        "priceCny": 2.6,
        "stock": 3135
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Q03EFa1ZEFVSpgMYT_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-植绒蝙蝠侠小新【灰色】",
        "priceCny": 2.6,
        "stock": 1051
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01eJl74q1ZEFVTIDx96_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-植绒蝙蝠侠小新【红色】",
        "priceCny": 2.6,
        "stock": 1350
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01FbqtC21ZEFVStsz61_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-植绒蝙蝠侠小新【蓝色】",
        "priceCny": 2.6,
        "stock": 3162
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01DXAkPo1ZEFVSZB5iC_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-植绒蝙蝠侠小新【紫色】",
        "priceCny": 2.6,
        "stock": 3773
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01z3SFb81ZEFVOBpP3w_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "植绒漫威小新【红色】",
        "priceCny": 2.6,
        "stock": 2396
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01J1sw871ZEFVSlVhpn_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "植绒漫威小新【蓝色】",
        "priceCny": 2.6,
        "stock": 1608
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01NutDtd1ZEFVSWFJEc_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-小新回力车【粉色】",
        "priceCny": 3.2,
        "stock": 1732
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01dJsCN41ZEFVSZJspx_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "挂件-小新回力车【黄色】",
        "priceCny": 3.2,
        "stock": 1798
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016eOwCr1ZEFVOCMEWI_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "小新和小白【蓝色】",
        "priceCny": 2.6,
        "stock": 1651
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016vXiUb1ZEFVSfevmZ_!!2215955093162-0-cib.jpg_sum.jpg",
        "name": "小新和小白【红色】",
        "priceCny": 2.6,
        "stock": 1371
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "pvc+植绒"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣"
      },
      {
        "name": "风格",
        "value": "卡通"
      },
      {
        "name": "品牌",
        "value": "致物"
      },
      {
        "name": "货号",
        "value": "MX-81819"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "挂件-植绒爆炸头小新【黄色】,挂件-植绒爆炸头小新【白色】,挂件-植绒爆炸头小新【粉色】,挂件-植绒爆炸头小新【蓝色】,植绒春游小新-【黄色】,植绒春游小新-【红色】,植绒高达小新-【白色】,植绒高达小新-【红色】,植绒小新牛仔-【蓝色】,植绒小新牛仔-【咖色】,入油-爆炸头小新-【紫色】,入油-爆炸头小新-【绿色】,入油-爆炸头小新-【粉色】,入油-爆炸头小新-【蓝色】,入油-爆炸头小新-【橘色】,入油-爆炸头小新-【白色】,马里奥小新【绿色】,马里奥小新【红色】,挂件-植绒蝙蝠侠小新【灰色】,挂件-植绒蝙蝠侠小新【红色】,挂件-植绒蝙蝠侠小新【蓝色】,挂件-植绒蝙蝠侠小新【紫色】,植绒漫威小新【红色】,植绒漫威小新【蓝色】,挂件-小新回力车【粉色】,挂件-小新回力车【黄色】,小新和小白【蓝色】,小新和小白【红色】"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师"
      },
      {
        "name": "送礼用途",
        "value": "积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "2",
        "value": "包包挂饰"
      },
      {
        "name": "3",
        "value": "抓娃机挂件"
      },
      {
        "name": "适用节日",
        "value": "圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节"
      },
      {
        "name": "1",
        "value": "钥匙配件"
      }
    ]
  },
  {
    "id": "1688-1014048901108",
    "title": "马年黄金小马手机链挂件新年马上有钱钥匙扣小礼品生肖马小饰品",
    "category": "1688 Imports",
    "description": "Supplier: 莆田市秀屿区辉先生珠宝首饰厂\n\n材质: 锌合金\n钥匙配饰分类: 钥匙扣\n风格: 中国风\n品牌: 辉先生\n货号: 1121\n包装: 独立包装\n适用送礼场合: 婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,其他\n是否专利货源: 否\n颜色: 马上有钱红绳手机挂,马上有钱+钥匙扣,马上有财+红绳,马上有财+钥匙扣,马上有钱+红绳+卡纸包装,马上有财+红绳+卡纸包装,马上有钱+钥匙扣+卡纸包装,马上有财+钥匙扣+卡纸包装,小马7*7礼盒装.随机祝福语,小马9*9礼盒装.随机祝福语\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师\n送礼用途: 积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他\n是否属于礼品: 是，商务礼品\n是否IP授权: 否\n适用节日: 通用,圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,国庆节,儿童节\n\n马上有钱红绳手机挂: CNY 0.95, stock 76426\n马上有钱+钥匙扣: CNY 1.62, stock 99311\n马上有财+红绳: CNY 1.14, stock 98836\n马上有财+钥匙扣: CNY 1.62, stock 99644\n马上有钱+红绳+卡纸包装: CNY 1.43, stock 91083\n马上有财+红绳+卡纸包装: CNY 1.43, stock 98547\n马上有钱+钥匙扣+卡纸包装: CNY 1.90, stock 97510\n马上有财+钥匙扣+卡纸包装: CNY 1.90, stock 99480\n小马7*7礼盒装.随机祝福语: CNY 1.81, stock 76759\n小马9*9礼盒装.随机祝福语: CNY 1.90, stock 77089\n\nSource: https://detail.1688.com/offer/1014048901108.html",
    "price": 1.64,
    "compare_at_price": 0,
    "cost_per_item": 0.24,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1014048901108/01.webp",
    "images": [
      "assets/1688/1014048901108/01.webp",
      "assets/1688/1014048901108/02.webp",
      "assets/1688/1014048901108/03.webp",
      "assets/1688/1014048901108/04.webp",
      "assets/1688/1014048901108/05.webp",
      "assets/1688/1014048901108/06.webp",
      "assets/1688/1014048901108/07.webp",
      "assets/1688/1014048901108/08.webp",
      "assets/1688/1014048901108/09.webp",
      "assets/1688/1014048901108/10.webp",
      "assets/1688/1014048901108/11.webp",
      "assets/1688/1014048901108/12.webp",
      "assets/1688/1014048901108/13.webp",
      "assets/1688/1014048901108/14.webp",
      "assets/1688/1014048901108/15.webp",
      "assets/1688/1014048901108/16.webp",
      "assets/1688/1014048901108/17.webp",
      "assets/1688/1014048901108/18.webp",
      "assets/1688/1014048901108/19.webp",
      "assets/1688/1014048901108/20.webp",
      "assets/1688/1014048901108/21.webp",
      "assets/1688/1014048901108/22.webp",
      "assets/1688/1014048901108/23.webp",
      "assets/1688/1014048901108/24.webp",
      "assets/1688/1014048901108/25.webp"
    ],
    "vendor": "莆田市秀屿区辉先生珠宝首饰厂",
    "sku": "1688-1014048901108",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1014048901108.html",
    "source_currency": "CNY",
    "source_price": 0.95,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Dlr9Wk1tWpro47UbU_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "马上有钱红绳手机挂",
        "priceCny": 0.95,
        "stock": 76426
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WcuEVF1tWprzwPy1K_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "马上有钱+钥匙扣",
        "priceCny": 1.62,
        "stock": 99311
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01bBRVjr1tWprpDXnWN_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "马上有财+红绳",
        "priceCny": 1.14,
        "stock": 98836
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01gcatb81tWpro2q5bt_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "马上有财+钥匙扣",
        "priceCny": 1.62,
        "stock": 99644
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01o7PWu11tWprnTme4n_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "马上有钱+红绳+卡纸包装",
        "priceCny": 1.43,
        "stock": 91083
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01QdAOMu1tWprnkyDwJ_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "马上有财+红绳+卡纸包装",
        "priceCny": 1.43,
        "stock": 98547
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01OyD5wU1tWpritFCNJ_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "马上有钱+钥匙扣+卡纸包装",
        "priceCny": 1.9,
        "stock": 97510
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01hGTgiM1tWproKTLfx_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "马上有财+钥匙扣+卡纸包装",
        "priceCny": 1.9,
        "stock": 99480
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01J6dyrA1tWproQA5nS_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "小马7*7礼盒装.随机祝福语",
        "priceCny": 1.81,
        "stock": 76759
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01iJIXGP1tWprcrW0qL_!!2221235575910-0-cib.jpg_sum.jpg",
        "name": "小马9*9礼盒装.随机祝福语",
        "priceCny": 1.9,
        "stock": 77089
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "锌合金"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣"
      },
      {
        "name": "风格",
        "value": "中国风"
      },
      {
        "name": "品牌",
        "value": "辉先生"
      },
      {
        "name": "货号",
        "value": "1121"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,其他"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "马上有钱红绳手机挂,马上有钱+钥匙扣,马上有财+红绳,马上有财+钥匙扣,马上有钱+红绳+卡纸包装,马上有财+红绳+卡纸包装,马上有钱+钥匙扣+卡纸包装,马上有财+钥匙扣+卡纸包装,小马7*7礼盒装.随机祝福语,小马9*9礼盒装.随机祝福语"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师"
      },
      {
        "name": "送礼用途",
        "value": "积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他"
      },
      {
        "name": "是否属于礼品",
        "value": "是，商务礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "通用,圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,国庆节,儿童节"
      }
    ]
  },
  {
    "id": "1688-1014151154971",
    "title": "新款卡通牛仔卡皮巴拉毛绒挂件可爱娃娃钥匙扣包包小挂饰玩偶批发",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市酷萌工艺品有限公司\n\n材质: 毛绒\n钥匙配饰分类: 钥匙扣\n风格: 卡通\n品牌: 酷萌\n货号: 牛仔卡皮巴拉1-20\n包装: 普通包装\n适用送礼场合: 婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他\n是否专利货源: 否\n颜色: 牛仔卡皮巴拉-帽子,牛仔卡皮巴拉-裙子\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师\n送礼用途: 积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他\n是否属于礼品: 是，商务礼品\n是否IP授权: 否\n适用节日: 圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节,其他\n\n牛仔卡皮巴拉-帽子: CNY 6.37, stock 5018\n牛仔卡皮巴拉-裙子: CNY 6.37, stock 5003\n\nSource: https://detail.1688.com/offer/1014151154971.html",
    "price": 10.99,
    "compare_at_price": 0,
    "cost_per_item": 1.59,
    "stock": 6,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1014151154971/01.webp",
    "images": [
      "assets/1688/1014151154971/01.webp",
      "assets/1688/1014151154971/02.webp",
      "assets/1688/1014151154971/03.webp",
      "assets/1688/1014151154971/04.webp",
      "assets/1688/1014151154971/05.webp",
      "assets/1688/1014151154971/06.webp",
      "assets/1688/1014151154971/07.webp",
      "assets/1688/1014151154971/08.webp",
      "assets/1688/1014151154971/09.webp"
    ],
    "vendor": "义乌市酷萌工艺品有限公司",
    "sku": "1688-1014151154971",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1014151154971.html",
    "source_currency": "CNY",
    "source_price": 6.37,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ksfMue1IXclYkswyb_!!2211899240903-0-cib.jpg_sum.jpg",
        "name": "牛仔卡皮巴拉-帽子",
        "priceCny": 6.37,
        "stock": 5018
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01suUAXx1IXclZUPMGO_!!2211899240903-0-cib.jpg_sum.jpg",
        "name": "牛仔卡皮巴拉-裙子",
        "priceCny": 6.37,
        "stock": 5003
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "毛绒"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣"
      },
      {
        "name": "风格",
        "value": "卡通"
      },
      {
        "name": "品牌",
        "value": "酷萌"
      },
      {
        "name": "货号",
        "value": "牛仔卡皮巴拉1-20"
      },
      {
        "name": "包装",
        "value": "普通包装"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "牛仔卡皮巴拉-帽子,牛仔卡皮巴拉-裙子"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师"
      },
      {
        "name": "送礼用途",
        "value": "积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他"
      },
      {
        "name": "是否属于礼品",
        "value": "是，商务礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节,其他"
      }
    ]
  },
  {
    "id": "1688-1014614302986",
    "title": "黄猫适用苹果支架17PROMAX高颜值手机壳高级iPhone16小众15少女",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市福田区钦典电子产品店\n\n材质: 硅胶\n工艺: 喷涂\n款式: 全包款\n品牌: 其他\n功能: 防滑,防磨,防摔\n适用机型: 苹果\n流行元素: 卡通\n颜色: 光面精控菲林壳-实白-蓝黄格子支架24-D489,光面精控菲林壳-实白-白狗支架可可24-D462,光面精控菲林壳-实白-白狗支架可可24-D491\n适用型号: 其它安卓型号拍此处留言客服备注,iPhone 17,iPhone 17 air,iPhone 17 Pro,iPhone 17 ProMax,iPhone 16,iPhone 16 Pro,iPhone 16 Plus,iPhone 16 ProMax,iPhone 16E,iPhone 15,iPhone 15 Pro,iPhone 15 Plus,iPhone 15 ProMax,iPhone 14,iPhone 14 Pro,iPhone 14 Plus,iPhone 14 ProMax,iPhone 13,iPhone 13Pro,iPhone 13 ProMax,iPhone 13 mini,iPhone 12,iPhone 12Pro,iPhone 12 ProMax,iPhone 12 mini,iPhone 11,iPhone 11Pro,iPhone 11 ProMax,iPhone XS Max,iPhone XS,iPhone XR,iPhone X,iPhone 7,iPhone 7 Plus\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他\n是否跨境出口专供货源: 是\n支持订制: 支持\n是否专利货源: 否\n风格: 韩式风,简约风,卡通风,简洁大方风,ins风,网红潮流风\n苹果型号: iPhone 6,iPhone 11,iPhone 12,iPhone 8,iPhone 7,iPhone X,iPhone 4/4S,iPhone14,iPhone 5/5s,iPhone 6s,iPhone 5C,iPhone Xs,iPhone 6 Plus,iPhone 6s Plus,iPhone Xr,iPhone 7 Plus,iPhone 8 Plus,iPhone Xs Max,iPhone 13,iPhone 11 Pro,iPhone 11 Pro Max,iPhone 12 Pro,iPhone 12 Pro Max,iPhone 12 mini,iPhone13 Pro Max,iPhone13 Pro,iPhone14 Pro,iPhone14 Pro Max,iPhone14 Max,其他\n颜色分类: 银色,灰色\n\n其它安卓型号拍此处留言客服备注: CNY 8.17, stock 9999\niPhone 17: CNY 8.17, stock 9998\niPhone 17 air: CNY 8.17, stock 9999\niPhone 17 Pro: CNY 8.17, stock 9998\niPhone 17 ProMax: CNY 8.17, stock 9998\niPhone 16: CNY 8.17, stock 9998\niPhone 16 Pro: CNY 8.17, stock 9999\niPhone 16 Plus: CNY 8.17, stock 9999\niPhone 16 ProMax: CNY 8.17, stock 9998\niPhone 16E: CNY 8.17, stock 9999\niPhone 15: CNY 8.17, stock 9998\niPhone 15 Pro: CNY 8.17, stock 9999\niPhone 15 Plus: CNY 8.17, stock 9999\niPhone 15 ProMax: CNY 8.17, stock 9998\niPhone 14: CNY 8.17, stock 9999\niPhone 14 Pro: CNY 8.17, stock 9999\niPhone 14 Plus: CNY 8.17, stock 9999\niPhone 14 ProMax: CNY 8.17, stock 9999\niPhone 13: CNY 8.17, stock 9999\niPhone 13Pro: CNY 8.17, stock 9999\niPhone 13 ProMax: CNY 8.17, stock 9999\niPhone 13 mini: CNY 8.17, stock 9999\niPhone 12: CNY 8.17, stock 9999\niPhone 12Pro: CNY 8.17, stock 9999\niPhone 12 ProMax: CNY 8.17, stock 9999\niPhone 12 mini: CNY 8.17, stock 9999\niPhone 11: CNY 8.17, stock 9999\niPhone 11Pro: CNY 8.17, stock 9999\niPhone 11 ProMax: CNY 8.17, stock 9999\niPhone XS Max: CNY 8.17, stock 9999\niPhone XS: CNY 8.17, stock 9999\niPhone XR: CNY 8.17, stock 9999\niPhone X: CNY 8.17, stock 9999\niPhone 7: CNY 8.17, stock 9999\niPhone 7 Plus: CNY 8.17, stock 9999\n\nSource: https://detail.1688.com/offer/1014614302986.html",
    "price": 14.09,
    "compare_at_price": 0,
    "cost_per_item": 2.04,
    "stock": 32,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1014614302986/01.webp",
    "images": [
      "assets/1688/1014614302986/01.webp",
      "assets/1688/1014614302986/02.webp",
      "assets/1688/1014614302986/03.webp",
      "assets/1688/1014614302986/04.webp",
      "assets/1688/1014614302986/05.webp",
      "assets/1688/1014614302986/06.webp"
    ],
    "vendor": "深圳市福田区钦典电子产品店",
    "sku": "1688-1014614302986",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1014614302986.html",
    "source_currency": "CNY",
    "source_price": 8.17,
    "source_variants": [
      {
        "image": "",
        "name": "其它安卓型号拍此处留言客服备注",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 17",
        "priceCny": 8.17,
        "stock": 9998
      },
      {
        "image": "",
        "name": "iPhone 17 air",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 17 Pro",
        "priceCny": 8.17,
        "stock": 9998
      },
      {
        "image": "",
        "name": "iPhone 17 ProMax",
        "priceCny": 8.17,
        "stock": 9998
      },
      {
        "image": "",
        "name": "iPhone 16",
        "priceCny": 8.17,
        "stock": 9998
      },
      {
        "image": "",
        "name": "iPhone 16 Pro",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 16 Plus",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 16 ProMax",
        "priceCny": 8.17,
        "stock": 9998
      },
      {
        "image": "",
        "name": "iPhone 16E",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 15",
        "priceCny": 8.17,
        "stock": 9998
      },
      {
        "image": "",
        "name": "iPhone 15 Pro",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 15 Plus",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 15 ProMax",
        "priceCny": 8.17,
        "stock": 9998
      },
      {
        "image": "",
        "name": "iPhone 14",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 14 Pro",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 14 Plus",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 14 ProMax",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 13",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 13Pro",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 13 ProMax",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 13 mini",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 12",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 12Pro",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 12 ProMax",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 12 mini",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 11",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 11Pro",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 11 ProMax",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone XS Max",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone XS",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone XR",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone X",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 7",
        "priceCny": 8.17,
        "stock": 9999
      },
      {
        "image": "",
        "name": "iPhone 7 Plus",
        "priceCny": 8.17,
        "stock": 9999
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "硅胶"
      },
      {
        "name": "工艺",
        "value": "喷涂"
      },
      {
        "name": "款式",
        "value": "全包款"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "功能",
        "value": "防滑,防磨,防摔"
      },
      {
        "name": "适用机型",
        "value": "苹果"
      },
      {
        "name": "流行元素",
        "value": "卡通"
      },
      {
        "name": "颜色",
        "value": "光面精控菲林壳-实白-蓝黄格子支架24-D489,光面精控菲林壳-实白-白狗支架可可24-D462,光面精控菲林壳-实白-白狗支架可可24-D491"
      },
      {
        "name": "适用型号",
        "value": "其它安卓型号拍此处留言客服备注,iPhone 17,iPhone 17 air,iPhone 17 Pro,iPhone 17 ProMax,iPhone 16,iPhone 16 Pro,iPhone 16 Plus,iPhone 16 ProMax,iPhone 16E,iPhone 15,iPhone 15 Pro,iPhone 15 Plus,iPhone 15 ProMax,iPhone 14,iPhone 14 Pro,iPhone 14 Plus,iPhone 14 ProMax,iPhone 13,iPhone 13Pro,iPhone 13 ProMax,iPhone 13 mini,iPhone 12,iPhone 12Pro,iPhone 12 ProMax,iPhone 12 mini,iPhone 11,iPhone 11Pro,iPhone 11 ProMax,iPhone XS Max,iPhone XS,iPhone XR,iPhone X,iPhone 7,iPhone 7 Plus"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "支持订制",
        "value": "支持"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "风格",
        "value": "韩式风,简约风,卡通风,简洁大方风,ins风,网红潮流风"
      },
      {
        "name": "苹果型号",
        "value": "iPhone 6,iPhone 11,iPhone 12,iPhone 8,iPhone 7,iPhone X,iPhone 4/4S,iPhone14,iPhone 5/5s,iPhone 6s,iPhone 5C,iPhone Xs,iPhone 6 Plus,iPhone 6s Plus,iPhone Xr,iPhone 7 Plus,iPhone 8 Plus,iPhone Xs Max,iPhone 13,iPhone 11 Pro,iPhone 11 Pro Max,iPhone 12 Pro,iPhone 12 Pro Max,iPhone 12 mini,iPhone13 Pro Max,iPhone13 Pro,iPhone14 Pro,iPhone14 Pro Max,iPhone14 Max,其他"
      },
      {
        "name": "颜色分类",
        "value": "银色,灰色"
      }
    ]
  },
  {
    "id": "1688-1018946132656",
    "title": "联-想thinkplusKM115PRO无线适用办公键鼠套装 键盘鼠标游戏无线",
    "category": "1688 Imports",
    "description": "Supplier: 广州旋雕电子科技有限公司\n\n品牌: 其他\n线长: 见详情（米）\n操作距离: 见详情（米）\n接口: USB\n型号: KM115PRO\n货号: FV-W706\n上市时间: 2024\n货源类别: 现货\n类型: 无线套装\n与电脑连接方式: 键盘无线,鼠标无线\n光电分辨率: 1200dpi\n产品尺寸: 见详情\n产品重量: 见详情（KG）\n是否支持人体工程学: 支持\n加印LOGO: 可以\n加工定制: 是\n售后服务: 有质保\n包装清单: 见详情\n颜色: 黑色,白色\n\n黑色: CNY 39.90, stock 3431\n白色: CNY 43.90, stock 3198\n\nSource: https://detail.1688.com/offer/1018946132656.html",
    "price": 68.83,
    "compare_at_price": 0,
    "cost_per_item": 9.98,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1018946132656/01.webp",
    "images": [
      "assets/1688/1018946132656/01.webp",
      "assets/1688/1018946132656/02.webp",
      "assets/1688/1018946132656/03.webp",
      "assets/1688/1018946132656/04.webp",
      "assets/1688/1018946132656/05.webp"
    ],
    "vendor": "广州旋雕电子科技有限公司",
    "sku": "1688-1018946132656",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1018946132656.html",
    "source_currency": "CNY",
    "source_price": 39.9,
    "source_variants": [
      {
        "image": "",
        "name": "黑色",
        "priceCny": 39.9,
        "stock": 3431
      },
      {
        "image": "",
        "name": "白色",
        "priceCny": 43.9,
        "stock": 3198
      }
    ],
    "source_attributes": [
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "线长",
        "value": "见详情（米）"
      },
      {
        "name": "操作距离",
        "value": "见详情（米）"
      },
      {
        "name": "接口",
        "value": "USB"
      },
      {
        "name": "型号",
        "value": "KM115PRO"
      },
      {
        "name": "货号",
        "value": "FV-W706"
      },
      {
        "name": "上市时间",
        "value": "2024"
      },
      {
        "name": "货源类别",
        "value": "现货"
      },
      {
        "name": "类型",
        "value": "无线套装"
      },
      {
        "name": "与电脑连接方式",
        "value": "键盘无线,鼠标无线"
      },
      {
        "name": "光电分辨率",
        "value": "1200dpi"
      },
      {
        "name": "产品尺寸",
        "value": "见详情"
      },
      {
        "name": "产品重量",
        "value": "见详情（KG）"
      },
      {
        "name": "是否支持人体工程学",
        "value": "支持"
      },
      {
        "name": "加印LOGO",
        "value": "可以"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "售后服务",
        "value": "有质保"
      },
      {
        "name": "包装清单",
        "value": "见详情"
      },
      {
        "name": "颜色",
        "value": "黑色,白色"
      }
    ]
  },
  {
    "id": "1688-1020408315989",
    "title": "玩具总动员Crazy按按解压挂件正版盲盒潮玩手办公仔娃娃礼物摆件",
    "category": "1688 Imports",
    "description": "Supplier: 广州蒸汽波文化发展有限公司\n\n玩具材质: PVC\n品牌: 其它\n专利及著作权: 无专利及著作权\n动漫角色: 其它\n产地: 广东省\n是否外贸专供: 否\n适用年龄: 青年（15-35岁）\n建议零售价: 29.9\n货号: 1\n上市时间: 2000-2025\n能力培养: 情感,视觉,智力开发,动手动脑,感官,手眼协调,互动玩具,兴趣培养\n是否有动漫形象: 是\n适用人群: 不限\n包装: 彩盒装\n是否进口: 否\n3C配置类别: 14岁以上的玩具\n是否跨境出口专供货源: 否\n原产国/地区: 中国\n专利号或版权登记证号: 否\n专利及著作权申请时间: 否\n颜色: 3000平方实体现货仓\n主要销售地区: 欧洲,南美,东南亚,北美,东北亚\n主要下游平台: 其他\n有可授权的自有品牌: 是\n规格: 正版单个(整盒请拍9个)\n出售状态: 现货\n\n正版单个(整盒请拍9个): CNY 16.45, stock 141\n\nSource: https://detail.1688.com/offer/1020408315989.html",
    "price": 28.38,
    "compare_at_price": 0,
    "cost_per_item": 4.11,
    "stock": 9,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1020408315989/01.webp",
    "images": [
      "assets/1688/1020408315989/01.webp",
      "assets/1688/1020408315989/02.webp",
      "assets/1688/1020408315989/03.webp",
      "assets/1688/1020408315989/04.webp",
      "assets/1688/1020408315989/05.webp"
    ],
    "vendor": "广州蒸汽波文化发展有限公司",
    "sku": "1688-1020408315989",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1020408315989.html",
    "source_currency": "CNY",
    "source_price": 16.45,
    "source_variants": [
      {
        "image": "",
        "name": "正版单个(整盒请拍9个)",
        "priceCny": 16.45,
        "stock": 141
      }
    ],
    "source_attributes": [
      {
        "name": "玩具材质",
        "value": "PVC"
      },
      {
        "name": "品牌",
        "value": "其它"
      },
      {
        "name": "专利及著作权",
        "value": "无专利及著作权"
      },
      {
        "name": "动漫角色",
        "value": "其它"
      },
      {
        "name": "产地",
        "value": "广东省"
      },
      {
        "name": "是否外贸专供",
        "value": "否"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "建议零售价",
        "value": "29.9"
      },
      {
        "name": "货号",
        "value": "1"
      },
      {
        "name": "上市时间",
        "value": "2000-2025"
      },
      {
        "name": "能力培养",
        "value": "情感,视觉,智力开发,动手动脑,感官,手眼协调,互动玩具,兴趣培养"
      },
      {
        "name": "是否有动漫形象",
        "value": "是"
      },
      {
        "name": "适用人群",
        "value": "不限"
      },
      {
        "name": "包装",
        "value": "彩盒装"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "原产国/地区",
        "value": "中国"
      },
      {
        "name": "专利号或版权登记证号",
        "value": "否"
      },
      {
        "name": "专利及著作权申请时间",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "3000平方实体现货仓"
      },
      {
        "name": "主要销售地区",
        "value": "欧洲,南美,东南亚,北美,东北亚"
      },
      {
        "name": "主要下游平台",
        "value": "其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "是"
      },
      {
        "name": "规格",
        "value": "正版单个(整盒请拍9个)"
      },
      {
        "name": "出售状态",
        "value": "现货"
      }
    ]
  },
  {
    "id": "1688-1020460213664",
    "title": "高级感新款肤感带镜头膜适用iPhone17promax苹果16手机壳15全包14",
    "category": "1688 Imports",
    "description": "Supplier: 汕头市潮阳区和平晨晞数码商行\n\n材质: 硅胶\n工艺: 磨砂\n款式: 全包款\n品牌: 无品牌\n功能: 防摔\n适用机型: 苹果\n流行元素: 纯色\n颜色: 【爱玛橙】水晶镜头肤感PC硬壳,【黑色】水晶镜头肤感PC硬壳,【水泥灰】水晶镜头肤感PC硬壳,【抹茶绿】水晶镜头肤感PC硬壳,【砂粉色】水晶镜头肤感PC硬壳,【暗夜绿】水晶镜头肤感PC硬壳,【奶蓝色】水晶镜头肤感PC硬壳,【白色】水晶镜头肤感PC硬壳,【香芋紫】水晶镜头肤感PC硬壳,【深蓝色】水晶镜头肤感PC硬壳,【暗紫色】水晶镜头肤感PC硬壳\n适用型号: iPhone 11,iPhone 12,iPhone 12pro,iPhone 12promax,iPhone13,iPhone13pro,iPhone13promax,iPhone14,iPhone14pro,iPhone14promax,iPhone15,iPhone15pro,iPhone15promax,iPhone16,iPhone16pro,iPhone16promax,iPhone17,iPhone17pro,iPhone17promax\n主要下游平台: 其他\n是否跨境出口专供货源: 否\n支持订制: 不支持\n是否专利货源: 否\n风格: 日韩\n颜色分类: 古董白\n\niPhone 11: CNY 12.00, stock 200\niPhone 12: CNY 12.00, stock 200\niPhone 12pro: CNY 12.00, stock 200\niPhone 12promax: CNY 12.00, stock 198\niPhone13: CNY 12.00, stock 200\niPhone13pro: CNY 12.00, stock 200\niPhone13promax: CNY 12.00, stock 200\niPhone14: CNY 12.00, stock 198\niPhone14pro: CNY 12.00, stock 200\niPhone14promax: CNY 12.00, stock 200\niPhone15: CNY 12.00, stock 200\niPhone15pro: CNY 12.00, stock 199\niPhone15promax: CNY 12.00, stock 199\niPhone16: CNY 12.00, stock 200\niPhone16pro: CNY 12.00, stock 199\niPhone16promax: CNY 12.00, stock 199\niPhone17: CNY 12.00, stock 199\niPhone17pro: CNY 12.00, stock 198\niPhone17promax: CNY 12.00, stock 189\n\nSource: https://detail.1688.com/offer/1020460213664.html",
    "price": 20.7,
    "compare_at_price": 0,
    "cost_per_item": 3,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1020460213664/01.webp",
    "images": [
      "assets/1688/1020460213664/01.webp",
      "assets/1688/1020460213664/02.webp",
      "assets/1688/1020460213664/03.webp",
      "assets/1688/1020460213664/04.webp",
      "assets/1688/1020460213664/05.webp",
      "assets/1688/1020460213664/06.webp",
      "assets/1688/1020460213664/07.webp",
      "assets/1688/1020460213664/08.webp",
      "assets/1688/1020460213664/09.webp",
      "assets/1688/1020460213664/10.webp",
      "assets/1688/1020460213664/11.webp",
      "assets/1688/1020460213664/12.webp",
      "assets/1688/1020460213664/13.webp",
      "assets/1688/1020460213664/14.webp",
      "assets/1688/1020460213664/15.webp",
      "assets/1688/1020460213664/16.webp"
    ],
    "vendor": "汕头市潮阳区和平晨晞数码商行",
    "sku": "1688-1020460213664",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1020460213664.html",
    "source_currency": "CNY",
    "source_price": 12,
    "source_variants": [
      {
        "image": "",
        "name": "iPhone 11",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone 12",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone 12pro",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone 12promax",
        "priceCny": 12,
        "stock": 198
      },
      {
        "image": "",
        "name": "iPhone13",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone13pro",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone13promax",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone14",
        "priceCny": 12,
        "stock": 198
      },
      {
        "image": "",
        "name": "iPhone14pro",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone14promax",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone15",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone15pro",
        "priceCny": 12,
        "stock": 199
      },
      {
        "image": "",
        "name": "iPhone15promax",
        "priceCny": 12,
        "stock": 199
      },
      {
        "image": "",
        "name": "iPhone16",
        "priceCny": 12,
        "stock": 200
      },
      {
        "image": "",
        "name": "iPhone16pro",
        "priceCny": 12,
        "stock": 199
      },
      {
        "image": "",
        "name": "iPhone16promax",
        "priceCny": 12,
        "stock": 199
      },
      {
        "image": "",
        "name": "iPhone17",
        "priceCny": 12,
        "stock": 199
      },
      {
        "image": "",
        "name": "iPhone17pro",
        "priceCny": 12,
        "stock": 198
      },
      {
        "image": "",
        "name": "iPhone17promax",
        "priceCny": 12,
        "stock": 189
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "硅胶"
      },
      {
        "name": "工艺",
        "value": "磨砂"
      },
      {
        "name": "款式",
        "value": "全包款"
      },
      {
        "name": "品牌",
        "value": "无品牌"
      },
      {
        "name": "功能",
        "value": "防摔"
      },
      {
        "name": "适用机型",
        "value": "苹果"
      },
      {
        "name": "流行元素",
        "value": "纯色"
      },
      {
        "name": "颜色",
        "value": "【爱玛橙】水晶镜头肤感PC硬壳,【黑色】水晶镜头肤感PC硬壳,【水泥灰】水晶镜头肤感PC硬壳,【抹茶绿】水晶镜头肤感PC硬壳,【砂粉色】水晶镜头肤感PC硬壳,【暗夜绿】水晶镜头肤感PC硬壳,【奶蓝色】水晶镜头肤感PC硬壳,【白色】水晶镜头肤感PC硬壳,【香芋紫】水晶镜头肤感PC硬壳,【深蓝色】水晶镜头肤感PC硬壳,【暗紫色】水晶镜头肤感PC硬壳"
      },
      {
        "name": "适用型号",
        "value": "iPhone 11,iPhone 12,iPhone 12pro,iPhone 12promax,iPhone13,iPhone13pro,iPhone13promax,iPhone14,iPhone14pro,iPhone14promax,iPhone15,iPhone15pro,iPhone15promax,iPhone16,iPhone16pro,iPhone16promax,iPhone17,iPhone17pro,iPhone17promax"
      },
      {
        "name": "主要下游平台",
        "value": "其他"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "支持订制",
        "value": "不支持"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "风格",
        "value": "日韩"
      },
      {
        "name": "颜色分类",
        "value": "古董白"
      }
    ]
  },
  {
    "id": "1688-1024105242339",
    "title": "面包小屋适用苹果17promax手机壳iphone16磁吸支架15创意韩13软17",
    "category": "1688 Imports",
    "description": "Supplier: 广东塔下科技有限责任公司\n\n材质: tpu\n工艺: 彩绘\n款式: 软壳\n品牌: 塔下\n功能: 防摔\n适用机型: 苹果\n流行元素: 彩绘,卡通,字母,几何,涂鸦,磁吸\n货号: 【泡泡心磁吸】\n颜色: 柚子白磁吸 面包小店+蓝角包 磁吸支架,柚子白磁吸 面包小店,蓝角包 磁吸支架\n适用型号: 17promax 精孔,17pro 精孔,17,16promax,16pro,16,15promax,15pro,15,14promax,14pro,13/14,13promax,13pro,12pro max(6.7),12/12pro,11,【单个支架】\n支持订制: 支持\n风格: 日韩,个性,创意,几何,小众,ins风\n苹果型号: iPhone14 Pro Max\n颜色分类: 古董白\n\n17promax 精孔: CNY 14.90, stock 3742\n17pro 精孔: CNY 14.90, stock 3814\n17: CNY 14.90, stock 3945\n16promax: CNY 14.90, stock 3920\n16pro: CNY 14.90, stock 3936\n16: CNY 14.90, stock 3977\n15promax: CNY 14.90, stock 3971\n15pro: CNY 14.90, stock 3971\n15: CNY 14.90, stock 3970\n14promax: CNY 14.90, stock 3976\n14pro: CNY 14.90, stock 3977\n13/14: CNY 14.90, stock 3967\n13promax: CNY 14.90, stock 3991\n13pro: CNY 14.90, stock 3992\n12pro max(6.7): CNY 14.90, stock 3991\n12/12pro: CNY 14.90, stock 3993\n11: CNY 14.90, stock 3994\n\nSource: https://detail.1688.com/offer/1024105242339.html",
    "price": 25.7,
    "compare_at_price": 0,
    "cost_per_item": 3.73,
    "stock": 58,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1024105242339/01.webp",
    "images": [
      "assets/1688/1024105242339/01.webp",
      "assets/1688/1024105242339/02.webp",
      "assets/1688/1024105242339/03.webp",
      "assets/1688/1024105242339/04.webp",
      "assets/1688/1024105242339/05.webp",
      "assets/1688/1024105242339/06.webp",
      "assets/1688/1024105242339/07.webp"
    ],
    "vendor": "广东塔下科技有限责任公司",
    "sku": "1688-1024105242339",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1024105242339.html",
    "source_currency": "CNY",
    "source_price": 14.9,
    "source_variants": [
      {
        "image": "",
        "name": "17promax 精孔",
        "priceCny": 14.9,
        "stock": 3742
      },
      {
        "image": "",
        "name": "17pro 精孔",
        "priceCny": 14.9,
        "stock": 3814
      },
      {
        "image": "",
        "name": "17",
        "priceCny": 14.9,
        "stock": 3945
      },
      {
        "image": "",
        "name": "16promax",
        "priceCny": 14.9,
        "stock": 3920
      },
      {
        "image": "",
        "name": "16pro",
        "priceCny": 14.9,
        "stock": 3936
      },
      {
        "image": "",
        "name": "16",
        "priceCny": 14.9,
        "stock": 3977
      },
      {
        "image": "",
        "name": "15promax",
        "priceCny": 14.9,
        "stock": 3971
      },
      {
        "image": "",
        "name": "15pro",
        "priceCny": 14.9,
        "stock": 3971
      },
      {
        "image": "",
        "name": "15",
        "priceCny": 14.9,
        "stock": 3970
      },
      {
        "image": "",
        "name": "14promax",
        "priceCny": 14.9,
        "stock": 3976
      },
      {
        "image": "",
        "name": "14pro",
        "priceCny": 14.9,
        "stock": 3977
      },
      {
        "image": "",
        "name": "13/14",
        "priceCny": 14.9,
        "stock": 3967
      },
      {
        "image": "",
        "name": "13promax",
        "priceCny": 14.9,
        "stock": 3991
      },
      {
        "image": "",
        "name": "13pro",
        "priceCny": 14.9,
        "stock": 3992
      },
      {
        "image": "",
        "name": "12pro max(6.7)",
        "priceCny": 14.9,
        "stock": 3991
      },
      {
        "image": "",
        "name": "12/12pro",
        "priceCny": 14.9,
        "stock": 3993
      },
      {
        "image": "",
        "name": "11",
        "priceCny": 14.9,
        "stock": 3994
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "tpu"
      },
      {
        "name": "工艺",
        "value": "彩绘"
      },
      {
        "name": "款式",
        "value": "软壳"
      },
      {
        "name": "品牌",
        "value": "塔下"
      },
      {
        "name": "功能",
        "value": "防摔"
      },
      {
        "name": "适用机型",
        "value": "苹果"
      },
      {
        "name": "流行元素",
        "value": "彩绘,卡通,字母,几何,涂鸦,磁吸"
      },
      {
        "name": "货号",
        "value": "【泡泡心磁吸】"
      },
      {
        "name": "颜色",
        "value": "柚子白磁吸 面包小店+蓝角包 磁吸支架,柚子白磁吸 面包小店,蓝角包 磁吸支架"
      },
      {
        "name": "适用型号",
        "value": "17promax 精孔,17pro 精孔,17,16promax,16pro,16,15promax,15pro,15,14promax,14pro,13/14,13promax,13pro,12pro max(6.7),12/12pro,11,【单个支架】"
      },
      {
        "name": "支持订制",
        "value": "支持"
      },
      {
        "name": "风格",
        "value": "日韩,个性,创意,几何,小众,ins风"
      },
      {
        "name": "苹果型号",
        "value": "iPhone14 Pro Max"
      },
      {
        "name": "颜色分类",
        "value": "古董白"
      }
    ]
  },
  {
    "id": "1688-1025793009854",
    "title": "正版新款三小毛缤纷甜品梳妆派对毛绒玩具包包装饰品钥匙挂件礼物",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市都志工艺品有限公司\n\n玩具材质: 搪胶\n品牌: 都志工厂店\n专利及著作权: 外观设计专利\n动漫角色: 其它\n产地: 浙江省\n是否外贸专供: 是\n适用年龄: 青年（15-35岁）\n建议零售价: 49.8\n货号: 1\n上市时间: 2025/8/5\n能力培养: 情感,抓握,其他能力培养,互动玩具,亲子交流,兴趣培养\n是否有动漫形象: 否\n适用人群: 不限\n包装: 彩盒装\n是否进口: 否\n3C配置类别: 14岁以上的玩具\n是否跨境出口专供货源: 是\n原产国/地区: 中国\n颜色: 三小毛-缤纷甜品梳妆派对,猫崽崽-魔法小兔T6,三小毛-海洋总动员T6,三小毛-站姿十二星座盲盒T12【正版】,三小毛-小狗乖乖T6,三小毛-mini招财兔盲盒T8,三小毛-多彩小兔兔T8,三小毛-果果喜好运T6,三小毛-mini十二生肖T12【正版】,三小毛-春日游记手机包T6,艾米-mini十二星座-B T6,艾米400%体-糖果罐里的精灵盲盒T6,艾米-mini十二星座-A T6,艾米400体-糖果罐里的精灵盲盒T6【正版】,三小毛-兔兔精灵600%体T4,三小毛400体-皇冠小兔 T2,三小毛-动物聚会化妆镜T6,三小毛400%体-软萌兔宝T6,艾米-小兔叽盲盒T8,三小毛400%体-萌宠双肩背包T1三小毛400%体-萌宠双肩背包T4,三小毛-U形枕T6,三小毛-海洋欢聚日T6,三小毛-睡梦之间二代之换装派对T6,三小毛-十二生肖盲盒T12【正版】,十二星座毛绒盲盒T12【正版】,三小毛-招财猫盲盒T6【正版】,三小毛-睡梦之间盲盒T6【正版】,三小毛-动物园游会二代t6【正版】,三小毛-奶萌小宠物T6,三小毛-猫猫聚会T6,三小毛400%体-小熊小兔盲盒T6,三小毛-魔力炫彩兔T6\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他\n有可授权的自有品牌: 是\n规格: 单个随机,端盒不重复\n出售状态: 现货,定做,代购,预售,其他\n属性二: 包包挂件\n属性三: 潮玩毛绒玩具\n属性一: 毛绒公仔玩具\n\n单个随机: CNY 30.40, stock 54849\n端盒不重复: CNY 186.20, stock 54849\n\nSource: https://detail.1688.com/offer/1025793009854.html",
    "price": 52.44,
    "compare_at_price": 0,
    "cost_per_item": 7.6,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1025793009854/01.webp",
    "images": [
      "assets/1688/1025793009854/01.webp",
      "assets/1688/1025793009854/02.webp",
      "assets/1688/1025793009854/03.webp",
      "assets/1688/1025793009854/04.webp",
      "assets/1688/1025793009854/05.webp",
      "assets/1688/1025793009854/06.webp",
      "assets/1688/1025793009854/07.webp",
      "assets/1688/1025793009854/08.webp",
      "assets/1688/1025793009854/09.webp",
      "assets/1688/1025793009854/10.webp",
      "assets/1688/1025793009854/11.webp",
      "assets/1688/1025793009854/12.webp",
      "assets/1688/1025793009854/13.webp",
      "assets/1688/1025793009854/14.webp",
      "assets/1688/1025793009854/15.webp",
      "assets/1688/1025793009854/16.webp",
      "assets/1688/1025793009854/17.webp",
      "assets/1688/1025793009854/18.webp",
      "assets/1688/1025793009854/19.webp",
      "assets/1688/1025793009854/20.webp",
      "assets/1688/1025793009854/21.webp",
      "assets/1688/1025793009854/22.webp",
      "assets/1688/1025793009854/23.webp",
      "assets/1688/1025793009854/24.webp",
      "assets/1688/1025793009854/25.webp",
      "assets/1688/1025793009854/26.webp",
      "assets/1688/1025793009854/27.webp",
      "assets/1688/1025793009854/28.webp",
      "assets/1688/1025793009854/29.webp",
      "assets/1688/1025793009854/30.webp",
      "assets/1688/1025793009854/31.webp",
      "assets/1688/1025793009854/32.webp",
      "assets/1688/1025793009854/33.webp",
      "assets/1688/1025793009854/34.webp",
      "assets/1688/1025793009854/35.webp",
      "assets/1688/1025793009854/36.webp"
    ],
    "vendor": "义乌市都志工艺品有限公司",
    "sku": "1688-1025793009854",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1025793009854.html",
    "source_currency": "CNY",
    "source_price": 30.4,
    "source_variants": [
      {
        "image": "",
        "name": "单个随机",
        "priceCny": 30.4,
        "stock": 54849
      },
      {
        "image": "",
        "name": "端盒不重复",
        "priceCny": 186.2,
        "stock": 54849
      }
    ],
    "source_attributes": [
      {
        "name": "玩具材质",
        "value": "搪胶"
      },
      {
        "name": "品牌",
        "value": "都志工厂店"
      },
      {
        "name": "专利及著作权",
        "value": "外观设计专利"
      },
      {
        "name": "动漫角色",
        "value": "其它"
      },
      {
        "name": "产地",
        "value": "浙江省"
      },
      {
        "name": "是否外贸专供",
        "value": "是"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "建议零售价",
        "value": "49.8"
      },
      {
        "name": "货号",
        "value": "1"
      },
      {
        "name": "上市时间",
        "value": "2025/8/5"
      },
      {
        "name": "能力培养",
        "value": "情感,抓握,其他能力培养,互动玩具,亲子交流,兴趣培养"
      },
      {
        "name": "是否有动漫形象",
        "value": "否"
      },
      {
        "name": "适用人群",
        "value": "不限"
      },
      {
        "name": "包装",
        "value": "彩盒装"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "原产国/地区",
        "value": "中国"
      },
      {
        "name": "颜色",
        "value": "三小毛-缤纷甜品梳妆派对,猫崽崽-魔法小兔T6,三小毛-海洋总动员T6,三小毛-站姿十二星座盲盒T12【正版】,三小毛-小狗乖乖T6,三小毛-mini招财兔盲盒T8,三小毛-多彩小兔兔T8,三小毛-果果喜好运T6,三小毛-mini十二生肖T12【正版】,三小毛-春日游记手机包T6,艾米-mini十二星座-B T6,艾米400%体-糖果罐里的精灵盲盒T6,艾米-mini十二星座-A T6,艾米400体-糖果罐里的精灵盲盒T6【正版】,三小毛-兔兔精灵600%体T4,三小毛400体-皇冠小兔 T2,三小毛-动物聚会化妆镜T6,三小毛400%体-软萌兔宝T6,艾米-小兔叽盲盒T8,三小毛400%体-萌宠双肩背包T1三小毛400%体-萌宠双肩背包T4,三小毛-U形枕T6,三小毛-海洋欢聚日T6,三小毛-睡梦之间二代之换装派对T6,三小毛-十二生肖盲盒T12【正版】,十二星座毛绒盲盒T12【正版】,三小毛-招财猫盲盒T6【正版】,三小毛-睡梦之间盲盒T6【正版】,三小毛-动物园游会二代t6【正版】,三小毛-奶萌小宠物T6,三小毛-猫猫聚会T6,三小毛400%体-小熊小兔盲盒T6,三小毛-魔力炫彩兔T6"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "是"
      },
      {
        "name": "规格",
        "value": "单个随机,端盒不重复"
      },
      {
        "name": "出售状态",
        "value": "现货,定做,代购,预售,其他"
      },
      {
        "name": "属性二",
        "value": "包包挂件"
      },
      {
        "name": "属性三",
        "value": "潮玩毛绒玩具"
      },
      {
        "name": "属性一",
        "value": "毛绒公仔玩具"
      }
    ]
  },
  {
    "id": "1688-1030629400777",
    "title": "三丽鸥家族花意系列盲盒凯蒂猫手办可爱潮玩摆件玩偶少女心小礼物",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市钴雪玩具有限公司\n\n材质: PVC\n品牌: other\n是否专利货源: 否\n颜色: 整套6款不重复/独立盒装,【精美礼盒装】全套6款不重复,【透明装装】全套6款不重复,随机单个盒装,随机两个盒装】,随机三个盒装,随机四个盒装,随机五个盒装,指定款【许愿兔】盒装,指定款【玉桂狗】盒装,指定款【帕恰狗】盒装,指定款【库洛米】盒装,指定款【美乐蒂】盒装,指定款【kt猫】盒装\n尺寸: 三丽鸥新品【花意系列】\n加工定制: 否\n货号: 1012210623\n适用送礼场合: 其他\n适用送礼关系: 同事,孩子,同学,恩师\n适用节日: 圣诞节\n是否属于礼品: 是，个人礼品\n是否跨境出口专供货源: 是\n主要下游平台: 其他\n有可授权的自有品牌: 否\n是否IP授权: 否\n\n三丽鸥新品【花意系列】: CNY 51.12, stock 913\n\nSource: https://detail.1688.com/offer/1030629400777.html",
    "price": 88.18,
    "compare_at_price": 0,
    "cost_per_item": 12.78,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1030629400777/01.webp",
    "images": [
      "assets/1688/1030629400777/01.webp",
      "assets/1688/1030629400777/02.webp",
      "assets/1688/1030629400777/03.webp",
      "assets/1688/1030629400777/04.webp",
      "assets/1688/1030629400777/05.webp",
      "assets/1688/1030629400777/06.webp",
      "assets/1688/1030629400777/07.webp",
      "assets/1688/1030629400777/08.webp",
      "assets/1688/1030629400777/09.webp",
      "assets/1688/1030629400777/10.webp",
      "assets/1688/1030629400777/11.webp",
      "assets/1688/1030629400777/12.webp",
      "assets/1688/1030629400777/13.webp",
      "assets/1688/1030629400777/14.webp",
      "assets/1688/1030629400777/15.webp",
      "assets/1688/1030629400777/16.webp",
      "assets/1688/1030629400777/17.webp",
      "assets/1688/1030629400777/18.webp",
      "assets/1688/1030629400777/19.webp"
    ],
    "vendor": "义乌市钴雪玩具有限公司",
    "sku": "1688-1030629400777",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1030629400777.html",
    "source_currency": "CNY",
    "source_price": 51.12,
    "source_variants": [
      {
        "image": "",
        "name": "三丽鸥新品【花意系列】",
        "priceCny": 51.12,
        "stock": 913
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "品牌",
        "value": "other"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "整套6款不重复/独立盒装,【精美礼盒装】全套6款不重复,【透明装装】全套6款不重复,随机单个盒装,随机两个盒装】,随机三个盒装,随机四个盒装,随机五个盒装,指定款【许愿兔】盒装,指定款【玉桂狗】盒装,指定款【帕恰狗】盒装,指定款【库洛米】盒装,指定款【美乐蒂】盒装,指定款【kt猫】盒装"
      },
      {
        "name": "尺寸",
        "value": "三丽鸥新品【花意系列】"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "货号",
        "value": "1012210623"
      },
      {
        "name": "适用送礼场合",
        "value": "其他"
      },
      {
        "name": "适用送礼关系",
        "value": "同事,孩子,同学,恩师"
      },
      {
        "name": "适用节日",
        "value": "圣诞节"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "主要下游平台",
        "value": "其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      }
    ]
  },
  {
    "id": "1688-1030647408225",
    "title": "卡通q版钥匙扣挂件可爱背包饰品挂饰送情侣闺蜜小礼物批发",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市睿谂电子商务商行\n\n材质: 塑料/树脂\n钥匙配饰分类: 钥匙扣\n品牌: 洛勋\n风格: 卡通\n颜色: 晚安星星人—恐龙睡衣（钥匙扣-挂件）,晚安星星人—难过（钥匙扣-挂件),晚安星星人—读书（钥匙扣-挂件）,晚安星星人—星星蓝色帽子（钥匙扣-挂件）,晚安星星人—睡觉（钥匙扣-挂件）,随机发\n是否IP授权: 否\n是否属于礼品: 是，个人礼品\n适用送礼关系: 情侣,同事,朋友,孩子,同学,恩师,其他\n是否专利货源: 否\n适用节日: 圣诞节,情人节,教师节,七夕,万圣节,国庆节,儿童节,其他\n送礼用途: 促销赠品,其他\n适用送礼场合: 圣诞节,情人节,教师节,七夕,万圣节,国庆节,儿童节,其他\n\n晚安星星人—恐龙睡衣（钥匙扣-挂件）: CNY 1.49, stock 17363\n晚安星星人—难过（钥匙扣-挂件): CNY 1.49, stock 18374\n晚安星星人—读书（钥匙扣-挂件）: CNY 1.49, stock 17629\n晚安星星人—星星蓝色帽子（钥匙扣-挂件）: CNY 1.49, stock 17804\n晚安星星人—睡觉（钥匙扣-挂件）: CNY 1.49, stock 17602\n随机发: CNY 1.49, stock 13770\n\nSource: https://detail.1688.com/offer/1030647408225.html",
    "price": 2.57,
    "compare_at_price": 0,
    "cost_per_item": 0.37,
    "stock": 16,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1030647408225/01.webp",
    "images": [
      "assets/1688/1030647408225/01.webp",
      "assets/1688/1030647408225/02.webp",
      "assets/1688/1030647408225/03.webp",
      "assets/1688/1030647408225/04.webp",
      "assets/1688/1030647408225/05.webp",
      "assets/1688/1030647408225/06.webp",
      "assets/1688/1030647408225/07.webp",
      "assets/1688/1030647408225/08.webp",
      "assets/1688/1030647408225/09.webp",
      "assets/1688/1030647408225/10.webp",
      "assets/1688/1030647408225/11.webp",
      "assets/1688/1030647408225/12.webp",
      "assets/1688/1030647408225/13.webp",
      "assets/1688/1030647408225/14.webp",
      "assets/1688/1030647408225/15.webp",
      "assets/1688/1030647408225/16.webp",
      "assets/1688/1030647408225/17.webp"
    ],
    "vendor": "义乌市睿谂电子商务商行",
    "sku": "1688-1030647408225",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1030647408225.html",
    "source_currency": "CNY",
    "source_price": 1.49,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IPCE8Y1IkuHuMkvyb_!!2217575230932-0-cib.jpg_sum.jpg",
        "name": "晚安星星人—恐龙睡衣（钥匙扣-挂件）",
        "priceCny": 1.49,
        "stock": 17363
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01fkI9wZ1IkuHujGlcw_!!2217575230932-0-cib.jpg_sum.jpg",
        "name": "晚安星星人—难过（钥匙扣-挂件)",
        "priceCny": 1.49,
        "stock": 18374
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ktlZXM1IkuHwAn5OI_!!2217575230932-0-cib.jpg_sum.jpg",
        "name": "晚安星星人—读书（钥匙扣-挂件）",
        "priceCny": 1.49,
        "stock": 17629
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ECIt0r1IkuHuZLYSJ_!!2217575230932-0-cib.jpg_sum.jpg",
        "name": "晚安星星人—星星蓝色帽子（钥匙扣-挂件）",
        "priceCny": 1.49,
        "stock": 17804
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01geiUVp1IkuHunHiDn_!!2217575230932-0-cib.jpg_sum.jpg",
        "name": "晚安星星人—睡觉（钥匙扣-挂件）",
        "priceCny": 1.49,
        "stock": 17602
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01eK32gC1IkuHuHo3Me_!!2217575230932-0-cib.jpg_sum.jpg",
        "name": "随机发",
        "priceCny": 1.49,
        "stock": 13770
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "塑料/树脂"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣"
      },
      {
        "name": "品牌",
        "value": "洛勋"
      },
      {
        "name": "风格",
        "value": "卡通"
      },
      {
        "name": "颜色",
        "value": "晚安星星人—恐龙睡衣（钥匙扣-挂件）,晚安星星人—难过（钥匙扣-挂件),晚安星星人—读书（钥匙扣-挂件）,晚安星星人—星星蓝色帽子（钥匙扣-挂件）,晚安星星人—睡觉（钥匙扣-挂件）,随机发"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "适用送礼关系",
        "value": "情侣,同事,朋友,孩子,同学,恩师,其他"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "圣诞节,情人节,教师节,七夕,万圣节,国庆节,儿童节,其他"
      },
      {
        "name": "送礼用途",
        "value": "促销赠品,其他"
      },
      {
        "name": "适用送礼场合",
        "value": "圣诞节,情人节,教师节,七夕,万圣节,国庆节,儿童节,其他"
      }
    ]
  },
  {
    "id": "1688-1031743616774",
    "title": "【源头工厂】吸盘手机支架磁吸车载墙壁支撑导航汽车稳固便携",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市风迷控科技有限公司\n\n材质: 金属\n风格: 通用\n类型: 折叠支架\n品牌: 其他\n支持订制: 不支持\n货号: DQ\n适用场景: 车载\n颜色: 黑色\n主要销售地区: 北美,东北亚,中东,国内电商,其他\n有可授权的自有品牌: 否\n款式: 塑料,金属\n是否专利货源: 否\n工厂直销: 跨境磁吸手机支架真空吸盘式导航车载手机架桌面折叠便携懒人支架\n固定方式: 抽拉式\n3C证书编号: 2025160907687272\n功能: 防抖\n生产企业: 深圳市风迷控科技有限公司\n爆款: 真空磁吸手机支架汽车中控台导航支撑多功能折叠磁吸车载支架旋转\n跨境: 手机支架2026新款车载吸盘真空吸附汽车通用导航磁吸固定桌面支架\n\n塑料: CNY 3.50, stock 98193\n金属: CNY 5.30, stock 97455\n\nSource: https://detail.1688.com/offer/1031743616774.html",
    "price": 6.04,
    "compare_at_price": 0,
    "cost_per_item": 0.88,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1031743616774/01.webp",
    "images": [
      "assets/1688/1031743616774/01.webp",
      "assets/1688/1031743616774/02.webp",
      "assets/1688/1031743616774/03.webp",
      "assets/1688/1031743616774/04.webp",
      "assets/1688/1031743616774/05.webp"
    ],
    "vendor": "深圳市风迷控科技有限公司",
    "sku": "1688-1031743616774",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1031743616774.html",
    "source_currency": "CNY",
    "source_price": 3.5,
    "source_variants": [
      {
        "image": "",
        "name": "塑料",
        "priceCny": 3.5,
        "stock": 98193
      },
      {
        "image": "",
        "name": "金属",
        "priceCny": 5.3,
        "stock": 97455
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "金属"
      },
      {
        "name": "风格",
        "value": "通用"
      },
      {
        "name": "类型",
        "value": "折叠支架"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "支持订制",
        "value": "不支持"
      },
      {
        "name": "货号",
        "value": "DQ"
      },
      {
        "name": "适用场景",
        "value": "车载"
      },
      {
        "name": "颜色",
        "value": "黑色"
      },
      {
        "name": "主要销售地区",
        "value": "北美,东北亚,中东,国内电商,其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "款式",
        "value": "塑料,金属"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "工厂直销",
        "value": "跨境磁吸手机支架真空吸盘式导航车载手机架桌面折叠便携懒人支架"
      },
      {
        "name": "固定方式",
        "value": "抽拉式"
      },
      {
        "name": "3C证书编号",
        "value": "2025160907687272"
      },
      {
        "name": "功能",
        "value": "防抖"
      },
      {
        "name": "生产企业",
        "value": "深圳市风迷控科技有限公司"
      },
      {
        "name": "爆款",
        "value": "真空磁吸手机支架汽车中控台导航支撑多功能折叠磁吸车载支架旋转"
      },
      {
        "name": "跨境",
        "value": "手机支架2026新款车载吸盘真空吸附汽车通用导航磁吸固定桌面支架"
      }
    ]
  },
  {
    "id": "1688-1033862052730",
    "title": "精臣D110打价格标签打印机超市商品热敏不干胶标签机手持小型服装",
    "category": "1688 Imports",
    "description": "Supplier: 无锡市梁溪区庆玉莫贸易商行\n\n品牌: 庆玉\n类型: 标配\n型号: 打价宝\n货号: 9676567467\n规格: D110春绿+送1卷【15*30白色】共210张-标配,D110白色+送1卷【15*30白色】共210张-标配,D110白色+送1卷【12*22白色】共250张-标配,D110白色+送1卷【6*22/2排白色】共520张-标配,D110白色+送1卷【15*50白色】共125张-标配,D110白色+送1卷【四色彩色】标签共210张-标配,D110白色+送1卷【14*30透明】共210张-标配,D110云水蓝+送1卷【15*30白色】共210张-标配,【套餐】D110白色+10卷14*22mm白色（共2600张）+送210张白色-标配,D110白+2卷【10*25】白色（含赠1卷，共480张）-标配,D110白+2卷【15*30】白色（含赠1卷，共420张）-标配,D110白+2卷【12*22】白色（含赠1卷，共500张）-标配,D110白+2卷【6*22】白色（含赠1卷，共1040张）-标配,D110白+2卷【6*12】白色（含赠1卷，共1840张）-标配,D110白+2卷【15*50】白色（含赠1卷，共250张）-标配,D110白+3卷【15*30】白色（含赠1卷，共630张）-标配,D110白+3卷【10*25】白色（含赠1卷，共720张）-标配,D110白+3卷【12*22】白色（含赠1卷，共750张）-标配,D110白+3卷【6*22】白色（含赠1卷，共1560张）-标配,D110白+3卷【6*12】白色（含赠1卷，共2760张）-标配,D110白+3卷【15*50】白色（含赠1卷，共375张）-标配,D110白+4卷【10*25】白色（含赠1卷，共960张）-标配,D110白+4卷15*30白色（含赠1卷，共840张）-标配,D110白+4卷12*22白色（含赠1卷，共1000张）-标配,D110白+4卷15*50白色（含赠1卷，共500张）-标配,D110白+7卷10*25白色（含赠2卷，共1680张）-标配,D110白+7卷15*30白色（含赠2卷，共1470张）-标配,D110白+7卷12*22白色（含赠2卷，共1750张）-标配,D110白+7卷15*50白色（含赠1卷，共875张）-标配,D11白色+送1卷【15*30白色】共210张-标配,D11蓝色+送1卷【15*30白色】共210张-标配,D11粉色+送1卷【15*30白色】共210张-标配,D11黑色+送1卷【15*30白色】共210张-标配,【套餐】D11白色+10卷14*22mm白色（共2600张）+送210张白色-标配,D11白色+2卷白色标签(尺寸任选,默认发15*30mm)含赠1卷-标配,D11白色+4卷白色标签(尺寸任选,默认发15*30mm)含赠1卷-标配,D11白色+7卷白色标签(尺寸任选,默认发15*30mm)含赠2卷-标配,【大小尺寸都能打】D101白色（打印宽度25mm）+送1卷白色标签-标配,D110春绿+送1卷【15*30白色】-标配,标签均可单独购买/点击大图可查看常用尺寸，赠品及套餐标签纸均可联系更换-标配,2卷套餐（含送1卷，尺寸可换）+晒单再送1卷 ↓↓↓-标配,3卷套餐（含送1卷，尺寸可换）+晒单再送1卷 ↓↓↓-标配,4卷套餐（含送1卷，尺寸可换）+晒单再送1卷 ↓↓↓-标配,7卷套餐（含送2卷，尺寸可换）+晒单再送1卷 ↓↓↓-标配,新品【300dpi更高清/速度升级】↓↓↓-标配\n\nD110春绿+送1卷【15*30白色】共210张-标配: CNY 68.07, stock 192\nD110白色+送1卷【15*30白色】共210张-标配: CNY 93.77, stock 198\nD110白色+送1卷【12*22白色】共250张-标配: CNY 93.77, stock 198\nD110白色+送1卷【6*22/2排白色】共520张-标配: CNY 93.77, stock 198\nD110白色+送1卷【15*50白色】共125张-标配: CNY 93.77, stock 200\nD110白色+送1卷【四色彩色】标签共210张-标配: CNY 93.77, stock 200\nD110白色+送1卷【14*30透明】共210张-标配: CNY 107.22, stock 200\nD110云水蓝+送1卷【15*30白色】共210张-标配: CNY 93.77, stock 200\n【套餐】D110白色+10卷14*22mm白色（共2600张）+送210张白色-标配: CNY 300.39, stock 200\nD110白+2卷【10*25】白色（含赠1卷，共480张）-标配: CNY 120.66, stock 200\nD110白+2卷【15*30】白色（含赠1卷，共420张）-标配: CNY 120.66, stock 200\nD110白+2卷【12*22】白色（含赠1卷，共500张）-标配: CNY 120.66, stock 200\nD110白+2卷【6*22】白色（含赠1卷，共1040张）-标配: CNY 120.66, stock 200\nD110白+2卷【6*12】白色（含赠1卷，共1840张）-标配: CNY 120.66, stock 200\nD110白+2卷【15*50】白色（含赠1卷，共250张）-标配: CNY 120.66, stock 200\nD110白+3卷【15*30】白色（含赠1卷，共630张）-标配: CNY 147.55, stock 200\nD110白+3卷【10*25】白色（含赠1卷，共720张）-标配: CNY 147.55, stock 200\nD110白+3卷【12*22】白色（含赠1卷，共750张）-标配: CNY 147.55, stock 200\nD110白+3卷【6*22】白色（含赠1卷，共1560张）-标配: CNY 147.55, stock 200\nD110白+3卷【6*12】白色（含赠1卷，共2760张）-标配: CNY 147.55, stock 199\nD110白+3卷【15*50】白色（含赠1卷，共375张）-标配: CNY 147.55, stock 200\nD110白+4卷【10*25】白色（含赠1卷，共960张）-标配: CNY 174.46, stock 200\nD110白+4卷15*30白色（含赠1卷，共840张）-标配: CNY 174.46, stock 200\nD110白+4卷12*22白色（含赠1卷，共1000张）-标配: CNY 174.46, stock 200\nD110白+4卷15*50白色（含赠1卷，共500张）-标配: CNY 174.46, stock 200\nD110白+7卷10*25白色（含赠2卷，共1680张）-标配: CNY 228.26, stock 199\nD110白+7卷15*30白色（含赠2卷，共1470张）-标配: CNY 228.26, stock 199\nD110白+7卷12*22白色（含赠2卷，共1750张）-标配: CNY 228.26, stock 200\nD110白+7卷15*50白色（含赠1卷，共875张）-标配: CNY 228.26, stock 200\nD11白色+送1卷【15*30白色】共210张-标配: CNY 142.67, stock 200\nD11蓝色+送1卷【15*30白色】共210张-标配: CNY 142.67, stock 200\nD11粉色+送1卷【15*30白色】共210张-标配: CNY 142.67, stock 200\nD11黑色+送1卷【15*30白色】共210张-标配: CNY 142.67, stock 199\n【套餐】D11白色+10卷14*22mm白色（共2600张）+送210张白色-标配: CNY 349.31, stock 200\nD11白色+2卷白色标签(尺寸任选,默认发15*30mm)含赠1卷-标配: CNY 169.58, stock 200\nD11白色+4卷白色标签(尺寸任选,默认发15*30mm)含赠1卷-标配: CNY 223.37, stock 200\nD11白色+7卷白色标签(尺寸任选,默认发15*30mm)含赠2卷-标配: CNY 277.16, stock 200\n【大小尺寸都能打】D101白色（打印宽度25mm）+送1卷白色标签-标配: CNY 185.46, stock 200\nD110春绿+送1卷【15*30白色】-标配: CNY 93.77, stock 200\n\nSource: https://detail.1688.com/offer/1033862052730.html",
    "price": 117.42,
    "compare_at_price": 0,
    "cost_per_item": 17.02,
    "stock": 0,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1033862052730/01.webp",
    "images": [
      "assets/1688/1033862052730/01.webp",
      "assets/1688/1033862052730/02.webp",
      "assets/1688/1033862052730/03.webp",
      "assets/1688/1033862052730/04.webp",
      "assets/1688/1033862052730/05.webp",
      "assets/1688/1033862052730/06.webp",
      "assets/1688/1033862052730/07.webp",
      "assets/1688/1033862052730/08.webp",
      "assets/1688/1033862052730/09.webp",
      "assets/1688/1033862052730/10.webp",
      "assets/1688/1033862052730/11.webp",
      "assets/1688/1033862052730/12.webp",
      "assets/1688/1033862052730/13.webp",
      "assets/1688/1033862052730/14.webp",
      "assets/1688/1033862052730/15.webp",
      "assets/1688/1033862052730/16.webp",
      "assets/1688/1033862052730/17.webp",
      "assets/1688/1033862052730/18.webp",
      "assets/1688/1033862052730/19.webp",
      "assets/1688/1033862052730/20.webp",
      "assets/1688/1033862052730/21.webp",
      "assets/1688/1033862052730/22.webp",
      "assets/1688/1033862052730/23.webp",
      "assets/1688/1033862052730/24.webp",
      "assets/1688/1033862052730/25.webp",
      "assets/1688/1033862052730/26.webp",
      "assets/1688/1033862052730/27.webp",
      "assets/1688/1033862052730/28.webp",
      "assets/1688/1033862052730/29.webp",
      "assets/1688/1033862052730/30.webp",
      "assets/1688/1033862052730/31.webp",
      "assets/1688/1033862052730/32.webp",
      "assets/1688/1033862052730/33.webp",
      "assets/1688/1033862052730/34.webp",
      "assets/1688/1033862052730/35.webp",
      "assets/1688/1033862052730/36.webp",
      "assets/1688/1033862052730/37.webp",
      "assets/1688/1033862052730/38.webp",
      "assets/1688/1033862052730/39.webp",
      "assets/1688/1033862052730/40.webp",
      "assets/1688/1033862052730/41.webp",
      "assets/1688/1033862052730/42.webp",
      "assets/1688/1033862052730/43.webp",
      "assets/1688/1033862052730/44.webp",
      "assets/1688/1033862052730/45.webp",
      "assets/1688/1033862052730/46.webp",
      "assets/1688/1033862052730/47.webp",
      "assets/1688/1033862052730/48.webp",
      "assets/1688/1033862052730/49.webp",
      "assets/1688/1033862052730/50.webp",
      "assets/1688/1033862052730/51.webp",
      "assets/1688/1033862052730/52.webp",
      "assets/1688/1033862052730/53.webp",
      "assets/1688/1033862052730/54.webp",
      "assets/1688/1033862052730/55.webp",
      "assets/1688/1033862052730/56.webp",
      "assets/1688/1033862052730/57.webp",
      "assets/1688/1033862052730/58.webp",
      "assets/1688/1033862052730/59.webp",
      "assets/1688/1033862052730/60.webp",
      "assets/1688/1033862052730/61.webp",
      "assets/1688/1033862052730/62.webp",
      "assets/1688/1033862052730/63.webp",
      "assets/1688/1033862052730/64.webp",
      "assets/1688/1033862052730/65.webp",
      "assets/1688/1033862052730/66.webp",
      "assets/1688/1033862052730/67.webp",
      "assets/1688/1033862052730/68.webp",
      "assets/1688/1033862052730/69.webp",
      "assets/1688/1033862052730/70.webp",
      "assets/1688/1033862052730/71.webp",
      "assets/1688/1033862052730/72.webp",
      "assets/1688/1033862052730/73.webp",
      "assets/1688/1033862052730/74.webp",
      "assets/1688/1033862052730/75.webp",
      "assets/1688/1033862052730/76.webp",
      "assets/1688/1033862052730/77.webp",
      "assets/1688/1033862052730/78.webp",
      "assets/1688/1033862052730/79.webp",
      "assets/1688/1033862052730/80.webp",
      "assets/1688/1033862052730/81.webp",
      "assets/1688/1033862052730/82.webp",
      "assets/1688/1033862052730/83.webp",
      "assets/1688/1033862052730/84.webp",
      "assets/1688/1033862052730/85.webp"
    ],
    "vendor": "无锡市梁溪区庆玉莫贸易商行",
    "sku": "1688-1033862052730",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1033862052730.html",
    "source_currency": "CNY",
    "source_price": 68.07,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01OIeoNN1I9oBF6n1fv_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110春绿+送1卷【15*30白色】共210张-标配",
        "priceCny": 68.07,
        "stock": 192
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Yv7qx01I9oBFI6Wds_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白色+送1卷【15*30白色】共210张-标配",
        "priceCny": 93.77,
        "stock": 198
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WBTGHp1I9oBFI1tgJ_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白色+送1卷【12*22白色】共250张-标配",
        "priceCny": 93.77,
        "stock": 198
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01bBRIsA1I9oBGMGfmu_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白色+送1卷【6*22/2排白色】共520张-标配",
        "priceCny": 93.77,
        "stock": 198
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0136bNSb1I9oBFQ0AvH_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白色+送1卷【15*50白色】共125张-标配",
        "priceCny": 93.77,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Fw4f2q1I9oBFB6i6t_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白色+送1卷【四色彩色】标签共210张-标配",
        "priceCny": 93.77,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01t7t2851I9oBGMGjxO_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白色+送1卷【14*30透明】共210张-标配",
        "priceCny": 107.22,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jLsEL51I9oBA5hxNU_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110云水蓝+送1卷【15*30白色】共210张-标配",
        "priceCny": 93.77,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WN3FKb1I9oBA5h9Wg_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "【套餐】D110白色+10卷14*22mm白色（共2600张）+送210张白色-标配",
        "priceCny": 300.39,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01VUNv1a1I9oBF09oeE_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+2卷【10*25】白色（含赠1卷，共480张）-标配",
        "priceCny": 120.66,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01SfnHL01I9oBFI4Vt3_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+2卷【15*30】白色（含赠1卷，共420张）-标配",
        "priceCny": 120.66,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PLfeDX1I9oBF6mcj8_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+2卷【12*22】白色（含赠1卷，共500张）-标配",
        "priceCny": 120.66,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IE8Oow1I9oBA5gsuS_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+2卷【6*22】白色（含赠1卷，共1040张）-标配",
        "priceCny": 120.66,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01SpmjhO1I9oBFI5eaM_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+2卷【6*12】白色（含赠1卷，共1840张）-标配",
        "priceCny": 120.66,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN018zlXGW1I9oBA5ilHA_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+2卷【15*50】白色（含赠1卷，共250张）-标配",
        "priceCny": 120.66,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01KMyaBQ1I9oBF6kgC9_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+3卷【15*30】白色（含赠1卷，共630张）-标配",
        "priceCny": 147.55,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN018Cb3nq1I9oBFNkQKZ_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+3卷【10*25】白色（含赠1卷，共720张）-标配",
        "priceCny": 147.55,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01hsG2Zz1I9oBEll7Cg_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+3卷【12*22】白色（含赠1卷，共750张）-标配",
        "priceCny": 147.55,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01f96RlX1I9oBFQ0Aw2_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+3卷【6*22】白色（含赠1卷，共1560张）-标配",
        "priceCny": 147.55,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01wKwQIm1I9oBFOv98k_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+3卷【6*12】白色（含赠1卷，共2760张）-标配",
        "priceCny": 147.55,
        "stock": 199
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN012dqZf31I9oBFVWfYF_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+3卷【15*50】白色（含赠1卷，共375张）-标配",
        "priceCny": 147.55,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01E0Basv1I9oBF08LAg_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+4卷【10*25】白色（含赠1卷，共960张）-标配",
        "priceCny": 174.46,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01nGFbin1I9oBFPyUyk_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+4卷15*30白色（含赠1卷，共840张）-标配",
        "priceCny": 174.46,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN012fl6Hc1I9oBFB83KG_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+4卷12*22白色（含赠1卷，共1000张）-标配",
        "priceCny": 174.46,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01bu2aBz1I9oBFI2Idh_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+4卷15*50白色（含赠1卷，共500张）-标配",
        "priceCny": 174.46,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01AD0dPA1I9oBA5iQVG_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+7卷10*25白色（含赠2卷，共1680张）-标配",
        "priceCny": 228.26,
        "stock": 199
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN017zOKtp1I9oBFVUrMc_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+7卷15*30白色（含赠2卷，共1470张）-标配",
        "priceCny": 228.26,
        "stock": 199
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01xdYTL91I9oBEllBNm_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+7卷12*22白色（含赠2卷，共1750张）-标配",
        "priceCny": 228.26,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01KfWrnr1I9oBFQ02dK_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110白+7卷15*50白色（含赠1卷，共875张）-标配",
        "priceCny": 228.26,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01mlVtxx1I9oBF6ml3v_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D11白色+送1卷【15*30白色】共210张-标配",
        "priceCny": 142.67,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Co7r281I9oBEyduxg_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D11蓝色+送1卷【15*30白色】共210张-标配",
        "priceCny": 142.67,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN010ZB9931I9oBFNlZ0t_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D11粉色+送1卷【15*30白色】共210张-标配",
        "priceCny": 142.67,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN010FseOw1I9oBGMIU1q_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D11黑色+送1卷【15*30白色】共210张-标配",
        "priceCny": 142.67,
        "stock": 199
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN017NDzAm1I9oBEcutp4_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "【套餐】D11白色+10卷14*22mm白色（共2600张）+送210张白色-标配",
        "priceCny": 349.31,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01QjMKRo1I9oBFPyUzM_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D11白色+2卷白色标签(尺寸任选,默认发15*30mm)含赠1卷-标配",
        "priceCny": 169.58,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01bke7V61I9oBA5jAGR_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D11白色+4卷白色标签(尺寸任选,默认发15*30mm)含赠1卷-标配",
        "priceCny": 223.37,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015XzWZk1I9oBElm3Ss_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D11白色+7卷白色标签(尺寸任选,默认发15*30mm)含赠2卷-标配",
        "priceCny": 277.16,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01F5Dr4a1I9oBElm3T0_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "【大小尺寸都能打】D101白色（打印宽度25mm）+送1卷白色标签-标配",
        "priceCny": 185.46,
        "stock": 200
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01MEkUve1I9oBElmBls_!!2222104080851-0-cib.jpg_sum.jpg",
        "name": "D110春绿+送1卷【15*30白色】-标配",
        "priceCny": 93.77,
        "stock": 200
      }
    ],
    "source_attributes": [
      {
        "name": "品牌",
        "value": "庆玉"
      },
      {
        "name": "类型",
        "value": "标配"
      },
      {
        "name": "型号",
        "value": "打价宝"
      },
      {
        "name": "货号",
        "value": "9676567467"
      },
      {
        "name": "规格",
        "value": "D110春绿+送1卷【15*30白色】共210张-标配,D110白色+送1卷【15*30白色】共210张-标配,D110白色+送1卷【12*22白色】共250张-标配,D110白色+送1卷【6*22/2排白色】共520张-标配,D110白色+送1卷【15*50白色】共125张-标配,D110白色+送1卷【四色彩色】标签共210张-标配,D110白色+送1卷【14*30透明】共210张-标配,D110云水蓝+送1卷【15*30白色】共210张-标配,【套餐】D110白色+10卷14*22mm白色（共2600张）+送210张白色-标配,D110白+2卷【10*25】白色（含赠1卷，共480张）-标配,D110白+2卷【15*30】白色（含赠1卷，共420张）-标配,D110白+2卷【12*22】白色（含赠1卷，共500张）-标配,D110白+2卷【6*22】白色（含赠1卷，共1040张）-标配,D110白+2卷【6*12】白色（含赠1卷，共1840张）-标配,D110白+2卷【15*50】白色（含赠1卷，共250张）-标配,D110白+3卷【15*30】白色（含赠1卷，共630张）-标配,D110白+3卷【10*25】白色（含赠1卷，共720张）-标配,D110白+3卷【12*22】白色（含赠1卷，共750张）-标配,D110白+3卷【6*22】白色（含赠1卷，共1560张）-标配,D110白+3卷【6*12】白色（含赠1卷，共2760张）-标配,D110白+3卷【15*50】白色（含赠1卷，共375张）-标配,D110白+4卷【10*25】白色（含赠1卷，共960张）-标配,D110白+4卷15*30白色（含赠1卷，共840张）-标配,D110白+4卷12*22白色（含赠1卷，共1000张）-标配,D110白+4卷15*50白色（含赠1卷，共500张）-标配,D110白+7卷10*25白色（含赠2卷，共1680张）-标配,D110白+7卷15*30白色（含赠2卷，共1470张）-标配,D110白+7卷12*22白色（含赠2卷，共1750张）-标配,D110白+7卷15*50白色（含赠1卷，共875张）-标配,D11白色+送1卷【15*30白色】共210张-标配,D11蓝色+送1卷【15*30白色】共210张-标配,D11粉色+送1卷【15*30白色】共210张-标配,D11黑色+送1卷【15*30白色】共210张-标配,【套餐】D11白色+10卷14*22mm白色（共2600张）+送210张白色-标配,D11白色+2卷白色标签(尺寸任选,默认发15*30mm)含赠1卷-标配,D11白色+4卷白色标签(尺寸任选,默认发15*30mm)含赠1卷-标配,D11白色+7卷白色标签(尺寸任选,默认发15*30mm)含赠2卷-标配,【大小尺寸都能打】D101白色（打印宽度25mm）+送1卷白色标签-标配,D110春绿+送1卷【15*30白色】-标配,标签均可单独购买/点击大图可查看常用尺寸，赠品及套餐标签纸均可联系更换-标配,2卷套餐（含送1卷，尺寸可换）+晒单再送1卷 ↓↓↓-标配,3卷套餐（含送1卷，尺寸可换）+晒单再送1卷 ↓↓↓-标配,4卷套餐（含送1卷，尺寸可换）+晒单再送1卷 ↓↓↓-标配,7卷套餐（含送2卷，尺寸可换）+晒单再送1卷 ↓↓↓-标配,新品【300dpi更高清/速度升级】↓↓↓-标配"
      }
    ]
  },
  {
    "id": "1688-1037660191992",
    "title": "手机链可爱蓝色星星手机壳挂绳手工DIY串珠ccd相机挂链耳机套挂坠",
    "category": "1688 Imports",
    "description": "Supplier: 义乌如火饰品有限公司\n\n绳带材质: 其它\n材质: 其它\n工艺: 其它\n绳扣材质: 塑料扣\n品牌: 1\n货号: 1\n是否进口: 否\n加工定制: 否\n产品编号: 1\n样式: 男女通用\n是否有挂件: 无\n包装: 独立包装\n加印LOGO: 不可以\n是否专利货源: 否\n是否跨境出口专供货源: 否\n颜色: 1\n规格: 夏日海盐蓝星星\n\n夏日海盐蓝星星: CNY 1.62, stock 9634\n\nSource: https://detail.1688.com/offer/1037660191992.html",
    "price": 2.79,
    "compare_at_price": 0,
    "cost_per_item": 0.41,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1037660191992/01.webp",
    "images": [
      "assets/1688/1037660191992/01.webp",
      "assets/1688/1037660191992/02.webp",
      "assets/1688/1037660191992/03.webp",
      "assets/1688/1037660191992/04.webp",
      "assets/1688/1037660191992/05.webp",
      "assets/1688/1037660191992/06.webp",
      "assets/1688/1037660191992/07.webp"
    ],
    "vendor": "义乌如火饰品有限公司",
    "sku": "1688-1037660191992",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1037660191992.html",
    "source_currency": "CNY",
    "source_price": 1.62,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01CkJyq62LJpsbHINl0_!!2217275539672-0-cib.jpg_sum.jpg",
        "name": "夏日海盐蓝星星",
        "priceCny": 1.62,
        "stock": 9634
      }
    ],
    "source_attributes": [
      {
        "name": "绳带材质",
        "value": "其它"
      },
      {
        "name": "材质",
        "value": "其它"
      },
      {
        "name": "工艺",
        "value": "其它"
      },
      {
        "name": "绳扣材质",
        "value": "塑料扣"
      },
      {
        "name": "品牌",
        "value": "1"
      },
      {
        "name": "货号",
        "value": "1"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "产品编号",
        "value": "1"
      },
      {
        "name": "样式",
        "value": "男女通用"
      },
      {
        "name": "是否有挂件",
        "value": "无"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "1"
      },
      {
        "name": "规格",
        "value": "夏日海盐蓝星星"
      }
    ]
  },
  {
    "id": "1688-1038217531653",
    "title": "智能云台摄像机WiFi无线监控室外防水AI人形追踪全彩夜视双向语音",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市赛诺威视科技有限公司\n\n品牌: 赛唯\n变倍变焦: 电子变焦\n工作温度: -10~50℃\n使用环境: 室内外通用\n外观尺寸: 98*140*213\n防水等级: IP66\n重量: 0.75\n电压: DC12\n水平清晰度: 1440\n类型: 外贸WiFi批发摄像头\n材质: 环保ABS\n镜头: 3.6°\n信噪比: 44\n背光补偿: 支持\n补充参数1: 跨境专供监控摄像头\n产地: 深圳\n最低照度值: 3.6\n摄像头传感器尺寸: 1/1.3\n支架类型: 螺丝固定式\n报警功能: 支持\n语音类型: 语音对讲\n光圈: 固定光圈\n红外夜视距离: 25\n供电方式: 外接电源\n\n英文款 WiFi高清监控+欧规电源（海外专属 国内慎拍）: CNY 96.00, stock 1\n\nSource: https://detail.1688.com/offer/1038217531653.html",
    "price": 165.6,
    "compare_at_price": 0,
    "cost_per_item": 24,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1038217531653/01.webp",
    "images": [
      "assets/1688/1038217531653/01.webp",
      "assets/1688/1038217531653/02.webp",
      "assets/1688/1038217531653/03.webp",
      "assets/1688/1038217531653/04.webp",
      "assets/1688/1038217531653/05.webp",
      "assets/1688/1038217531653/06.webp"
    ],
    "vendor": "深圳市赛诺威视科技有限公司",
    "sku": "1688-1038217531653",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1038217531653.html",
    "source_currency": "CNY",
    "source_price": 96,
    "source_variants": [
      {
        "name": "英文款 WiFi高清监控+欧规电源（海外专属 国内慎拍）",
        "priceCny": 96,
        "stock": 1,
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01QexLd22G7rT6Pa7i2_!!4022998969-0-cib.jpg_.webp"
      }
    ],
    "source_attributes": [
      {
        "name": "品牌",
        "value": "赛唯"
      },
      {
        "name": "变倍变焦",
        "value": "电子变焦"
      },
      {
        "name": "工作温度",
        "value": "-10~50℃"
      },
      {
        "name": "使用环境",
        "value": "室内外通用"
      },
      {
        "name": "外观尺寸",
        "value": "98*140*213"
      },
      {
        "name": "防水等级",
        "value": "IP66"
      },
      {
        "name": "重量",
        "value": "0.75"
      },
      {
        "name": "电压",
        "value": "DC12"
      },
      {
        "name": "水平清晰度",
        "value": "1440"
      },
      {
        "name": "类型",
        "value": "外贸WiFi批发摄像头"
      },
      {
        "name": "材质",
        "value": "环保ABS"
      },
      {
        "name": "镜头",
        "value": "3.6°"
      },
      {
        "name": "信噪比",
        "value": "44"
      },
      {
        "name": "背光补偿",
        "value": "支持"
      },
      {
        "name": "补充参数1",
        "value": "跨境专供监控摄像头"
      },
      {
        "name": "产地",
        "value": "深圳"
      },
      {
        "name": "最低照度值",
        "value": "3.6"
      },
      {
        "name": "摄像头传感器尺寸",
        "value": "1/1.3"
      },
      {
        "name": "支架类型",
        "value": "螺丝固定式"
      },
      {
        "name": "报警功能",
        "value": "支持"
      },
      {
        "name": "语音类型",
        "value": "语音对讲"
      },
      {
        "name": "光圈",
        "value": "固定光圈"
      },
      {
        "name": "红外夜视距离",
        "value": "25"
      },
      {
        "name": "供电方式",
        "value": "外接电源"
      }
    ]
  },
  {
    "id": "1688-1039846904285",
    "title": "蝰蛇WK900无线键盘鼠标套装蓝牙双模拼色平板电脑笔记本办公键盘",
    "category": "1688 Imports",
    "description": "Supplier: 广州惠联电脑配件有限公司\n\n光电分辨率: 1000\n品牌: 蝰蛇\n与电脑连接方式: 鼠标无线\n类型: 无线套装\n工作方式: 无线\n鼠标接口: USB\n键盘接口: USB\n套装型号: WK900\n货号: WK900\n上市时间: 2026\n货源类别: 现货\n是否支持人体工程学: 支持\n特性: 支持防水\n适用对象: 游戏\n线长: 其他（米）\n产品尺寸: 44.2*14.9*2.7cm\n产品重量: 850g（KG）\n加印LOGO: 可以\n加工定制: 是\n售后服务: 店铺三包\n包装清单: 键盘 鼠标 电池 接收器 说明书 彩盒\n颜色: 蝰蛇WK900无线蓝牙套装曜石黑,蝰蛇WK900无线蓝牙套装海盐蓝,蝰蛇WK900无线蓝牙套装黑色,蝰蛇WK900无线蓝牙套装白色\n主要下游平台: ebay\n主要销售地区: 欧洲\n有可授权的自有品牌: 否\n是否跨境出口专供货源: 是\n\n蝰蛇WK900无线蓝牙套装曜石黑: CNY 45.00, stock 35225\n蝰蛇WK900无线蓝牙套装海盐蓝: CNY 45.00, stock 2886\n蝰蛇WK900无线蓝牙套装黑色: CNY 39.00, stock 2952\n蝰蛇WK900无线蓝牙套装白色: CNY 40.00, stock 2935\n\nSource: https://detail.1688.com/offer/1039846904285.html",
    "price": 67.27,
    "compare_at_price": 0,
    "cost_per_item": 9.75,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1039846904285/01.webp",
    "images": [
      "assets/1688/1039846904285/01.webp",
      "assets/1688/1039846904285/02.webp",
      "assets/1688/1039846904285/03.webp",
      "assets/1688/1039846904285/04.webp",
      "assets/1688/1039846904285/05.webp",
      "assets/1688/1039846904285/06.webp",
      "assets/1688/1039846904285/07.webp",
      "assets/1688/1039846904285/08.webp",
      "assets/1688/1039846904285/09.webp",
      "assets/1688/1039846904285/10.webp",
      "assets/1688/1039846904285/11.webp",
      "assets/1688/1039846904285/12.webp",
      "assets/1688/1039846904285/13.webp"
    ],
    "vendor": "广州惠联电脑配件有限公司",
    "sku": "1688-1039846904285",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1039846904285.html",
    "source_currency": "CNY",
    "source_price": 39,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01c2HqF12D3Kg4FQ0T4_!!2212503388553-0-cib.jpg_sum.jpg",
        "name": "蝰蛇WK900无线蓝牙套装曜石黑",
        "priceCny": 45,
        "stock": 35225
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013OS3XN2D3Kg3hGEON_!!2212503388553-0-cib.jpg_sum.jpg",
        "name": "蝰蛇WK900无线蓝牙套装海盐蓝",
        "priceCny": 45,
        "stock": 2886
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01wDw4di2D3Kg44SLRY_!!2212503388553-0-cib.jpg_sum.jpg",
        "name": "蝰蛇WK900无线蓝牙套装黑色",
        "priceCny": 39,
        "stock": 2952
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013zJZ1B2D3Kg4noZ4g_!!2212503388553-0-cib.jpg_sum.jpg",
        "name": "蝰蛇WK900无线蓝牙套装白色",
        "priceCny": 40,
        "stock": 2935
      }
    ],
    "source_attributes": [
      {
        "name": "光电分辨率",
        "value": "1000"
      },
      {
        "name": "品牌",
        "value": "蝰蛇"
      },
      {
        "name": "与电脑连接方式",
        "value": "鼠标无线"
      },
      {
        "name": "类型",
        "value": "无线套装"
      },
      {
        "name": "工作方式",
        "value": "无线"
      },
      {
        "name": "鼠标接口",
        "value": "USB"
      },
      {
        "name": "键盘接口",
        "value": "USB"
      },
      {
        "name": "套装型号",
        "value": "WK900"
      },
      {
        "name": "货号",
        "value": "WK900"
      },
      {
        "name": "上市时间",
        "value": "2026"
      },
      {
        "name": "货源类别",
        "value": "现货"
      },
      {
        "name": "是否支持人体工程学",
        "value": "支持"
      },
      {
        "name": "特性",
        "value": "支持防水"
      },
      {
        "name": "适用对象",
        "value": "游戏"
      },
      {
        "name": "线长",
        "value": "其他（米）"
      },
      {
        "name": "产品尺寸",
        "value": "44.2*14.9*2.7cm"
      },
      {
        "name": "产品重量",
        "value": "850g（KG）"
      },
      {
        "name": "加印LOGO",
        "value": "可以"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "售后服务",
        "value": "店铺三包"
      },
      {
        "name": "包装清单",
        "value": "键盘 鼠标 电池 接收器 说明书 彩盒"
      },
      {
        "name": "颜色",
        "value": "蝰蛇WK900无线蓝牙套装曜石黑,蝰蛇WK900无线蓝牙套装海盐蓝,蝰蛇WK900无线蓝牙套装黑色,蝰蛇WK900无线蓝牙套装白色"
      },
      {
        "name": "主要下游平台",
        "value": "ebay"
      },
      {
        "name": "主要销售地区",
        "value": "欧洲"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      }
    ]
  },
  {
    "id": "1688-1040328213135",
    "title": "盲盒收纳展示盒透明防尘高清手办积木展示柜泡泡玛特公仔展示架子",
    "category": "1688 Imports",
    "description": "Supplier: 台州市益昕塑业有限公司\n\n材质: pet\n功能: 多用途\n产品类别: 盲盒展示盒\n品牌: 辰穆\n容量: 1\n收纳场景: 客厅,卧室,桌上\n是否进口: 否\n型号: 多型号\n商品特性: 其他\n适用范围: 其他\n风格: 现代简约\n图案: 纯色\n规格: 多规格\n加工定制: 否\n加印LOGO: 不可以\n贸易属性: 内贸+外贸\n箱装数量: 默认\n产品上市时间: 2026\n价格段: 20-30元\n专利: 否\n颜色: 奶油色-舞台款-大号,奶油色-舞台款-特大号,奶油色-阶梯款-大号,奶油色-阶梯款-特大号,奶油色-积木款-大号,奶油色-积木款-特大号,奶油色-阶梯款-中号\n毛重: 咨询客服\n开合方式: 分格盖\n\n奶油色-舞台款-大号: CNY 17.80, stock 88525\n奶油色-舞台款-特大号: CNY 20.80, stock 87772\n奶油色-阶梯款-大号: CNY 16.80, stock 88821\n奶油色-阶梯款-特大号: CNY 19.80, stock 88771\n奶油色-积木款-大号: CNY 16.80, stock 88819\n奶油色-积木款-特大号: CNY 19.80, stock 88258\n奶油色-阶梯款-中号: CNY 10.50, stock 88831\n\nSource: https://detail.1688.com/offer/1040328213135.html",
    "price": 18.11,
    "compare_at_price": 0,
    "cost_per_item": 2.63,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1040328213135/01.webp",
    "images": [
      "assets/1688/1040328213135/01.webp",
      "assets/1688/1040328213135/02.webp",
      "assets/1688/1040328213135/03.webp",
      "assets/1688/1040328213135/04.webp",
      "assets/1688/1040328213135/05.webp",
      "assets/1688/1040328213135/06.webp",
      "assets/1688/1040328213135/07.webp",
      "assets/1688/1040328213135/08.webp",
      "assets/1688/1040328213135/09.webp",
      "assets/1688/1040328213135/10.webp",
      "assets/1688/1040328213135/11.webp",
      "assets/1688/1040328213135/12.webp",
      "assets/1688/1040328213135/13.webp",
      "assets/1688/1040328213135/14.webp",
      "assets/1688/1040328213135/15.webp",
      "assets/1688/1040328213135/16.webp",
      "assets/1688/1040328213135/17.webp",
      "assets/1688/1040328213135/18.webp",
      "assets/1688/1040328213135/19.webp"
    ],
    "vendor": "台州市益昕塑业有限公司",
    "sku": "1688-1040328213135",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1040328213135.html",
    "source_currency": "CNY",
    "source_price": 10.5,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01NE0ZTk1bdYbquN4cz_!!2208750303488-0-cib.jpg_sum.jpg",
        "name": "奶油色-舞台款-大号",
        "priceCny": 17.8,
        "stock": 88525
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01MbhhbK1bdYbqOU5IY_!!2208750303488-0-cib.jpg_sum.jpg",
        "name": "奶油色-舞台款-特大号",
        "priceCny": 20.8,
        "stock": 87772
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015iUl0w1bdYbltgJQs_!!2208750303488-0-cib.jpg_sum.jpg",
        "name": "奶油色-阶梯款-大号",
        "priceCny": 16.8,
        "stock": 88821
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01JzK24a1bdYbqOV5k4_!!2208750303488-0-cib.jpg_sum.jpg",
        "name": "奶油色-阶梯款-特大号",
        "priceCny": 19.8,
        "stock": 88771
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01aiEmIb1bdYbrCq6is_!!2208750303488-0-cib.jpg_sum.jpg",
        "name": "奶油色-积木款-大号",
        "priceCny": 16.8,
        "stock": 88819
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01aYfIiR1bdYbs8RaGl_!!2208750303488-0-cib.jpg_sum.jpg",
        "name": "奶油色-积木款-特大号",
        "priceCny": 19.8,
        "stock": 88258
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01dYgScu1bdYbquP1Ic_!!2208750303488-0-cib.jpg_sum.jpg",
        "name": "奶油色-阶梯款-中号",
        "priceCny": 10.5,
        "stock": 88831
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "pet"
      },
      {
        "name": "功能",
        "value": "多用途"
      },
      {
        "name": "产品类别",
        "value": "盲盒展示盒"
      },
      {
        "name": "品牌",
        "value": "辰穆"
      },
      {
        "name": "容量",
        "value": "1"
      },
      {
        "name": "收纳场景",
        "value": "客厅,卧室,桌上"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "型号",
        "value": "多型号"
      },
      {
        "name": "商品特性",
        "value": "其他"
      },
      {
        "name": "适用范围",
        "value": "其他"
      },
      {
        "name": "风格",
        "value": "现代简约"
      },
      {
        "name": "图案",
        "value": "纯色"
      },
      {
        "name": "规格",
        "value": "多规格"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "贸易属性",
        "value": "内贸+外贸"
      },
      {
        "name": "箱装数量",
        "value": "默认"
      },
      {
        "name": "产品上市时间",
        "value": "2026"
      },
      {
        "name": "价格段",
        "value": "20-30元"
      },
      {
        "name": "专利",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "奶油色-舞台款-大号,奶油色-舞台款-特大号,奶油色-阶梯款-大号,奶油色-阶梯款-特大号,奶油色-积木款-大号,奶油色-积木款-特大号,奶油色-阶梯款-中号"
      },
      {
        "name": "毛重",
        "value": "咨询客服"
      },
      {
        "name": "开合方式",
        "value": "分格盖"
      }
    ]
  },
  {
    "id": "1688-1042320460623",
    "title": "跨境车载手机支架 空调出风口卡扣 重力感应 汽车导航支架",
    "category": "1688 Imports",
    "description": "Supplier: 汕头市澄海区乐灵贸易商行\n\n材质: ABS\n风格: 通用\n类型: 车载手机支架\n品牌: 其他\n支持订制: 支持\n货号: 三角车载支架\n适用场景: 车载\n颜色: 黑色,银色,金色\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东,国内电商,其他\n有可授权的自有品牌: 否\n是否专利货源: 否\n固定方式: 卡扣式,夹缝式\n生产企业: 工厂\n\n黑色: CNY 2.60, stock 99955\n银色: CNY 2.60, stock 99976\n金色: CNY 2.60, stock 99993\n\nSource: https://detail.1688.com/offer/1042320460623.html",
    "price": 4.48,
    "compare_at_price": 0,
    "cost_per_item": 0.65,
    "stock": 10,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1042320460623/01.webp",
    "images": [
      "assets/1688/1042320460623/01.webp",
      "assets/1688/1042320460623/02.webp",
      "assets/1688/1042320460623/03.webp",
      "assets/1688/1042320460623/04.webp",
      "assets/1688/1042320460623/05.webp",
      "assets/1688/1042320460623/06.webp",
      "assets/1688/1042320460623/07.webp",
      "assets/1688/1042320460623/08.webp",
      "assets/1688/1042320460623/09.webp",
      "assets/1688/1042320460623/10.webp",
      "assets/1688/1042320460623/11.webp"
    ],
    "vendor": "汕头市澄海区乐灵贸易商行",
    "sku": "1688-1042320460623",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1042320460623.html",
    "source_currency": "CNY",
    "source_price": 2.6,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013RRZx21sGyYBSUwiM_!!2222228345740-0-cib.jpg_sum.jpg",
        "name": "黑色",
        "priceCny": 2.6,
        "stock": 99955
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01TOJspG1sGyYBIuFZ1_!!2222228345740-0-cib.jpg_sum.jpg",
        "name": "银色",
        "priceCny": 2.6,
        "stock": 99976
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN010ODoMr1sGyYBF1KUb_!!2222228345740-0-cib.jpg_sum.jpg",
        "name": "金色",
        "priceCny": 2.6,
        "stock": 99993
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "ABS"
      },
      {
        "name": "风格",
        "value": "通用"
      },
      {
        "name": "类型",
        "value": "车载手机支架"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "支持订制",
        "value": "支持"
      },
      {
        "name": "货号",
        "value": "三角车载支架"
      },
      {
        "name": "适用场景",
        "value": "车载"
      },
      {
        "name": "颜色",
        "value": "黑色,银色,金色"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东,国内电商,其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "固定方式",
        "value": "卡扣式,夹缝式"
      },
      {
        "name": "生产企业",
        "value": "工厂"
      }
    ]
  },
  {
    "id": "1688-1043166830866",
    "title": "软萌可爱金丝熊仓鼠毛绒玩偶治愈系老鼠公仔解压捏捏包包挂件礼物",
    "category": "1688 Imports",
    "description": "Supplier: 容城县改艳毛绒玩具店\n\n填充材质: PP棉\n品牌: 0001\n造型类别: 卡通\n毛绒分类: 短毛绒\n所属分类: 毛绒公仔\n造型是否卡通、动漫: 否\n包装方式: 网袋\n是否多功能: 否\n货号: xr\n加工定制: 是\n加工方式: 来样定制\n是否有导购视频: 是\n产地: 中国\n是否外贸: 是\n是否专供外贸: 是(本商品仅供外贸用途，可能不符合境内产品标准。请境内买家谨慎购入)\n颜色: 金丝熊--小蜜裸款,金丝熊--小白裸款,金丝熊--小灰裸款,小蜜套装（小蜜+口水巾+青蛙帽子+小兔帽),小白套装（小白+口水巾+青蛙帽子+小兔帽),小灰套装（小灰+口水巾+青蛙帽子+小兔帽)\n高度: 15cm\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他\n是否跨境出口专供货源: 是\n适用年龄: 青年（15-35岁）\n适用性别: 男女通用\n材质: PP\n\n15cm: CNY 9.00, stock 99533\n\nSource: https://detail.1688.com/offer/1043166830866.html",
    "price": 15.52,
    "compare_at_price": 0,
    "cost_per_item": 2.25,
    "stock": 7,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1043166830866/01.webp",
    "images": [
      "assets/1688/1043166830866/01.webp",
      "assets/1688/1043166830866/02.webp",
      "assets/1688/1043166830866/03.webp",
      "assets/1688/1043166830866/04.webp",
      "assets/1688/1043166830866/05.webp",
      "assets/1688/1043166830866/06.webp",
      "assets/1688/1043166830866/07.webp",
      "assets/1688/1043166830866/08.webp",
      "assets/1688/1043166830866/09.webp",
      "assets/1688/1043166830866/10.webp",
      "assets/1688/1043166830866/11.webp"
    ],
    "vendor": "容城县改艳毛绒玩具店",
    "sku": "1688-1043166830866",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1043166830866.html",
    "source_currency": "CNY",
    "source_price": 9,
    "source_variants": [
      {
        "image": "",
        "name": "15cm",
        "priceCny": 9,
        "stock": 99533
      }
    ],
    "source_attributes": [
      {
        "name": "填充材质",
        "value": "PP棉"
      },
      {
        "name": "品牌",
        "value": "0001"
      },
      {
        "name": "造型类别",
        "value": "卡通"
      },
      {
        "name": "毛绒分类",
        "value": "短毛绒"
      },
      {
        "name": "所属分类",
        "value": "毛绒公仔"
      },
      {
        "name": "造型是否卡通、动漫",
        "value": "否"
      },
      {
        "name": "包装方式",
        "value": "网袋"
      },
      {
        "name": "是否多功能",
        "value": "否"
      },
      {
        "name": "货号",
        "value": "xr"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "加工方式",
        "value": "来样定制"
      },
      {
        "name": "是否有导购视频",
        "value": "是"
      },
      {
        "name": "产地",
        "value": "中国"
      },
      {
        "name": "是否外贸",
        "value": "是"
      },
      {
        "name": "是否专供外贸",
        "value": "是(本商品仅供外贸用途，可能不符合境内产品标准。请境内买家谨慎购入)"
      },
      {
        "name": "颜色",
        "value": "金丝熊--小蜜裸款,金丝熊--小白裸款,金丝熊--小灰裸款,小蜜套装（小蜜+口水巾+青蛙帽子+小兔帽),小白套装（小白+口水巾+青蛙帽子+小兔帽),小灰套装（小灰+口水巾+青蛙帽子+小兔帽)"
      },
      {
        "name": "高度",
        "value": "15cm"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "适用性别",
        "value": "男女通用"
      },
      {
        "name": "材质",
        "value": "PP"
      }
    ]
  },
  {
    "id": "1688-1044699373084",
    "title": "可爱呆萌抱小鱼毛绒玩偶情侣包挂件创意罗小黑猫钥匙扣",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市前纺电子商务商行\n\n填充材质: 毛绒\n品牌: 无脸\n造型类别: 卡通\n毛绒分类: 短毛绒\n所属分类: 毛绒公仔\n造型是否卡通、动漫: 否\n包装方式: 其他\n是否多功能: 否\n货号: 大眼黑猫\n加工定制: 是\n加工方式: 来图定制\n专利及著作权申请时间: 2026\n是否有导购视频: 否\n产地: 中国\n是否外贸: 否\n是否专供外贸: 否\n3C配置类别: 14岁以上的玩具\n颜色: 单黑猫,黑猫抱鱼,白猫抱鱼\n高度: 珠链款,挂绳款\n是否跨境出口专供货源: 否\n适用年龄: 青年（15-35岁）\n适用性别: 男女通用\n材质: PP\n\n珠链款: CNY 1.10, stock 7857\n挂绳款: CNY 1.90, stock 8887\n\nSource: https://detail.1688.com/offer/1044699373084.html",
    "price": 1.9,
    "compare_at_price": 0,
    "cost_per_item": 0.28,
    "stock": 6,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1044699373084/01.webp",
    "images": [
      "assets/1688/1044699373084/01.webp",
      "assets/1688/1044699373084/02.webp",
      "assets/1688/1044699373084/03.webp",
      "assets/1688/1044699373084/04.webp",
      "assets/1688/1044699373084/05.webp",
      "assets/1688/1044699373084/06.webp",
      "assets/1688/1044699373084/07.webp"
    ],
    "vendor": "义乌市前纺电子商务商行",
    "sku": "1688-1044699373084",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1044699373084.html",
    "source_currency": "CNY",
    "source_price": 1.1,
    "source_variants": [
      {
        "image": "",
        "name": "珠链款",
        "priceCny": 1.1,
        "stock": 7857
      },
      {
        "image": "",
        "name": "挂绳款",
        "priceCny": 1.9,
        "stock": 8887
      }
    ],
    "source_attributes": [
      {
        "name": "填充材质",
        "value": "毛绒"
      },
      {
        "name": "品牌",
        "value": "无脸"
      },
      {
        "name": "造型类别",
        "value": "卡通"
      },
      {
        "name": "毛绒分类",
        "value": "短毛绒"
      },
      {
        "name": "所属分类",
        "value": "毛绒公仔"
      },
      {
        "name": "造型是否卡通、动漫",
        "value": "否"
      },
      {
        "name": "包装方式",
        "value": "其他"
      },
      {
        "name": "是否多功能",
        "value": "否"
      },
      {
        "name": "货号",
        "value": "大眼黑猫"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "加工方式",
        "value": "来图定制"
      },
      {
        "name": "专利及著作权申请时间",
        "value": "2026"
      },
      {
        "name": "是否有导购视频",
        "value": "否"
      },
      {
        "name": "产地",
        "value": "中国"
      },
      {
        "name": "是否外贸",
        "value": "否"
      },
      {
        "name": "是否专供外贸",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "颜色",
        "value": "单黑猫,黑猫抱鱼,白猫抱鱼"
      },
      {
        "name": "高度",
        "value": "珠链款,挂绳款"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "适用性别",
        "value": "男女通用"
      },
      {
        "name": "材质",
        "value": "PP"
      }
    ]
  },
  {
    "id": "1688-1045045886146",
    "title": "可爱包包绒绒心事毛绒痛包网红爆款盲盒创意毛绒挂件女生背包装饰",
    "category": "1688 Imports",
    "description": "Supplier: 茗心优品(东莞)科技有限公司\n\n材质: ABS\n类别: 卡通\n品牌: 驰猫\n风格: 卡通风\n适用节日: 七夕,儿童节,其他\n货号: MR019\n包装: 纸盒包装\n是否专利货源: 否\n颜色: p-392绒绒心事盒6,070-41奶糖花漾甜心盒1,1089心情软糖400体盒1,5057猫崽崽糖豆彩兔盒6,5043猫崽崽假日温泉盒6,5070时尚日常盒6,5053萌宠剧场盒6,070-24奶糖山海瑞兽盒6,1102兔兔精灵二代680%盒1,p-391喵不可言盒6,p-390心晴云雨盒6,1098熊熊暴击盒1,070-39奶糖mini兔盒6,5074马年行大运盒6,5059十二星座盒12,5056八方来财喵盒6,5058猫崽缤纷果糖盒6,5037喵喵爪爪挂件盒6,3148神仙毛绒盲袋盒12,p-389淘淘果颂盒6,1107奇妙圣诞夜680体盒1,1090小动物萌友会盒6,5049Mini十二星座盒6,1103奇迹圣诞夜盒1,5011花影流光盒6,p-387盒6,p-385圣诞叮叮铛盒8,5061圣诞晚安曲盒6,070-25猫猫挂件盒6,p-383跳一跳小兔盒8,1083小动物狂欢派对盒6,5028海洋物语盒6,1091艾米甜美风400体盒1,1084星光之夜盒6,1079满分甜度400大体盒1,070-28奶糖百变时装盒6,1081智能AI1000体盒1,5036下午茶时间盒6,p-382小熊冬眠计划盒6,5035趴趴小狗盒6,p-373AI800体盒1,5025香香水果乐园盒6,p-372圣诞快乐盒8【2端送1大娃】,1101捣蛋鬼日记盒1,5027抱抱雪糕萌宠盒6,5034小动物们的发箍盒8,1074彩虹兔宝系列盒6,p-371初代马卡龙盒6,1082马卡龙六代盒1,p-367果园拉链包盒6,p-366魔镜2代盒8,5026三小毛炸虾虾盒6,p-364糖心兔魔法秘境盒6,p-363霉霉星座物语盒12,1088快乐圣诞夜盒6,070-32奶糖甜心坐姿盒6,5031喵喵酷炫时刻盒6,1069毛绒绒艾小兔盒8,070-23MM奶糖乖乖兔盒6,1053毛兔兔大家族盒1,p-351好运派送盒8,P-348拼拼世界盒6,5020魔法小兔盒6,p-345收纳小包盒8,-27奶糖淘气猫猫盒6,1045二代换装派对盒6,1075萌宠双肩包盒1,5021动物聚会盒6,5024果果报喜盒6,p-344我呀认梳了盒8,5017三小毛U型枕盒1,076-1潦草小猫盒4,080-4小萌佛挂件盒6,080-6小萌佛冰箱贴盒6,5003mini 十二星座盒6,p-341百变idol盒1,1080皇冠小兔400%盒1,p-339毛绒首饰盒8,070-13奶糖400体盒1,074-3安妮宝贝盒6,5012海底总动员盒6\n尺寸: 随机一个,端盒\n适用送礼场合: 满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他\n送礼用途: 促销赠品,会议礼品,节庆礼品,嘉奖纪念,其他\n是否属于礼品: 是，个人礼品\n是否IP授权: 否\n外观造型: 卡通\n\n端盒: CNY 297.83, stock 1\n\nSource: https://detail.1688.com/offer/1045045886146.html",
    "price": 513.76,
    "compare_at_price": 0,
    "cost_per_item": 74.46,
    "stock": 0,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1045045886146/01.webp",
    "images": [
      "assets/1688/1045045886146/01.webp",
      "assets/1688/1045045886146/02.webp",
      "assets/1688/1045045886146/03.webp",
      "assets/1688/1045045886146/04.webp",
      "assets/1688/1045045886146/05.webp",
      "assets/1688/1045045886146/06.webp",
      "assets/1688/1045045886146/07.webp",
      "assets/1688/1045045886146/08.webp",
      "assets/1688/1045045886146/09.webp",
      "assets/1688/1045045886146/10.webp",
      "assets/1688/1045045886146/11.webp",
      "assets/1688/1045045886146/12.webp",
      "assets/1688/1045045886146/13.webp",
      "assets/1688/1045045886146/14.webp",
      "assets/1688/1045045886146/15.webp",
      "assets/1688/1045045886146/16.webp",
      "assets/1688/1045045886146/17.webp",
      "assets/1688/1045045886146/18.webp",
      "assets/1688/1045045886146/19.webp",
      "assets/1688/1045045886146/20.webp",
      "assets/1688/1045045886146/21.webp",
      "assets/1688/1045045886146/22.webp",
      "assets/1688/1045045886146/23.webp",
      "assets/1688/1045045886146/24.webp",
      "assets/1688/1045045886146/25.webp",
      "assets/1688/1045045886146/26.webp",
      "assets/1688/1045045886146/27.webp",
      "assets/1688/1045045886146/28.webp",
      "assets/1688/1045045886146/29.webp",
      "assets/1688/1045045886146/30.webp",
      "assets/1688/1045045886146/31.webp",
      "assets/1688/1045045886146/32.webp",
      "assets/1688/1045045886146/33.webp",
      "assets/1688/1045045886146/34.webp",
      "assets/1688/1045045886146/35.webp",
      "assets/1688/1045045886146/36.webp",
      "assets/1688/1045045886146/37.webp",
      "assets/1688/1045045886146/38.webp",
      "assets/1688/1045045886146/39.webp",
      "assets/1688/1045045886146/40.webp",
      "assets/1688/1045045886146/41.webp",
      "assets/1688/1045045886146/42.webp",
      "assets/1688/1045045886146/43.webp",
      "assets/1688/1045045886146/44.webp",
      "assets/1688/1045045886146/45.webp",
      "assets/1688/1045045886146/46.webp",
      "assets/1688/1045045886146/47.webp",
      "assets/1688/1045045886146/48.webp",
      "assets/1688/1045045886146/49.webp",
      "assets/1688/1045045886146/50.webp",
      "assets/1688/1045045886146/51.webp",
      "assets/1688/1045045886146/52.webp",
      "assets/1688/1045045886146/53.webp",
      "assets/1688/1045045886146/54.webp",
      "assets/1688/1045045886146/55.webp",
      "assets/1688/1045045886146/56.webp",
      "assets/1688/1045045886146/57.webp",
      "assets/1688/1045045886146/58.webp",
      "assets/1688/1045045886146/59.webp",
      "assets/1688/1045045886146/60.webp",
      "assets/1688/1045045886146/61.webp",
      "assets/1688/1045045886146/62.webp",
      "assets/1688/1045045886146/63.webp",
      "assets/1688/1045045886146/64.webp",
      "assets/1688/1045045886146/65.webp",
      "assets/1688/1045045886146/66.webp",
      "assets/1688/1045045886146/67.webp",
      "assets/1688/1045045886146/68.webp",
      "assets/1688/1045045886146/69.webp",
      "assets/1688/1045045886146/70.webp",
      "assets/1688/1045045886146/71.webp",
      "assets/1688/1045045886146/72.webp",
      "assets/1688/1045045886146/73.webp",
      "assets/1688/1045045886146/74.webp",
      "assets/1688/1045045886146/75.webp",
      "assets/1688/1045045886146/76.webp",
      "assets/1688/1045045886146/77.webp",
      "assets/1688/1045045886146/78.webp",
      "assets/1688/1045045886146/79.webp",
      "assets/1688/1045045886146/80.webp",
      "assets/1688/1045045886146/81.webp",
      "assets/1688/1045045886146/82.webp",
      "assets/1688/1045045886146/83.webp",
      "assets/1688/1045045886146/84.webp",
      "assets/1688/1045045886146/85.webp",
      "assets/1688/1045045886146/86.webp"
    ],
    "vendor": "茗心优品(东莞)科技有限公司",
    "sku": "1688-1045045886146",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1045045886146.html",
    "source_currency": "CNY",
    "source_price": 297.83,
    "source_variants": [
      {
        "image": "",
        "name": "端盒",
        "priceCny": 297.83,
        "stock": 1
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "ABS"
      },
      {
        "name": "类别",
        "value": "卡通"
      },
      {
        "name": "品牌",
        "value": "驰猫"
      },
      {
        "name": "风格",
        "value": "卡通风"
      },
      {
        "name": "适用节日",
        "value": "七夕,儿童节,其他"
      },
      {
        "name": "货号",
        "value": "MR019"
      },
      {
        "name": "包装",
        "value": "纸盒包装"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "p-392绒绒心事盒6,070-41奶糖花漾甜心盒1,1089心情软糖400体盒1,5057猫崽崽糖豆彩兔盒6,5043猫崽崽假日温泉盒6,5070时尚日常盒6,5053萌宠剧场盒6,070-24奶糖山海瑞兽盒6,1102兔兔精灵二代680%盒1,p-391喵不可言盒6,p-390心晴云雨盒6,1098熊熊暴击盒1,070-39奶糖mini兔盒6,5074马年行大运盒6,5059十二星座盒12,5056八方来财喵盒6,5058猫崽缤纷果糖盒6,5037喵喵爪爪挂件盒6,3148神仙毛绒盲袋盒12,p-389淘淘果颂盒6,1107奇妙圣诞夜680体盒1,1090小动物萌友会盒6,5049Mini十二星座盒6,1103奇迹圣诞夜盒1,5011花影流光盒6,p-387盒6,p-385圣诞叮叮铛盒8,5061圣诞晚安曲盒6,070-25猫猫挂件盒6,p-383跳一跳小兔盒8,1083小动物狂欢派对盒6,5028海洋物语盒6,1091艾米甜美风400体盒1,1084星光之夜盒6,1079满分甜度400大体盒1,070-28奶糖百变时装盒6,1081智能AI1000体盒1,5036下午茶时间盒6,p-382小熊冬眠计划盒6,5035趴趴小狗盒6,p-373AI800体盒1,5025香香水果乐园盒6,p-372圣诞快乐盒8【2端送1大娃】,1101捣蛋鬼日记盒1,5027抱抱雪糕萌宠盒6,5034小动物们的发箍盒8,1074彩虹兔宝系列盒6,p-371初代马卡龙盒6,1082马卡龙六代盒1,p-367果园拉链包盒6,p-366魔镜2代盒8,5026三小毛炸虾虾盒6,p-364糖心兔魔法秘境盒6,p-363霉霉星座物语盒12,1088快乐圣诞夜盒6,070-32奶糖甜心坐姿盒6,5031喵喵酷炫时刻盒6,1069毛绒绒艾小兔盒8,070-23MM奶糖乖乖兔盒6,1053毛兔兔大家族盒1,p-351好运派送盒8,P-348拼拼世界盒6,5020魔法小兔盒6,p-345收纳小包盒8,-27奶糖淘气猫猫盒6,1045二代换装派对盒6,1075萌宠双肩包盒1,5021动物聚会盒6,5024果果报喜盒6,p-344我呀认梳了盒8,5017三小毛U型枕盒1,076-1潦草小猫盒4,080-4小萌佛挂件盒6,080-6小萌佛冰箱贴盒6,5003mini 十二星座盒6,p-341百变idol盒1,1080皇冠小兔400%盒1,p-339毛绒首饰盒8,070-13奶糖400体盒1,074-3安妮宝贝盒6,5012海底总动员盒6"
      },
      {
        "name": "尺寸",
        "value": "随机一个,端盒"
      },
      {
        "name": "适用送礼场合",
        "value": "满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他"
      },
      {
        "name": "送礼用途",
        "value": "促销赠品,会议礼品,节庆礼品,嘉奖纪念,其他"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "外观造型",
        "value": "卡通"
      }
    ]
  },
  {
    "id": "1688-1045949412782",
    "title": "k007车载手机支架跨境汽车吸盘真空磁吸导航专用支架纳米滴胶支架",
    "category": "1688 Imports",
    "description": "Supplier: 东阳市良栖日用品厂\n\n功率: 5W\n是否可充电: 不可充电\n附加功能: 无\n安装方式: 吸盘式\n适用汽车品牌: 通用\n品牌: 无品牌\n适用部位: 通用\n货号: K007\n颜色: 塑料杆【黑色】真空吸附,塑料杆【白色】真空吸附,合金杆常规磁【黑色】真空吸附,合金杆常规磁【白色】真空吸附,合金杆高强磁【黑色】真空吸附,合金杆高强磁【白色】真空吸附,纳米滴胶黑色【金属杆高强磁】,纳米滴胶白色【金属杆高强磁】\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA\n主要销售地区: 欧洲,南美,东南亚,中东\n有可授权的自有品牌: 否\n是否跨境出口专供货源: 是\n款式: k007【彩盒包装】\n加工定制: 是\n1: 007车载手机支架\n充电功能: 不支持无线充电\n是否专利货源: 否\n3: 纳米滴胶支架\n风格: 简约风\n3C证书编号: 2021010902421496\n2: 真空吸附支架\n是否IP授权: 否\n\nk007【彩盒包装】: CNY 4.30, stock 885895\n\nSource: https://detail.1688.com/offer/1045949412782.html",
    "price": 7.42,
    "compare_at_price": 0,
    "cost_per_item": 1.08,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1045949412782/01.webp",
    "images": [
      "assets/1688/1045949412782/01.webp",
      "assets/1688/1045949412782/02.webp",
      "assets/1688/1045949412782/03.webp",
      "assets/1688/1045949412782/04.webp",
      "assets/1688/1045949412782/05.webp",
      "assets/1688/1045949412782/06.webp",
      "assets/1688/1045949412782/07.webp",
      "assets/1688/1045949412782/08.webp",
      "assets/1688/1045949412782/09.webp",
      "assets/1688/1045949412782/10.webp"
    ],
    "vendor": "东阳市良栖日用品厂",
    "sku": "1688-1045949412782",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1045949412782.html",
    "source_currency": "CNY",
    "source_price": 4.3,
    "source_variants": [
      {
        "image": "",
        "name": "k007【彩盒包装】",
        "priceCny": 4.3,
        "stock": 885895
      }
    ],
    "source_attributes": [
      {
        "name": "功率",
        "value": "5W"
      },
      {
        "name": "是否可充电",
        "value": "不可充电"
      },
      {
        "name": "附加功能",
        "value": "无"
      },
      {
        "name": "安装方式",
        "value": "吸盘式"
      },
      {
        "name": "适用汽车品牌",
        "value": "通用"
      },
      {
        "name": "品牌",
        "value": "无品牌"
      },
      {
        "name": "适用部位",
        "value": "通用"
      },
      {
        "name": "货号",
        "value": "K007"
      },
      {
        "name": "颜色",
        "value": "塑料杆【黑色】真空吸附,塑料杆【白色】真空吸附,合金杆常规磁【黑色】真空吸附,合金杆常规磁【白色】真空吸附,合金杆高强磁【黑色】真空吸附,合金杆高强磁【白色】真空吸附,纳米滴胶黑色【金属杆高强磁】,纳米滴胶白色【金属杆高强磁】"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA"
      },
      {
        "name": "主要销售地区",
        "value": "欧洲,南美,东南亚,中东"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "款式",
        "value": "k007【彩盒包装】"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "1",
        "value": "007车载手机支架"
      },
      {
        "name": "充电功能",
        "value": "不支持无线充电"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "3",
        "value": "纳米滴胶支架"
      },
      {
        "name": "风格",
        "value": "简约风"
      },
      {
        "name": "3C证书编号",
        "value": "2021010902421496"
      },
      {
        "name": "2",
        "value": "真空吸附支架"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      }
    ]
  },
  {
    "id": "1688-1046882782655",
    "title": "动漫周边复仇者联盟盲盒公仔蜘蛛侠美国队长PVC桌面摆件学生奖品",
    "category": "1688 Imports",
    "description": "Supplier: 龙港市柯漫工艺品厂\n\n材质: PVC\n品牌: 柯漫\n动漫角色: 其它\n产地: 中国\n规格: 见选项图\n包装方式: 彩盒\n是否有动漫形象: 是\n专利及著作权: 著作权\n专利及著作权申请时间: 11\n货号: 221451\n是否有导购视频: 是\n是否拼装: 否\n是否专供外贸: 否\n3C配置类别: 14岁以上的玩具\n颜色: 6款英雄（一个价格下单6个发一套）,6款Q版英雄（一个价格下单6个发一套）,6款披风英雄（一个价格下单6个发一套）,4款复仇（一个价格下单4个发一套）,4款美国队长（一个价格下单4个发一套）,4款蜘蛛侠（一个价格下单4个发一套）,7款蜘蛛侠小号（一个价格下单7个发一套）,7款蜘蛛侠大号（一个价格下单7个发一套）,8款Q版复仇（一个价格下单8个发一套）,6款装甲复仇（一个价格下单6个发一套）,4款大号蜘蛛侠（一个价格下单4个发一套）,4款休闲生活（一个价格下单4个发一套）\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东\n是否跨境出口专供货源: 是\n适用年龄: 青少年（15-17岁）\n出售状态: 现货\n\n6款英雄（一个价格下单6个发一套）: CNY 4.50, stock 3875\n6款Q版英雄（一个价格下单6个发一套）: CNY 4.30, stock 5874\n6款披风英雄（一个价格下单6个发一套）: CNY 4.10, stock 6059\n4款复仇（一个价格下单4个发一套）: CNY 4.10, stock 25705\n4款美国队长（一个价格下单4个发一套）: CNY 3.50, stock 25756\n4款蜘蛛侠（一个价格下单4个发一套）: CNY 3.50, stock 25385\n7款蜘蛛侠小号（一个价格下单7个发一套）: CNY 2.00, stock 25599\n7款蜘蛛侠大号（一个价格下单7个发一套）: CNY 2.30, stock 25727\n8款Q版复仇（一个价格下单8个发一套）: CNY 4.40, stock 258396\n6款装甲复仇（一个价格下单6个发一套）: CNY 4.80, stock 625666\n4款大号蜘蛛侠（一个价格下单4个发一套）: CNY 2.30, stock 32562\n4款休闲生活（一个价格下单4个发一套）: CNY 3.40, stock 32562\n\nSource: https://detail.1688.com/offer/1046882782655.html",
    "price": 3.45,
    "compare_at_price": 0,
    "cost_per_item": 0.5,
    "stock": 12,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1046882782655/01.webp",
    "images": [
      "assets/1688/1046882782655/01.webp",
      "assets/1688/1046882782655/02.webp",
      "assets/1688/1046882782655/03.webp",
      "assets/1688/1046882782655/04.webp",
      "assets/1688/1046882782655/05.webp",
      "assets/1688/1046882782655/06.webp",
      "assets/1688/1046882782655/07.webp",
      "assets/1688/1046882782655/08.webp",
      "assets/1688/1046882782655/09.webp",
      "assets/1688/1046882782655/10.webp",
      "assets/1688/1046882782655/11.webp",
      "assets/1688/1046882782655/12.webp",
      "assets/1688/1046882782655/13.webp",
      "assets/1688/1046882782655/14.webp",
      "assets/1688/1046882782655/15.webp",
      "assets/1688/1046882782655/16.webp",
      "assets/1688/1046882782655/17.webp",
      "assets/1688/1046882782655/18.webp",
      "assets/1688/1046882782655/19.webp",
      "assets/1688/1046882782655/20.webp",
      "assets/1688/1046882782655/21.webp",
      "assets/1688/1046882782655/22.webp",
      "assets/1688/1046882782655/23.webp",
      "assets/1688/1046882782655/24.webp",
      "assets/1688/1046882782655/25.webp",
      "assets/1688/1046882782655/26.webp",
      "assets/1688/1046882782655/27.webp",
      "assets/1688/1046882782655/28.webp",
      "assets/1688/1046882782655/29.webp"
    ],
    "vendor": "龙港市柯漫工艺品厂",
    "sku": "1688-1046882782655",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1046882782655.html",
    "source_currency": "CNY",
    "source_price": 2,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN010htAl31kYozmLaieu_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "6款英雄（一个价格下单6个发一套）",
        "priceCny": 4.5,
        "stock": 3875
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0109xLp91sZknxG4cib_!!2222381125781-0-cib.jpg_sum.jpg",
        "name": "6款Q版英雄（一个价格下单6个发一套）",
        "priceCny": 4.3,
        "stock": 5874
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01KkkrRy1kYozmMGbqB_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "6款披风英雄（一个价格下单6个发一套）",
        "priceCny": 4.1,
        "stock": 6059
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01pbz6GP1kYozlUBU1B_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "4款复仇（一个价格下单4个发一套）",
        "priceCny": 4.1,
        "stock": 25705
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01TjreIh1kYozllCiWb_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "4款美国队长（一个价格下单4个发一套）",
        "priceCny": 3.5,
        "stock": 25756
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0135C1DD1kYp0JN5cIe_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "4款蜘蛛侠（一个价格下单4个发一套）",
        "priceCny": 3.5,
        "stock": 25385
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IsLsyt1kYozv5RvvA_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "7款蜘蛛侠小号（一个价格下单7个发一套）",
        "priceCny": 2,
        "stock": 25599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qYdYGf1kYp1jn7IOf_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "7款蜘蛛侠大号（一个价格下单7个发一套）",
        "priceCny": 2.3,
        "stock": 25727
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01vFvhpx1kYp28Cpj1U_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "8款Q版复仇（一个价格下单8个发一套）",
        "priceCny": 4.4,
        "stock": 258396
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01AXAvws1kYp23udrw4_!!2214160494696-0-cib.jpg_sum.jpg",
        "name": "6款装甲复仇（一个价格下单6个发一套）",
        "priceCny": 4.8,
        "stock": 625666
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Xzta5Q1sZknojStuy_!!2222381125781-0-cib.jpg_sum.jpg",
        "name": "4款大号蜘蛛侠（一个价格下单4个发一套）",
        "priceCny": 2.3,
        "stock": 32562
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01nHnu091sZknxZooHr_!!2222381125781-0-cib.jpg_sum.jpg",
        "name": "4款休闲生活（一个价格下单4个发一套）",
        "priceCny": 3.4,
        "stock": 32562
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "品牌",
        "value": "柯漫"
      },
      {
        "name": "动漫角色",
        "value": "其它"
      },
      {
        "name": "产地",
        "value": "中国"
      },
      {
        "name": "规格",
        "value": "见选项图"
      },
      {
        "name": "包装方式",
        "value": "彩盒"
      },
      {
        "name": "是否有动漫形象",
        "value": "是"
      },
      {
        "name": "专利及著作权",
        "value": "著作权"
      },
      {
        "name": "专利及著作权申请时间",
        "value": "11"
      },
      {
        "name": "货号",
        "value": "221451"
      },
      {
        "name": "是否有导购视频",
        "value": "是"
      },
      {
        "name": "是否拼装",
        "value": "否"
      },
      {
        "name": "是否专供外贸",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "颜色",
        "value": "6款英雄（一个价格下单6个发一套）,6款Q版英雄（一个价格下单6个发一套）,6款披风英雄（一个价格下单6个发一套）,4款复仇（一个价格下单4个发一套）,4款美国队长（一个价格下单4个发一套）,4款蜘蛛侠（一个价格下单4个发一套）,7款蜘蛛侠小号（一个价格下单7个发一套）,7款蜘蛛侠大号（一个价格下单7个发一套）,8款Q版复仇（一个价格下单8个发一套）,6款装甲复仇（一个价格下单6个发一套）,4款大号蜘蛛侠（一个价格下单4个发一套）,4款休闲生活（一个价格下单4个发一套）"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "适用年龄",
        "value": "青少年（15-17岁）"
      },
      {
        "name": "出售状态",
        "value": "现货"
      }
    ]
  },
  {
    "id": "1688-1047237087840",
    "title": "双TypeC 60W手机快充数据线适用于苹果15三星华为平板充电线",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市光明区晶鸿电子产品加工店\n\n材质: 编织\n接口: TYPE-C\n分线接头数量: 单头\n品牌: 中性\n最大输出功率: 60\n特性: 快充\n长度: 1m(不含)~2m(含)\n型号: 尼龙编织黑色【双TypeC 60W】1米（裸线）\n生产企业: /\n颜色分类: /\n\n尼龙编织黑色【双TypeC 60W】1米（裸线）: CNY 1.80, stock 9073\n\nSource: https://detail.1688.com/offer/1047237087840.html",
    "price": 3.11,
    "compare_at_price": 0,
    "cost_per_item": 0.45,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1047237087840/01.webp",
    "images": [
      "assets/1688/1047237087840/01.webp",
      "assets/1688/1047237087840/02.webp",
      "assets/1688/1047237087840/03.webp",
      "assets/1688/1047237087840/04.webp",
      "assets/1688/1047237087840/05.webp",
      "assets/1688/1047237087840/06.webp",
      "assets/1688/1047237087840/07.webp"
    ],
    "vendor": "深圳市光明区晶鸿电子产品加工店",
    "sku": "1688-1047237087840",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1047237087840.html",
    "source_currency": "CNY",
    "source_price": 1.8,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01m0Oh8A2L3o1ZbgPTY_!!2220522919637-0-cib.jpg_sum.jpg",
        "name": "尼龙编织黑色【双TypeC 60W】1米（裸线）",
        "priceCny": 1.8,
        "stock": 9073
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "编织"
      },
      {
        "name": "接口",
        "value": "TYPE-C"
      },
      {
        "name": "分线接头数量",
        "value": "单头"
      },
      {
        "name": "品牌",
        "value": "中性"
      },
      {
        "name": "最大输出功率",
        "value": "60"
      },
      {
        "name": "特性",
        "value": "快充"
      },
      {
        "name": "长度",
        "value": "1m(不含)~2m(含)"
      },
      {
        "name": "型号",
        "value": "尼龙编织黑色【双TypeC 60W】1米（裸线）"
      },
      {
        "name": "生产企业",
        "value": "/"
      },
      {
        "name": "颜色分类",
        "value": "/"
      }
    ]
  },
  {
    "id": "1688-1048835724442",
    "title": "可爱萌香氛挂件掌中宝毛绒玩具公仔小狗包包挂饰钥匙扣布娃娃玩偶",
    "category": "1688 Imports",
    "description": "Supplier: 白沟新城百萌毛绒玩具厂\n\n填充材质: PP棉\n品牌: 其他\n造型类别: 猫咪\n毛绒分类: 短毛绒\n动物分类: 猫\n所属分类: 毛绒公仔\n造型是否卡通、动漫: 否\n包装方式: 网袋\n是否多功能: 否\n货号: BZ-香氛掌中宝\n加工定制: 否\n是否有导购视频: 是\n产地: 广东\n是否外贸: 是\n是否专供外贸: 否\n3C配置类别: 14岁以下的毛绒玩具\n颜色: 香氛挂件-小羊,香氛挂件-小鸭子,香氛挂件-小猫咪,香氛挂件-企鹅,香氛挂件-小猪,香氛挂件-小兔子,香氛挂件-秋田犬,香氛挂件-小浣熊,香氛挂件-狐狸,香氛挂件-大象,香氛挂件-棕熊\n高度: 14cm【有挂绳，带香味】\n主要下游平台: 亚马逊,独立站,其他\n主要销售地区: 北美,其他\n有可授权的自有品牌: 否\n是否跨境出口专供货源: 是\n适用年龄: 青年（15-35岁）\n1: 挂件\n适用性别: 男女通用\n2: 毛绒玩具\n是否IP授权: 否\n3: 公仔玩偶\n材质: 聚酯纤维\n\n14cm【有挂绳，带香味】: CNY 7.99, stock 909\n\nSource: https://detail.1688.com/offer/1048835724442.html",
    "price": 13.78,
    "compare_at_price": 0,
    "cost_per_item": 2,
    "stock": 22,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1048835724442/01.webp",
    "images": [
      "assets/1688/1048835724442/01.webp",
      "assets/1688/1048835724442/02.webp",
      "assets/1688/1048835724442/03.webp",
      "assets/1688/1048835724442/04.webp",
      "assets/1688/1048835724442/05.webp",
      "assets/1688/1048835724442/06.webp",
      "assets/1688/1048835724442/07.webp",
      "assets/1688/1048835724442/08.webp",
      "assets/1688/1048835724442/09.webp",
      "assets/1688/1048835724442/10.webp",
      "assets/1688/1048835724442/11.webp",
      "assets/1688/1048835724442/12.webp",
      "assets/1688/1048835724442/13.webp",
      "assets/1688/1048835724442/14.webp",
      "assets/1688/1048835724442/15.webp",
      "assets/1688/1048835724442/16.webp"
    ],
    "vendor": "白沟新城百萌毛绒玩具厂",
    "sku": "1688-1048835724442",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1048835724442.html",
    "source_currency": "CNY",
    "source_price": 7.99,
    "source_variants": [
      {
        "image": "",
        "name": "14cm【有挂绳，带香味】",
        "priceCny": 7.99,
        "stock": 909
      }
    ],
    "source_attributes": [
      {
        "name": "填充材质",
        "value": "PP棉"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "造型类别",
        "value": "猫咪"
      },
      {
        "name": "毛绒分类",
        "value": "短毛绒"
      },
      {
        "name": "动物分类",
        "value": "猫"
      },
      {
        "name": "所属分类",
        "value": "毛绒公仔"
      },
      {
        "name": "造型是否卡通、动漫",
        "value": "否"
      },
      {
        "name": "包装方式",
        "value": "网袋"
      },
      {
        "name": "是否多功能",
        "value": "否"
      },
      {
        "name": "货号",
        "value": "BZ-香氛掌中宝"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "是否有导购视频",
        "value": "是"
      },
      {
        "name": "产地",
        "value": "广东"
      },
      {
        "name": "是否外贸",
        "value": "是"
      },
      {
        "name": "是否专供外贸",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以下的毛绒玩具"
      },
      {
        "name": "颜色",
        "value": "香氛挂件-小羊,香氛挂件-小鸭子,香氛挂件-小猫咪,香氛挂件-企鹅,香氛挂件-小猪,香氛挂件-小兔子,香氛挂件-秋田犬,香氛挂件-小浣熊,香氛挂件-狐狸,香氛挂件-大象,香氛挂件-棕熊"
      },
      {
        "name": "高度",
        "value": "14cm【有挂绳，带香味】"
      },
      {
        "name": "主要下游平台",
        "value": "亚马逊,独立站,其他"
      },
      {
        "name": "主要销售地区",
        "value": "北美,其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "1",
        "value": "挂件"
      },
      {
        "name": "适用性别",
        "value": "男女通用"
      },
      {
        "name": "2",
        "value": "毛绒玩具"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "3",
        "value": "公仔玩偶"
      },
      {
        "name": "材质",
        "value": "聚酯纤维"
      }
    ]
  },
  {
    "id": "1688-1051134616103",
    "title": "ins卡通小熊串珠手机链ccd相机挂链可爱小众少女心方格手机挂链潮",
    "category": "1688 Imports",
    "description": "Supplier: 义乌如火饰品有限公司\n\n绳带材质: PVC\n材质: PVC\n工艺: 其它\n绳扣材质: 塑料扣\n品牌: aimao\n是否进口: 否\n加工定制: 是\n产品编号: 288\n样式: 男女通用\n是否有挂件: 无\n包装: 独立包装\n加印LOGO: 不可以\n是否专利货源: 否\n是否跨境出口专供货源: 否\n颜色: 彩色\n规格: 【泰迪熊格子方块】挂绳\n\n【泰迪熊格子方块】挂绳: CNY 2.19, stock 1009553\n\nSource: https://detail.1688.com/offer/1051134616103.html",
    "price": 3.78,
    "compare_at_price": 0,
    "cost_per_item": 0.55,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1051134616103/01.webp",
    "images": [
      "assets/1688/1051134616103/01.webp",
      "assets/1688/1051134616103/02.webp",
      "assets/1688/1051134616103/03.webp",
      "assets/1688/1051134616103/04.webp",
      "assets/1688/1051134616103/05.webp",
      "assets/1688/1051134616103/06.webp"
    ],
    "vendor": "义乌如火饰品有限公司",
    "sku": "1688-1051134616103",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1051134616103.html",
    "source_currency": "CNY",
    "source_price": 2.19,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01hUlo9J2LJpt09P1Ir_!!2217275539672-0-cib.jpg_sum.jpg",
        "name": "【泰迪熊格子方块】挂绳",
        "priceCny": 2.19,
        "stock": 1009553
      }
    ],
    "source_attributes": [
      {
        "name": "绳带材质",
        "value": "PVC"
      },
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "工艺",
        "value": "其它"
      },
      {
        "name": "绳扣材质",
        "value": "塑料扣"
      },
      {
        "name": "品牌",
        "value": "aimao"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "产品编号",
        "value": "288"
      },
      {
        "name": "样式",
        "value": "男女通用"
      },
      {
        "name": "是否有挂件",
        "value": "无"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "彩色"
      },
      {
        "name": "规格",
        "value": "【泰迪熊格子方块】挂绳"
      }
    ]
  },
  {
    "id": "1688-1052120829727",
    "title": "适用S23手机膜S23+无尘秒贴仓全胶超清陶瓷膜全覆盖防摔贴膜",
    "category": "1688 Imports",
    "description": "Supplier: 汕头市潮阳区贵屿浩马电子商行\n\n材质: 陶瓷膜\n适用机型: 三星\n贴膜类型: 前膜\n贴膜特点: 高清\n品牌: 浩马\n颜色: 【升级秒贴仓】超清陶瓷膜\n尺寸: 三星S23,三星S23+/s23plus,三星S23ultra,三星S23FE\n\n三星S23: CNY 4.80, stock 88887\n三星S23+/s23plus: CNY 4.80, stock 88888\n三星S23ultra: CNY 4.80, stock 88875\n三星S23FE: CNY 4.80, stock 88888\n\nSource: https://detail.1688.com/offer/1052120829727.html",
    "price": 8.28,
    "compare_at_price": 0,
    "cost_per_item": 1.2,
    "stock": 10,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1052120829727/01.webp",
    "images": [
      "assets/1688/1052120829727/01.webp",
      "assets/1688/1052120829727/02.webp",
      "assets/1688/1052120829727/03.webp",
      "assets/1688/1052120829727/04.webp",
      "assets/1688/1052120829727/05.webp"
    ],
    "vendor": "汕头市潮阳区贵屿浩马电子商行",
    "sku": "1688-1052120829727",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1052120829727.html",
    "source_currency": "CNY",
    "source_price": 4.8,
    "source_variants": [
      {
        "image": "",
        "name": "三星S23",
        "priceCny": 4.8,
        "stock": 88887
      },
      {
        "image": "",
        "name": "三星S23+/s23plus",
        "priceCny": 4.8,
        "stock": 88888
      },
      {
        "image": "",
        "name": "三星S23ultra",
        "priceCny": 4.8,
        "stock": 88875
      },
      {
        "image": "",
        "name": "三星S23FE",
        "priceCny": 4.8,
        "stock": 88888
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "陶瓷膜"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "高清"
      },
      {
        "name": "品牌",
        "value": "浩马"
      },
      {
        "name": "颜色",
        "value": "【升级秒贴仓】超清陶瓷膜"
      },
      {
        "name": "尺寸",
        "value": "三星S23,三星S23+/s23plus,三星S23ultra,三星S23FE"
      }
    ]
  },
  {
    "id": "1688-1054220822302",
    "title": "适用于A56钢化膜全屏全包手机膜防爆防摔高清护眼抗蓝光防窥",
    "category": "1688 Imports",
    "description": "Supplier: 汕头市潮阳区贵屿浩马电子商行\n\n材质: 钢化玻璃\n适用机型: 三星\n贴膜类型: 前膜\n贴膜特点: 防刮\n品牌: 浩马\n颜色: 简装【超清增透+强抗指纹】升级*顶配康宁膜,简装【防窥增透+强抗指纹】升级*顶配康宁膜,简装【护眼增透+强抗指纹】升级*顶配康宁膜,精装【超清增透+强抗指纹】升级*顶配康宁膜,精装【防窥增透+强抗指纹】升级*顶配康宁膜,精装【护眼增透+强抗指纹】升级*顶配康宁膜\n尺寸: 三星A56\n\n三星A56: CNY 2.80, stock 88883\n\nSource: https://detail.1688.com/offer/1054220822302.html",
    "price": 4.83,
    "compare_at_price": 0,
    "cost_per_item": 0.7,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1054220822302/01.webp",
    "images": [
      "assets/1688/1054220822302/01.webp",
      "assets/1688/1054220822302/02.webp",
      "assets/1688/1054220822302/03.webp",
      "assets/1688/1054220822302/04.webp",
      "assets/1688/1054220822302/05.webp",
      "assets/1688/1054220822302/06.webp",
      "assets/1688/1054220822302/07.webp",
      "assets/1688/1054220822302/08.webp",
      "assets/1688/1054220822302/09.webp",
      "assets/1688/1054220822302/10.webp",
      "assets/1688/1054220822302/11.webp"
    ],
    "vendor": "汕头市潮阳区贵屿浩马电子商行",
    "sku": "1688-1054220822302",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1054220822302.html",
    "source_currency": "CNY",
    "source_price": 2.8,
    "source_variants": [
      {
        "image": "",
        "name": "三星A56",
        "priceCny": 2.8,
        "stock": 88883
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "钢化玻璃"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "防刮"
      },
      {
        "name": "品牌",
        "value": "浩马"
      },
      {
        "name": "颜色",
        "value": "简装【超清增透+强抗指纹】升级*顶配康宁膜,简装【防窥增透+强抗指纹】升级*顶配康宁膜,简装【护眼增透+强抗指纹】升级*顶配康宁膜,精装【超清增透+强抗指纹】升级*顶配康宁膜,精装【防窥增透+强抗指纹】升级*顶配康宁膜,精装【护眼增透+强抗指纹】升级*顶配康宁膜"
      },
      {
        "name": "尺寸",
        "value": "三星A56"
      }
    ]
  },
  {
    "id": "1688-1054848181049",
    "title": "跨境毛绒玩具雀斑男孩挂件玩偶卡通爆炸头公仔钥匙扣配饰礼物挂饰",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市福米日用品厂\n\n详情状态: 1688商品已下架，资料来自订单快照\n已购规格数: 4\n\n雀斑男孩【蓝白条纹】: CNY 6.38, stock 2\n雀斑男孩【绿衣】: CNY 6.38, stock 2\n雀斑男孩【红白条纹】: CNY 6.38, stock 2\n其他已购规格: CNY 6.38, stock 2\n\nSource: https://detail.1688.com/offer/1054848181049.html",
    "price": 11.01,
    "compare_at_price": 0,
    "cost_per_item": 1.6,
    "stock": 8,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1054848181049/01.webp",
    "images": [
      "assets/1688/1054848181049/01.webp",
      "assets/1688/1054848181049/02.webp",
      "assets/1688/1054848181049/03.webp",
      "assets/1688/1054848181049/04.webp",
      "assets/1688/1054848181049/05.webp",
      "assets/1688/1054848181049/06.webp",
      "assets/1688/1054848181049/07.webp",
      "assets/1688/1054848181049/08.webp",
      "assets/1688/1054848181049/09.webp",
      "assets/1688/1054848181049/10.webp"
    ],
    "vendor": "义乌市福米日用品厂",
    "sku": "1688-1054848181049",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1054848181049.html",
    "source_currency": "CNY",
    "source_price": 6.38,
    "source_variants": [
      {
        "name": "雀斑男孩【蓝白条纹】",
        "priceCny": 6.38,
        "stock": 2,
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01iPoUrC1kEfdtf1Ux0_!!6000000004652-0-cib.jpg_160x160.jpg_.webp"
      },
      {
        "name": "雀斑男孩【绿衣】",
        "priceCny": 6.38,
        "stock": 2,
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN011JbMUg1HTDMWoahK2_!!6000000000758-0-cib.jpg_160x160.jpg_.webp"
      },
      {
        "name": "雀斑男孩【红白条纹】",
        "priceCny": 6.38,
        "stock": 2,
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01SsTEkD1ooAo6yt7Qn_!!6000000005271-0-cib.jpg_160x160.jpg_.webp"
      },
      {
        "name": "其他已购规格",
        "priceCny": 6.38,
        "stock": 2,
        "image": ""
      }
    ],
    "source_attributes": [
      {
        "name": "详情状态",
        "value": "1688商品已下架，资料来自订单快照"
      },
      {
        "name": "已购规格数",
        "value": "4"
      }
    ]
  },
  {
    "id": "1688-1055132607351",
    "title": "无线扫码枪超市收银快递物流专用出入库盘点条码二维码识别扫描枪",
    "category": "1688 Imports",
    "description": "Supplier: 佛山鑫码电子科技有限公司\n\n品牌: GTCODESTAR\n接口类型: USB接口\n类型: 手持式扫描枪\n扫描速率: 中高\n分辨率: 30万/100万选配\n货号: 3600\n外形尺寸: 181.13 * 59.04 * 47.08mm\n质保: 1年\n重量: 125.4g±5g（不含线材和支架）\n售后服务: 1年质保+技术支持\n型号: 二维有线【普通配置】不带支架,二维无线蓝牙【全局30万扫描】,二维无线蓝牙【全局100万扫描】\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他\n有可授权的自有品牌: 是\n是否跨境出口专供货源: 是\n是否属于礼品: 否\n\n二维有线【普通配置】不带支架: CNY 99.00, stock 4953\n二维无线蓝牙【全局30万扫描】: CNY 199.00, stock 4999\n二维无线蓝牙【全局100万扫描】: CNY 399.00, stock 4999\n\nSource: https://detail.1688.com/offer/1055132607351.html",
    "price": 170.77,
    "compare_at_price": 0,
    "cost_per_item": 24.75,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1055132607351/01.webp",
    "images": [
      "assets/1688/1055132607351/01.webp",
      "assets/1688/1055132607351/02.webp",
      "assets/1688/1055132607351/03.webp",
      "assets/1688/1055132607351/04.webp",
      "assets/1688/1055132607351/05.webp",
      "assets/1688/1055132607351/06.webp",
      "assets/1688/1055132607351/07.webp",
      "assets/1688/1055132607351/08.webp",
      "assets/1688/1055132607351/09.webp",
      "assets/1688/1055132607351/10.webp",
      "assets/1688/1055132607351/11.webp"
    ],
    "vendor": "佛山鑫码电子科技有限公司",
    "sku": "1688-1055132607351",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1055132607351.html",
    "source_currency": "CNY",
    "source_price": 99,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01hokSFR1VQpvYutNcC_!!1006742648-0-cib.jpg_sum.jpg",
        "name": "二维有线【普通配置】不带支架",
        "priceCny": 99,
        "stock": 4953
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PxOVrL1VQpvXYmb1e_!!1006742648-0-cib.jpg_sum.jpg",
        "name": "二维无线蓝牙【全局30万扫描】",
        "priceCny": 199,
        "stock": 4999
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN011xHMHb1VQpvXg5Md8_!!1006742648-0-cib.jpg_sum.jpg",
        "name": "二维无线蓝牙【全局100万扫描】",
        "priceCny": 399,
        "stock": 4999
      }
    ],
    "source_attributes": [
      {
        "name": "品牌",
        "value": "GTCODESTAR"
      },
      {
        "name": "接口类型",
        "value": "USB接口"
      },
      {
        "name": "类型",
        "value": "手持式扫描枪"
      },
      {
        "name": "扫描速率",
        "value": "中高"
      },
      {
        "name": "分辨率",
        "value": "30万/100万选配"
      },
      {
        "name": "货号",
        "value": "3600"
      },
      {
        "name": "外形尺寸",
        "value": "181.13 * 59.04 * 47.08mm"
      },
      {
        "name": "质保",
        "value": "1年"
      },
      {
        "name": "重量",
        "value": "125.4g±5g（不含线材和支架）"
      },
      {
        "name": "售后服务",
        "value": "1年质保+技术支持"
      },
      {
        "name": "型号",
        "value": "二维有线【普通配置】不带支架,二维无线蓝牙【全局30万扫描】,二维无线蓝牙【全局100万扫描】"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "是"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "是否属于礼品",
        "value": "否"
      }
    ]
  },
  {
    "id": "1688-1055370465108",
    "title": "产地货源娃三岁-罗曼史的密语毛绒盲盒潮玩公仔礼物网红爆款盲盒",
    "category": "1688 Imports",
    "description": "Supplier: 东莞市长安花伦同学玩具商行\n\n玩具材质: 毛绒\n品牌: 大漂亮\n专利及著作权: 无专利及著作权\n动漫角色: 娃三岁\n产地: 广东省\n是否外贸专供: 否\n适用年龄: 青年（15-35岁）\n建议零售价: 99\n货号: 娃三岁罗曼史的密语\n上市时间: 2026\n能力培养: 情感,视觉,智力开发,爬行,抓握,感官\n是否有动漫形象: 否\n适用人群: 不限\n包装: 彩盒装\n是否进口: 否\n3C配置类别: 14岁以上的玩具\n是否跨境出口专供货源: 否\n原产国/地区: 中国\n专利号或版权登记证号: 否\n专利及著作权申请时间: 否\n主要销售地区: 欧洲,南美,东南亚,北美,东北亚,中东\n主要下游平台: ebay,亚马逊,wish,速卖通\n有可授权的自有品牌: 否\n出售状态: 现货\n\n: CNY 31.00, stock 1991\n\nSource: https://detail.1688.com/offer/1055370465108.html",
    "price": 53.47,
    "compare_at_price": 0,
    "cost_per_item": 7.75,
    "stock": 8,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1055370465108/01.webp",
    "images": [
      "assets/1688/1055370465108/01.webp",
      "assets/1688/1055370465108/02.webp",
      "assets/1688/1055370465108/03.webp",
      "assets/1688/1055370465108/04.webp",
      "assets/1688/1055370465108/05.webp"
    ],
    "vendor": "东莞市长安花伦同学玩具商行",
    "sku": "1688-1055370465108",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1055370465108.html",
    "source_currency": "CNY",
    "source_price": 31,
    "source_variants": [
      {
        "image": "",
        "name": "",
        "priceCny": 31,
        "stock": 1991
      }
    ],
    "source_attributes": [
      {
        "name": "玩具材质",
        "value": "毛绒"
      },
      {
        "name": "品牌",
        "value": "大漂亮"
      },
      {
        "name": "专利及著作权",
        "value": "无专利及著作权"
      },
      {
        "name": "动漫角色",
        "value": "娃三岁"
      },
      {
        "name": "产地",
        "value": "广东省"
      },
      {
        "name": "是否外贸专供",
        "value": "否"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "建议零售价",
        "value": "99"
      },
      {
        "name": "货号",
        "value": "娃三岁罗曼史的密语"
      },
      {
        "name": "上市时间",
        "value": "2026"
      },
      {
        "name": "能力培养",
        "value": "情感,视觉,智力开发,爬行,抓握,感官"
      },
      {
        "name": "是否有动漫形象",
        "value": "否"
      },
      {
        "name": "适用人群",
        "value": "不限"
      },
      {
        "name": "包装",
        "value": "彩盒装"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "原产国/地区",
        "value": "中国"
      },
      {
        "name": "专利号或版权登记证号",
        "value": "否"
      },
      {
        "name": "专利及著作权申请时间",
        "value": "否"
      },
      {
        "name": "主要销售地区",
        "value": "欧洲,南美,东南亚,北美,东北亚,中东"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "出售状态",
        "value": "现货"
      }
    ]
  },
  {
    "id": "1688-1056839400986",
    "title": "卡通炸毛雀斑家族男孩小挂件毛绒玩偶可爱卷毛娃娃公仔儿童钥匙扣",
    "category": "1688 Imports",
    "description": "Supplier: 兰山区杨洋地意玩具用品厂\n\n填充材质: PP棉\n品牌: 其他\n造型类别: 其它\n毛绒分类: 优质毛绒\n所属分类: 毛绒公仔\n造型是否卡通、动漫: 否\n包装方式: 网袋\n是否多功能: 否\n货号: 卷毛娃娃\n加工定制: 否\n是否有导购视频: 否\n产地: 中国\n是否外贸: 是\n是否专供外贸: 否\n3C配置类别: 14岁以上的玩具\n颜色: 丑娃-子涵,丑娃-歪比巴卜,丑娃-艾玛,丑娃-娜塔莎,丑娃朵拉\n高度: 15cm\n是否跨境出口专供货源: 否\n适用年龄: 青年（15-35岁）\n适用性别: 男女通用\n材质: 聚酯纤维\n\n15cm: CNY 16.00, stock 997\n\nSource: https://detail.1688.com/offer/1056839400986.html",
    "price": 27.6,
    "compare_at_price": 0,
    "cost_per_item": 4,
    "stock": 7,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1056839400986/01.webp",
    "images": [
      "assets/1688/1056839400986/01.webp",
      "assets/1688/1056839400986/02.webp",
      "assets/1688/1056839400986/03.webp",
      "assets/1688/1056839400986/04.webp",
      "assets/1688/1056839400986/05.webp",
      "assets/1688/1056839400986/06.webp",
      "assets/1688/1056839400986/07.webp",
      "assets/1688/1056839400986/08.webp",
      "assets/1688/1056839400986/09.webp",
      "assets/1688/1056839400986/10.webp"
    ],
    "vendor": "兰山区杨洋地意玩具用品厂",
    "sku": "1688-1056839400986",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1056839400986.html",
    "source_currency": "CNY",
    "source_price": 16,
    "source_variants": [
      {
        "image": "",
        "name": "15cm",
        "priceCny": 16,
        "stock": 997
      }
    ],
    "source_attributes": [
      {
        "name": "填充材质",
        "value": "PP棉"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "造型类别",
        "value": "其它"
      },
      {
        "name": "毛绒分类",
        "value": "优质毛绒"
      },
      {
        "name": "所属分类",
        "value": "毛绒公仔"
      },
      {
        "name": "造型是否卡通、动漫",
        "value": "否"
      },
      {
        "name": "包装方式",
        "value": "网袋"
      },
      {
        "name": "是否多功能",
        "value": "否"
      },
      {
        "name": "货号",
        "value": "卷毛娃娃"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "是否有导购视频",
        "value": "否"
      },
      {
        "name": "产地",
        "value": "中国"
      },
      {
        "name": "是否外贸",
        "value": "是"
      },
      {
        "name": "是否专供外贸",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "颜色",
        "value": "丑娃-子涵,丑娃-歪比巴卜,丑娃-艾玛,丑娃-娜塔莎,丑娃朵拉"
      },
      {
        "name": "高度",
        "value": "15cm"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "适用性别",
        "value": "男女通用"
      },
      {
        "name": "材质",
        "value": "聚酯纤维"
      }
    ]
  },
  {
    "id": "1688-1058019627153",
    "title": "KOUCOMI我是大王系列毛绒盲盒动漫手办周边摆件礼物网红爆款盲盒",
    "category": "1688 Imports",
    "description": "Supplier: 东莞市长安花伦同学玩具商行\n\n玩具材质: 毛绒\n品牌: 其他\n专利及著作权: 无专利及著作权\n动漫角色: 其它\n产地: 广东省\n是否外贸专供: 否\n适用年龄: 青年（15-35岁）\n建议零售价: 188\n货号: JX-1058\n上市时间: 2025\n能力培养: 情感,视觉,爬行,抓握,感官\n是否有动漫形象: 否\n适用人群: 不限\n包装: 彩盒装\n是否进口: 否\n3C配置类别: 14岁以上的玩具\n是否跨境出口专供货源: 否\n原产国/地区: 中国\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA\n有可授权的自有品牌: 否\n出售状态: 预售\n是否IP授权: 否\n\n: CNY 49.00, stock 246\n\nSource: https://detail.1688.com/offer/1058019627153.html",
    "price": 84.53,
    "compare_at_price": 0,
    "cost_per_item": 12.25,
    "stock": 24,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1058019627153/01.webp",
    "images": [
      "assets/1688/1058019627153/01.webp",
      "assets/1688/1058019627153/02.webp",
      "assets/1688/1058019627153/03.webp",
      "assets/1688/1058019627153/04.webp",
      "assets/1688/1058019627153/05.webp"
    ],
    "vendor": "东莞市长安花伦同学玩具商行",
    "sku": "1688-1058019627153",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1058019627153.html",
    "source_currency": "CNY",
    "source_price": 49,
    "source_variants": [
      {
        "image": "",
        "name": "",
        "priceCny": 49,
        "stock": 246
      }
    ],
    "source_attributes": [
      {
        "name": "玩具材质",
        "value": "毛绒"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "专利及著作权",
        "value": "无专利及著作权"
      },
      {
        "name": "动漫角色",
        "value": "其它"
      },
      {
        "name": "产地",
        "value": "广东省"
      },
      {
        "name": "是否外贸专供",
        "value": "否"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "建议零售价",
        "value": "188"
      },
      {
        "name": "货号",
        "value": "JX-1058"
      },
      {
        "name": "上市时间",
        "value": "2025"
      },
      {
        "name": "能力培养",
        "value": "情感,视觉,爬行,抓握,感官"
      },
      {
        "name": "是否有动漫形象",
        "value": "否"
      },
      {
        "name": "适用人群",
        "value": "不限"
      },
      {
        "name": "包装",
        "value": "彩盒装"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "原产国/地区",
        "value": "中国"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "出售状态",
        "value": "预售"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      }
    ]
  },
  {
    "id": "1688-1059631005816",
    "title": "东南亚跨境钱包女生带活页卡包拉链零钱包清爽学生可爱钱包女款PU",
    "category": "1688 Imports",
    "description": "Supplier: 广东淳富实业有限公司\n\n材质: PU\n皮质特征: 其它\n功能: 多卡位,放银行卡,放硬币\n里料质地: 涤纶\n品牌: Suphair\n钱夹折数: 2折\n流行元素: 花朵,印花,撞色,拼接\n风格: 清新甜美\n货号: M8801\n图案: 几何图案\n颜色: 黑色,绿色,粉色,紫色,蓝色,米白色\n有可授权的自有品牌: 是\n上市年份季节: 2026\n适用场景: 日常搭配\n\n黑色: CNY 18.03, stock 851\n绿色: CNY 18.03, stock 849\n粉色: CNY 18.03, stock 852\n紫色: CNY 18.03, stock 851\n蓝色: CNY 18.03, stock 851\n米白色: CNY 18.03, stock 852\n\nSource: https://detail.1688.com/offer/1059631005816.html",
    "price": 31.1,
    "compare_at_price": 0,
    "cost_per_item": 4.51,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1059631005816/01.webp",
    "images": [
      "assets/1688/1059631005816/01.webp",
      "assets/1688/1059631005816/02.webp",
      "assets/1688/1059631005816/03.webp",
      "assets/1688/1059631005816/04.webp",
      "assets/1688/1059631005816/05.webp",
      "assets/1688/1059631005816/06.webp",
      "assets/1688/1059631005816/07.webp",
      "assets/1688/1059631005816/08.webp",
      "assets/1688/1059631005816/09.webp",
      "assets/1688/1059631005816/10.webp",
      "assets/1688/1059631005816/11.webp",
      "assets/1688/1059631005816/12.webp",
      "assets/1688/1059631005816/13.webp",
      "assets/1688/1059631005816/14.webp",
      "assets/1688/1059631005816/15.webp",
      "assets/1688/1059631005816/16.webp",
      "assets/1688/1059631005816/17.webp"
    ],
    "vendor": "广东淳富实业有限公司",
    "sku": "1688-1059631005816",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1059631005816.html",
    "source_currency": "CNY",
    "source_price": 18.03,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015l63bQ1tYfTpsGJVu_!!2213340205914-0-cib.jpg_sum.jpg",
        "name": "黑色",
        "priceCny": 18.03,
        "stock": 851
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01YNnEmk1tYfTq7WL08_!!2213340205914-0-cib.jpg_sum.jpg",
        "name": "绿色",
        "priceCny": 18.03,
        "stock": 849
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01503bQi1tYfTpsGuuE_!!2213340205914-0-cib.jpg_sum.jpg",
        "name": "粉色",
        "priceCny": 18.03,
        "stock": 852
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01n1DkKT1tYfTqDHwrk_!!2213340205914-0-cib.jpg_sum.jpg",
        "name": "紫色",
        "priceCny": 18.03,
        "stock": 851
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01xyUfoV1tYfTqBnoIg_!!2213340205914-0-cib.jpg_sum.jpg",
        "name": "蓝色",
        "priceCny": 18.03,
        "stock": 851
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01T3yD9K1tYfTqGKbKS_!!2213340205914-0-cib.jpg_sum.jpg",
        "name": "米白色",
        "priceCny": 18.03,
        "stock": 852
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PU"
      },
      {
        "name": "皮质特征",
        "value": "其它"
      },
      {
        "name": "功能",
        "value": "多卡位,放银行卡,放硬币"
      },
      {
        "name": "里料质地",
        "value": "涤纶"
      },
      {
        "name": "品牌",
        "value": "Suphair"
      },
      {
        "name": "钱夹折数",
        "value": "2折"
      },
      {
        "name": "流行元素",
        "value": "花朵,印花,撞色,拼接"
      },
      {
        "name": "风格",
        "value": "清新甜美"
      },
      {
        "name": "货号",
        "value": "M8801"
      },
      {
        "name": "图案",
        "value": "几何图案"
      },
      {
        "name": "颜色",
        "value": "黑色,绿色,粉色,紫色,蓝色,米白色"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "是"
      },
      {
        "name": "上市年份季节",
        "value": "2026"
      },
      {
        "name": "适用场景",
        "value": "日常搭配"
      }
    ]
  },
  {
    "id": "1688-1060304503811",
    "title": "热销新款猫猫幻想乐园直播间可爱创意摆件树脂工艺品潮玩批发盲盒",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市星游川岸工艺品有限公司\n\n材质: 树脂\n类别: 树脂工艺品\n品牌: 星游\n风格: 卡通风\n适用节日: 生日,通用,情人节,感恩节,教师节,中秋节,七夕,万圣节,复活节,端午节,国庆节,儿童节,妇女节,结婚纪念日\n货号: XY-FQ02\n包装: 独立包装\n是否专利货源: 否\n颜色: 猫猫幻想乐园单盒（1个）,暹罗猫的小美好单盒（1个）,蘑菇猫之星星小宝单盒（1个）,海洋生物喵单盒（1个）,无忧无虑小猫单盒（1个）,予愿梦境转转单盒（1个）,奇思喵想集端盒（1个）,泥泥兔营业中单盒（1个）,指尖咪语日记单盒（1个）,逃学小咪大作战单盒（1个）,宝藏情绪小喵呜单盒（1个）,猫狗pai我爱我家单盒（1个）,猫猫PAI乐无忧转转单盒（1个）,猫猫pai生之盎然单盒（1个）,猫猫PAI幻想蘑菇单盒（1个）,猫猫PAI一缕温暖单盒(1个),猫猫PAI果然有趣单盒(1个),猫猫PAI表演艺术家mini单盒（1对）,猫猫pal单盒（1个）,猫猫PAI情绪单盒（1个）,猫猫pai运能量单盒（1个）,猫猫幻想乐园端盒（9个）,暹罗猫的小美好端盒（6个）,蘑菇猫之星星小宝端盒（8个）,海洋生物喵端盒（6个）,无忧无虑小猫端盒（8个）,予愿梦境转转端盒（6个）,奇思喵想集端盒（8个）,泥泥兔营业中端盒（6个）,指尖咪语日记端盒（6个）,逃学小咪大作战端盒（8个）,宝藏情绪小喵呜端盒（8个）,猫狗pai我爱我家端盒（6个）,猫猫PAI乐无忧转转端盒（6个）,猫猫pai生之盎然端盒（6个）,猫猫PAI幻想蘑菇端盒（9个）,猫猫PAI一缕温暖端盒(6个),猫猫PAI果然有趣端盒(12个),猫猫PAI表演艺术家mini端盒（6对）,猫猫pal端盒（6个）,猫猫PAI情绪端盒（4个）,猫猫pai运能量端盒（6个）\n适用送礼场合: 毕业,乔迁,派对聚会,探病慰问,其他\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他\n送礼用途: 促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他\n是否属于礼品: 是，个人礼品\n是否IP授权: 否\n外观造型: 动物\n\n猫猫幻想乐园单盒（1个）: CNY 7.00, stock 158\n暹罗猫的小美好单盒（1个）: CNY 11.00, stock 39\n蘑菇猫之星星小宝单盒（1个）: CNY 7.35, stock 91\n海洋生物喵单盒（1个）: CNY 6.00, stock 90\n无忧无虑小猫单盒（1个）: CNY 8.60, stock 30\n予愿梦境转转单盒（1个）: CNY 9.70, stock 76\n奇思喵想集端盒（1个）: CNY 5.75, stock 82\n泥泥兔营业中单盒（1个）: CNY 6.85, stock 80\n指尖咪语日记单盒（1个）: CNY 6.00, stock 120\n逃学小咪大作战单盒（1个）: CNY 7.70, stock 153\n宝藏情绪小喵呜单盒（1个）: CNY 7.10, stock 180\n猫狗pai我爱我家单盒（1个）: CNY 6.60, stock 90\n猫猫PAI乐无忧转转单盒（1个）: CNY 8.50, stock 40\n猫猫pai生之盎然单盒（1个）: CNY 7.70, stock 288\n猫猫PAI幻想蘑菇单盒（1个）: CNY 7.30, stock 12\n猫猫PAI一缕温暖单盒(1个): CNY 7.80, stock 136\n猫猫PAI果然有趣单盒(1个): CNY 6.30, stock 148\n猫猫PAI表演艺术家mini单盒（1对）: CNY 5.20, stock 21\n猫猫pal单盒（1个）: CNY 5.60, stock 139\n猫猫PAI情绪单盒（1个）: CNY 6.10, stock 100\n猫猫pai运能量单盒（1个）: CNY 5.90, stock 134\n猫猫幻想乐园端盒（9个）: CNY 63.00, stock 2\n暹罗猫的小美好端盒（6个）: CNY 66.00, stock 15\n蘑菇猫之星星小宝端盒（8个）: CNY 58.80, stock 29\n海洋生物喵端盒（6个）: CNY 36.00, stock 34\n无忧无虑小猫端盒（8个）: CNY 68.80, stock 9\n予愿梦境转转端盒（6个）: CNY 58.20, stock 28\n奇思喵想集端盒（8个）: CNY 46.00, stock 87\n泥泥兔营业中端盒（6个）: CNY 41.10, stock 30\n指尖咪语日记端盒（6个）: CNY 36.00, stock 37\n逃学小咪大作战端盒（8个）: CNY 61.60, stock 27\n宝藏情绪小喵呜端盒（8个）: CNY 56.80, stock 27\n猫狗pai我爱我家端盒（6个）: CNY 39.60, stock 21\n猫猫PAI乐无忧转转端盒（6个）: CNY 51.00, stock 50\n猫猫pai生之盎然端盒（6个）: CNY 46.20, stock 79\n猫猫PAI幻想蘑菇端盒（9个）: CNY 65.70, stock 26\n猫猫PAI一缕温暖端盒(6个): CNY 46.80, stock 16\n猫猫PAI果然有趣端盒(12个): CNY 75.60, stock 38\n猫猫PAI表演艺术家mini端盒（6对）: CNY 31.20, stock 14\n猫猫pal端盒（6个）: CNY 33.60, stock 20\n猫猫PAI情绪端盒（4个）: CNY 24.40, stock 50\n猫猫pai运能量端盒（6个）: CNY 35.40, stock 12\n\nSource: https://detail.1688.com/offer/1060304503811.html",
    "price": 8.97,
    "compare_at_price": 0,
    "cost_per_item": 1.3,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1060304503811/01.webp",
    "images": [
      "assets/1688/1060304503811/01.webp",
      "assets/1688/1060304503811/02.webp",
      "assets/1688/1060304503811/03.webp",
      "assets/1688/1060304503811/04.webp",
      "assets/1688/1060304503811/05.webp",
      "assets/1688/1060304503811/06.webp",
      "assets/1688/1060304503811/07.webp",
      "assets/1688/1060304503811/08.webp",
      "assets/1688/1060304503811/09.webp",
      "assets/1688/1060304503811/10.webp",
      "assets/1688/1060304503811/11.webp",
      "assets/1688/1060304503811/12.webp",
      "assets/1688/1060304503811/13.webp",
      "assets/1688/1060304503811/14.webp",
      "assets/1688/1060304503811/15.webp",
      "assets/1688/1060304503811/16.webp",
      "assets/1688/1060304503811/17.webp",
      "assets/1688/1060304503811/18.webp",
      "assets/1688/1060304503811/19.webp",
      "assets/1688/1060304503811/20.webp",
      "assets/1688/1060304503811/21.webp",
      "assets/1688/1060304503811/22.webp",
      "assets/1688/1060304503811/23.webp",
      "assets/1688/1060304503811/24.webp",
      "assets/1688/1060304503811/25.webp",
      "assets/1688/1060304503811/26.webp",
      "assets/1688/1060304503811/27.webp",
      "assets/1688/1060304503811/28.webp",
      "assets/1688/1060304503811/29.webp",
      "assets/1688/1060304503811/30.webp",
      "assets/1688/1060304503811/31.webp",
      "assets/1688/1060304503811/32.webp",
      "assets/1688/1060304503811/33.webp",
      "assets/1688/1060304503811/34.webp",
      "assets/1688/1060304503811/35.webp",
      "assets/1688/1060304503811/36.webp",
      "assets/1688/1060304503811/37.webp",
      "assets/1688/1060304503811/38.webp",
      "assets/1688/1060304503811/39.webp",
      "assets/1688/1060304503811/40.webp",
      "assets/1688/1060304503811/41.webp",
      "assets/1688/1060304503811/42.webp",
      "assets/1688/1060304503811/43.webp",
      "assets/1688/1060304503811/44.webp",
      "assets/1688/1060304503811/45.webp",
      "assets/1688/1060304503811/46.webp"
    ],
    "vendor": "义乌市星游川岸工艺品有限公司",
    "sku": "1688-1060304503811",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1060304503811.html",
    "source_currency": "CNY",
    "source_price": 5.2,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01iqOKYY24wRot5UsBS_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫幻想乐园单盒（1个）",
        "priceCny": 7,
        "stock": 158
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01VINSfI24wRoqbqhjA_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "暹罗猫的小美好单盒（1个）",
        "priceCny": 11,
        "stock": 39
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01fmIECx24wRor8Oj7N_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "蘑菇猫之星星小宝单盒（1个）",
        "priceCny": 7.35,
        "stock": 91
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Cs4FTf24wRoqhP0WP_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "海洋生物喵单盒（1个）",
        "priceCny": 6,
        "stock": 90
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IEmiss24wRoqf81Hb_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "无忧无虑小猫单盒（1个）",
        "priceCny": 8.6,
        "stock": 30
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01YvRINZ24wRoljuEP2_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "予愿梦境转转单盒（1个）",
        "priceCny": 9.7,
        "stock": 76
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ghtWzp24wRom3qdYE_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "奇思喵想集端盒（1个）",
        "priceCny": 5.75,
        "stock": 82
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IhFttJ24wRolyVg8z_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "泥泥兔营业中单盒（1个）",
        "priceCny": 6.85,
        "stock": 80
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013ujRSh24wRoiFvzK4_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "指尖咪语日记单盒（1个）",
        "priceCny": 6,
        "stock": 120
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Z5jQ8y24wRoXfQyJA_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "逃学小咪大作战单盒（1个）",
        "priceCny": 7.7,
        "stock": 153
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01JrsOJY24wRoXdmvhu_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "宝藏情绪小喵呜单盒（1个）",
        "priceCny": 7.1,
        "stock": 180
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01q68Q8o24wRoPftrfI_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫狗pai我爱我家单盒（1个）",
        "priceCny": 6.6,
        "stock": 90
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01VKo19o24wRngMrFFr_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI乐无忧转转单盒（1个）",
        "priceCny": 8.5,
        "stock": 40
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015LQZhD24wRo2Y1pu9_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫pai生之盎然单盒（1个）",
        "priceCny": 7.7,
        "stock": 288
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016Mr5YS24wRngPs6na_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI幻想蘑菇单盒（1个）",
        "priceCny": 7.3,
        "stock": 12
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ptUmdL24wRnWAw7CO_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI一缕温暖单盒(1个)",
        "priceCny": 7.8,
        "stock": 136
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01apFfFU24wRnVyo9jj_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI果然有趣单盒(1个)",
        "priceCny": 6.3,
        "stock": 148
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0112vO9V24wRm6DkfNp_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI表演艺术家mini单盒（1对）",
        "priceCny": 5.2,
        "stock": 21
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN018xU4TM24wRkSTRsX1_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫pal单盒（1个）",
        "priceCny": 5.6,
        "stock": 139
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01GZk6gl24wRl9xOZlY_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI情绪单盒（1个）",
        "priceCny": 6.1,
        "stock": 100
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01odFpMe24wRmCxgLvQ_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫pai运能量单盒（1个）",
        "priceCny": 5.9,
        "stock": 134
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01iqOKYY24wRot5UsBS_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫幻想乐园端盒（9个）",
        "priceCny": 63,
        "stock": 2
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01VINSfI24wRoqbqhjA_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "暹罗猫的小美好端盒（6个）",
        "priceCny": 66,
        "stock": 15
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01fmIECx24wRor8Oj7N_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "蘑菇猫之星星小宝端盒（8个）",
        "priceCny": 58.8,
        "stock": 29
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Cs4FTf24wRoqhP0WP_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "海洋生物喵端盒（6个）",
        "priceCny": 36,
        "stock": 34
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IEmiss24wRoqf81Hb_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "无忧无虑小猫端盒（8个）",
        "priceCny": 68.8,
        "stock": 9
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01YvRINZ24wRoljuEP2_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "予愿梦境转转端盒（6个）",
        "priceCny": 58.2,
        "stock": 28
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ghtWzp24wRom3qdYE_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "奇思喵想集端盒（8个）",
        "priceCny": 46,
        "stock": 87
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IhFttJ24wRolyVg8z_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "泥泥兔营业中端盒（6个）",
        "priceCny": 41.1,
        "stock": 30
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013ujRSh24wRoiFvzK4_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "指尖咪语日记端盒（6个）",
        "priceCny": 36,
        "stock": 37
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Z5jQ8y24wRoXfQyJA_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "逃学小咪大作战端盒（8个）",
        "priceCny": 61.6,
        "stock": 27
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01JrsOJY24wRoXdmvhu_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "宝藏情绪小喵呜端盒（8个）",
        "priceCny": 56.8,
        "stock": 27
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01q68Q8o24wRoPftrfI_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫狗pai我爱我家端盒（6个）",
        "priceCny": 39.6,
        "stock": 21
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01VKo19o24wRngMrFFr_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI乐无忧转转端盒（6个）",
        "priceCny": 51,
        "stock": 50
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015LQZhD24wRo2Y1pu9_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫pai生之盎然端盒（6个）",
        "priceCny": 46.2,
        "stock": 79
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016Mr5YS24wRngPs6na_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI幻想蘑菇端盒（9个）",
        "priceCny": 65.7,
        "stock": 26
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ptUmdL24wRnWAw7CO_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI一缕温暖端盒(6个)",
        "priceCny": 46.8,
        "stock": 16
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01apFfFU24wRnVyo9jj_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI果然有趣端盒(12个)",
        "priceCny": 75.6,
        "stock": 38
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0112vO9V24wRm6DkfNp_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI表演艺术家mini端盒（6对）",
        "priceCny": 31.2,
        "stock": 14
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN018xU4TM24wRkSTRsX1_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫pal端盒（6个）",
        "priceCny": 33.6,
        "stock": 20
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01GZk6gl24wRl9xOZlY_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI情绪端盒（4个）",
        "priceCny": 24.4,
        "stock": 50
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01odFpMe24wRmCxgLvQ_!!2219391957455-0-cib.jpg_sum.jpg",
        "name": "猫猫pai运能量端盒（6个）",
        "priceCny": 35.4,
        "stock": 12
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "树脂"
      },
      {
        "name": "类别",
        "value": "树脂工艺品"
      },
      {
        "name": "品牌",
        "value": "星游"
      },
      {
        "name": "风格",
        "value": "卡通风"
      },
      {
        "name": "适用节日",
        "value": "生日,通用,情人节,感恩节,教师节,中秋节,七夕,万圣节,复活节,端午节,国庆节,儿童节,妇女节,结婚纪念日"
      },
      {
        "name": "货号",
        "value": "XY-FQ02"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "猫猫幻想乐园单盒（1个）,暹罗猫的小美好单盒（1个）,蘑菇猫之星星小宝单盒（1个）,海洋生物喵单盒（1个）,无忧无虑小猫单盒（1个）,予愿梦境转转单盒（1个）,奇思喵想集端盒（1个）,泥泥兔营业中单盒（1个）,指尖咪语日记单盒（1个）,逃学小咪大作战单盒（1个）,宝藏情绪小喵呜单盒（1个）,猫狗pai我爱我家单盒（1个）,猫猫PAI乐无忧转转单盒（1个）,猫猫pai生之盎然单盒（1个）,猫猫PAI幻想蘑菇单盒（1个）,猫猫PAI一缕温暖单盒(1个),猫猫PAI果然有趣单盒(1个),猫猫PAI表演艺术家mini单盒（1对）,猫猫pal单盒（1个）,猫猫PAI情绪单盒（1个）,猫猫pai运能量单盒（1个）,猫猫幻想乐园端盒（9个）,暹罗猫的小美好端盒（6个）,蘑菇猫之星星小宝端盒（8个）,海洋生物喵端盒（6个）,无忧无虑小猫端盒（8个）,予愿梦境转转端盒（6个）,奇思喵想集端盒（8个）,泥泥兔营业中端盒（6个）,指尖咪语日记端盒（6个）,逃学小咪大作战端盒（8个）,宝藏情绪小喵呜端盒（8个）,猫狗pai我爱我家端盒（6个）,猫猫PAI乐无忧转转端盒（6个）,猫猫pai生之盎然端盒（6个）,猫猫PAI幻想蘑菇端盒（9个）,猫猫PAI一缕温暖端盒(6个),猫猫PAI果然有趣端盒(12个),猫猫PAI表演艺术家mini端盒（6对）,猫猫pal端盒（6个）,猫猫PAI情绪端盒（4个）,猫猫pai运能量端盒（6个）"
      },
      {
        "name": "适用送礼场合",
        "value": "毕业,乔迁,派对聚会,探病慰问,其他"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他"
      },
      {
        "name": "送礼用途",
        "value": "促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "外观造型",
        "value": "动物"
      }
    ]
  },
  {
    "id": "1688-1061025427330",
    "title": "财神爷供奉神像店铺开业办公室黄铜财神爷摆件家用供奉佛像批发",
    "category": "1688 Imports",
    "description": "Supplier: 汕头市沐恩家居用品有限公司\n\n材质: 黄铜\n工艺: 雕刻,铸造,打磨\n品牌: 无\n风格: 中式\n有可授权的自有品牌: 无\n颜色: 聚宝铜财神-12#,聚宝铜财神-20#,聚宝铜财神-25#,聚宝铜财神-30#,聚宝铜财神-35#,聚宝铜财神-40#\n是否专利货源: 否\n货号: E0901\n专利号: /\n是否属于礼品: 否\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他\n是否IP授权: 是\nIP授权类型: /\nIP名称: /\n\n聚宝铜财神-12#: CNY 65.00, stock 15\n聚宝铜财神-20#: CNY 198.00, stock 5\n聚宝铜财神-25#: CNY 290.00, stock 24\n聚宝铜财神-30#: CNY 425.00, stock 20\n聚宝铜财神-35#: CNY 640.00, stock 8\n聚宝铜财神-40#: CNY 816.00, stock 3\n\nSource: https://detail.1688.com/offer/1061025427330.html",
    "price": 112.12,
    "compare_at_price": 0,
    "cost_per_item": 16.25,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/1061025427330/01.webp",
    "images": [
      "assets/1688/1061025427330/01.webp",
      "assets/1688/1061025427330/02.webp",
      "assets/1688/1061025427330/03.webp",
      "assets/1688/1061025427330/04.webp",
      "assets/1688/1061025427330/05.webp",
      "assets/1688/1061025427330/06.webp",
      "assets/1688/1061025427330/07.webp",
      "assets/1688/1061025427330/08.webp",
      "assets/1688/1061025427330/09.webp",
      "assets/1688/1061025427330/10.webp",
      "assets/1688/1061025427330/11.webp",
      "assets/1688/1061025427330/12.webp",
      "assets/1688/1061025427330/13.webp",
      "assets/1688/1061025427330/14.webp",
      "assets/1688/1061025427330/15.webp",
      "assets/1688/1061025427330/16.webp",
      "assets/1688/1061025427330/17.webp"
    ],
    "vendor": "汕头市沐恩家居用品有限公司",
    "sku": "1688-1061025427330",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/1061025427330.html",
    "source_currency": "CNY",
    "source_price": 65,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01OmZ6z01hkmXbKvFQ4_!!2924494316-0-cib.jpg_sum.jpg",
        "name": "聚宝铜财神-12#",
        "priceCny": 65,
        "stock": 15
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WeDeAX1hkmXaNoKJD_!!2924494316-0-cib.jpg_sum.jpg",
        "name": "聚宝铜财神-20#",
        "priceCny": 198,
        "stock": 5
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN010jqiG31hkmXay7vN5_!!2924494316-0-cib.jpg_sum.jpg",
        "name": "聚宝铜财神-25#",
        "priceCny": 290,
        "stock": 24
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0116UHJL1hkmXam4qSl_!!2924494316-0-cib.jpg_sum.jpg",
        "name": "聚宝铜财神-30#",
        "priceCny": 425,
        "stock": 20
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01965mMZ1hkmXaglGJJ_!!2924494316-0-cib.jpg_sum.jpg",
        "name": "聚宝铜财神-35#",
        "priceCny": 640,
        "stock": 8
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01vBJd4v1hkmXaO46Kw_!!2924494316-0-cib.jpg_sum.jpg",
        "name": "聚宝铜财神-40#",
        "priceCny": 816,
        "stock": 3
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "黄铜"
      },
      {
        "name": "工艺",
        "value": "雕刻,铸造,打磨"
      },
      {
        "name": "品牌",
        "value": "无"
      },
      {
        "name": "风格",
        "value": "中式"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "无"
      },
      {
        "name": "颜色",
        "value": "聚宝铜财神-12#,聚宝铜财神-20#,聚宝铜财神-25#,聚宝铜财神-30#,聚宝铜财神-35#,聚宝铜财神-40#"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "货号",
        "value": "E0901"
      },
      {
        "name": "专利号",
        "value": "/"
      },
      {
        "name": "是否属于礼品",
        "value": "否"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "是否IP授权",
        "value": "是"
      },
      {
        "name": "IP授权类型",
        "value": "/"
      },
      {
        "name": "IP名称",
        "value": "/"
      }
    ]
  },
  {
    "id": "1688-638236634232",
    "title": "手机平板钢化膜贴膜垫子辅助工具硅胶垫防滑保护膜 厂家直供",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市华然材料科技有限公司\n\n材质: tpu\n贴膜类型: 全身膜\n贴膜特点: 3916359\n品牌: 华然\n产地: 深圳\n颜色: 灰色130*220\n货号: 020\n适用品牌: 中性\n\n灰色130*220: CNY 3.04, stock 188971\n\nSource: https://detail.1688.com/offer/638236634232.html",
    "price": 5.24,
    "compare_at_price": 0,
    "cost_per_item": 0.76,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/638236634232/01.webp",
    "images": [
      "assets/1688/638236634232/01.webp",
      "assets/1688/638236634232/02.webp",
      "assets/1688/638236634232/03.webp",
      "assets/1688/638236634232/04.webp",
      "assets/1688/638236634232/05.webp",
      "assets/1688/638236634232/06.webp",
      "assets/1688/638236634232/07.webp"
    ],
    "vendor": "深圳市华然材料科技有限公司",
    "sku": "1688-638236634232",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/638236634232.html",
    "source_currency": "CNY",
    "source_price": 3.04,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WsKn4S1kDHy7U7orH_!!2209895674649-0-cib.jpg_sum.jpg",
        "name": "灰色130*220",
        "priceCny": 3.04,
        "stock": 188971
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "tpu"
      },
      {
        "name": "贴膜类型",
        "value": "全身膜"
      },
      {
        "name": "贴膜特点",
        "value": "3916359"
      },
      {
        "name": "品牌",
        "value": "华然"
      },
      {
        "name": "产地",
        "value": "深圳"
      },
      {
        "name": "颜色",
        "value": "灰色130*220"
      },
      {
        "name": "货号",
        "value": "020"
      },
      {
        "name": "适用品牌",
        "value": "中性"
      }
    ]
  },
  {
    "id": "1688-641308393669",
    "title": "适用note20三星s25ultra保护膜s26+原厂软膜水凝膜s22批发高清膜",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市键键通科技有限公司\n\n材质: tpu\n适用机型: 三星\n贴膜类型: 前膜\n贴膜特点: 高清,防指纹,自动修复\n品牌: 键键通\n颜色: 4K透明高清\n尺寸: S24ultra,S24/S25,S24+/S25+,S23ultra,S23 FE,S23,S23+,S20+,S21,S21+,S21ultra,S20,NOTE20,S22+,S22,S22Ultra,Note20Ultra,S20FE,s10,s10+/s10Plus,S25ultra,S25Edge,S25 FE,S26,S26+,S26ultra\n\nS24ultra: CNY 5.51, stock 99986\nS24/S25: CNY 5.51, stock 99989\nS24+/S25+: CNY 5.51, stock 99989\nS23ultra: CNY 5.51, stock 99985\nS23 FE: CNY 5.51, stock 99999\nS23: CNY 5.51, stock 99983\nS23+: CNY 5.51, stock 99989\nS20+: CNY 5.51, stock 99999\nS21: CNY 5.51, stock 99999\nS21+: CNY 5.51, stock 99997\nS21ultra: CNY 5.51, stock 99999\nS20: CNY 5.51, stock 99999\nNOTE20: CNY 5.51, stock 100004\nS22+: CNY 5.51, stock 99999\nS22: CNY 5.51, stock 99999\nS22Ultra: CNY 5.51, stock 99989\nNote20Ultra: CNY 5.51, stock 99999\nS20FE: CNY 5.51, stock 99998\ns10: CNY 5.51, stock 99999\ns10+/s10Plus: CNY 5.51, stock 99998\nS25ultra: CNY 5.51, stock 99989\nS25Edge: CNY 5.51, stock 99999\nS25 FE: CNY 5.51, stock 99999\nS26: CNY 5.51, stock 99999\nS26+: CNY 5.51, stock 99999\nS26ultra: CNY 5.51, stock 99999\n\nSource: https://detail.1688.com/offer/641308393669.html",
    "price": 9.5,
    "compare_at_price": 0,
    "cost_per_item": 1.38,
    "stock": 8,
    "sales": 0,
    "published": false,
    "image": "assets/1688/641308393669/01.webp",
    "images": [
      "assets/1688/641308393669/01.webp",
      "assets/1688/641308393669/02.webp",
      "assets/1688/641308393669/03.webp",
      "assets/1688/641308393669/04.webp",
      "assets/1688/641308393669/05.webp",
      "assets/1688/641308393669/06.webp"
    ],
    "vendor": "深圳市键键通科技有限公司",
    "sku": "1688-641308393669",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/641308393669.html",
    "source_currency": "CNY",
    "source_price": 5.51,
    "source_variants": [
      {
        "image": "",
        "name": "S24ultra",
        "priceCny": 5.51,
        "stock": 99986
      },
      {
        "image": "",
        "name": "S24/S25",
        "priceCny": 5.51,
        "stock": 99989
      },
      {
        "image": "",
        "name": "S24+/S25+",
        "priceCny": 5.51,
        "stock": 99989
      },
      {
        "image": "",
        "name": "S23ultra",
        "priceCny": 5.51,
        "stock": 99985
      },
      {
        "image": "",
        "name": "S23 FE",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S23",
        "priceCny": 5.51,
        "stock": 99983
      },
      {
        "image": "",
        "name": "S23+",
        "priceCny": 5.51,
        "stock": 99989
      },
      {
        "image": "",
        "name": "S20+",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S21",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S21+",
        "priceCny": 5.51,
        "stock": 99997
      },
      {
        "image": "",
        "name": "S21ultra",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S20",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "NOTE20",
        "priceCny": 5.51,
        "stock": 100004
      },
      {
        "image": "",
        "name": "S22+",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S22",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S22Ultra",
        "priceCny": 5.51,
        "stock": 99989
      },
      {
        "image": "",
        "name": "Note20Ultra",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S20FE",
        "priceCny": 5.51,
        "stock": 99998
      },
      {
        "image": "",
        "name": "s10",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "s10+/s10Plus",
        "priceCny": 5.51,
        "stock": 99998
      },
      {
        "image": "",
        "name": "S25ultra",
        "priceCny": 5.51,
        "stock": 99989
      },
      {
        "image": "",
        "name": "S25Edge",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S25 FE",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S26",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S26+",
        "priceCny": 5.51,
        "stock": 99999
      },
      {
        "image": "",
        "name": "S26ultra",
        "priceCny": 5.51,
        "stock": 99999
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "tpu"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "高清,防指纹,自动修复"
      },
      {
        "name": "品牌",
        "value": "键键通"
      },
      {
        "name": "颜色",
        "value": "4K透明高清"
      },
      {
        "name": "尺寸",
        "value": "S24ultra,S24/S25,S24+/S25+,S23ultra,S23 FE,S23,S23+,S20+,S21,S21+,S21ultra,S20,NOTE20,S22+,S22,S22Ultra,Note20Ultra,S20FE,s10,s10+/s10Plus,S25ultra,S25Edge,S25 FE,S26,S26+,S26ultra"
      }
    ]
  },
  {
    "id": "1688-645350323565",
    "title": "适用苹果数据线快充typec快充线 iPhone手机PD数据线苹果充电线",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市赛乔科技有限公司\n\n材质: TPE\n接口: Lightning\n分线接头数量: 单头\n品牌: 其他\n最大输出功率: 40\n特性: 快充\n长度: 1m(不含)~2m(含)\n型号: 【适用苹果5-14】PD27W数据线,【适用苹果15-17】双C口编织线60W,【适用苹果15-17】PD数据线C-C系列,PD20W充电器【认证款】,PD30W充电器【认证款】,PD40W充电器,40w美规【适用苹果15-17套装】编织C-C1m+PD充电头,20W中规认证款【适用苹果15-17套装】编织C-C1m+PD充电头,20W美规认证款【适用苹果15-17套装】编织C-C1m+PD充电头,20W中规认证款【适用苹果5-14套装】PD27W数据线1m+PD充电头,20W美规认证款【适用苹果5-14套装】PD27W数据线1m+PD充电头,30W美规认证款【适用苹果5-14套装】PD27W数据线1m+PD充电头,30W美规认证款【适用苹果15-17套装】编织C-C1m+PD充电头,苹果粗款USB1米,苹果粗款USB1.5米,苹果粗款USB2米,苹果粗款USB3米\n颜色: 快充线1m,快充线1.5m,快充线2m,1米台版芯片中性,2米台版芯片中性,1米C94原芯片中性,2米C94原芯片中性,1M（精仿芯片）,1.5M（精仿芯片）,2米（精仿芯片）,C-C1米编织后组原中性,C-C1米编织原芯片中性,C-C2米240W原芯片中性,C-C2米60w,C-C1米100W原芯片,C-C2米100w原芯片.,美规中性,中规,苹果USB,7代扎USB1米6颗料\n货号: 63\n3C证书编号: 2024010907607022\n生产企业: 赛乔科技\n颜色分类: 白色\n\n快充线1m: CNY 3.42, stock 99859\n快充线1.5m: CNY 3.80, stock 99974\n快充线2m: CNY 4.18, stock 99977\n1米台版芯片中性: CNY 13.47, stock 99999\n2米台版芯片中性: CNY 15.47, stock 100000\n1米C94原芯片中性: CNY 21.85, stock 100000\n2米C94原芯片中性: CNY 27.55, stock 100000\n\nSource: https://detail.1688.com/offer/645350323565.html",
    "price": 5.9,
    "compare_at_price": 0,
    "cost_per_item": 0.86,
    "stock": 14,
    "sales": 0,
    "published": false,
    "image": "assets/1688/645350323565/01.webp",
    "images": [
      "assets/1688/645350323565/01.webp",
      "assets/1688/645350323565/02.webp",
      "assets/1688/645350323565/03.webp",
      "assets/1688/645350323565/04.webp",
      "assets/1688/645350323565/05.webp",
      "assets/1688/645350323565/06.webp",
      "assets/1688/645350323565/07.webp",
      "assets/1688/645350323565/08.webp",
      "assets/1688/645350323565/09.webp",
      "assets/1688/645350323565/10.webp",
      "assets/1688/645350323565/11.webp",
      "assets/1688/645350323565/12.webp",
      "assets/1688/645350323565/13.webp",
      "assets/1688/645350323565/14.webp",
      "assets/1688/645350323565/15.webp",
      "assets/1688/645350323565/16.webp",
      "assets/1688/645350323565/17.webp",
      "assets/1688/645350323565/18.webp",
      "assets/1688/645350323565/19.webp",
      "assets/1688/645350323565/20.webp",
      "assets/1688/645350323565/21.webp"
    ],
    "vendor": "深圳市赛乔科技有限公司",
    "sku": "1688-645350323565",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/645350323565.html",
    "source_currency": "CNY",
    "source_price": 3.42,
    "source_variants": [
      {
        "image": "",
        "name": "快充线1m",
        "priceCny": 3.42,
        "stock": 99859
      },
      {
        "image": "",
        "name": "快充线1.5m",
        "priceCny": 3.8,
        "stock": 99974
      },
      {
        "image": "",
        "name": "快充线2m",
        "priceCny": 4.18,
        "stock": 99977
      },
      {
        "image": "",
        "name": "1米台版芯片中性",
        "priceCny": 13.47,
        "stock": 99999
      },
      {
        "image": "",
        "name": "2米台版芯片中性",
        "priceCny": 15.47,
        "stock": 100000
      },
      {
        "image": "",
        "name": "1米C94原芯片中性",
        "priceCny": 21.85,
        "stock": 100000
      },
      {
        "image": "",
        "name": "2米C94原芯片中性",
        "priceCny": 27.55,
        "stock": 100000
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "TPE"
      },
      {
        "name": "接口",
        "value": "Lightning"
      },
      {
        "name": "分线接头数量",
        "value": "单头"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "最大输出功率",
        "value": "40"
      },
      {
        "name": "特性",
        "value": "快充"
      },
      {
        "name": "长度",
        "value": "1m(不含)~2m(含)"
      },
      {
        "name": "型号",
        "value": "【适用苹果5-14】PD27W数据线,【适用苹果15-17】双C口编织线60W,【适用苹果15-17】PD数据线C-C系列,PD20W充电器【认证款】,PD30W充电器【认证款】,PD40W充电器,40w美规【适用苹果15-17套装】编织C-C1m+PD充电头,20W中规认证款【适用苹果15-17套装】编织C-C1m+PD充电头,20W美规认证款【适用苹果15-17套装】编织C-C1m+PD充电头,20W中规认证款【适用苹果5-14套装】PD27W数据线1m+PD充电头,20W美规认证款【适用苹果5-14套装】PD27W数据线1m+PD充电头,30W美规认证款【适用苹果5-14套装】PD27W数据线1m+PD充电头,30W美规认证款【适用苹果15-17套装】编织C-C1m+PD充电头,苹果粗款USB1米,苹果粗款USB1.5米,苹果粗款USB2米,苹果粗款USB3米"
      },
      {
        "name": "颜色",
        "value": "快充线1m,快充线1.5m,快充线2m,1米台版芯片中性,2米台版芯片中性,1米C94原芯片中性,2米C94原芯片中性,1M（精仿芯片）,1.5M（精仿芯片）,2米（精仿芯片）,C-C1米编织后组原中性,C-C1米编织原芯片中性,C-C2米240W原芯片中性,C-C2米60w,C-C1米100W原芯片,C-C2米100w原芯片.,美规中性,中规,苹果USB,7代扎USB1米6颗料"
      },
      {
        "name": "货号",
        "value": "63"
      },
      {
        "name": "3C证书编号",
        "value": "2024010907607022"
      },
      {
        "name": "生产企业",
        "value": "赛乔科技"
      },
      {
        "name": "颜色分类",
        "value": "白色"
      }
    ]
  },
  {
    "id": "1688-675433423362",
    "title": "UV胶水固化手机钢化贴膜紫外线紫光速干一字照灯美甲店穿戴甲烤灯",
    "category": "1688 Imports",
    "description": "Supplier: 中山市兴鑫电子商务有限公司\n\n品牌类型: OEM\n品牌: 其他\n是否进口: 否\n型号: XX-UV-15灯\n产地: 广东中山\n货号: XX-UV-15灯\n净含量: 106g\n主要下游平台: ebay,亚马逊,wish,速卖通,LAZADA\n有可授权的自有品牌: 否\n是否跨境出口专供货源: 是\n规格: 新款28灯插电款【60/90/150S】,新款24灯插电款【60/90/150S】,新款8灯插电款【60/90/150S】,15灯插电款【Type-C彩盒+80CM数据线】,10灯插电款【Type-C接口+OPP袋子】,白色-电池款【升级灯珠】,白色-插电款【升级灯珠】\n颜色: 白色\n美甲产品分类: UV手机固化灯\n适用人群: 普通人群\n灯光颜色: 紫光\n\n新款28灯插电款【60/90/150S】: CNY 11.72, stock 9709\n新款24灯插电款【60/90/150S】: CNY 10.07, stock 99344\n新款8灯插电款【60/90/150S】: CNY 5.61, stock 9771\n15灯插电款【Type-C彩盒+80CM数据线】: CNY 9.31, stock 197914\n10灯插电款【Type-C接口+OPP袋子】: CNY 3.23, stock 8307\n白色-电池款【升级灯珠】: CNY 4.28, stock 99988\n白色-插电款【升级灯珠】: CNY 2.47, stock 99948\n\nSource: https://detail.1688.com/offer/675433423362.html",
    "price": 4.26,
    "compare_at_price": 0,
    "cost_per_item": 0.62,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/675433423362/01.webp",
    "images": [
      "assets/1688/675433423362/01.webp",
      "assets/1688/675433423362/02.webp",
      "assets/1688/675433423362/03.webp",
      "assets/1688/675433423362/04.webp",
      "assets/1688/675433423362/05.webp",
      "assets/1688/675433423362/06.webp",
      "assets/1688/675433423362/07.webp",
      "assets/1688/675433423362/08.webp",
      "assets/1688/675433423362/09.webp",
      "assets/1688/675433423362/10.webp",
      "assets/1688/675433423362/11.webp",
      "assets/1688/675433423362/12.webp",
      "assets/1688/675433423362/13.webp",
      "assets/1688/675433423362/14.webp",
      "assets/1688/675433423362/15.webp",
      "assets/1688/675433423362/16.webp",
      "assets/1688/675433423362/17.webp",
      "assets/1688/675433423362/18.webp",
      "assets/1688/675433423362/19.webp"
    ],
    "vendor": "中山市兴鑫电子商务有限公司",
    "sku": "1688-675433423362",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/675433423362.html",
    "source_currency": "CNY",
    "source_price": 2.47,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN010bZkQz1CcJ5fnqY0h_!!2202787890101-0-cib.jpg_sum.jpg",
        "name": "新款28灯插电款【60/90/150S】",
        "priceCny": 11.72,
        "stock": 9709
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01dUzW4Y1CcIxhrJGqH_!!2202787890101-0-cib.jpg_sum.jpg",
        "name": "新款24灯插电款【60/90/150S】",
        "priceCny": 10.07,
        "stock": 99344
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN010gfUpF1CcIxjtVjT3_!!2202787890101-0-cib.jpg_sum.jpg",
        "name": "新款8灯插电款【60/90/150S】",
        "priceCny": 5.61,
        "stock": 9771
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01x2MpAo1CcIxiggSpj_!!2202787890101-0-cib.jpg_sum.jpg",
        "name": "15灯插电款【Type-C彩盒+80CM数据线】",
        "priceCny": 9.31,
        "stock": 197914
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01SyI8ST1CcIxkqmflm_!!2202787890101-0-cib.jpg_sum.jpg",
        "name": "10灯插电款【Type-C接口+OPP袋子】",
        "priceCny": 3.23,
        "stock": 8307
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jyzViE1CcJ8rUyA28_!!2202787890101-0-cib.jpg_sum.jpg",
        "name": "白色-电池款【升级灯珠】",
        "priceCny": 4.28,
        "stock": 99988
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01bEeUsG1CcJ8rM3ZZC_!!2202787890101-0-cib.jpg_sum.jpg",
        "name": "白色-插电款【升级灯珠】",
        "priceCny": 2.47,
        "stock": 99948
      }
    ],
    "source_attributes": [
      {
        "name": "品牌类型",
        "value": "OEM"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "型号",
        "value": "XX-UV-15灯"
      },
      {
        "name": "产地",
        "value": "广东中山"
      },
      {
        "name": "货号",
        "value": "XX-UV-15灯"
      },
      {
        "name": "净含量",
        "value": "106g"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,LAZADA"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "规格",
        "value": "新款28灯插电款【60/90/150S】,新款24灯插电款【60/90/150S】,新款8灯插电款【60/90/150S】,15灯插电款【Type-C彩盒+80CM数据线】,10灯插电款【Type-C接口+OPP袋子】,白色-电池款【升级灯珠】,白色-插电款【升级灯珠】"
      },
      {
        "name": "颜色",
        "value": "白色"
      },
      {
        "name": "美甲产品分类",
        "value": "UV手机固化灯"
      },
      {
        "name": "适用人群",
        "value": "普通人群"
      },
      {
        "name": "灯光颜色",
        "value": "紫光"
      }
    ]
  },
  {
    "id": "1688-696158031878",
    "title": "外卖牛皮纸袋圣诞节礼品礼物手提袋定制烘焙咖啡饮品外卖打包袋",
    "category": "1688 Imports",
    "description": "Supplier: 温州市艺站包装有限公司\n\n品牌: 其他\n主要下游平台: wish,亚马逊,独立站,速卖通,LAZADA,ebay\n主要销售地区: 东南亚,东北亚,拉丁美洲,非洲,欧洲,中东,中国,其他,南美,北美\n是否跨境出口专供货源: 是\n适用送礼场合: 节日\n日生产量: 350000\n用途: 礼品袋\n是否可降解: 是\n是否可印logo: 是\n全国工业生产许可证编号: 001\n纸袋形状: 手提袋\n产地: 浙江温州\n尺寸: 8-33\n工艺: 其他\n规格: 竖版中号21*11*27CM,外卖袋21*14*27CM,竖版小号15x8x21CM,大号外卖袋28*15*28CM,4号尺寸图,1号尺寸图,2号尺寸图,横版大号32x11x25CM,单杯纸袋12*10*22CM,横版加大号40*13*31CM,竖版大号26x12x31CM,嗨底捞同款12.5*7.5*15\n颜色: 粉色,黄色,酒红色,浅蓝色,深蓝色,黑色,浅绿色,橙色,墨绿色,动物园,恭喜发财,粉紫色,中国红,心想事成,玫红色,粉色爱心,五福临门,天空蓝,宝石蓝,来杯咖啡,动物派对,HAPPY兔,蛋糕兔,蓝色爱心,日进斗金,蓝色大理石,条纹熊,黄色爱心,hello熊,美味蛋糕屋,HAPPY花,一点心意,贩卖幸福,圣诞火车,财神驾到,粉色大理石,黑红爱心,向日葵女孩,万事如意,银灰手,圣诞粉色,大理石纹蓝,粉色-爱心,桃桃兔,黄牛本色,打包甜蜜,圣诞礼物堆,白牛白色,好运满满,梦幻圣诞树,红格面包,圣诞老人快乐,好运咖啡,NICE花,贩卖可爱,平安喜乐1,像蛋糕一样甜,搞钱要紧,拒绝焦虑,初雪圣诞,幸运郁金香,暴富-好运,蓝字礼物,喝杯拿铁,这家蛋糕真不错,冲鸭开心鸭,公主请发财,圣诞卡皮巴拉,平安喜乐白卡袋（厚款）,熊猫胖哒（立体耳朵）,可爱喵（立体耳朵）,可爱熊（立体耳朵）,好运花花来,姐妹你又瘦了,珍珠卡皮巴拉,发财-多亿,烟斗卡皮巴拉,白卡-五福临门,白卡-福气满满,平安喜乐-黄牛,前程似锦-黄牛,萌萌虎（立体耳朵）,感恩狐（立体耳朵）,毕业季白卡袋,圣诞Merry Christmas礼物,小狗旺财（立体耳朵）,北欧感圣诞\n\n竖版小号15x8x21CM: CNY 0.19, stock 416102\n竖版中号21*11*27CM: CNY 0.29, stock 488253\n竖版大号26x12x31CM: CNY 0.43, stock 334157\n横版大号32x11x25CM: CNY 0.43, stock 556970\n大号外卖袋28*15*28CM: CNY 0.45, stock 500295\n单杯纸袋12*10*22CM: CNY 0.24, stock 403260\n外卖袋21*14*27CM: CNY 0.33, stock 216749\n横版加大号40*13*31CM: CNY 0.55, stock 395553\n嗨底捞同款12.5*7.5*15: CNY 0.24, stock 458782\n\nSource: https://detail.1688.com/offer/696158031878.html",
    "price": 0.33,
    "compare_at_price": 0,
    "cost_per_item": 0.05,
    "stock": 220,
    "sales": 0,
    "published": false,
    "image": "assets/1688/696158031878/01.webp",
    "images": [
      "assets/1688/696158031878/01.webp",
      "assets/1688/696158031878/02.webp",
      "assets/1688/696158031878/03.webp",
      "assets/1688/696158031878/04.webp",
      "assets/1688/696158031878/05.webp",
      "assets/1688/696158031878/06.webp",
      "assets/1688/696158031878/07.webp",
      "assets/1688/696158031878/08.webp",
      "assets/1688/696158031878/09.webp",
      "assets/1688/696158031878/10.webp",
      "assets/1688/696158031878/11.webp",
      "assets/1688/696158031878/12.webp",
      "assets/1688/696158031878/13.webp",
      "assets/1688/696158031878/14.webp",
      "assets/1688/696158031878/15.webp",
      "assets/1688/696158031878/16.webp",
      "assets/1688/696158031878/17.webp",
      "assets/1688/696158031878/18.webp",
      "assets/1688/696158031878/19.webp",
      "assets/1688/696158031878/20.webp",
      "assets/1688/696158031878/21.webp",
      "assets/1688/696158031878/22.webp",
      "assets/1688/696158031878/23.webp",
      "assets/1688/696158031878/24.webp",
      "assets/1688/696158031878/25.webp",
      "assets/1688/696158031878/26.webp",
      "assets/1688/696158031878/27.webp",
      "assets/1688/696158031878/28.webp",
      "assets/1688/696158031878/29.webp",
      "assets/1688/696158031878/30.webp",
      "assets/1688/696158031878/31.webp",
      "assets/1688/696158031878/32.webp",
      "assets/1688/696158031878/33.webp",
      "assets/1688/696158031878/34.webp",
      "assets/1688/696158031878/35.webp",
      "assets/1688/696158031878/36.webp",
      "assets/1688/696158031878/37.webp",
      "assets/1688/696158031878/38.webp",
      "assets/1688/696158031878/39.webp",
      "assets/1688/696158031878/40.webp",
      "assets/1688/696158031878/41.webp",
      "assets/1688/696158031878/42.webp",
      "assets/1688/696158031878/43.webp",
      "assets/1688/696158031878/44.webp",
      "assets/1688/696158031878/45.webp",
      "assets/1688/696158031878/46.webp",
      "assets/1688/696158031878/47.webp",
      "assets/1688/696158031878/48.webp",
      "assets/1688/696158031878/49.webp",
      "assets/1688/696158031878/50.webp",
      "assets/1688/696158031878/51.webp",
      "assets/1688/696158031878/52.webp",
      "assets/1688/696158031878/53.webp",
      "assets/1688/696158031878/54.webp",
      "assets/1688/696158031878/55.webp",
      "assets/1688/696158031878/56.webp",
      "assets/1688/696158031878/57.webp",
      "assets/1688/696158031878/58.webp",
      "assets/1688/696158031878/59.webp",
      "assets/1688/696158031878/60.webp",
      "assets/1688/696158031878/61.webp",
      "assets/1688/696158031878/62.webp",
      "assets/1688/696158031878/63.webp",
      "assets/1688/696158031878/64.webp",
      "assets/1688/696158031878/65.webp",
      "assets/1688/696158031878/66.webp",
      "assets/1688/696158031878/67.webp",
      "assets/1688/696158031878/68.webp",
      "assets/1688/696158031878/69.webp",
      "assets/1688/696158031878/70.webp",
      "assets/1688/696158031878/71.webp",
      "assets/1688/696158031878/72.webp",
      "assets/1688/696158031878/73.webp",
      "assets/1688/696158031878/74.webp",
      "assets/1688/696158031878/75.webp",
      "assets/1688/696158031878/76.webp",
      "assets/1688/696158031878/77.webp",
      "assets/1688/696158031878/78.webp",
      "assets/1688/696158031878/79.webp",
      "assets/1688/696158031878/80.webp",
      "assets/1688/696158031878/81.webp",
      "assets/1688/696158031878/82.webp",
      "assets/1688/696158031878/83.webp",
      "assets/1688/696158031878/84.webp",
      "assets/1688/696158031878/85.webp",
      "assets/1688/696158031878/86.webp",
      "assets/1688/696158031878/87.webp",
      "assets/1688/696158031878/88.webp",
      "assets/1688/696158031878/89.webp",
      "assets/1688/696158031878/90.webp",
      "assets/1688/696158031878/91.webp",
      "assets/1688/696158031878/92.webp"
    ],
    "vendor": "温州市艺站包装有限公司",
    "sku": "1688-696158031878",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/696158031878.html",
    "source_currency": "CNY",
    "source_price": 0.19,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "竖版小号15x8x21CM",
        "priceCny": 0.19,
        "stock": 416102
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "竖版中号21*11*27CM",
        "priceCny": 0.29,
        "stock": 488253
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "竖版大号26x12x31CM",
        "priceCny": 0.43,
        "stock": 334157
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "横版大号32x11x25CM",
        "priceCny": 0.43,
        "stock": 556970
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "大号外卖袋28*15*28CM",
        "priceCny": 0.45,
        "stock": 500295
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "单杯纸袋12*10*22CM",
        "priceCny": 0.24,
        "stock": 403260
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "外卖袋21*14*27CM",
        "priceCny": 0.33,
        "stock": 216749
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "横版加大号40*13*31CM",
        "priceCny": 0.55,
        "stock": 395553
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jtl76F2C4sGq3zhsT_!!2215087068421-0-cib.jpg_sum.jpg",
        "name": "嗨底捞同款12.5*7.5*15",
        "priceCny": 0.24,
        "stock": 458782
      }
    ],
    "source_attributes": [
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "主要下游平台",
        "value": "wish,亚马逊,独立站,速卖通,LAZADA,ebay"
      },
      {
        "name": "主要销售地区",
        "value": "东南亚,东北亚,拉丁美洲,非洲,欧洲,中东,中国,其他,南美,北美"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "适用送礼场合",
        "value": "节日"
      },
      {
        "name": "日生产量",
        "value": "350000"
      },
      {
        "name": "用途",
        "value": "礼品袋"
      },
      {
        "name": "是否可降解",
        "value": "是"
      },
      {
        "name": "是否可印logo",
        "value": "是"
      },
      {
        "name": "全国工业生产许可证编号",
        "value": "001"
      },
      {
        "name": "纸袋形状",
        "value": "手提袋"
      },
      {
        "name": "产地",
        "value": "浙江温州"
      },
      {
        "name": "尺寸",
        "value": "8-33"
      },
      {
        "name": "工艺",
        "value": "其他"
      },
      {
        "name": "规格",
        "value": "竖版中号21*11*27CM,外卖袋21*14*27CM,竖版小号15x8x21CM,大号外卖袋28*15*28CM,4号尺寸图,1号尺寸图,2号尺寸图,横版大号32x11x25CM,单杯纸袋12*10*22CM,横版加大号40*13*31CM,竖版大号26x12x31CM,嗨底捞同款12.5*7.5*15"
      },
      {
        "name": "颜色",
        "value": "粉色,黄色,酒红色,浅蓝色,深蓝色,黑色,浅绿色,橙色,墨绿色,动物园,恭喜发财,粉紫色,中国红,心想事成,玫红色,粉色爱心,五福临门,天空蓝,宝石蓝,来杯咖啡,动物派对,HAPPY兔,蛋糕兔,蓝色爱心,日进斗金,蓝色大理石,条纹熊,黄色爱心,hello熊,美味蛋糕屋,HAPPY花,一点心意,贩卖幸福,圣诞火车,财神驾到,粉色大理石,黑红爱心,向日葵女孩,万事如意,银灰手,圣诞粉色,大理石纹蓝,粉色-爱心,桃桃兔,黄牛本色,打包甜蜜,圣诞礼物堆,白牛白色,好运满满,梦幻圣诞树,红格面包,圣诞老人快乐,好运咖啡,NICE花,贩卖可爱,平安喜乐1,像蛋糕一样甜,搞钱要紧,拒绝焦虑,初雪圣诞,幸运郁金香,暴富-好运,蓝字礼物,喝杯拿铁,这家蛋糕真不错,冲鸭开心鸭,公主请发财,圣诞卡皮巴拉,平安喜乐白卡袋（厚款）,熊猫胖哒（立体耳朵）,可爱喵（立体耳朵）,可爱熊（立体耳朵）,好运花花来,姐妹你又瘦了,珍珠卡皮巴拉,发财-多亿,烟斗卡皮巴拉,白卡-五福临门,白卡-福气满满,平安喜乐-黄牛,前程似锦-黄牛,萌萌虎（立体耳朵）,感恩狐（立体耳朵）,毕业季白卡袋,圣诞Merry Christmas礼物,小狗旺财（立体耳朵）,北欧感圣诞"
      }
    ]
  },
  {
    "id": "1688-728032335540",
    "title": "5V2A澳规手机充电头适用安卓平果手机插头USB手机充电器批发厂家",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市捷通晶电科技有限公司\n\n是否支持快充: 否\n输出功率: 5W\n接口类型: USB\n品牌: 中性\n充电器适用形式: 直充\n充电协议: 其它\n是否原装: 是\n插头标准: 澳标\n产品认证: CE认证\n适用型号: 1A-澳规白色,1A-澳规黑色,2A-澳规白色,2A-澳规黑色\n电源端接口类型: USB-A\n是否数显: 否\n输出功电流总功率: 5W\n最大输出功率: 5W\n充电模式: 有线直充\n线材外层材质: ABS\n充电器适用形式2: 其他\n输出电流: 2000\n单口最大输出功率: 10\n兼容设备类型: 手机,手表\n插脚类型: 固定插脚\n颜色分类: 白色,黑色\n接口数量: 1\n\n1A-澳规白色: CNY 2.33, stock 985025\n1A-澳规黑色: CNY 2.33, stock 996394\n2A-澳规白色: CNY 3.28, stock 982859\n2A-澳规黑色: CNY 3.28, stock 985335\n\nSource: https://detail.1688.com/offer/728032335540.html",
    "price": 4.02,
    "compare_at_price": 0,
    "cost_per_item": 0.58,
    "stock": 10,
    "sales": 0,
    "published": false,
    "image": "assets/1688/728032335540/01.webp",
    "images": [
      "assets/1688/728032335540/01.webp",
      "assets/1688/728032335540/02.webp",
      "assets/1688/728032335540/03.webp",
      "assets/1688/728032335540/04.webp",
      "assets/1688/728032335540/05.webp",
      "assets/1688/728032335540/06.webp",
      "assets/1688/728032335540/07.webp",
      "assets/1688/728032335540/08.webp",
      "assets/1688/728032335540/09.webp",
      "assets/1688/728032335540/10.webp",
      "assets/1688/728032335540/11.webp",
      "assets/1688/728032335540/12.webp",
      "assets/1688/728032335540/13.webp"
    ],
    "vendor": "深圳市捷通晶电科技有限公司",
    "sku": "1688-728032335540",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/728032335540.html",
    "source_currency": "CNY",
    "source_price": 2.33,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qeLIO11iVUxuZNdw5_!!2209303874418-0-cib.jpg_sum.jpg",
        "name": "1A-澳规白色",
        "priceCny": 2.33,
        "stock": 985025
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01iGbtIq1iVUxuXbmFy_!!2209303874418-0-cib.jpg_sum.jpg",
        "name": "1A-澳规黑色",
        "priceCny": 2.33,
        "stock": 996394
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01rAQaN71iVUxuVeMXp_!!2209303874418-0-cib.jpg_sum.jpg",
        "name": "2A-澳规白色",
        "priceCny": 3.28,
        "stock": 982859
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01hKGDsA1iVUxuQCpsN_!!2209303874418-0-cib.jpg_sum.jpg",
        "name": "2A-澳规黑色",
        "priceCny": 3.28,
        "stock": 985335
      }
    ],
    "source_attributes": [
      {
        "name": "是否支持快充",
        "value": "否"
      },
      {
        "name": "输出功率",
        "value": "5W"
      },
      {
        "name": "接口类型",
        "value": "USB"
      },
      {
        "name": "品牌",
        "value": "中性"
      },
      {
        "name": "充电器适用形式",
        "value": "直充"
      },
      {
        "name": "充电协议",
        "value": "其它"
      },
      {
        "name": "是否原装",
        "value": "是"
      },
      {
        "name": "插头标准",
        "value": "澳标"
      },
      {
        "name": "产品认证",
        "value": "CE认证"
      },
      {
        "name": "适用型号",
        "value": "1A-澳规白色,1A-澳规黑色,2A-澳规白色,2A-澳规黑色"
      },
      {
        "name": "电源端接口类型",
        "value": "USB-A"
      },
      {
        "name": "是否数显",
        "value": "否"
      },
      {
        "name": "输出功电流总功率",
        "value": "5W"
      },
      {
        "name": "最大输出功率",
        "value": "5W"
      },
      {
        "name": "充电模式",
        "value": "有线直充"
      },
      {
        "name": "线材外层材质",
        "value": "ABS"
      },
      {
        "name": "充电器适用形式2",
        "value": "其他"
      },
      {
        "name": "输出电流",
        "value": "2000"
      },
      {
        "name": "单口最大输出功率",
        "value": "10"
      },
      {
        "name": "兼容设备类型",
        "value": "手机,手表"
      },
      {
        "name": "插脚类型",
        "value": "固定插脚"
      },
      {
        "name": "颜色分类",
        "value": "白色,黑色"
      },
      {
        "name": "接口数量",
        "value": "1"
      }
    ]
  },
  {
    "id": "1688-732430089963",
    "title": "卡通炫酷宇航员太空人公仔钥匙扣创意汽车配件可爱情侣包挂件礼品",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市润遇饰品有限公司\n\n材质: PVC\n钥匙配饰分类: 钥匙扣\n品牌: 润兴饰品\n风格: 卡通\n货号: 炫彩宇航员\n颜色: 炫彩宇航员-蓝色,炫彩宇航员-紫色,炫彩宇航员-黄色,炫彩宇航员-粉色,入油流沙宇航员-粉色,入油流沙宇航员-蓝色\n是否IP授权: 否\n是否属于礼品: 是，商务礼品\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师\n是否专利货源: 否\n适用节日: 通用,圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节\n送礼用途: 积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品\n适用送礼场合: 婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问\n\n炫彩宇航员-蓝色: CNY 2.19, stock 2074\n炫彩宇航员-紫色: CNY 2.19, stock 3121\n炫彩宇航员-黄色: CNY 2.19, stock 3235\n炫彩宇航员-粉色: CNY 2.19, stock 4136\n入油流沙宇航员-粉色: CNY 2.19, stock 8517\n\nSource: https://detail.1688.com/offer/732430089963.html",
    "price": 3.78,
    "compare_at_price": 0,
    "cost_per_item": 0.55,
    "stock": 12,
    "sales": 0,
    "published": false,
    "image": "assets/1688/732430089963/01.webp",
    "images": [
      "assets/1688/732430089963/01.webp",
      "assets/1688/732430089963/02.webp",
      "assets/1688/732430089963/03.webp",
      "assets/1688/732430089963/04.webp",
      "assets/1688/732430089963/05.webp",
      "assets/1688/732430089963/06.webp",
      "assets/1688/732430089963/07.webp",
      "assets/1688/732430089963/08.webp",
      "assets/1688/732430089963/09.webp",
      "assets/1688/732430089963/10.webp",
      "assets/1688/732430089963/11.webp",
      "assets/1688/732430089963/12.webp",
      "assets/1688/732430089963/13.webp",
      "assets/1688/732430089963/14.webp",
      "assets/1688/732430089963/15.webp",
      "assets/1688/732430089963/16.webp"
    ],
    "vendor": "义乌市润遇饰品有限公司",
    "sku": "1688-732430089963",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/732430089963.html",
    "source_currency": "CNY",
    "source_price": 2.19,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01DjljkI20h61ETINbO_!!2214149986880-0-cib.jpg_sum.jpg",
        "name": "炫彩宇航员-蓝色",
        "priceCny": 2.19,
        "stock": 2074
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN019A1hkI20h61A7Z4QR_!!2214149986880-0-cib.jpg_sum.jpg",
        "name": "炫彩宇航员-紫色",
        "priceCny": 2.19,
        "stock": 3121
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ohaitr20h61GbivTR_!!2214149986880-0-cib.jpg_sum.jpg",
        "name": "炫彩宇航员-黄色",
        "priceCny": 2.19,
        "stock": 3235
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01bA91V020h61EvPSoX_!!2214149986880-0-cib.jpg_sum.jpg",
        "name": "炫彩宇航员-粉色",
        "priceCny": 2.19,
        "stock": 4136
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01sjFfIj20h5yxwHLL7_!!2214149986880-0-cib.jpg_sum.jpg",
        "name": "入油流沙宇航员-粉色",
        "priceCny": 2.19,
        "stock": 8517
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣"
      },
      {
        "name": "品牌",
        "value": "润兴饰品"
      },
      {
        "name": "风格",
        "value": "卡通"
      },
      {
        "name": "货号",
        "value": "炫彩宇航员"
      },
      {
        "name": "颜色",
        "value": "炫彩宇航员-蓝色,炫彩宇航员-紫色,炫彩宇航员-黄色,炫彩宇航员-粉色,入油流沙宇航员-粉色,入油流沙宇航员-蓝色"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "是否属于礼品",
        "value": "是，商务礼品"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "通用,圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节"
      },
      {
        "name": "送礼用途",
        "value": "积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问"
      }
    ]
  },
  {
    "id": "1688-734227501524",
    "title": "跨境pu卡包定制轻薄款女高级感小卡包多卡位小巧皮革pu卡套定做",
    "category": "1688 Imports",
    "description": "Supplier: 苍南翔旺皮具有限公司\n\n材质: PU\n功能: 其它\n里料质地: PU\n钱夹折数: 3折\n风格: 无性别风\n品牌: 无\n货号: 1\n图案: 纯色\n适用性别: 中性/男女均可\n颜色: 红棕色,黑色,浅蓝,咖啡色,灰黑\n有可授权的自有品牌: 否\n上市年份季节: 2023年夏季\n适用场景: 日常搭配\n流行元素: 其他\n生产企业: 翔旺\n\n红棕色: CNY 2.68, stock 17\n黑色: CNY 2.68, stock 27\n浅蓝: CNY 2.68, stock 27\n咖啡色: CNY 2.68, stock 36\n灰黑: CNY 2.68, stock 45\n\nSource: https://detail.1688.com/offer/734227501524.html",
    "price": 4.62,
    "compare_at_price": 0,
    "cost_per_item": 0.67,
    "stock": 4,
    "sales": 0,
    "published": false,
    "image": "assets/1688/734227501524/01.webp",
    "images": [
      "assets/1688/734227501524/01.webp",
      "assets/1688/734227501524/02.webp",
      "assets/1688/734227501524/03.webp",
      "assets/1688/734227501524/04.webp",
      "assets/1688/734227501524/05.webp",
      "assets/1688/734227501524/06.webp",
      "assets/1688/734227501524/07.webp",
      "assets/1688/734227501524/08.webp",
      "assets/1688/734227501524/09.webp",
      "assets/1688/734227501524/10.webp",
      "assets/1688/734227501524/11.webp",
      "assets/1688/734227501524/12.webp",
      "assets/1688/734227501524/13.webp",
      "assets/1688/734227501524/14.webp",
      "assets/1688/734227501524/15.webp"
    ],
    "vendor": "苍南翔旺皮具有限公司",
    "sku": "1688-734227501524",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/734227501524.html",
    "source_currency": "CNY",
    "source_price": 2.68,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01aZMoCy1ND4pauKLtk_!!2216322321535-0-cib.jpg_sum.jpg",
        "name": "红棕色",
        "priceCny": 2.68,
        "stock": 17
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ZTVGsp1ND4pXc9TY5_!!2216322321535-0-cib.jpg_sum.jpg",
        "name": "黑色",
        "priceCny": 2.68,
        "stock": 27
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN011sLatw1ND4pauNdkf_!!2216322321535-0-cib.jpg_sum.jpg",
        "name": "浅蓝",
        "priceCny": 2.68,
        "stock": 27
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN018X2TmG1ND4pec0Vqm_!!2216322321535-0-cib.jpg_sum.jpg",
        "name": "咖啡色",
        "priceCny": 2.68,
        "stock": 36
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01mHICUi1ND4pec4L56_!!2216322321535-0-cib.jpg_sum.jpg",
        "name": "灰黑",
        "priceCny": 2.68,
        "stock": 45
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PU"
      },
      {
        "name": "功能",
        "value": "其它"
      },
      {
        "name": "里料质地",
        "value": "PU"
      },
      {
        "name": "钱夹折数",
        "value": "3折"
      },
      {
        "name": "风格",
        "value": "无性别风"
      },
      {
        "name": "品牌",
        "value": "无"
      },
      {
        "name": "货号",
        "value": "1"
      },
      {
        "name": "图案",
        "value": "纯色"
      },
      {
        "name": "适用性别",
        "value": "中性/男女均可"
      },
      {
        "name": "颜色",
        "value": "红棕色,黑色,浅蓝,咖啡色,灰黑"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "上市年份季节",
        "value": "2023年夏季"
      },
      {
        "name": "适用场景",
        "value": "日常搭配"
      },
      {
        "name": "流行元素",
        "value": "其他"
      },
      {
        "name": "生产企业",
        "value": "翔旺"
      }
    ]
  },
  {
    "id": "1688-737572590798",
    "title": "适用三星S26手机壳磁吸S24ultra小羊皮纹S23+全包S22U保护套S25软",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市金鸿顺通数码有限公司\n\n材质: 仿皮\n工艺: 组装\n款式: 保护壳\n品牌: Aibairuixin\n功能: 防震,散热,磁吸,防磨,防摔,抗指纹\n适用机型: 三星\n流行元素: 纹理,气囊,磁吸\n颜色: 黑色,蓝色,咖啡色,橙色,砖红色\n适用型号: Samsung s26,Samsung S26 Plus,Samsung s26 Ultra,Samsung S25 FE,Samsung S25 Edge,Samsung S25,Samsung S25 Plus/ S25+,Samsung s25 Ultra,Samsung S24 FE,Samsung S24,Samsung S24plus,Samsung s24 Ultra,Samsung S23,Samsung S23 Ultra,Samsung S23 Plus,Samsung S23 FE,Samsung S22,Samsung S22 Plus,Samsung S22 Ultra,Samsung S21,Samsung S21 Plus,Samsung S21 Ultra,Samsung S21 FE,Samsung Note 20,Samsung Note20 Ultra\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他\n是否跨境出口专供货源: 是\n支持订制: 支持\n是否专利货源: 否\n风格: 日韩,商务,时尚,奢华,欧美风,韩式风,日式风,简约风,北欧风,南美风,简洁大方风\n颜色分类: 红色,蓝色,黑色,橙色,咖啡色\n\nSamsung s26: CNY 5.63, stock 8560\nSamsung S26 Plus: CNY 5.63, stock 9920\nSamsung s26 Ultra: CNY 5.63, stock 9719\nSamsung S25 FE: CNY 5.63, stock 9927\nSamsung S25 Edge: CNY 5.63, stock 9971\nSamsung S25: CNY 5.63, stock 9922\nSamsung S25 Plus/ S25+: CNY 5.63, stock 9957\nSamsung s25 Ultra: CNY 5.63, stock 9641\nSamsung S24 FE: CNY 5.63, stock 9969\nSamsung S24: CNY 5.63, stock 9945\nSamsung S24plus: CNY 5.63, stock 9962\nSamsung s24 Ultra: CNY 5.63, stock 9858\nSamsung S23: CNY 5.63, stock 9935\nSamsung S23 Ultra: CNY 5.63, stock 9889\nSamsung S23 Plus: CNY 5.63, stock 9965\nSamsung S23 FE: CNY 5.63, stock 9976\nSamsung S22: CNY 5.63, stock 9988\nSamsung S22 Plus: CNY 5.63, stock 9994\nSamsung S22 Ultra: CNY 5.63, stock 9920\nSamsung S21: CNY 5.63, stock 9977\nSamsung S21 Plus: CNY 5.63, stock 9986\nSamsung S21 Ultra: CNY 5.63, stock 9973\nSamsung S21 FE: CNY 5.63, stock 9977\nSamsung Note 20: CNY 5.63, stock 9997\nSamsung Note20 Ultra: CNY 5.63, stock 9991\n\nSource: https://detail.1688.com/offer/737572590798.html",
    "price": 9.71,
    "compare_at_price": 0,
    "cost_per_item": 1.41,
    "stock": 16,
    "sales": 0,
    "published": false,
    "image": "assets/1688/737572590798/01.webp",
    "images": [
      "assets/1688/737572590798/01.webp",
      "assets/1688/737572590798/02.webp",
      "assets/1688/737572590798/03.webp",
      "assets/1688/737572590798/04.webp",
      "assets/1688/737572590798/05.webp",
      "assets/1688/737572590798/06.webp",
      "assets/1688/737572590798/07.webp",
      "assets/1688/737572590798/08.webp",
      "assets/1688/737572590798/09.webp",
      "assets/1688/737572590798/10.webp"
    ],
    "vendor": "深圳市金鸿顺通数码有限公司",
    "sku": "1688-737572590798",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/737572590798.html",
    "source_currency": "CNY",
    "source_price": 5.63,
    "source_variants": [
      {
        "image": "",
        "name": "Samsung s26",
        "priceCny": 5.63,
        "stock": 8560
      },
      {
        "image": "",
        "name": "Samsung S26 Plus",
        "priceCny": 5.63,
        "stock": 9920
      },
      {
        "image": "",
        "name": "Samsung s26 Ultra",
        "priceCny": 5.63,
        "stock": 9719
      },
      {
        "image": "",
        "name": "Samsung S25 FE",
        "priceCny": 5.63,
        "stock": 9927
      },
      {
        "image": "",
        "name": "Samsung S25 Edge",
        "priceCny": 5.63,
        "stock": 9971
      },
      {
        "image": "",
        "name": "Samsung S25",
        "priceCny": 5.63,
        "stock": 9922
      },
      {
        "image": "",
        "name": "Samsung S25 Plus/ S25+",
        "priceCny": 5.63,
        "stock": 9957
      },
      {
        "image": "",
        "name": "Samsung s25 Ultra",
        "priceCny": 5.63,
        "stock": 9641
      },
      {
        "image": "",
        "name": "Samsung S24 FE",
        "priceCny": 5.63,
        "stock": 9969
      },
      {
        "image": "",
        "name": "Samsung S24",
        "priceCny": 5.63,
        "stock": 9945
      },
      {
        "image": "",
        "name": "Samsung S24plus",
        "priceCny": 5.63,
        "stock": 9962
      },
      {
        "image": "",
        "name": "Samsung s24 Ultra",
        "priceCny": 5.63,
        "stock": 9858
      },
      {
        "image": "",
        "name": "Samsung S23",
        "priceCny": 5.63,
        "stock": 9935
      },
      {
        "image": "",
        "name": "Samsung S23 Ultra",
        "priceCny": 5.63,
        "stock": 9889
      },
      {
        "image": "",
        "name": "Samsung S23 Plus",
        "priceCny": 5.63,
        "stock": 9965
      },
      {
        "image": "",
        "name": "Samsung S23 FE",
        "priceCny": 5.63,
        "stock": 9976
      },
      {
        "image": "",
        "name": "Samsung S22",
        "priceCny": 5.63,
        "stock": 9988
      },
      {
        "image": "",
        "name": "Samsung S22 Plus",
        "priceCny": 5.63,
        "stock": 9994
      },
      {
        "image": "",
        "name": "Samsung S22 Ultra",
        "priceCny": 5.63,
        "stock": 9920
      },
      {
        "image": "",
        "name": "Samsung S21",
        "priceCny": 5.63,
        "stock": 9977
      },
      {
        "image": "",
        "name": "Samsung S21 Plus",
        "priceCny": 5.63,
        "stock": 9986
      },
      {
        "image": "",
        "name": "Samsung S21 Ultra",
        "priceCny": 5.63,
        "stock": 9973
      },
      {
        "image": "",
        "name": "Samsung S21 FE",
        "priceCny": 5.63,
        "stock": 9977
      },
      {
        "image": "",
        "name": "Samsung Note 20",
        "priceCny": 5.63,
        "stock": 9997
      },
      {
        "image": "",
        "name": "Samsung Note20 Ultra",
        "priceCny": 5.63,
        "stock": 9991
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "仿皮"
      },
      {
        "name": "工艺",
        "value": "组装"
      },
      {
        "name": "款式",
        "value": "保护壳"
      },
      {
        "name": "品牌",
        "value": "Aibairuixin"
      },
      {
        "name": "功能",
        "value": "防震,散热,磁吸,防磨,防摔,抗指纹"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "流行元素",
        "value": "纹理,气囊,磁吸"
      },
      {
        "name": "颜色",
        "value": "黑色,蓝色,咖啡色,橙色,砖红色"
      },
      {
        "name": "适用型号",
        "value": "Samsung s26,Samsung S26 Plus,Samsung s26 Ultra,Samsung S25 FE,Samsung S25 Edge,Samsung S25,Samsung S25 Plus/ S25+,Samsung s25 Ultra,Samsung S24 FE,Samsung S24,Samsung S24plus,Samsung s24 Ultra,Samsung S23,Samsung S23 Ultra,Samsung S23 Plus,Samsung S23 FE,Samsung S22,Samsung S22 Plus,Samsung S22 Ultra,Samsung S21,Samsung S21 Plus,Samsung S21 Ultra,Samsung S21 FE,Samsung Note 20,Samsung Note20 Ultra"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "支持订制",
        "value": "支持"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "风格",
        "value": "日韩,商务,时尚,奢华,欧美风,韩式风,日式风,简约风,北欧风,南美风,简洁大方风"
      },
      {
        "name": "颜色分类",
        "value": "红色,蓝色,黑色,橙色,咖啡色"
      }
    ]
  },
  {
    "id": "1688-787226793408",
    "title": "卡包男士驾驶证证件包钱包大容量银行卡身份证套多卡位驾照零钱包",
    "category": "1688 Imports",
    "description": "Supplier: 潮州市潮安区浮洋镇爵兴家居贸易商行\n\n材质: PVC\n功能: 防水\n里料质地: 涤纶\n风格: 商务通勤\n品牌: 其他\n货号: S6235\n图案: 条纹\n适用性别: 中性/男女均可\n颜色: 啡色【9卡位+2证件位】,啡色【18卡位+2证件位】\n有可授权的自有品牌: 否\n上市年份季节: 2023年夏季\n适用场景: 家用收纳\n流行元素: 车缝线\n\n啡色【9卡位+2证件位】: CNY 4.66, stock 996\n啡色【18卡位+2证件位】: CNY 5.99, stock 992\n\nSource: https://detail.1688.com/offer/787226793408.html",
    "price": 8.04,
    "compare_at_price": 0,
    "cost_per_item": 1.17,
    "stock": 4,
    "sales": 0,
    "published": false,
    "image": "assets/1688/787226793408/01.webp",
    "images": [
      "assets/1688/787226793408/01.webp",
      "assets/1688/787226793408/02.webp",
      "assets/1688/787226793408/03.webp",
      "assets/1688/787226793408/04.webp",
      "assets/1688/787226793408/05.webp",
      "assets/1688/787226793408/06.webp",
      "assets/1688/787226793408/07.webp",
      "assets/1688/787226793408/08.webp",
      "assets/1688/787226793408/09.webp"
    ],
    "vendor": "潮州市潮安区浮洋镇爵兴家居贸易商行",
    "sku": "1688-787226793408",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/787226793408.html",
    "source_currency": "CNY",
    "source_price": 4.66,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01JyDSPI1zErrISMW1r_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "啡色【9卡位+2证件位】",
        "priceCny": 4.66,
        "stock": 996
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01vZWLhj1zErrKKCtxC_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "啡色【18卡位+2证件位】",
        "priceCny": 5.99,
        "stock": 992
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "功能",
        "value": "防水"
      },
      {
        "name": "里料质地",
        "value": "涤纶"
      },
      {
        "name": "风格",
        "value": "商务通勤"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "货号",
        "value": "S6235"
      },
      {
        "name": "图案",
        "value": "条纹"
      },
      {
        "name": "适用性别",
        "value": "中性/男女均可"
      },
      {
        "name": "颜色",
        "value": "啡色【9卡位+2证件位】,啡色【18卡位+2证件位】"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "上市年份季节",
        "value": "2023年夏季"
      },
      {
        "name": "适用场景",
        "value": "家用收纳"
      },
      {
        "name": "流行元素",
        "value": "车缝线"
      }
    ]
  },
  {
    "id": "1688-800248492172",
    "title": "苹果18手机壳iphone17透明软壳15四角防摔超薄16pro14太空保护套",
    "category": "1688 Imports",
    "description": "Supplier: 惠州市兴创源科技有限公司\n\n材质: tpu\n功能: 散热,防摔\n款式: 透明\n品牌: UQ\n工艺: 热压\n流行元素: 立体\n风格: 简约\n颜色: 透明壳【精孔全包】超薄透亮,【加厚气囊】十米防摔,【太空壳】透明,透明壳【精孔全包】超薄透亮（盒装）,【太空壳】透明(盒装）\n适用型号: iphone18 pro,iphone18 promax,iphone17,iphone17 pro,iphone17promax,iphone17 Air,iphone16 【6.1寸】,iphone16pro 【6.3寸】,iphone16promax 【6.9寸】,iphone16plus【 6.7寸】,16E【6.1寸】,iphone15 【6.1寸】,iphone15pro 【6.1寸】,iphone15promax 【6.7寸】,iphone15plus【 6.7寸】,iphone14 【6.1寸】,iphone14pro 【6.1寸】,iphone14promax【 6.7寸】,iphone14plus 【6.7寸】,iphone13 mini 【5.4寸】,iphone13 【6.1寸】,iphone13 pro【 6.1寸】,iphone13 pro max 【 6.7寸】,iphone12 Mini 5.4,iphone12 【6.1寸】,iphone12 pro 【6.1寸】,iphone12 pro max【 6.7寸】,iphone11 【6.1寸】,iphone11Pro 【6.1寸】,iphone11Promax 【6.5寸】,iphoneX/XS 【5.8寸】,iphoneXR 【6.1寸】,iphoneXSMAX 【6.5寸】,iphone7/8/SE2 【4.7寸】,iphone7/8PLUS 【5.5寸】,iphone6/6S 【4.7寸】,iphone6P/6SP 【4.7寸】\n支持订制: 支持\n适用机型: iPhone14,iPhone 6s,iPhone Xs,iPhone 6 Plus,iPhone 6s Plus,iPhone Xr,iPhone 7 Plus,iPhone 8 Plus,iPhone Xs Max,iPhone 13,iPhone 11 Pro,iPhone 11 Pro Max,iPhone 12 Pro,iPhone 12 Pro Max,iPhone 12 mini,iPhone13 Pro Max,iPhone13 Pro,iPhone14 Pro,iPhone14 Pro Max,iPhone14 Max\n颜色分类: 透明\n\niphone18 pro: CNY 0.83, stock 99947\niphone18 promax: CNY 0.83, stock 99949\niphone17: CNY 0.83, stock 88840\niphone17 pro: CNY 0.83, stock 90446\niphone17promax: CNY 0.83, stock 78080\niphone17 Air: CNY 0.83, stock 99024\niphone16 【6.1寸】: CNY 0.83, stock 95821\niphone16pro 【6.3寸】: CNY 0.83, stock 990161\niphone16promax 【6.9寸】: CNY 0.83, stock 71520\niphone16plus【 6.7寸】: CNY 0.83, stock 97671\n16E【6.1寸】: CNY 0.83, stock 98515\niphone15 【6.1寸】: CNY 0.83, stock 91050\niphone15pro 【6.1寸】: CNY 0.83, stock 90410\niphone15promax 【6.7寸】: CNY 0.83, stock 73888\niphone15plus【 6.7寸】: CNY 0.83, stock 93435\niphone14 【6.1寸】: CNY 0.83, stock 93144\niphone14pro 【6.1寸】: CNY 0.83, stock 86449\niphone14promax【 6.7寸】: CNY 0.83, stock 60205\niphone14plus 【6.7寸】: CNY 0.83, stock 94808\niphone13 mini 【5.4寸】: CNY 0.83, stock 98040\niphone13 【6.1寸】: CNY 0.83, stock 82481\niphone13 pro【 6.1寸】: CNY 0.83, stock 93432\niphone13 pro max 【 6.7寸】: CNY 0.83, stock 83939\niphone12 Mini 5.4: CNY 0.83, stock 97368\niphone12 【6.1寸】: CNY 0.83, stock 89689\niphone12 pro 【6.1寸】: CNY 0.83, stock 90136\niphone12 pro max【 6.7寸】: CNY 0.83, stock 43888\niphone11 【6.1寸】: CNY 0.83, stock 84257\niphone11Pro 【6.1寸】: CNY 0.83, stock 95477\niphone11Promax 【6.5寸】: CNY 0.83, stock 85354\niphoneX/XS 【5.8寸】: CNY 0.83, stock 97380\niphoneXR 【6.1寸】: CNY 0.83, stock 98705\niphoneXSMAX 【6.5寸】: CNY 0.83, stock 99351\niphone7/8/SE2 【4.7寸】: CNY 0.83, stock 96923\niphone7/8PLUS 【5.5寸】: CNY 0.83, stock 97794\niphone6/6S 【4.7寸】: CNY 0.83, stock 98239\niphone6P/6SP 【4.7寸】: CNY 0.83, stock 98144\n\nSource: https://detail.1688.com/offer/800248492172.html",
    "price": 1.43,
    "compare_at_price": 0,
    "cost_per_item": 0.21,
    "stock": 62,
    "sales": 0,
    "published": false,
    "image": "assets/1688/800248492172/01.webp",
    "images": [
      "assets/1688/800248492172/01.webp",
      "assets/1688/800248492172/02.webp",
      "assets/1688/800248492172/03.webp",
      "assets/1688/800248492172/04.webp",
      "assets/1688/800248492172/05.webp",
      "assets/1688/800248492172/06.webp",
      "assets/1688/800248492172/07.webp",
      "assets/1688/800248492172/08.webp",
      "assets/1688/800248492172/09.webp",
      "assets/1688/800248492172/10.webp"
    ],
    "vendor": "惠州市兴创源科技有限公司",
    "sku": "1688-800248492172",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/800248492172.html",
    "source_currency": "CNY",
    "source_price": 0.83,
    "source_variants": [
      {
        "image": "",
        "name": "iphone18 pro",
        "priceCny": 0.83,
        "stock": 99947
      },
      {
        "image": "",
        "name": "iphone18 promax",
        "priceCny": 0.83,
        "stock": 99949
      },
      {
        "image": "",
        "name": "iphone17",
        "priceCny": 0.83,
        "stock": 88840
      },
      {
        "image": "",
        "name": "iphone17 pro",
        "priceCny": 0.83,
        "stock": 90446
      },
      {
        "image": "",
        "name": "iphone17promax",
        "priceCny": 0.83,
        "stock": 78080
      },
      {
        "image": "",
        "name": "iphone17 Air",
        "priceCny": 0.83,
        "stock": 99024
      },
      {
        "image": "",
        "name": "iphone16 【6.1寸】",
        "priceCny": 0.83,
        "stock": 95821
      },
      {
        "image": "",
        "name": "iphone16pro 【6.3寸】",
        "priceCny": 0.83,
        "stock": 990161
      },
      {
        "image": "",
        "name": "iphone16promax 【6.9寸】",
        "priceCny": 0.83,
        "stock": 71520
      },
      {
        "image": "",
        "name": "iphone16plus【 6.7寸】",
        "priceCny": 0.83,
        "stock": 97671
      },
      {
        "image": "",
        "name": "16E【6.1寸】",
        "priceCny": 0.83,
        "stock": 98515
      },
      {
        "image": "",
        "name": "iphone15 【6.1寸】",
        "priceCny": 0.83,
        "stock": 91050
      },
      {
        "image": "",
        "name": "iphone15pro 【6.1寸】",
        "priceCny": 0.83,
        "stock": 90410
      },
      {
        "image": "",
        "name": "iphone15promax 【6.7寸】",
        "priceCny": 0.83,
        "stock": 73888
      },
      {
        "image": "",
        "name": "iphone15plus【 6.7寸】",
        "priceCny": 0.83,
        "stock": 93435
      },
      {
        "image": "",
        "name": "iphone14 【6.1寸】",
        "priceCny": 0.83,
        "stock": 93144
      },
      {
        "image": "",
        "name": "iphone14pro 【6.1寸】",
        "priceCny": 0.83,
        "stock": 86449
      },
      {
        "image": "",
        "name": "iphone14promax【 6.7寸】",
        "priceCny": 0.83,
        "stock": 60205
      },
      {
        "image": "",
        "name": "iphone14plus 【6.7寸】",
        "priceCny": 0.83,
        "stock": 94808
      },
      {
        "image": "",
        "name": "iphone13 mini 【5.4寸】",
        "priceCny": 0.83,
        "stock": 98040
      },
      {
        "image": "",
        "name": "iphone13 【6.1寸】",
        "priceCny": 0.83,
        "stock": 82481
      },
      {
        "image": "",
        "name": "iphone13 pro【 6.1寸】",
        "priceCny": 0.83,
        "stock": 93432
      },
      {
        "image": "",
        "name": "iphone13 pro max 【 6.7寸】",
        "priceCny": 0.83,
        "stock": 83939
      },
      {
        "image": "",
        "name": "iphone12 Mini 5.4",
        "priceCny": 0.83,
        "stock": 97368
      },
      {
        "image": "",
        "name": "iphone12 【6.1寸】",
        "priceCny": 0.83,
        "stock": 89689
      },
      {
        "image": "",
        "name": "iphone12 pro 【6.1寸】",
        "priceCny": 0.83,
        "stock": 90136
      },
      {
        "image": "",
        "name": "iphone12 pro max【 6.7寸】",
        "priceCny": 0.83,
        "stock": 43888
      },
      {
        "image": "",
        "name": "iphone11 【6.1寸】",
        "priceCny": 0.83,
        "stock": 84257
      },
      {
        "image": "",
        "name": "iphone11Pro 【6.1寸】",
        "priceCny": 0.83,
        "stock": 95477
      },
      {
        "image": "",
        "name": "iphone11Promax 【6.5寸】",
        "priceCny": 0.83,
        "stock": 85354
      },
      {
        "image": "",
        "name": "iphoneX/XS 【5.8寸】",
        "priceCny": 0.83,
        "stock": 97380
      },
      {
        "image": "",
        "name": "iphoneXR 【6.1寸】",
        "priceCny": 0.83,
        "stock": 98705
      },
      {
        "image": "",
        "name": "iphoneXSMAX 【6.5寸】",
        "priceCny": 0.83,
        "stock": 99351
      },
      {
        "image": "",
        "name": "iphone7/8/SE2 【4.7寸】",
        "priceCny": 0.83,
        "stock": 96923
      },
      {
        "image": "",
        "name": "iphone7/8PLUS 【5.5寸】",
        "priceCny": 0.83,
        "stock": 97794
      },
      {
        "image": "",
        "name": "iphone6/6S 【4.7寸】",
        "priceCny": 0.83,
        "stock": 98239
      },
      {
        "image": "",
        "name": "iphone6P/6SP 【4.7寸】",
        "priceCny": 0.83,
        "stock": 98144
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "tpu"
      },
      {
        "name": "功能",
        "value": "散热,防摔"
      },
      {
        "name": "款式",
        "value": "透明"
      },
      {
        "name": "品牌",
        "value": "UQ"
      },
      {
        "name": "工艺",
        "value": "热压"
      },
      {
        "name": "流行元素",
        "value": "立体"
      },
      {
        "name": "风格",
        "value": "简约"
      },
      {
        "name": "颜色",
        "value": "透明壳【精孔全包】超薄透亮,【加厚气囊】十米防摔,【太空壳】透明,透明壳【精孔全包】超薄透亮（盒装）,【太空壳】透明(盒装）"
      },
      {
        "name": "适用型号",
        "value": "iphone18 pro,iphone18 promax,iphone17,iphone17 pro,iphone17promax,iphone17 Air,iphone16 【6.1寸】,iphone16pro 【6.3寸】,iphone16promax 【6.9寸】,iphone16plus【 6.7寸】,16E【6.1寸】,iphone15 【6.1寸】,iphone15pro 【6.1寸】,iphone15promax 【6.7寸】,iphone15plus【 6.7寸】,iphone14 【6.1寸】,iphone14pro 【6.1寸】,iphone14promax【 6.7寸】,iphone14plus 【6.7寸】,iphone13 mini 【5.4寸】,iphone13 【6.1寸】,iphone13 pro【 6.1寸】,iphone13 pro max 【 6.7寸】,iphone12 Mini 5.4,iphone12 【6.1寸】,iphone12 pro 【6.1寸】,iphone12 pro max【 6.7寸】,iphone11 【6.1寸】,iphone11Pro 【6.1寸】,iphone11Promax 【6.5寸】,iphoneX/XS 【5.8寸】,iphoneXR 【6.1寸】,iphoneXSMAX 【6.5寸】,iphone7/8/SE2 【4.7寸】,iphone7/8PLUS 【5.5寸】,iphone6/6S 【4.7寸】,iphone6P/6SP 【4.7寸】"
      },
      {
        "name": "支持订制",
        "value": "支持"
      },
      {
        "name": "适用机型",
        "value": "iPhone14,iPhone 6s,iPhone Xs,iPhone 6 Plus,iPhone 6s Plus,iPhone Xr,iPhone 7 Plus,iPhone 8 Plus,iPhone Xs Max,iPhone 13,iPhone 11 Pro,iPhone 11 Pro Max,iPhone 12 Pro,iPhone 12 Pro Max,iPhone 12 mini,iPhone13 Pro Max,iPhone13 Pro,iPhone14 Pro,iPhone14 Pro Max,iPhone14 Max"
      },
      {
        "name": "颜色分类",
        "value": "透明"
      }
    ]
  },
  {
    "id": "1688-808463212184",
    "title": "120w充电器线编织数据线三合一tpyec超级快充车载一拖三华为通用",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市龙岗区铎越电子商行\n\n材质: 尼龙\n接口: Micro USB,TYPE-C\n分线接头数量: 一拖三\n品牌: DY\n最大输出功率: 60\n特性: 快充\n长度: 1m(不含)~2m(含)\n型号: 一拖三数据线 【1.2米】裸线,一拖三数据线 【1.2米】袋装,一拖三数据线 【1.2米】盒装\n颜色: 黑色\n颜色分类: 黑色\n\n黑色: CNY 2.80, stock 250961\n\nSource: https://detail.1688.com/offer/808463212184.html",
    "price": 4.83,
    "compare_at_price": 0,
    "cost_per_item": 0.7,
    "stock": 10,
    "sales": 0,
    "published": false,
    "image": "assets/1688/808463212184/01.webp",
    "images": [
      "assets/1688/808463212184/01.webp",
      "assets/1688/808463212184/02.webp",
      "assets/1688/808463212184/03.webp",
      "assets/1688/808463212184/04.webp",
      "assets/1688/808463212184/05.webp"
    ],
    "vendor": "深圳市龙岗区铎越电子商行",
    "sku": "1688-808463212184",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/808463212184.html",
    "source_currency": "CNY",
    "source_price": 2.8,
    "source_variants": [
      {
        "image": "",
        "name": "黑色",
        "priceCny": 2.8,
        "stock": 250961
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "尼龙"
      },
      {
        "name": "接口",
        "value": "Micro USB,TYPE-C"
      },
      {
        "name": "分线接头数量",
        "value": "一拖三"
      },
      {
        "name": "品牌",
        "value": "DY"
      },
      {
        "name": "最大输出功率",
        "value": "60"
      },
      {
        "name": "特性",
        "value": "快充"
      },
      {
        "name": "长度",
        "value": "1m(不含)~2m(含)"
      },
      {
        "name": "型号",
        "value": "一拖三数据线 【1.2米】裸线,一拖三数据线 【1.2米】袋装,一拖三数据线 【1.2米】盒装"
      },
      {
        "name": "颜色",
        "value": "黑色"
      },
      {
        "name": "颜色分类",
        "value": "黑色"
      }
    ]
  },
  {
    "id": "1688-811611699488",
    "title": "厂家现货无尘清洁贴膜手机超细纤维无尘布跨境家用3009擦拭布",
    "category": "1688 Imports",
    "description": "Supplier: 东莞市鑫力达防静电制品有限公司\n\n产地: 东莞\n是否进口: 否\n订货号: XLD-0704\n品牌: 鑫力达\n货号: XLD-0704\n型号: XLD-0704\n每盒（卷）数量: 100（张）\n单张尺寸: 4寸6寸9寸\n层数: 单层\n包装规格: 4寸6寸9寸\n类型: 擦拭布\n主要功能: 表面处理、手机维修\n产品认证: SGS\n材质: 聚酯纤维\n适用范围: 表面处理、手机维修、电子厂\n加工定制: 是\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他\n有可授权的自有品牌: 是\n是否跨境出口专供货源: 是\n尺寸规格: 4*4(10x10cm) 50片/包,4寸（10*10cm）400片/包,6英寸（15*15cm）100片/包,9寸/（21*21cm）100片/包\n产品型号: 3009\n超细无尘布: 无尘擦拭布\n无尘布工业擦拭布: 超细纤维无尘布\n防静电无尘布: 工业无尘布\n\n3009: CNY 1.89, stock 19761\n\nSource: https://detail.1688.com/offer/811611699488.html",
    "price": 3.26,
    "compare_at_price": 0,
    "cost_per_item": 0.47,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/811611699488/01.webp",
    "images": [
      "assets/1688/811611699488/01.webp",
      "assets/1688/811611699488/02.webp",
      "assets/1688/811611699488/03.webp",
      "assets/1688/811611699488/04.webp",
      "assets/1688/811611699488/05.webp",
      "assets/1688/811611699488/06.webp"
    ],
    "vendor": "东莞市鑫力达防静电制品有限公司",
    "sku": "1688-811611699488",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/811611699488.html",
    "source_currency": "CNY",
    "source_price": 1.89,
    "source_variants": [
      {
        "image": "",
        "name": "3009",
        "priceCny": 1.89,
        "stock": 19761
      }
    ],
    "source_attributes": [
      {
        "name": "产地",
        "value": "东莞"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "订货号",
        "value": "XLD-0704"
      },
      {
        "name": "品牌",
        "value": "鑫力达"
      },
      {
        "name": "货号",
        "value": "XLD-0704"
      },
      {
        "name": "型号",
        "value": "XLD-0704"
      },
      {
        "name": "每盒（卷）数量",
        "value": "100（张）"
      },
      {
        "name": "单张尺寸",
        "value": "4寸6寸9寸"
      },
      {
        "name": "层数",
        "value": "单层"
      },
      {
        "name": "包装规格",
        "value": "4寸6寸9寸"
      },
      {
        "name": "类型",
        "value": "擦拭布"
      },
      {
        "name": "主要功能",
        "value": "表面处理、手机维修"
      },
      {
        "name": "产品认证",
        "value": "SGS"
      },
      {
        "name": "材质",
        "value": "聚酯纤维"
      },
      {
        "name": "适用范围",
        "value": "表面处理、手机维修、电子厂"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东,其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "是"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "尺寸规格",
        "value": "4*4(10x10cm) 50片/包,4寸（10*10cm）400片/包,6英寸（15*15cm）100片/包,9寸/（21*21cm）100片/包"
      },
      {
        "name": "产品型号",
        "value": "3009"
      },
      {
        "name": "超细无尘布",
        "value": "无尘擦拭布"
      },
      {
        "name": "无尘布工业擦拭布",
        "value": "超细纤维无尘布"
      },
      {
        "name": "防静电无尘布",
        "value": "工业无尘布"
      }
    ]
  },
  {
    "id": "1688-812391615843",
    "title": "适用三星A06手机钢化膜Galaxy屏幕高清防窥保护膜增透钢化玻璃膜",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市凡敏科技有限公司\n\n材质: 钢化玻璃\n适用机型: 三星\n贴膜类型: 前膜\n贴膜特点: 高清,防尘,全屏,防偷窥\n品牌: 其他\n颜色: 全透明钢化膜,全胶丝印钢化膜,高清防窥钢化膜\n尺寸: Samsung Galaxy A06\n\nSamsung Galaxy A06: CNY 3.80, stock 9989\n\nSource: https://detail.1688.com/offer/812391615843.html",
    "price": 6.55,
    "compare_at_price": 0,
    "cost_per_item": 0.95,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/812391615843/01.webp",
    "images": [
      "assets/1688/812391615843/01.webp",
      "assets/1688/812391615843/02.webp",
      "assets/1688/812391615843/03.webp",
      "assets/1688/812391615843/04.webp",
      "assets/1688/812391615843/05.webp"
    ],
    "vendor": "深圳市凡敏科技有限公司",
    "sku": "1688-812391615843",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/812391615843.html",
    "source_currency": "CNY",
    "source_price": 3.8,
    "source_variants": [
      {
        "image": "",
        "name": "Samsung Galaxy A06",
        "priceCny": 3.8,
        "stock": 9989
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "钢化玻璃"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "高清,防尘,全屏,防偷窥"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "颜色",
        "value": "全透明钢化膜,全胶丝印钢化膜,高清防窥钢化膜"
      },
      {
        "name": "尺寸",
        "value": "Samsung Galaxy A06"
      }
    ]
  },
  {
    "id": "1688-818448440344",
    "title": "1688PLUS会员年卡",
    "category": "1688 Imports",
    "description": "Supplier: 阿里巴巴(中国)网络技术有限公司\n\n商品类型: 1688会员服务\n详情状态: 原商品链接跳转到1688会员页面\n\n1688PLUS会员年卡: CNY 99.00, stock 1\n\nSource: https://detail.1688.com/offer/818448440344.html",
    "price": 170.77,
    "compare_at_price": 0,
    "cost_per_item": 24.75,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/818448440344/01.webp",
    "images": [
      "assets/1688/818448440344/01.webp"
    ],
    "vendor": "阿里巴巴(中国)网络技术有限公司",
    "sku": "1688-818448440344",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/818448440344.html",
    "source_currency": "CNY",
    "source_price": 99,
    "source_variants": [
      {
        "name": "1688PLUS会员年卡",
        "priceCny": 99,
        "stock": 1,
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01YBjprG1YZUGAKJNVh_!!6000000003073-0-cib.jpg_160x160.jpg_.webp"
      }
    ],
    "source_attributes": [
      {
        "name": "商品类型",
        "value": "1688会员服务"
      },
      {
        "name": "详情状态",
        "value": "原商品链接跳转到1688会员页面"
      }
    ]
  },
  {
    "id": "1688-819897979933",
    "title": "曲面屏UV胶水手机钢化膜贴膜uv胶水凝固气味液态贴膜工具胶水通用",
    "category": "1688 Imports",
    "description": "Supplier: 广州优哈创电子商务有限公司\n\n材质: UV\n适用机型: 曲面屏手机\n贴膜类型: 曲面膜\n贴膜特点: 自动修复\n品牌: 无\n颜色: 曲面屏UV胶水黄盖\n\n曲面屏UV胶水黄盖: CNY 0.57, stock 9675\n\nSource: https://detail.1688.com/offer/819897979933.html",
    "price": 0.98,
    "compare_at_price": 0,
    "cost_per_item": 0.14,
    "stock": 20,
    "sales": 0,
    "published": false,
    "image": "assets/1688/819897979933/01.webp",
    "images": [
      "assets/1688/819897979933/01.webp",
      "assets/1688/819897979933/02.webp"
    ],
    "vendor": "广州优哈创电子商务有限公司",
    "sku": "1688-819897979933",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/819897979933.html",
    "source_currency": "CNY",
    "source_price": 0.57,
    "source_variants": [
      {
        "image": "",
        "name": "曲面屏UV胶水黄盖",
        "priceCny": 0.57,
        "stock": 9675
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "UV"
      },
      {
        "name": "适用机型",
        "value": "曲面屏手机"
      },
      {
        "name": "贴膜类型",
        "value": "曲面膜"
      },
      {
        "name": "贴膜特点",
        "value": "自动修复"
      },
      {
        "name": "品牌",
        "value": "无"
      },
      {
        "name": "颜色",
        "value": "曲面屏UV胶水黄盖"
      }
    ]
  },
  {
    "id": "1688-825190399130",
    "title": "大猩猩钢化膜适用苹果iphone16防指纹苹果15防窥膜13pro 磨砂全屏",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市福田区鑫膜电子商行\n\n材质: 钢化玻璃\n适用机型: 苹果\n贴膜类型: 前膜\n贴膜特点: 磨砂,镜面,高清,防爆,防尘,防指纹,防摔,全屏,防偷窥,抗蓝光\n品牌: WELEMENT\n产地: 深圳\n颜色: 大猩猩【裸膜】高清,大猩猩【裸膜】防窥,大猩猩【裸膜】磨砂,大猩猩【裸膜】磨砂防窥,大猩猩【裸膜】紫蓝光,大猩猩【简装】高清,大猩猩【简装】防窥,大猩猩【简装】磨砂,大猩猩【简装】磨砂防窥,大猩猩【简装】紫蓝光,大猩猩【精装】高清,大猩猩【精装】防窥,大猩猩【精装】磨砂,大猩猩【精装】磨砂防窥,大猩猩【精装】紫蓝光\n尺寸: iP~17Pro MAX,iP~17Pro,iP~17Air,iP~17/16Pro通用,iP~16Pro MAX,iP~16Plus/15Plus通用,iP~16/15通用,iP~15Pro MAX,iP~15Pro,iP~14Pro MAX,iP~14Pro,iP~13ProMax/14Plus通用,iP~17E/16E /13/13Pro/14通用,iP~13Mini,iP~12Pro MAX,iP~12/12Pro通用,iP~12Mini,iP~XsMax/11ProMax通用,iP~XR/11通用,iP~X/Xs/11Pro通用,iP~6/7/8【颜色型号请备注！！】\n苹果型号: iPhone14 Pro Max\n大猩猩钢化膜: 苹果钢化膜，苹果手机膜，防指纹钢化膜，防偷窥膜\n适用品牌: 点赞猩猩\n\niP~17Pro MAX: CNY 2.38, stock 969224\niP~17Pro: CNY 2.38, stock 974169\niP~17Air: CNY 2.38, stock 977729\niP~17/16Pro通用: CNY 2.38, stock 973199\niP~16Pro MAX: CNY 2.38, stock 971223\niP~16Plus/15Plus通用: CNY 2.38, stock 977571\niP~16/15通用: CNY 2.38, stock 974383\niP~15Pro MAX: CNY 2.38, stock 826857\niP~15Pro: CNY 2.38, stock 975375\niP~14Pro MAX: CNY 2.38, stock 975125\niP~14Pro: CNY 2.38, stock 975947\niP~13ProMax/14Plus通用: CNY 2.38, stock 976139\niP~17E/16E /13/13Pro/14通用: CNY 2.38, stock 973154\niP~12Pro MAX: CNY 2.38, stock 977552\niP~12/12Pro通用: CNY 2.38, stock 977036\niP~12Mini: CNY 2.38, stock 978461\niP~XsMax/11ProMax通用: CNY 2.38, stock 977755\niP~XR/11通用: CNY 2.38, stock 976860\niP~X/Xs/11Pro通用: CNY 2.38, stock 977883\niP~6/7/8【颜色型号请备注！！】: CNY 2.38, stock 978315\n\nSource: https://detail.1688.com/offer/825190399130.html",
    "price": 4.11,
    "compare_at_price": 0,
    "cost_per_item": 0.6,
    "stock": 403,
    "sales": 0,
    "published": false,
    "image": "assets/1688/825190399130/01.webp",
    "images": [
      "assets/1688/825190399130/01.webp",
      "assets/1688/825190399130/02.webp",
      "assets/1688/825190399130/03.webp",
      "assets/1688/825190399130/04.webp",
      "assets/1688/825190399130/05.webp",
      "assets/1688/825190399130/06.webp",
      "assets/1688/825190399130/07.webp",
      "assets/1688/825190399130/08.webp",
      "assets/1688/825190399130/09.webp",
      "assets/1688/825190399130/10.webp",
      "assets/1688/825190399130/11.webp",
      "assets/1688/825190399130/12.webp",
      "assets/1688/825190399130/13.webp",
      "assets/1688/825190399130/14.webp",
      "assets/1688/825190399130/15.webp",
      "assets/1688/825190399130/16.webp",
      "assets/1688/825190399130/17.webp",
      "assets/1688/825190399130/18.webp",
      "assets/1688/825190399130/19.webp",
      "assets/1688/825190399130/20.webp"
    ],
    "vendor": "深圳市福田区鑫膜电子商行",
    "sku": "1688-825190399130",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/825190399130.html",
    "source_currency": "CNY",
    "source_price": 2.38,
    "source_variants": [
      {
        "image": "",
        "name": "iP~17Pro MAX",
        "priceCny": 2.38,
        "stock": 969224
      },
      {
        "image": "",
        "name": "iP~17Pro",
        "priceCny": 2.38,
        "stock": 974169
      },
      {
        "image": "",
        "name": "iP~17Air",
        "priceCny": 2.38,
        "stock": 977729
      },
      {
        "image": "",
        "name": "iP~17/16Pro通用",
        "priceCny": 2.38,
        "stock": 973199
      },
      {
        "image": "",
        "name": "iP~16Pro MAX",
        "priceCny": 2.38,
        "stock": 971223
      },
      {
        "image": "",
        "name": "iP~16Plus/15Plus通用",
        "priceCny": 2.38,
        "stock": 977571
      },
      {
        "image": "",
        "name": "iP~16/15通用",
        "priceCny": 2.38,
        "stock": 974383
      },
      {
        "image": "",
        "name": "iP~15Pro MAX",
        "priceCny": 2.38,
        "stock": 826857
      },
      {
        "image": "",
        "name": "iP~15Pro",
        "priceCny": 2.38,
        "stock": 975375
      },
      {
        "image": "",
        "name": "iP~14Pro MAX",
        "priceCny": 2.38,
        "stock": 975125
      },
      {
        "image": "",
        "name": "iP~14Pro",
        "priceCny": 2.38,
        "stock": 975947
      },
      {
        "image": "",
        "name": "iP~13ProMax/14Plus通用",
        "priceCny": 2.38,
        "stock": 976139
      },
      {
        "image": "",
        "name": "iP~17E/16E /13/13Pro/14通用",
        "priceCny": 2.38,
        "stock": 973154
      },
      {
        "image": "",
        "name": "iP~12Pro MAX",
        "priceCny": 2.38,
        "stock": 977552
      },
      {
        "image": "",
        "name": "iP~12/12Pro通用",
        "priceCny": 2.38,
        "stock": 977036
      },
      {
        "image": "",
        "name": "iP~12Mini",
        "priceCny": 2.38,
        "stock": 978461
      },
      {
        "image": "",
        "name": "iP~XsMax/11ProMax通用",
        "priceCny": 2.38,
        "stock": 977755
      },
      {
        "image": "",
        "name": "iP~XR/11通用",
        "priceCny": 2.38,
        "stock": 976860
      },
      {
        "image": "",
        "name": "iP~X/Xs/11Pro通用",
        "priceCny": 2.38,
        "stock": 977883
      },
      {
        "image": "",
        "name": "iP~6/7/8【颜色型号请备注！！】",
        "priceCny": 2.38,
        "stock": 978315
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "钢化玻璃"
      },
      {
        "name": "适用机型",
        "value": "苹果"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "磨砂,镜面,高清,防爆,防尘,防指纹,防摔,全屏,防偷窥,抗蓝光"
      },
      {
        "name": "品牌",
        "value": "WELEMENT"
      },
      {
        "name": "产地",
        "value": "深圳"
      },
      {
        "name": "颜色",
        "value": "大猩猩【裸膜】高清,大猩猩【裸膜】防窥,大猩猩【裸膜】磨砂,大猩猩【裸膜】磨砂防窥,大猩猩【裸膜】紫蓝光,大猩猩【简装】高清,大猩猩【简装】防窥,大猩猩【简装】磨砂,大猩猩【简装】磨砂防窥,大猩猩【简装】紫蓝光,大猩猩【精装】高清,大猩猩【精装】防窥,大猩猩【精装】磨砂,大猩猩【精装】磨砂防窥,大猩猩【精装】紫蓝光"
      },
      {
        "name": "尺寸",
        "value": "iP~17Pro MAX,iP~17Pro,iP~17Air,iP~17/16Pro通用,iP~16Pro MAX,iP~16Plus/15Plus通用,iP~16/15通用,iP~15Pro MAX,iP~15Pro,iP~14Pro MAX,iP~14Pro,iP~13ProMax/14Plus通用,iP~17E/16E /13/13Pro/14通用,iP~13Mini,iP~12Pro MAX,iP~12/12Pro通用,iP~12Mini,iP~XsMax/11ProMax通用,iP~XR/11通用,iP~X/Xs/11Pro通用,iP~6/7/8【颜色型号请备注！！】"
      },
      {
        "name": "苹果型号",
        "value": "iPhone14 Pro Max"
      },
      {
        "name": "大猩猩钢化膜",
        "value": "苹果钢化膜，苹果手机膜，防指纹钢化膜，防偷窥膜"
      },
      {
        "name": "适用品牌",
        "value": "点赞猩猩"
      }
    ]
  },
  {
    "id": "1688-840381586138",
    "title": "暴富钱包女小众个性高级感可爱三折小零钱包学生适用短款折叠卡包",
    "category": "1688 Imports",
    "description": "Supplier: 潮州市潮安区浮洋镇爵兴家居贸易商行\n\n材质: PVC\n功能: 其他\n里料质地: 合成革\n钱夹折数: 其他\n风格: 无性别风\n品牌: 其他\n货号: 30132\n图案: 其他\n适用性别: 中性/男女均可\n颜色: 无限好运,平安喜乐,多财多亿,日富一日,翘屁屁小狗,翘屁屁小熊,贪吃小熊猫,绿色小怪兽,粉色小怪兽,黄色小怪兽,彩色小怪兽\n有可授权的自有品牌: 否\n上市年份季节: 2024年春季\n适用场景: 家用收纳\n流行元素: 其他\n\n无限好运: CNY 6.46, stock 1997\n平安喜乐: CNY 6.46, stock 1996\n多财多亿: CNY 6.46, stock 1998\n日富一日: CNY 6.46, stock 1996\n翘屁屁小狗: CNY 6.46, stock 1996\n翘屁屁小熊: CNY 6.46, stock 1995\n贪吃小熊猫: CNY 6.46, stock 1997\n\nSource: https://detail.1688.com/offer/840381586138.html",
    "price": 11.14,
    "compare_at_price": 0,
    "cost_per_item": 1.62,
    "stock": 4,
    "sales": 0,
    "published": false,
    "image": "assets/1688/840381586138/01.webp",
    "images": [
      "assets/1688/840381586138/01.webp",
      "assets/1688/840381586138/02.webp",
      "assets/1688/840381586138/03.webp",
      "assets/1688/840381586138/04.webp",
      "assets/1688/840381586138/05.webp",
      "assets/1688/840381586138/06.webp",
      "assets/1688/840381586138/07.webp",
      "assets/1688/840381586138/08.webp",
      "assets/1688/840381586138/09.webp",
      "assets/1688/840381586138/10.webp",
      "assets/1688/840381586138/11.webp",
      "assets/1688/840381586138/12.webp",
      "assets/1688/840381586138/13.webp",
      "assets/1688/840381586138/14.webp",
      "assets/1688/840381586138/15.webp",
      "assets/1688/840381586138/16.webp",
      "assets/1688/840381586138/17.webp",
      "assets/1688/840381586138/18.webp",
      "assets/1688/840381586138/19.webp",
      "assets/1688/840381586138/20.webp",
      "assets/1688/840381586138/21.webp",
      "assets/1688/840381586138/22.webp",
      "assets/1688/840381586138/23.webp"
    ],
    "vendor": "潮州市潮安区浮洋镇爵兴家居贸易商行",
    "sku": "1688-840381586138",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/840381586138.html",
    "source_currency": "CNY",
    "source_price": 6.46,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Dx356n1zEru8Lxxff_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "无限好运",
        "priceCny": 6.46,
        "stock": 1997
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0135mnDb1zEru3A92Ab_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "平安喜乐",
        "priceCny": 6.46,
        "stock": 1996
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01jOX6il1zEru5un2RT_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "多财多亿",
        "priceCny": 6.46,
        "stock": 1998
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Agg79k1zEru3SQOzW_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "日富一日",
        "priceCny": 6.46,
        "stock": 1996
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PBGdjX1zEru5JMShS_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "翘屁屁小狗",
        "priceCny": 6.46,
        "stock": 1996
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01uAS0571zEru4ePdZW_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "翘屁屁小熊",
        "priceCny": 6.46,
        "stock": 1995
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01HikeOH1zEru5um1sG_!!2217614866683-0-cib.jpg_sum.jpg",
        "name": "贪吃小熊猫",
        "priceCny": 6.46,
        "stock": 1997
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "功能",
        "value": "其他"
      },
      {
        "name": "里料质地",
        "value": "合成革"
      },
      {
        "name": "钱夹折数",
        "value": "其他"
      },
      {
        "name": "风格",
        "value": "无性别风"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "货号",
        "value": "30132"
      },
      {
        "name": "图案",
        "value": "其他"
      },
      {
        "name": "适用性别",
        "value": "中性/男女均可"
      },
      {
        "name": "颜色",
        "value": "无限好运,平安喜乐,多财多亿,日富一日,翘屁屁小狗,翘屁屁小熊,贪吃小熊猫,绿色小怪兽,粉色小怪兽,黄色小怪兽,彩色小怪兽"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "上市年份季节",
        "value": "2024年春季"
      },
      {
        "name": "适用场景",
        "value": "家用收纳"
      },
      {
        "name": "流行元素",
        "value": "其他"
      }
    ]
  },
  {
    "id": "1688-843570217832",
    "title": "适用iPhone17磁吸手机壳苹果16pro金属漆全包15磨砂肤感tpu保护套",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市新天羽科技有限公司\n\n材质: tpu\n功能: 磁吸,防摔\n款式: 全包\n品牌: 新天羽\n工艺: 热压\n流行元素: 磁吸\n风格: 个性,简约\n货号: 金属漆\n货号: 金属漆\n颜色: 高级黑,暗紫色,海军蓝,钛灰色,哑光银\n适用型号: iPhone17,iPhone17pro,iPhone17air,iPhone17ProMax,iPhone16,iPhone16Pro,iPhone16plus,iPhone16promax,iPhone15,iPhone15Pro,iPhone15plus,iPhone15promax,iPhone14,iPhone14Pro,iPhone14plus,iPhone14promax,iPhone13,iPhone13Pro,iPhone13promax,iPhone12,iPhone12Pro,iPhone12promax,iPhone11,iPhone11Pro,iPhone11promax\n支持订制: 不支持\n适用机型: 4827101\n颜色分类: 紫色,蓝色,黑色,银灰色\n\niPhone17: CNY 4.80, stock 7852\niPhone17pro: CNY 4.80, stock 7845\niPhone17air: CNY 4.80, stock 7888\niPhone17ProMax: CNY 4.80, stock 7847\niPhone16: CNY 4.80, stock 7629\niPhone16Pro: CNY 4.80, stock 7591\niPhone16plus: CNY 4.80, stock 7703\niPhone16promax: CNY 4.80, stock 7564\niPhone15: CNY 4.80, stock 7901\niPhone15Pro: CNY 4.80, stock 7905\niPhone15plus: CNY 4.80, stock 7981\niPhone15promax: CNY 4.80, stock 7903\niPhone14: CNY 4.80, stock 7940\niPhone14Pro: CNY 4.80, stock 7866\niPhone14plus: CNY 4.80, stock 7985\niPhone14promax: CNY 4.80, stock 7892\niPhone13: CNY 4.80, stock 7932\niPhone13Pro: CNY 4.80, stock 7950\niPhone13promax: CNY 4.80, stock 7955\niPhone12: CNY 4.80, stock 7960\niPhone12Pro: CNY 4.80, stock 7970\niPhone12promax: CNY 4.80, stock 7964\niPhone11: CNY 4.80, stock 7946\niPhone11Pro: CNY 4.80, stock 7977\niPhone11promax: CNY 4.80, stock 7980\n\nSource: https://detail.1688.com/offer/843570217832.html",
    "price": 8.28,
    "compare_at_price": 0,
    "cost_per_item": 1.2,
    "stock": 11,
    "sales": 0,
    "published": false,
    "image": "assets/1688/843570217832/01.webp",
    "images": [
      "assets/1688/843570217832/01.webp",
      "assets/1688/843570217832/02.webp",
      "assets/1688/843570217832/03.webp",
      "assets/1688/843570217832/04.webp",
      "assets/1688/843570217832/05.webp",
      "assets/1688/843570217832/06.webp",
      "assets/1688/843570217832/07.webp",
      "assets/1688/843570217832/08.webp",
      "assets/1688/843570217832/09.webp",
      "assets/1688/843570217832/10.webp"
    ],
    "vendor": "深圳市新天羽科技有限公司",
    "sku": "1688-843570217832",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/843570217832.html",
    "source_currency": "CNY",
    "source_price": 4.8,
    "source_variants": [
      {
        "image": "",
        "name": "iPhone17",
        "priceCny": 4.8,
        "stock": 7852
      },
      {
        "image": "",
        "name": "iPhone17pro",
        "priceCny": 4.8,
        "stock": 7845
      },
      {
        "image": "",
        "name": "iPhone17air",
        "priceCny": 4.8,
        "stock": 7888
      },
      {
        "image": "",
        "name": "iPhone17ProMax",
        "priceCny": 4.8,
        "stock": 7847
      },
      {
        "image": "",
        "name": "iPhone16",
        "priceCny": 4.8,
        "stock": 7629
      },
      {
        "image": "",
        "name": "iPhone16Pro",
        "priceCny": 4.8,
        "stock": 7591
      },
      {
        "image": "",
        "name": "iPhone16plus",
        "priceCny": 4.8,
        "stock": 7703
      },
      {
        "image": "",
        "name": "iPhone16promax",
        "priceCny": 4.8,
        "stock": 7564
      },
      {
        "image": "",
        "name": "iPhone15",
        "priceCny": 4.8,
        "stock": 7901
      },
      {
        "image": "",
        "name": "iPhone15Pro",
        "priceCny": 4.8,
        "stock": 7905
      },
      {
        "image": "",
        "name": "iPhone15plus",
        "priceCny": 4.8,
        "stock": 7981
      },
      {
        "image": "",
        "name": "iPhone15promax",
        "priceCny": 4.8,
        "stock": 7903
      },
      {
        "image": "",
        "name": "iPhone14",
        "priceCny": 4.8,
        "stock": 7940
      },
      {
        "image": "",
        "name": "iPhone14Pro",
        "priceCny": 4.8,
        "stock": 7866
      },
      {
        "image": "",
        "name": "iPhone14plus",
        "priceCny": 4.8,
        "stock": 7985
      },
      {
        "image": "",
        "name": "iPhone14promax",
        "priceCny": 4.8,
        "stock": 7892
      },
      {
        "image": "",
        "name": "iPhone13",
        "priceCny": 4.8,
        "stock": 7932
      },
      {
        "image": "",
        "name": "iPhone13Pro",
        "priceCny": 4.8,
        "stock": 7950
      },
      {
        "image": "",
        "name": "iPhone13promax",
        "priceCny": 4.8,
        "stock": 7955
      },
      {
        "image": "",
        "name": "iPhone12",
        "priceCny": 4.8,
        "stock": 7960
      },
      {
        "image": "",
        "name": "iPhone12Pro",
        "priceCny": 4.8,
        "stock": 7970
      },
      {
        "image": "",
        "name": "iPhone12promax",
        "priceCny": 4.8,
        "stock": 7964
      },
      {
        "image": "",
        "name": "iPhone11",
        "priceCny": 4.8,
        "stock": 7946
      },
      {
        "image": "",
        "name": "iPhone11Pro",
        "priceCny": 4.8,
        "stock": 7977
      },
      {
        "image": "",
        "name": "iPhone11promax",
        "priceCny": 4.8,
        "stock": 7980
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "tpu"
      },
      {
        "name": "功能",
        "value": "磁吸,防摔"
      },
      {
        "name": "款式",
        "value": "全包"
      },
      {
        "name": "品牌",
        "value": "新天羽"
      },
      {
        "name": "工艺",
        "value": "热压"
      },
      {
        "name": "流行元素",
        "value": "磁吸"
      },
      {
        "name": "风格",
        "value": "个性,简约"
      },
      {
        "name": "货号",
        "value": "金属漆"
      },
      {
        "name": "货号",
        "value": "金属漆"
      },
      {
        "name": "颜色",
        "value": "高级黑,暗紫色,海军蓝,钛灰色,哑光银"
      },
      {
        "name": "适用型号",
        "value": "iPhone17,iPhone17pro,iPhone17air,iPhone17ProMax,iPhone16,iPhone16Pro,iPhone16plus,iPhone16promax,iPhone15,iPhone15Pro,iPhone15plus,iPhone15promax,iPhone14,iPhone14Pro,iPhone14plus,iPhone14promax,iPhone13,iPhone13Pro,iPhone13promax,iPhone12,iPhone12Pro,iPhone12promax,iPhone11,iPhone11Pro,iPhone11promax"
      },
      {
        "name": "支持订制",
        "value": "不支持"
      },
      {
        "name": "适用机型",
        "value": "4827101"
      },
      {
        "name": "颜色分类",
        "value": "紫色,蓝色,黑色,银灰色"
      }
    ]
  },
  {
    "id": "1688-844769635903",
    "title": "2024新款车载手机支架多功能汽车吸盘式导航通用车载手机支撑架",
    "category": "1688 Imports",
    "description": "Supplier: 南宫市晟曜汽车用品有限公司\n\n功率: 7.5W\n是否可充电: 不可充电\n附加功能: 无\n安装方式: 吸盘式\n适用汽车品牌: 通用\n品牌: 大晟\n适用部位: 前挡玻璃\n货号: XP019\n颜色: 三合一款,金色,银色,黑色\n主要下游平台: ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他\n主要销售地区: 非洲,欧洲,南美,东南亚,北美,东北亚,中东\n是否跨境出口专供货源: 是\n款式: 手机支架\n加工定制: 是\n是否专利货源: 否\n\n手机支架: CNY 7.00, stock 9855\n\nSource: https://detail.1688.com/offer/844769635903.html",
    "price": 12.08,
    "compare_at_price": 0,
    "cost_per_item": 1.75,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/844769635903/01.webp",
    "images": [
      "assets/1688/844769635903/01.webp",
      "assets/1688/844769635903/02.webp",
      "assets/1688/844769635903/03.webp",
      "assets/1688/844769635903/04.webp",
      "assets/1688/844769635903/05.webp",
      "assets/1688/844769635903/06.webp",
      "assets/1688/844769635903/07.webp",
      "assets/1688/844769635903/08.webp",
      "assets/1688/844769635903/09.webp"
    ],
    "vendor": "南宫市晟曜汽车用品有限公司",
    "sku": "1688-844769635903",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/844769635903.html",
    "source_currency": "CNY",
    "source_price": 7,
    "source_variants": [
      {
        "image": "",
        "name": "手机支架",
        "priceCny": 7,
        "stock": 9855
      }
    ],
    "source_attributes": [
      {
        "name": "功率",
        "value": "7.5W"
      },
      {
        "name": "是否可充电",
        "value": "不可充电"
      },
      {
        "name": "附加功能",
        "value": "无"
      },
      {
        "name": "安装方式",
        "value": "吸盘式"
      },
      {
        "name": "适用汽车品牌",
        "value": "通用"
      },
      {
        "name": "品牌",
        "value": "大晟"
      },
      {
        "name": "适用部位",
        "value": "前挡玻璃"
      },
      {
        "name": "货号",
        "value": "XP019"
      },
      {
        "name": "颜色",
        "value": "三合一款,金色,银色,黑色"
      },
      {
        "name": "主要下游平台",
        "value": "ebay,亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "主要销售地区",
        "value": "非洲,欧洲,南美,东南亚,北美,东北亚,中东"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "款式",
        "value": "手机支架"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      }
    ]
  },
  {
    "id": "1688-844862654026",
    "title": "适用于三星A36手机钢化膜GalaxyA36屏幕高清防摔钢化玻璃保护贴膜",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市卓瑞恒科技有限公司\n\n材质: 钢化玻璃\n适用机型: 三星\n贴膜类型: 前膜\n贴膜特点: 高清,防摔,全屏\n品牌: 其他\n颜色: 高清全屏钢化膜,电镀丝印钢化膜,防窥钢化膜\n尺寸: 三星A36\n\n三星A36: CNY 3.80, stock 99994\n\nSource: https://detail.1688.com/offer/844862654026.html",
    "price": 6.55,
    "compare_at_price": 0,
    "cost_per_item": 0.95,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/844862654026/01.webp",
    "images": [
      "assets/1688/844862654026/01.webp",
      "assets/1688/844862654026/02.webp",
      "assets/1688/844862654026/03.webp",
      "assets/1688/844862654026/04.webp",
      "assets/1688/844862654026/05.webp",
      "assets/1688/844862654026/06.webp",
      "assets/1688/844862654026/07.webp",
      "assets/1688/844862654026/08.webp"
    ],
    "vendor": "深圳市卓瑞恒科技有限公司",
    "sku": "1688-844862654026",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/844862654026.html",
    "source_currency": "CNY",
    "source_price": 3.8,
    "source_variants": [
      {
        "image": "",
        "name": "三星A36",
        "priceCny": 3.8,
        "stock": 99994
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "钢化玻璃"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "高清,防摔,全屏"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "颜色",
        "value": "高清全屏钢化膜,电镀丝印钢化膜,防窥钢化膜"
      },
      {
        "name": "尺寸",
        "value": "三星A36"
      }
    ]
  },
  {
    "id": "1688-856442746323",
    "title": "适用三星Galaxy A16 5G手机钢化膜透明丝印全屏防窥防摔玻璃贴膜",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市诺易科科技有限公司\n\n材质: 钢化玻璃\n适用机型: 三星\n贴膜类型: 镜头膜\n贴膜特点: 高清,防爆,防尘,防摔,全屏\n品牌: 中性\n颜色: 钢化膜-【透明高清膜】,钢化膜-【全屏高清膜】,钢化膜-【透明防窥膜】,钢化膜-【全屏防窥膜】\n尺寸: 三星Galaxy A16 5G,三星Galaxy A16\n\n三星Galaxy A16 5G: CNY 2.85, stock 9972\n三星Galaxy A16: CNY 2.85, stock 9997\n\nSource: https://detail.1688.com/offer/856442746323.html",
    "price": 4.92,
    "compare_at_price": 0,
    "cost_per_item": 0.71,
    "stock": 10,
    "sales": 0,
    "published": false,
    "image": "assets/1688/856442746323/01.webp",
    "images": [
      "assets/1688/856442746323/01.webp",
      "assets/1688/856442746323/02.webp",
      "assets/1688/856442746323/03.webp",
      "assets/1688/856442746323/04.webp",
      "assets/1688/856442746323/05.webp"
    ],
    "vendor": "深圳市诺易科科技有限公司",
    "sku": "1688-856442746323",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/856442746323.html",
    "source_currency": "CNY",
    "source_price": 2.85,
    "source_variants": [
      {
        "image": "",
        "name": "三星Galaxy A16 5G",
        "priceCny": 2.85,
        "stock": 9972
      },
      {
        "image": "",
        "name": "三星Galaxy A16",
        "priceCny": 2.85,
        "stock": 9997
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "钢化玻璃"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "镜头膜"
      },
      {
        "name": "贴膜特点",
        "value": "高清,防爆,防尘,防摔,全屏"
      },
      {
        "name": "品牌",
        "value": "中性"
      },
      {
        "name": "颜色",
        "value": "钢化膜-【透明高清膜】,钢化膜-【全屏高清膜】,钢化膜-【透明防窥膜】,钢化膜-【全屏防窥膜】"
      },
      {
        "name": "尺寸",
        "value": "三星Galaxy A16 5G,三星Galaxy A16"
      }
    ]
  },
  {
    "id": "1688-859230739614",
    "title": "手机除尘膜屏幕清灰清洁吸尘胶带平板换屏粘尘除尘胶带PE保护膜",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市达丰胶带有限公司\n\n产地: 深圳\n是否进口: 否\n加工定制: 是\n货号: 手机除尘膜\n厚度: 0.07MM\n适用范围: 保护膜\n用途: 保护\n品牌: 米乐奇\n材质: PE\n长度: 50米\n基材: PE\n胶系: 保护膜\n宽度: 5CM\n透光率: 1\n颜色: 7丝加厚 5cm宽*50米长,7丝加厚 6cm宽*50米长,7丝加厚 7cm宽*50米长,7丝加厚 8cm宽*50米长,7丝加厚 9cm宽*50米长,7丝加厚 10cm宽*50米长,7丝加厚 12cm宽*50米长,7丝加厚 15cm宽*50米长,7丝加厚 20cm宽*50米长,7丝加厚 25cm宽*50米长,7丝加厚 30cm宽*50米长\n系列: 手机除尘膜\n订货号: 1\n粘性: 中粘\n卷芯材质: 纸筒\n型号: 标准\n是否跨境出口专供货源: 否\n\n标准: CNY 7.99, stock 99071\n\nSource: https://detail.1688.com/offer/859230739614.html",
    "price": 13.78,
    "compare_at_price": 0,
    "cost_per_item": 2,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/859230739614/01.webp",
    "images": [
      "assets/1688/859230739614/01.webp",
      "assets/1688/859230739614/02.webp",
      "assets/1688/859230739614/03.webp",
      "assets/1688/859230739614/04.webp",
      "assets/1688/859230739614/05.webp"
    ],
    "vendor": "深圳市达丰胶带有限公司",
    "sku": "1688-859230739614",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/859230739614.html",
    "source_currency": "CNY",
    "source_price": 7.99,
    "source_variants": [
      {
        "image": "",
        "name": "标准",
        "priceCny": 7.99,
        "stock": 99071
      }
    ],
    "source_attributes": [
      {
        "name": "产地",
        "value": "深圳"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "货号",
        "value": "手机除尘膜"
      },
      {
        "name": "厚度",
        "value": "0.07MM"
      },
      {
        "name": "适用范围",
        "value": "保护膜"
      },
      {
        "name": "用途",
        "value": "保护"
      },
      {
        "name": "品牌",
        "value": "米乐奇"
      },
      {
        "name": "材质",
        "value": "PE"
      },
      {
        "name": "长度",
        "value": "50米"
      },
      {
        "name": "基材",
        "value": "PE"
      },
      {
        "name": "胶系",
        "value": "保护膜"
      },
      {
        "name": "宽度",
        "value": "5CM"
      },
      {
        "name": "透光率",
        "value": "1"
      },
      {
        "name": "颜色",
        "value": "7丝加厚 5cm宽*50米长,7丝加厚 6cm宽*50米长,7丝加厚 7cm宽*50米长,7丝加厚 8cm宽*50米长,7丝加厚 9cm宽*50米长,7丝加厚 10cm宽*50米长,7丝加厚 12cm宽*50米长,7丝加厚 15cm宽*50米长,7丝加厚 20cm宽*50米长,7丝加厚 25cm宽*50米长,7丝加厚 30cm宽*50米长"
      },
      {
        "name": "系列",
        "value": "手机除尘膜"
      },
      {
        "name": "订货号",
        "value": "1"
      },
      {
        "name": "粘性",
        "value": "中粘"
      },
      {
        "name": "卷芯材质",
        "value": "纸筒"
      },
      {
        "name": "型号",
        "value": "标准"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      }
    ]
  },
  {
    "id": "1688-864279706758",
    "title": "适用三星Galaxy A35手机钢化膜防窥指纹解锁高清丝印屏幕保护贴膜",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市诺易科科技有限公司\n\n材质: 钢化玻璃\n适用机型: 三星\n贴膜类型: 前膜\n贴膜特点: 磨砂,高清,彩膜,防偷窥,抗蓝光,抗紫光,抗绿光\n品牌: 中性\n颜色: 高铝电镀透明膜【无黑边】,高铝电镀丝印膜【有黑边】,透明防窥膜【无黑边】,全屏丝印防窥膜【有黑边】\n尺寸: 三星Galaxy A35\n\n三星Galaxy A35: CNY 2.85, stock 99989\n\nSource: https://detail.1688.com/offer/864279706758.html",
    "price": 4.92,
    "compare_at_price": 0,
    "cost_per_item": 0.71,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/864279706758/01.webp",
    "images": [
      "assets/1688/864279706758/01.webp",
      "assets/1688/864279706758/02.webp",
      "assets/1688/864279706758/03.webp",
      "assets/1688/864279706758/04.webp",
      "assets/1688/864279706758/05.webp"
    ],
    "vendor": "深圳市诺易科科技有限公司",
    "sku": "1688-864279706758",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/864279706758.html",
    "source_currency": "CNY",
    "source_price": 2.85,
    "source_variants": [
      {
        "image": "",
        "name": "三星Galaxy A35",
        "priceCny": 2.85,
        "stock": 99989
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "钢化玻璃"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "磨砂,高清,彩膜,防偷窥,抗蓝光,抗紫光,抗绿光"
      },
      {
        "name": "品牌",
        "value": "中性"
      },
      {
        "name": "颜色",
        "value": "高铝电镀透明膜【无黑边】,高铝电镀丝印膜【有黑边】,透明防窥膜【无黑边】,全屏丝印防窥膜【有黑边】"
      },
      {
        "name": "尺寸",
        "value": "三星Galaxy A35"
      }
    ]
  },
  {
    "id": "1688-865301240925",
    "title": "适用三星A15手机钢化膜GalaxyA35透明丝印全屏防窥贴膜不顶壳A55",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市卓瑞恒科技有限公司\n\n材质: 钢化玻璃\n适用机型: 三星\n贴膜类型: 前膜\n贴膜特点: 高清,防摔,全屏\n品牌: 其他\n颜色: 全屏防窥钢化膜,透明防窥钢化膜,全屏高清钢化膜,电镀高铝钢化膜\n尺寸: 三星Galaxy A15,三星Galaxy A35,三星Galaxy A55\n\n三星Galaxy A15: CNY 5.70, stock 9998\n三星Galaxy A35: CNY 5.70, stock 9999\n三星Galaxy A55: CNY 5.70, stock 9999\n\nSource: https://detail.1688.com/offer/865301240925.html",
    "price": 9.83,
    "compare_at_price": 0,
    "cost_per_item": 1.43,
    "stock": 10,
    "sales": 0,
    "published": false,
    "image": "assets/1688/865301240925/01.webp",
    "images": [
      "assets/1688/865301240925/01.webp",
      "assets/1688/865301240925/02.webp",
      "assets/1688/865301240925/03.webp",
      "assets/1688/865301240925/04.webp",
      "assets/1688/865301240925/05.webp"
    ],
    "vendor": "深圳市卓瑞恒科技有限公司",
    "sku": "1688-865301240925",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/865301240925.html",
    "source_currency": "CNY",
    "source_price": 5.7,
    "source_variants": [
      {
        "image": "",
        "name": "三星Galaxy A15",
        "priceCny": 5.7,
        "stock": 9998
      },
      {
        "image": "",
        "name": "三星Galaxy A35",
        "priceCny": 5.7,
        "stock": 9999
      },
      {
        "image": "",
        "name": "三星Galaxy A55",
        "priceCny": 5.7,
        "stock": 9999
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "钢化玻璃"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "高清,防摔,全屏"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "颜色",
        "value": "全屏防窥钢化膜,透明防窥钢化膜,全屏高清钢化膜,电镀高铝钢化膜"
      },
      {
        "name": "尺寸",
        "value": "三星Galaxy A15,三星Galaxy A35,三星Galaxy A55"
      }
    ]
  },
  {
    "id": "1688-869311951682",
    "title": "可爱卡包2025新款女式个性多卡位小巧男士卡夹包大容量卡套零钱包",
    "category": "1688 Imports",
    "description": "Supplier: 潮州市潮安区浮洋镇爵兴家居贸易商行\n\n货号: S6248\n材质: PVC\n钱夹折数: 其它\n品牌: QIGER/琦格尔\n图案: 动漫卡通\n适用性别: 中性/男女均可\n流行元素: 车缝线\n里料质地: 合成革\n颜色: B平安喜乐【20卡位+2证件位】,B大吉大利【20卡位+2证件位】\n有可授权的自有品牌: 否\n上市年份季节: 2025年春季\n适用场景: 家用收纳\n风格: 无性别风\n功能: 防水,可收纳\n产品类别: 护照夹、证件夹\n\nSource: https://detail.1688.com/offer/869311951682.html",
    "price": 5.73,
    "compare_at_price": 0,
    "cost_per_item": 0.83,
    "stock": 4,
    "sales": 0,
    "published": false,
    "image": "assets/1688/869311951682/01.webp",
    "images": [
      "assets/1688/869311951682/01.webp",
      "assets/1688/869311951682/02.webp",
      "assets/1688/869311951682/03.webp",
      "assets/1688/869311951682/04.webp",
      "assets/1688/869311951682/05.webp",
      "assets/1688/869311951682/06.webp",
      "assets/1688/869311951682/07.webp",
      "assets/1688/869311951682/08.webp",
      "assets/1688/869311951682/09.webp",
      "assets/1688/869311951682/10.webp",
      "assets/1688/869311951682/11.webp",
      "assets/1688/869311951682/12.webp",
      "assets/1688/869311951682/13.webp"
    ],
    "vendor": "潮州市潮安区浮洋镇爵兴家居贸易商行",
    "sku": "1688-869311951682",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/869311951682.html",
    "source_currency": "CNY",
    "source_price": 3.32,
    "source_variants": [],
    "source_attributes": [
      {
        "name": "货号",
        "value": "S6248"
      },
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "钱夹折数",
        "value": "其它"
      },
      {
        "name": "品牌",
        "value": "QIGER/琦格尔"
      },
      {
        "name": "图案",
        "value": "动漫卡通"
      },
      {
        "name": "适用性别",
        "value": "中性/男女均可"
      },
      {
        "name": "流行元素",
        "value": "车缝线"
      },
      {
        "name": "里料质地",
        "value": "合成革"
      },
      {
        "name": "颜色",
        "value": "B平安喜乐【20卡位+2证件位】,B大吉大利【20卡位+2证件位】"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "上市年份季节",
        "value": "2025年春季"
      },
      {
        "name": "适用场景",
        "value": "家用收纳"
      },
      {
        "name": "风格",
        "value": "无性别风"
      },
      {
        "name": "功能",
        "value": "防水,可收纳"
      },
      {
        "name": "产品类别",
        "value": "护照夹、证件夹"
      }
    ]
  },
  {
    "id": "1688-891112098286",
    "title": "澳洲澳大利亚5v3a手机充电头saa认证电源适配器15w澳规充电器",
    "category": "1688 Imports",
    "description": "Supplier: 广东三古科技有限公司\n\n是否支持快充: 否\n输出功率: 15W\n接口类型: USB\n品牌: SENGOOG\n充电器适用形式: 充电插头\n充电协议: PD\n是否原装: 是\n插头标准: 澳标\n产品认证: SAA认证\n适用型号: 5V3A 澳规（含税价）,5V3A 澳规+包装（含税价）\n颜色: 白色,黑色\n电源端接口类型: USB-A\n是否数显: 否\n输出功电流总功率: 15W\n最大输出功率: 15W\n充电模式: 有线直充\n注意事项: 跨境货源产品，澳洲地区专用，国内请选3C产品\n充电器适用形式2: 充电插头\n输出电流: 3A\n产品质保: 24个月\n单口最大输出功率: 15\n生产企业: 广东三古科技有限公司\n兼容设备类型: 手机,手表,平板,耳机,游戏机\n适用国家: 澳洲\n插脚类型: 固定插脚\n颜色分类: 白色,黑色\n接口数量: 1\n\n白色: CNY 11.86, stock 9225\n黑色: CNY 11.86, stock 9421\n\nSource: https://detail.1688.com/offer/891112098286.html",
    "price": 20.46,
    "compare_at_price": 0,
    "cost_per_item": 2.97,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/891112098286/01.webp",
    "images": [
      "assets/1688/891112098286/01.webp",
      "assets/1688/891112098286/02.webp",
      "assets/1688/891112098286/03.webp",
      "assets/1688/891112098286/04.webp",
      "assets/1688/891112098286/05.webp",
      "assets/1688/891112098286/06.webp",
      "assets/1688/891112098286/07.webp"
    ],
    "vendor": "广东三古科技有限公司",
    "sku": "1688-891112098286",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/891112098286.html",
    "source_currency": "CNY",
    "source_price": 11.86,
    "source_variants": [
      {
        "image": "",
        "name": "白色",
        "priceCny": 11.86,
        "stock": 9225
      },
      {
        "image": "",
        "name": "黑色",
        "priceCny": 11.86,
        "stock": 9421
      }
    ],
    "source_attributes": [
      {
        "name": "是否支持快充",
        "value": "否"
      },
      {
        "name": "输出功率",
        "value": "15W"
      },
      {
        "name": "接口类型",
        "value": "USB"
      },
      {
        "name": "品牌",
        "value": "SENGOOG"
      },
      {
        "name": "充电器适用形式",
        "value": "充电插头"
      },
      {
        "name": "充电协议",
        "value": "PD"
      },
      {
        "name": "是否原装",
        "value": "是"
      },
      {
        "name": "插头标准",
        "value": "澳标"
      },
      {
        "name": "产品认证",
        "value": "SAA认证"
      },
      {
        "name": "适用型号",
        "value": "5V3A 澳规（含税价）,5V3A 澳规+包装（含税价）"
      },
      {
        "name": "颜色",
        "value": "白色,黑色"
      },
      {
        "name": "电源端接口类型",
        "value": "USB-A"
      },
      {
        "name": "是否数显",
        "value": "否"
      },
      {
        "name": "输出功电流总功率",
        "value": "15W"
      },
      {
        "name": "最大输出功率",
        "value": "15W"
      },
      {
        "name": "充电模式",
        "value": "有线直充"
      },
      {
        "name": "注意事项",
        "value": "跨境货源产品，澳洲地区专用，国内请选3C产品"
      },
      {
        "name": "充电器适用形式2",
        "value": "充电插头"
      },
      {
        "name": "输出电流",
        "value": "3A"
      },
      {
        "name": "产品质保",
        "value": "24个月"
      },
      {
        "name": "单口最大输出功率",
        "value": "15"
      },
      {
        "name": "生产企业",
        "value": "广东三古科技有限公司"
      },
      {
        "name": "兼容设备类型",
        "value": "手机,手表,平板,耳机,游戏机"
      },
      {
        "name": "适用国家",
        "value": "澳洲"
      },
      {
        "name": "插脚类型",
        "value": "固定插脚"
      },
      {
        "name": "颜色分类",
        "value": "白色,黑色"
      },
      {
        "name": "接口数量",
        "value": "1"
      }
    ]
  },
  {
    "id": "1688-896458787156",
    "title": "创意安妮宝贝宠爱降临小号毛绒盲盒-坐姿精美少女心玩偶厂家直销",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市九时猫供应链有限公司\n\n材质: 合成树脂\n类别: 盲盒\n品牌: 九时猫\n风格: 卡通风\n适用节日: 婚庆,生日,通用,情人节,春节,父亲节,母亲节,感恩节,教师节,中秋节,元旦,七夕,清明,满月,复活节,端午节,开业,乔迁,狂欢节,国庆节,建军节,儿童节,妇女节,护士节,愚人节,劳动节,结婚纪念日,周岁礼,植树节,其他\n货号: G074-3\n包装: 纸盒包装\n是否专利货源: 否\n颜色: 074-3安妮宝贝6个,1103奇迹圣诞夜1个,5011花影流光6个,5049Mini十二星座6个,1090小动物萌友会6个,5028海洋物语6个,1083小动物狂欢派对6个,p-383跳一跳小兔8个,070-25猫猫挂件6个,5061圣诞晚安曲6个,p-385圣诞叮叮铛8个,070-28奶糖百变时装6个,1079满分甜度400大体1个,1084星光之夜6个,1091艾米甜美风400体1个,5035趴趴小狗6个,p-382小熊冬眠计划6个,5036下午茶时间6个,5027抱抱雪糕萌宠6个,1101捣蛋鬼日记1个,p-372圣诞快乐8个,p-373AI800体1个,p-371pippa初代马卡龙6个,1074彩虹兔宝系列6个,5034小动物们的发箍8个,p-366 娃三岁魔镜2代8个,p-367果园拉链包6个,MR1088快乐圣诞夜6个,p-363霉霉星座物语12个,p-364糖心兔魔法秘境6个,p-378 6个,5031喵喵酷炫时刻6个,p-356娃三岁甜梦8个,5023小巴拉日常生活6个,5014mini小小动物二代8个,p-355童话秘语10个,p-248兔兔零钱包6个,5004招财兔带码8个,p-230大闹天宫8个,1050十二星座12个,-7mm奶糖缤纷毛绒6个,5001三小毛小小动物8个,MM奶糖二代6个,1054 三小毛水果乐园6个,1048 三小毛生肖12个,1052 三小毛招财猫6个,1029鸭鸭缤纷鲜果6个,1023小怪兽之动物果果6个,1032美食派对6个,p-218百变农场6个\n尺寸: 随机一个,整套\n适用送礼场合: 婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他\n送礼用途: 积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他\n是否属于礼品: 是，个人礼品\n是否IP授权: 否\n\n随机一个: CNY 22.77, stock 481\n整套: CNY 136.62, stock 80\n\nSource: https://detail.1688.com/offer/896458787156.html",
    "price": 39.28,
    "compare_at_price": 0,
    "cost_per_item": 5.69,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/896458787156/01.webp",
    "images": [
      "assets/1688/896458787156/01.webp",
      "assets/1688/896458787156/02.webp",
      "assets/1688/896458787156/03.webp",
      "assets/1688/896458787156/04.webp",
      "assets/1688/896458787156/05.webp",
      "assets/1688/896458787156/06.webp",
      "assets/1688/896458787156/07.webp",
      "assets/1688/896458787156/08.webp",
      "assets/1688/896458787156/09.webp",
      "assets/1688/896458787156/10.webp",
      "assets/1688/896458787156/11.webp",
      "assets/1688/896458787156/12.webp",
      "assets/1688/896458787156/13.webp",
      "assets/1688/896458787156/14.webp",
      "assets/1688/896458787156/15.webp",
      "assets/1688/896458787156/16.webp",
      "assets/1688/896458787156/17.webp",
      "assets/1688/896458787156/18.webp",
      "assets/1688/896458787156/19.webp",
      "assets/1688/896458787156/20.webp",
      "assets/1688/896458787156/21.webp",
      "assets/1688/896458787156/22.webp",
      "assets/1688/896458787156/23.webp",
      "assets/1688/896458787156/24.webp",
      "assets/1688/896458787156/25.webp",
      "assets/1688/896458787156/26.webp",
      "assets/1688/896458787156/27.webp",
      "assets/1688/896458787156/28.webp",
      "assets/1688/896458787156/29.webp",
      "assets/1688/896458787156/30.webp",
      "assets/1688/896458787156/31.webp",
      "assets/1688/896458787156/32.webp",
      "assets/1688/896458787156/33.webp",
      "assets/1688/896458787156/34.webp",
      "assets/1688/896458787156/35.webp",
      "assets/1688/896458787156/36.webp",
      "assets/1688/896458787156/37.webp",
      "assets/1688/896458787156/38.webp",
      "assets/1688/896458787156/39.webp",
      "assets/1688/896458787156/40.webp",
      "assets/1688/896458787156/41.webp",
      "assets/1688/896458787156/42.webp",
      "assets/1688/896458787156/43.webp",
      "assets/1688/896458787156/44.webp",
      "assets/1688/896458787156/45.webp",
      "assets/1688/896458787156/46.webp",
      "assets/1688/896458787156/47.webp",
      "assets/1688/896458787156/48.webp",
      "assets/1688/896458787156/49.webp",
      "assets/1688/896458787156/50.webp",
      "assets/1688/896458787156/51.webp",
      "assets/1688/896458787156/52.webp",
      "assets/1688/896458787156/53.webp",
      "assets/1688/896458787156/54.webp"
    ],
    "vendor": "义乌市九时猫供应链有限公司",
    "sku": "1688-896458787156",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/896458787156.html",
    "source_currency": "CNY",
    "source_price": 22.77,
    "source_variants": [
      {
        "image": "",
        "name": "随机一个",
        "priceCny": 22.77,
        "stock": 481
      },
      {
        "image": "",
        "name": "整套",
        "priceCny": 136.62,
        "stock": 80
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "合成树脂"
      },
      {
        "name": "类别",
        "value": "盲盒"
      },
      {
        "name": "品牌",
        "value": "九时猫"
      },
      {
        "name": "风格",
        "value": "卡通风"
      },
      {
        "name": "适用节日",
        "value": "婚庆,生日,通用,情人节,春节,父亲节,母亲节,感恩节,教师节,中秋节,元旦,七夕,清明,满月,复活节,端午节,开业,乔迁,狂欢节,国庆节,建军节,儿童节,妇女节,护士节,愚人节,劳动节,结婚纪念日,周岁礼,植树节,其他"
      },
      {
        "name": "货号",
        "value": "G074-3"
      },
      {
        "name": "包装",
        "value": "纸盒包装"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "074-3安妮宝贝6个,1103奇迹圣诞夜1个,5011花影流光6个,5049Mini十二星座6个,1090小动物萌友会6个,5028海洋物语6个,1083小动物狂欢派对6个,p-383跳一跳小兔8个,070-25猫猫挂件6个,5061圣诞晚安曲6个,p-385圣诞叮叮铛8个,070-28奶糖百变时装6个,1079满分甜度400大体1个,1084星光之夜6个,1091艾米甜美风400体1个,5035趴趴小狗6个,p-382小熊冬眠计划6个,5036下午茶时间6个,5027抱抱雪糕萌宠6个,1101捣蛋鬼日记1个,p-372圣诞快乐8个,p-373AI800体1个,p-371pippa初代马卡龙6个,1074彩虹兔宝系列6个,5034小动物们的发箍8个,p-366 娃三岁魔镜2代8个,p-367果园拉链包6个,MR1088快乐圣诞夜6个,p-363霉霉星座物语12个,p-364糖心兔魔法秘境6个,p-378 6个,5031喵喵酷炫时刻6个,p-356娃三岁甜梦8个,5023小巴拉日常生活6个,5014mini小小动物二代8个,p-355童话秘语10个,p-248兔兔零钱包6个,5004招财兔带码8个,p-230大闹天宫8个,1050十二星座12个,-7mm奶糖缤纷毛绒6个,5001三小毛小小动物8个,MM奶糖二代6个,1054 三小毛水果乐园6个,1048 三小毛生肖12个,1052 三小毛招财猫6个,1029鸭鸭缤纷鲜果6个,1023小怪兽之动物果果6个,1032美食派对6个,p-218百变农场6个"
      },
      {
        "name": "尺寸",
        "value": "随机一个,整套"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他"
      },
      {
        "name": "送礼用途",
        "value": "积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      }
    ]
  },
  {
    "id": "1688-898337480724",
    "title": "【小栗熊】原创陶瓷粉色复古手机挂件手机链ccd挂绳相机链条",
    "category": "1688 Imports",
    "description": "Supplier: 义乌如火饰品有限公司\n\n绳带材质: PVC\n材质: 其它\n挂件材质: 陶瓷\n工艺: 手工\n绳扣材质: 塑料扣\n品牌: 如火\n货号: SJL-62\n是否进口: 否\n加工定制: 否\n产品编号: SJL-62\n样式: 男女通用\n是否有挂件: 有\n包装: 独立包装\n加印LOGO: 不可以\n是否专利货源: 否\n是否跨境出口专供货源: 否\n规格: 小栗熊\nSJL-62: SJL-62\n\n小栗熊: CNY 1.71, stock 7139\n\nSource: https://detail.1688.com/offer/898337480724.html",
    "price": 2.95,
    "compare_at_price": 0,
    "cost_per_item": 0.43,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/898337480724/01.webp",
    "images": [
      "assets/1688/898337480724/01.webp",
      "assets/1688/898337480724/02.webp",
      "assets/1688/898337480724/03.webp",
      "assets/1688/898337480724/04.webp",
      "assets/1688/898337480724/05.webp",
      "assets/1688/898337480724/06.webp",
      "assets/1688/898337480724/07.webp"
    ],
    "vendor": "义乌如火饰品有限公司",
    "sku": "1688-898337480724",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/898337480724.html",
    "source_currency": "CNY",
    "source_price": 1.71,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01umjNpe2LJpmxxsVGX_!!2217275539672-0-cib.jpg_sum.jpg",
        "name": "小栗熊",
        "priceCny": 1.71,
        "stock": 7139
      }
    ],
    "source_attributes": [
      {
        "name": "绳带材质",
        "value": "PVC"
      },
      {
        "name": "材质",
        "value": "其它"
      },
      {
        "name": "挂件材质",
        "value": "陶瓷"
      },
      {
        "name": "工艺",
        "value": "手工"
      },
      {
        "name": "绳扣材质",
        "value": "塑料扣"
      },
      {
        "name": "品牌",
        "value": "如火"
      },
      {
        "name": "货号",
        "value": "SJL-62"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "产品编号",
        "value": "SJL-62"
      },
      {
        "name": "样式",
        "value": "男女通用"
      },
      {
        "name": "是否有挂件",
        "value": "有"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "规格",
        "value": "小栗熊"
      },
      {
        "name": "SJL-62",
        "value": "SJL-62"
      }
    ]
  },
  {
    "id": "1688-900373330076",
    "title": "【情侣款】小怪兽新款彩链钥匙扣书包百塔创意玩偶毛绒公仔挂件",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市炽酷贸易商行\n\n材质: 毛绒\n钥匙配饰分类: 钥匙扣挂件\n品牌: 其他\n风格: 可爱风\n货号: 1610\n颜色: 简款彩链大眼—蓝色,简款彩链大眼—绿色,简款彩链大眼—粉色,简款彩链大眼—白色,简款彩链大眼—黄色,简款彩链大眼—紫色,简款彩链大眼—随机一只,简款彩链大眼—6种颜色各一只（6色齐全）\n是否IP授权: 否\n是否属于礼品: 是，个人礼品\n适用送礼关系: 晚辈,情侣,同事,朋友,孩子,同学,恩师\n是否专利货源: 否\n适用节日: 圣诞节,情人节,春节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节\n送礼用途: 积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品\n适用送礼场合: 婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会\n\n简款彩链大眼—蓝色: CNY 2.60, stock 71687\n简款彩链大眼—绿色: CNY 2.60, stock 92768\n简款彩链大眼—粉色: CNY 2.60, stock 68545\n简款彩链大眼—白色: CNY 2.60, stock 97918\n简款彩链大眼—黄色: CNY 2.60, stock 80732\n简款彩链大眼—紫色: CNY 2.60, stock 67083\n简款彩链大眼—随机一只: CNY 2.50, stock 4818\n简款彩链大眼—6种颜色各一只（6色齐全）: CNY 16.80, stock 99446\n\nSource: https://detail.1688.com/offer/900373330076.html",
    "price": 4.31,
    "compare_at_price": 0,
    "cost_per_item": 0.63,
    "stock": 15,
    "sales": 0,
    "published": false,
    "image": "assets/1688/900373330076/01.webp",
    "images": [
      "assets/1688/900373330076/01.webp",
      "assets/1688/900373330076/02.webp",
      "assets/1688/900373330076/03.webp",
      "assets/1688/900373330076/04.webp",
      "assets/1688/900373330076/05.webp",
      "assets/1688/900373330076/06.webp",
      "assets/1688/900373330076/07.webp",
      "assets/1688/900373330076/08.webp",
      "assets/1688/900373330076/09.webp",
      "assets/1688/900373330076/10.webp",
      "assets/1688/900373330076/11.webp",
      "assets/1688/900373330076/12.webp",
      "assets/1688/900373330076/13.webp",
      "assets/1688/900373330076/14.webp",
      "assets/1688/900373330076/15.webp",
      "assets/1688/900373330076/16.webp",
      "assets/1688/900373330076/17.webp",
      "assets/1688/900373330076/18.webp",
      "assets/1688/900373330076/19.webp",
      "assets/1688/900373330076/20.webp",
      "assets/1688/900373330076/21.webp"
    ],
    "vendor": "义乌市炽酷贸易商行",
    "sku": "1688-900373330076",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/900373330076.html",
    "source_currency": "CNY",
    "source_price": 2.5,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01LKCJut2BhW72qxhNz_!!2217719988370-0-cib.jpg_sum.jpg",
        "name": "简款彩链大眼—蓝色",
        "priceCny": 2.6,
        "stock": 71687
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PRWYhk2BhW72G4cKo_!!2217719988370-0-cib.jpg_sum.jpg",
        "name": "简款彩链大眼—绿色",
        "priceCny": 2.6,
        "stock": 92768
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01nYCb0V2BhW7185iGw_!!2217719988370-0-cib.jpg_sum.jpg",
        "name": "简款彩链大眼—粉色",
        "priceCny": 2.6,
        "stock": 68545
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01dsYAeH2BhW74DBA7q_!!2217719988370-0-cib.jpg_sum.jpg",
        "name": "简款彩链大眼—白色",
        "priceCny": 2.6,
        "stock": 97918
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01eAtZIi2BhW72uo4Z6_!!2217719988370-0-cib.jpg_sum.jpg",
        "name": "简款彩链大眼—黄色",
        "priceCny": 2.6,
        "stock": 80732
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013jq2xU2BhW72v1MfP_!!2217719988370-0-cib.jpg_sum.jpg",
        "name": "简款彩链大眼—紫色",
        "priceCny": 2.6,
        "stock": 67083
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01EvEl8W2BhW73GwWfu_!!2217719988370-0-cib.jpg_sum.jpg",
        "name": "简款彩链大眼—随机一只",
        "priceCny": 2.5,
        "stock": 4818
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015ufnrk2BhW73gFGP8_!!2217719988370-0-cib.jpg_sum.jpg",
        "name": "简款彩链大眼—6种颜色各一只（6色齐全）",
        "priceCny": 16.8,
        "stock": 99446
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "毛绒"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣挂件"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "风格",
        "value": "可爱风"
      },
      {
        "name": "货号",
        "value": "1610"
      },
      {
        "name": "颜色",
        "value": "简款彩链大眼—蓝色,简款彩链大眼—绿色,简款彩链大眼—粉色,简款彩链大眼—白色,简款彩链大眼—黄色,简款彩链大眼—紫色,简款彩链大眼—随机一只,简款彩链大眼—6种颜色各一只（6色齐全）"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,同事,朋友,孩子,同学,恩师"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "圣诞节,情人节,春节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节"
      },
      {
        "name": "送礼用途",
        "value": "积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会"
      }
    ]
  },
  {
    "id": "1688-904047009791",
    "title": "手机贴膜刮卡弧形贴膜工具TPU水凝膜刮卡贴膜辅助刮板包镜布刮板",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市百雅轩科技有限公司\n\n材质: 普通膜\n贴膜类型: 全身膜\n贴膜特点: 全屏\n品牌: 中性\n颜色: 黑色\n尺寸: 9*5.5CM\n\n9*5.5CM: CNY 0.52, stock 8630\n\nSource: https://detail.1688.com/offer/904047009791.html",
    "price": 0.9,
    "compare_at_price": 0,
    "cost_per_item": 0.13,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/904047009791/01.webp",
    "images": [
      "assets/1688/904047009791/01.webp",
      "assets/1688/904047009791/02.webp",
      "assets/1688/904047009791/03.webp",
      "assets/1688/904047009791/04.webp",
      "assets/1688/904047009791/05.webp",
      "assets/1688/904047009791/06.webp"
    ],
    "vendor": "深圳市百雅轩科技有限公司",
    "sku": "1688-904047009791",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/904047009791.html",
    "source_currency": "CNY",
    "source_price": 0.52,
    "source_variants": [
      {
        "image": "",
        "name": "9*5.5CM",
        "priceCny": 0.52,
        "stock": 8630
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "普通膜"
      },
      {
        "name": "贴膜类型",
        "value": "全身膜"
      },
      {
        "name": "贴膜特点",
        "value": "全屏"
      },
      {
        "name": "品牌",
        "value": "中性"
      },
      {
        "name": "颜色",
        "value": "黑色"
      },
      {
        "name": "尺寸",
        "value": "9*5.5CM"
      }
    ]
  },
  {
    "id": "1688-905020913177",
    "title": "小礼品做活动地推地摊可爱毛绒公仔挂件挂饰玩偶背包饰钥匙扣配饰",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市驸马贸易有限公司\n\n材质: 毛绒\n填充材质: 纤维棉\n毛绒分类: 超柔短毛绒\n是否多功能: 否\n包装方式: 散装\n品牌: 其它\n货号: 6666\n是否外贸: 否\n加工方式: 来样定制\n规格: 卡头包装特价款（公仔小款式随机）,混发（款式随机）,精美包装（公仔大款式随机）,纯公仔挂件盲袋【12cm*9cm】,F-5727,F-5728,F-5729,F-5730,F-5731,F-5732,F-5733,F-5734,3565,3566,3567,3568,3569,3570,3571,3572,3573,3574,3575,3576,3577,3578,3579,3580,3581,3582,3583,3584,3585,3586,3587,3588,3589,3590,3591,3591-1,3677,3678,3679,3730,F-5311,F-5310,4026【会叫唧唧叫】,F-4027(会吱吱叫）,F-5382,F-5383,F-5384,F-5385,F-5387,F-5388,F-5389,F-5389-1,F-5389-2,F-5389-3,F-5389-4,F-5455,F-5435,F-5402,F-5404,F-5400,F-5391,F-5392,F-5393,F-5394,F-5395,F-5396,F-5397,F-5398,F-5399,F-5355,F-5361,F-5354,F-5358,F-5357,F-5363,F-5407,F-5366,F-5365,F-5411,F-5376,F-5377,F-5364,F-5410,F-5408,F-5409,F-5406,黄星星珠链(会吱吱叫）,4024,4006,F-4270(汉堡）,F-4271（鸡腿）,F-4272（吐司）,F-4273（薯条）,F-4049,F-4050,F-4051,F-4052,F-4053,小粉蛇,5120,5121,5122,5123,5124,5127,5128,5125,F-4025,5360,5100,F-3939(香蕉）,F-4776,F-4851,F-4852,F-4853,F-4854,F-4503,F-4054,F-4056,F-4057,F-4058,F-4059,4005【钥匙扣】,F-4195(黄）,F-4196（橙）,F-4197（蓝）,F-4198（粉）,F-4199（紫）,F-4200（绿）,黄星星钥匙扣(会吱吱叫）,3911【钥匙扣】,3913【钥匙扣】,3909【钥匙扣】,3914【钥匙扣】,3912【钥匙扣】,3505【钥匙扣】,3731【钥匙扣】,3511【钥匙扣】,3488-A【钥匙扣】,3502【钥匙扣】,3504【钥匙扣】,3493【钥匙扣】,3489【钥匙扣】,3492【钥匙扣】,3512【钥匙扣】,3497【钥匙扣】,3487【钥匙扣】,3496【钥匙扣】,3503【钥匙扣】,3510【钥匙扣】,3488【钥匙扣】,3657【钥匙扣】,3659【钥匙扣】,3658【钥匙扣,3495,3719【钥匙扣】,3720【钥匙扣】,3721【钥匙扣】,3723【钥匙扣】,3724【钥匙扣】,3725【钥匙扣】,F-4519,F-4521,F-4710,F-4711,F-4306黄背包猫(会吱吱叫）,F-4307橙背包猫(会吱吱叫）,F-4308红背包猫(会吱吱叫）,F-4309白背包猫(会吱吱叫）,F-3726,F-3727,F-3729,小怪兽粉色,小怪兽蓝色,小怪兽紫色,小怪兽白色,小怪兽黄色,F-5156,F-5157,F-5160\n加工定制: 否\n进口地: 日韩\n造型类别: 动物\n产地: 浙江\n系列: 其他\n形象: 其他\n是否有导购视频: 是\n产品尺寸: 详情\n是否专供外贸: 否\n是否跨境出口专供货源: 否\n主要销售地区: 其他\n适用年龄: 青年（15-35岁）\n主要下游平台: 亚马逊,wish,速卖通,独立站,LAZADA\n有可授权的自有品牌: 否\n适用性别: 男女通用\n\n卡头包装特价款（公仔小款式随机）: CNY 0.75, stock 681862\n混发（款式随机）: CNY 1.29, stock 673133\n精美包装（公仔大款式随机）: CNY 1.59, stock 691826\n纯公仔挂件盲袋【12cm*9cm】: CNY 1.20, stock 676123\nF-5727: CNY 1.50, stock 677010\nF-5728: CNY 1.50, stock 69898\nF-5729: CNY 1.50, stock 69870\nF-5730: CNY 1.50, stock 69921\nF-5731: CNY 1.50, stock 69951\nF-5732: CNY 1.50, stock 69890\nF-5733: CNY 1.50, stock 69945\nF-5734: CNY 1.50, stock 69949\n3565: CNY 1.20, stock 980100\n3566: CNY 1.20, stock 983101\n3567: CNY 1.10, stock 977625\n3568: CNY 1.50, stock 985460\n3569: CNY 1.50, stock 984620\n3570: CNY 0.65, stock 449726\n3571: CNY 1.10, stock 976736\n3572: CNY 0.65, stock 973793\n3573: CNY 1.10, stock 969960\n3574: CNY 1.20, stock 984133\n3575: CNY 0.90, stock 955374\n3576: CNY 0.95, stock 969316\n3577: CNY 1.30, stock 975118\n3578: CNY 0.90, stock 980529\n3579: CNY 1.20, stock 977081\n3580: CNY 1.20, stock 977406\n3581: CNY 1.20, stock 977990\n3582: CNY 1.20, stock 977645\n3583: CNY 0.65, stock 977538\n3584: CNY 1.20, stock 960987\n3585: CNY 1.40, stock 977918\n3586: CNY 1.40, stock 979343\n3587: CNY 1.30, stock 972219\n3588: CNY 1.70, stock 982359\n3589: CNY 1.20, stock 971048\n3590: CNY 1.20, stock 940564\n3591: CNY 1.60, stock 981178\n3591-1: CNY 1.00, stock 973345\n3677: CNY 0.85, stock 974305\n3678: CNY 0.65, stock 179020\n3679: CNY 0.65, stock 819886\n3730: CNY 1.10, stock 917551\nF-5311: CNY 0.60, stock 858173\nF-5310: CNY 0.60, stock 982460\n4026【会叫唧唧叫】: CNY 1.60, stock 697189\nF-4027(会吱吱叫）: CNY 1.80, stock 696648\nF-5382: CNY 1.80, stock 977226\nF-5383: CNY 1.90, stock 686351\nF-5384: CNY 1.30, stock 687155\nF-5385: CNY 1.40, stock 687391\nF-5387: CNY 1.20, stock 699253\nF-5388: CNY 1.50, stock 693742\nF-5389: CNY 1.50, stock 693774\nF-5389-1: CNY 1.40, stock 686136\nF-5389-2: CNY 1.40, stock 686059\nF-5389-3: CNY 1.50, stock 685691\nF-5389-4: CNY 1.50, stock 686003\nF-5455: CNY 1.60, stock 685834\nF-5435: CNY 1.20, stock 699316\nF-5402: CNY 1.90, stock 686402\nF-5404: CNY 0.99, stock 699262\nF-5400: CNY 1.20, stock 686438\nF-5391: CNY 0.99, stock 684998\nF-5392: CNY 1.20, stock 686212\nF-5393: CNY 1.10, stock 685790\nF-5394: CNY 1.10, stock 686447\nF-5395: CNY 1.30, stock 686349\nF-5396: CNY 0.99, stock 685909\nF-5397: CNY 0.99, stock 685742\nF-5398: CNY 0.99, stock 686286\nF-5399: CNY 0.99, stock 685523\nF-5355: CNY 0.95, stock 685880\nF-5361: CNY 1.10, stock 686013\nF-5354: CNY 0.95, stock 698967\nF-5358: CNY 0.95, stock 699420\nF-5357: CNY 0.95, stock 699055\nF-5363: CNY 1.30, stock 699553\nF-5407: CNY 0.99, stock 684873\nF-5366: CNY 1.30, stock 686269\nF-5365: CNY 1.30, stock 686279\nF-5411: CNY 1.10, stock 685848\nF-5376: CNY 1.30, stock 686352\nF-5377: CNY 1.30, stock 686438\nF-5364: CNY 1.30, stock 686395\nF-5410: CNY 1.10, stock 686072\nF-5408: CNY 0.99, stock 686348\nF-5409: CNY 0.99, stock 69936\nF-5406: CNY 0.99, stock 858294\n黄星星珠链(会吱吱叫）: CNY 1.25, stock 969572\n4024: CNY 1.40, stock 882969\n4006: CNY 1.40, stock 889846\nF-4270(汉堡）: CNY 1.20, stock 958736\nF-4271（鸡腿）: CNY 1.20, stock 958303\nF-4272（吐司）: CNY 1.20, stock 962361\nF-4273（薯条）: CNY 1.20, stock 950009\nF-4049: CNY 1.30, stock 966824\nF-4050: CNY 1.40, stock 978630\nF-4051: CNY 1.30, stock 987552\nF-4052: CNY 1.30, stock 980374\nF-4053: CNY 1.40, stock 985357\n小粉蛇: CNY 1.20, stock 975114\n5120: CNY 1.10, stock 969548\n5121: CNY 1.10, stock 976584\n5122: CNY 1.10, stock 976402\n5123: CNY 1.10, stock 973135\n5124: CNY 1.10, stock 974379\n5127: CNY 1.30, stock 976119\n5128: CNY 1.30, stock 980634\n5125: CNY 1.90, stock 979530\nF-4025: CNY 1.70, stock 979506\n5360: CNY 0.70, stock 980133\n5100: CNY 1.90, stock 990612\nF-3939(香蕉）: CNY 1.56, stock 966828\nF-4776: CNY 1.90, stock 698708\nF-4851: CNY 1.90, stock 698962\nF-4852: CNY 1.90, stock 699393\nF-4853: CNY 1.90, stock 698969\nF-4854: CNY 1.90, stock 699144\nF-4503: CNY 1.90, stock 983859\nF-4054: CNY 1.66, stock 985542\nF-4056: CNY 1.66, stock 986415\nF-4057: CNY 1.66, stock 985161\nF-4058: CNY 1.66, stock 986716\nF-4059: CNY 1.66, stock 699575\n4005【钥匙扣】: CNY 1.60, stock 987720\nF-4195(黄）: CNY 1.90, stock 963872\nF-4196（橙）: CNY 1.90, stock 979198\nF-4197（蓝）: CNY 1.90, stock 983990\nF-4198（粉）: CNY 1.90, stock 977437\nF-4199（紫）: CNY 1.90, stock 965662\nF-4200（绿）: CNY 1.90, stock 982619\n黄星星钥匙扣(会吱吱叫）: CNY 1.50, stock 972770\n3911【钥匙扣】: CNY 2.50, stock 952639\n3913【钥匙扣】: CNY 2.90, stock 968572\n3909【钥匙扣】: CNY 2.50, stock 980289\n3914【钥匙扣】: CNY 2.90, stock 954485\n3912【钥匙扣】: CNY 2.20, stock 973394\n3505【钥匙扣】: CNY 1.70, stock 927964\n3731【钥匙扣】: CNY 1.50, stock 668970\n3511【钥匙扣】: CNY 1.60, stock 983073\n3488-A【钥匙扣】: CNY 2.00, stock 982086\n3502【钥匙扣】: CNY 1.45, stock 417972\n3504【钥匙扣】: CNY 1.50, stock 6888348\n3493【钥匙扣】: CNY 1.70, stock 4945421\n3489【钥匙扣】: CNY 1.80, stock 367066\n3492【钥匙扣】: CNY 1.50, stock 517512\n3512【钥匙扣】: CNY 1.50, stock 514559\n3497【钥匙扣】: CNY 1.70, stock 334723\n3487【钥匙扣】: CNY 2.00, stock 514761\n3496【钥匙扣】: CNY 1.80, stock 464059\n3503【钥匙扣】: CNY 1.60, stock 361651\n3510【钥匙扣】: CNY 1.60, stock 362564\n3488【钥匙扣】: CNY 2.00, stock 677658\n3657【钥匙扣】: CNY 2.00, stock 626295\n3659【钥匙扣】: CNY 1.55, stock 124078\n3658【钥匙扣: CNY 2.00, stock 746363\n3495: CNY 1.80, stock 942470\n3719【钥匙扣】: CNY 1.50, stock 868545\n3720【钥匙扣】: CNY 2.00, stock 770875\n3721【钥匙扣】: CNY 2.00, stock 877347\n3723【钥匙扣】: CNY 1.80, stock 953602\n3724【钥匙扣】: CNY 2.00, stock 840070\n3725【钥匙扣】: CNY 2.00, stock 765411\nF-4519: CNY 1.70, stock 687801\nF-4521: CNY 1.70, stock 98591\nF-4710: CNY 1.60, stock 979421\nF-4711: CNY 1.60, stock 979565\nF-4306黄背包猫(会吱吱叫）: CNY 4.90, stock 987551\nF-4307橙背包猫(会吱吱叫）: CNY 4.90, stock 987780\nF-4308红背包猫(会吱吱叫）: CNY 4.90, stock 987790\nF-4309白背包猫(会吱吱叫）: CNY 4.90, stock 984524\nF-3726: CNY 2.50, stock 987998\nF-3727: CNY 2.50, stock 987270\nF-3729: CNY 2.90, stock 986061\n小怪兽粉色: CNY 2.19, stock 983651\n小怪兽蓝色: CNY 2.19, stock 985559\n小怪兽紫色: CNY 2.19, stock 982220\n小怪兽白色: CNY 2.19, stock 985088\n小怪兽黄色: CNY 2.19, stock 984349\nF-5156: CNY 1.30, stock 699631\nF-5157: CNY 1.30, stock 699672\nF-5160: CNY 1.30, stock 699635\n\nSource: https://detail.1688.com/offer/905020913177.html",
    "price": 1.04,
    "compare_at_price": 0,
    "cost_per_item": 0.15,
    "stock": 82,
    "sales": 0,
    "published": false,
    "image": "assets/1688/905020913177/01.webp",
    "images": [
      "assets/1688/905020913177/01.webp",
      "assets/1688/905020913177/02.webp",
      "assets/1688/905020913177/03.webp",
      "assets/1688/905020913177/04.webp",
      "assets/1688/905020913177/05.webp",
      "assets/1688/905020913177/06.webp",
      "assets/1688/905020913177/07.webp",
      "assets/1688/905020913177/08.webp",
      "assets/1688/905020913177/09.webp",
      "assets/1688/905020913177/10.webp",
      "assets/1688/905020913177/11.webp",
      "assets/1688/905020913177/12.webp",
      "assets/1688/905020913177/13.webp",
      "assets/1688/905020913177/14.webp",
      "assets/1688/905020913177/15.webp",
      "assets/1688/905020913177/16.webp",
      "assets/1688/905020913177/17.webp",
      "assets/1688/905020913177/18.webp",
      "assets/1688/905020913177/19.webp",
      "assets/1688/905020913177/20.webp",
      "assets/1688/905020913177/21.webp",
      "assets/1688/905020913177/22.webp",
      "assets/1688/905020913177/23.webp",
      "assets/1688/905020913177/24.webp",
      "assets/1688/905020913177/25.webp",
      "assets/1688/905020913177/26.webp",
      "assets/1688/905020913177/27.webp",
      "assets/1688/905020913177/28.webp",
      "assets/1688/905020913177/29.webp",
      "assets/1688/905020913177/30.webp",
      "assets/1688/905020913177/31.webp",
      "assets/1688/905020913177/32.webp",
      "assets/1688/905020913177/33.webp",
      "assets/1688/905020913177/34.webp",
      "assets/1688/905020913177/35.webp",
      "assets/1688/905020913177/36.webp",
      "assets/1688/905020913177/37.webp",
      "assets/1688/905020913177/38.webp",
      "assets/1688/905020913177/39.webp",
      "assets/1688/905020913177/40.webp",
      "assets/1688/905020913177/41.webp",
      "assets/1688/905020913177/42.webp",
      "assets/1688/905020913177/43.webp",
      "assets/1688/905020913177/44.webp",
      "assets/1688/905020913177/45.webp",
      "assets/1688/905020913177/46.webp",
      "assets/1688/905020913177/47.webp",
      "assets/1688/905020913177/48.webp",
      "assets/1688/905020913177/49.webp",
      "assets/1688/905020913177/50.webp",
      "assets/1688/905020913177/51.webp",
      "assets/1688/905020913177/52.webp",
      "assets/1688/905020913177/53.webp",
      "assets/1688/905020913177/54.webp",
      "assets/1688/905020913177/55.webp",
      "assets/1688/905020913177/56.webp",
      "assets/1688/905020913177/57.webp",
      "assets/1688/905020913177/58.webp",
      "assets/1688/905020913177/59.webp",
      "assets/1688/905020913177/60.webp",
      "assets/1688/905020913177/61.webp",
      "assets/1688/905020913177/62.webp",
      "assets/1688/905020913177/63.webp",
      "assets/1688/905020913177/64.webp",
      "assets/1688/905020913177/65.webp",
      "assets/1688/905020913177/66.webp",
      "assets/1688/905020913177/67.webp",
      "assets/1688/905020913177/68.webp",
      "assets/1688/905020913177/69.webp",
      "assets/1688/905020913177/70.webp",
      "assets/1688/905020913177/71.webp",
      "assets/1688/905020913177/72.webp",
      "assets/1688/905020913177/73.webp",
      "assets/1688/905020913177/74.webp",
      "assets/1688/905020913177/75.webp",
      "assets/1688/905020913177/76.webp",
      "assets/1688/905020913177/77.webp",
      "assets/1688/905020913177/78.webp",
      "assets/1688/905020913177/79.webp",
      "assets/1688/905020913177/80.webp",
      "assets/1688/905020913177/81.webp",
      "assets/1688/905020913177/82.webp",
      "assets/1688/905020913177/83.webp",
      "assets/1688/905020913177/84.webp",
      "assets/1688/905020913177/85.webp",
      "assets/1688/905020913177/86.webp",
      "assets/1688/905020913177/87.webp",
      "assets/1688/905020913177/88.webp",
      "assets/1688/905020913177/89.webp",
      "assets/1688/905020913177/90.webp",
      "assets/1688/905020913177/91.webp",
      "assets/1688/905020913177/92.webp",
      "assets/1688/905020913177/93.webp",
      "assets/1688/905020913177/94.webp",
      "assets/1688/905020913177/95.webp",
      "assets/1688/905020913177/96.webp",
      "assets/1688/905020913177/97.webp",
      "assets/1688/905020913177/98.webp",
      "assets/1688/905020913177/99.webp",
      "assets/1688/905020913177/100.webp",
      "assets/1688/905020913177/101.webp",
      "assets/1688/905020913177/102.webp",
      "assets/1688/905020913177/103.webp",
      "assets/1688/905020913177/104.webp",
      "assets/1688/905020913177/105.webp",
      "assets/1688/905020913177/106.webp",
      "assets/1688/905020913177/107.webp",
      "assets/1688/905020913177/108.webp",
      "assets/1688/905020913177/109.webp",
      "assets/1688/905020913177/110.webp",
      "assets/1688/905020913177/111.webp",
      "assets/1688/905020913177/112.webp",
      "assets/1688/905020913177/113.webp",
      "assets/1688/905020913177/114.webp",
      "assets/1688/905020913177/115.webp",
      "assets/1688/905020913177/116.webp",
      "assets/1688/905020913177/117.webp",
      "assets/1688/905020913177/118.webp",
      "assets/1688/905020913177/119.webp",
      "assets/1688/905020913177/120.webp",
      "assets/1688/905020913177/121.webp",
      "assets/1688/905020913177/122.webp",
      "assets/1688/905020913177/123.webp",
      "assets/1688/905020913177/124.webp",
      "assets/1688/905020913177/125.webp",
      "assets/1688/905020913177/126.webp",
      "assets/1688/905020913177/127.webp",
      "assets/1688/905020913177/128.webp",
      "assets/1688/905020913177/129.webp",
      "assets/1688/905020913177/130.webp",
      "assets/1688/905020913177/131.webp",
      "assets/1688/905020913177/132.webp",
      "assets/1688/905020913177/133.webp",
      "assets/1688/905020913177/134.webp",
      "assets/1688/905020913177/135.webp",
      "assets/1688/905020913177/136.webp",
      "assets/1688/905020913177/137.webp",
      "assets/1688/905020913177/138.webp",
      "assets/1688/905020913177/139.webp",
      "assets/1688/905020913177/140.webp",
      "assets/1688/905020913177/141.webp",
      "assets/1688/905020913177/142.webp",
      "assets/1688/905020913177/143.webp",
      "assets/1688/905020913177/144.webp",
      "assets/1688/905020913177/145.webp",
      "assets/1688/905020913177/146.webp",
      "assets/1688/905020913177/147.webp",
      "assets/1688/905020913177/148.webp",
      "assets/1688/905020913177/149.webp",
      "assets/1688/905020913177/150.webp",
      "assets/1688/905020913177/151.webp",
      "assets/1688/905020913177/152.webp",
      "assets/1688/905020913177/153.webp",
      "assets/1688/905020913177/154.webp",
      "assets/1688/905020913177/155.webp",
      "assets/1688/905020913177/156.webp",
      "assets/1688/905020913177/157.webp",
      "assets/1688/905020913177/158.webp",
      "assets/1688/905020913177/159.webp",
      "assets/1688/905020913177/160.webp",
      "assets/1688/905020913177/161.webp",
      "assets/1688/905020913177/162.webp",
      "assets/1688/905020913177/163.webp",
      "assets/1688/905020913177/164.webp",
      "assets/1688/905020913177/165.webp",
      "assets/1688/905020913177/166.webp",
      "assets/1688/905020913177/167.webp",
      "assets/1688/905020913177/168.webp",
      "assets/1688/905020913177/169.webp",
      "assets/1688/905020913177/170.webp",
      "assets/1688/905020913177/171.webp",
      "assets/1688/905020913177/172.webp",
      "assets/1688/905020913177/173.webp",
      "assets/1688/905020913177/174.webp",
      "assets/1688/905020913177/175.webp",
      "assets/1688/905020913177/176.webp",
      "assets/1688/905020913177/177.webp",
      "assets/1688/905020913177/178.webp",
      "assets/1688/905020913177/179.webp",
      "assets/1688/905020913177/180.webp",
      "assets/1688/905020913177/181.webp",
      "assets/1688/905020913177/182.webp",
      "assets/1688/905020913177/183.webp",
      "assets/1688/905020913177/184.webp",
      "assets/1688/905020913177/185.webp",
      "assets/1688/905020913177/186.webp",
      "assets/1688/905020913177/187.webp",
      "assets/1688/905020913177/188.webp",
      "assets/1688/905020913177/189.webp",
      "assets/1688/905020913177/190.webp",
      "assets/1688/905020913177/191.webp",
      "assets/1688/905020913177/192.webp",
      "assets/1688/905020913177/193.webp",
      "assets/1688/905020913177/194.webp",
      "assets/1688/905020913177/195.webp",
      "assets/1688/905020913177/196.webp",
      "assets/1688/905020913177/197.webp",
      "assets/1688/905020913177/198.webp",
      "assets/1688/905020913177/199.webp",
      "assets/1688/905020913177/200.webp",
      "assets/1688/905020913177/201.webp",
      "assets/1688/905020913177/202.webp",
      "assets/1688/905020913177/203.webp",
      "assets/1688/905020913177/204.webp",
      "assets/1688/905020913177/205.webp",
      "assets/1688/905020913177/206.webp",
      "assets/1688/905020913177/207.webp",
      "assets/1688/905020913177/208.webp",
      "assets/1688/905020913177/209.webp",
      "assets/1688/905020913177/210.webp",
      "assets/1688/905020913177/211.webp",
      "assets/1688/905020913177/212.webp",
      "assets/1688/905020913177/213.webp",
      "assets/1688/905020913177/214.webp",
      "assets/1688/905020913177/215.webp",
      "assets/1688/905020913177/216.webp",
      "assets/1688/905020913177/217.webp",
      "assets/1688/905020913177/218.webp",
      "assets/1688/905020913177/219.webp",
      "assets/1688/905020913177/220.webp",
      "assets/1688/905020913177/221.webp",
      "assets/1688/905020913177/222.webp",
      "assets/1688/905020913177/223.webp",
      "assets/1688/905020913177/224.webp",
      "assets/1688/905020913177/225.webp",
      "assets/1688/905020913177/226.webp",
      "assets/1688/905020913177/227.webp",
      "assets/1688/905020913177/228.webp",
      "assets/1688/905020913177/229.webp",
      "assets/1688/905020913177/230.webp",
      "assets/1688/905020913177/231.webp",
      "assets/1688/905020913177/232.webp",
      "assets/1688/905020913177/233.webp",
      "assets/1688/905020913177/234.webp",
      "assets/1688/905020913177/235.webp",
      "assets/1688/905020913177/236.webp",
      "assets/1688/905020913177/237.webp",
      "assets/1688/905020913177/238.webp",
      "assets/1688/905020913177/239.webp",
      "assets/1688/905020913177/240.webp",
      "assets/1688/905020913177/241.webp",
      "assets/1688/905020913177/242.webp",
      "assets/1688/905020913177/243.webp",
      "assets/1688/905020913177/244.webp",
      "assets/1688/905020913177/245.webp",
      "assets/1688/905020913177/246.webp",
      "assets/1688/905020913177/247.webp",
      "assets/1688/905020913177/248.webp",
      "assets/1688/905020913177/249.webp",
      "assets/1688/905020913177/250.webp",
      "assets/1688/905020913177/251.webp",
      "assets/1688/905020913177/252.webp",
      "assets/1688/905020913177/253.webp",
      "assets/1688/905020913177/254.webp",
      "assets/1688/905020913177/255.webp",
      "assets/1688/905020913177/256.webp",
      "assets/1688/905020913177/257.webp",
      "assets/1688/905020913177/258.webp",
      "assets/1688/905020913177/259.webp",
      "assets/1688/905020913177/260.webp",
      "assets/1688/905020913177/261.webp",
      "assets/1688/905020913177/262.webp",
      "assets/1688/905020913177/263.webp",
      "assets/1688/905020913177/264.webp",
      "assets/1688/905020913177/265.webp",
      "assets/1688/905020913177/266.webp",
      "assets/1688/905020913177/267.webp",
      "assets/1688/905020913177/268.webp",
      "assets/1688/905020913177/269.webp",
      "assets/1688/905020913177/270.webp",
      "assets/1688/905020913177/271.webp",
      "assets/1688/905020913177/272.webp",
      "assets/1688/905020913177/273.webp",
      "assets/1688/905020913177/274.webp",
      "assets/1688/905020913177/275.webp",
      "assets/1688/905020913177/276.webp",
      "assets/1688/905020913177/277.webp",
      "assets/1688/905020913177/278.webp",
      "assets/1688/905020913177/279.webp",
      "assets/1688/905020913177/280.webp",
      "assets/1688/905020913177/281.webp",
      "assets/1688/905020913177/282.webp",
      "assets/1688/905020913177/283.webp",
      "assets/1688/905020913177/284.webp",
      "assets/1688/905020913177/285.webp",
      "assets/1688/905020913177/286.webp",
      "assets/1688/905020913177/287.webp",
      "assets/1688/905020913177/288.webp",
      "assets/1688/905020913177/289.webp",
      "assets/1688/905020913177/290.webp",
      "assets/1688/905020913177/291.webp",
      "assets/1688/905020913177/292.webp",
      "assets/1688/905020913177/293.webp",
      "assets/1688/905020913177/294.webp",
      "assets/1688/905020913177/295.webp",
      "assets/1688/905020913177/296.webp",
      "assets/1688/905020913177/297.webp",
      "assets/1688/905020913177/298.webp",
      "assets/1688/905020913177/299.webp",
      "assets/1688/905020913177/300.webp",
      "assets/1688/905020913177/301.webp",
      "assets/1688/905020913177/302.webp",
      "assets/1688/905020913177/303.webp",
      "assets/1688/905020913177/304.webp",
      "assets/1688/905020913177/305.webp",
      "assets/1688/905020913177/306.webp",
      "assets/1688/905020913177/307.webp",
      "assets/1688/905020913177/308.webp",
      "assets/1688/905020913177/309.webp",
      "assets/1688/905020913177/310.webp",
      "assets/1688/905020913177/311.webp",
      "assets/1688/905020913177/312.webp",
      "assets/1688/905020913177/313.webp",
      "assets/1688/905020913177/314.webp",
      "assets/1688/905020913177/315.webp",
      "assets/1688/905020913177/316.webp",
      "assets/1688/905020913177/317.webp",
      "assets/1688/905020913177/318.webp",
      "assets/1688/905020913177/319.webp",
      "assets/1688/905020913177/320.webp",
      "assets/1688/905020913177/321.webp",
      "assets/1688/905020913177/322.webp",
      "assets/1688/905020913177/323.webp",
      "assets/1688/905020913177/324.webp",
      "assets/1688/905020913177/325.webp",
      "assets/1688/905020913177/326.webp",
      "assets/1688/905020913177/327.webp",
      "assets/1688/905020913177/328.webp",
      "assets/1688/905020913177/329.webp",
      "assets/1688/905020913177/330.webp",
      "assets/1688/905020913177/331.webp",
      "assets/1688/905020913177/332.webp",
      "assets/1688/905020913177/333.webp",
      "assets/1688/905020913177/334.webp",
      "assets/1688/905020913177/335.webp",
      "assets/1688/905020913177/336.webp",
      "assets/1688/905020913177/337.webp",
      "assets/1688/905020913177/338.webp",
      "assets/1688/905020913177/339.webp",
      "assets/1688/905020913177/340.webp",
      "assets/1688/905020913177/341.webp",
      "assets/1688/905020913177/342.webp",
      "assets/1688/905020913177/343.webp",
      "assets/1688/905020913177/344.webp",
      "assets/1688/905020913177/345.webp",
      "assets/1688/905020913177/346.webp",
      "assets/1688/905020913177/347.webp",
      "assets/1688/905020913177/348.webp",
      "assets/1688/905020913177/349.webp",
      "assets/1688/905020913177/350.webp",
      "assets/1688/905020913177/351.webp",
      "assets/1688/905020913177/352.webp",
      "assets/1688/905020913177/353.webp",
      "assets/1688/905020913177/354.webp",
      "assets/1688/905020913177/355.webp",
      "assets/1688/905020913177/356.webp",
      "assets/1688/905020913177/357.webp",
      "assets/1688/905020913177/358.webp",
      "assets/1688/905020913177/359.webp",
      "assets/1688/905020913177/360.webp",
      "assets/1688/905020913177/361.webp",
      "assets/1688/905020913177/362.webp",
      "assets/1688/905020913177/363.webp",
      "assets/1688/905020913177/364.webp",
      "assets/1688/905020913177/365.webp",
      "assets/1688/905020913177/366.webp",
      "assets/1688/905020913177/367.webp",
      "assets/1688/905020913177/368.webp",
      "assets/1688/905020913177/369.webp",
      "assets/1688/905020913177/370.webp",
      "assets/1688/905020913177/371.webp",
      "assets/1688/905020913177/372.webp",
      "assets/1688/905020913177/373.webp"
    ],
    "vendor": "义乌市驸马贸易有限公司",
    "sku": "1688-905020913177",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/905020913177.html",
    "source_currency": "CNY",
    "source_price": 0.6,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01mBqBWo1ULy5dsp8Iz_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "卡头包装特价款（公仔小款式随机）",
        "priceCny": 0.75,
        "stock": 681862
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qIsyWf1ULy3ueBXaZ_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "混发（款式随机）",
        "priceCny": 1.29,
        "stock": 673133
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IsQqWH1ULy3vWcSJ6_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "精美包装（公仔大款式随机）",
        "priceCny": 1.59,
        "stock": 691826
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01wKVtRU1ULy2xl1IT4_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "纯公仔挂件盲袋【12cm*9cm】",
        "priceCny": 1.2,
        "stock": 676123
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01CsfD7s1ULy5uNFzj3_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5727",
        "priceCny": 1.5,
        "stock": 677010
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01saEVXY1ULy5twrQPN_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5728",
        "priceCny": 1.5,
        "stock": 69898
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01QzZ1Qv1ULy5tmmA6X_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5729",
        "priceCny": 1.5,
        "stock": 69870
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013pNHWI1ULy5u4NdQZ_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5730",
        "priceCny": 1.5,
        "stock": 69921
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01FbpbFB1ULy5uKqVb8_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5731",
        "priceCny": 1.5,
        "stock": 69951
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01NE0yeO1ULy5vUueqs_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5732",
        "priceCny": 1.5,
        "stock": 69890
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015XBSKQ1ULy5tvSve6_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5733",
        "priceCny": 1.5,
        "stock": 69945
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013s1gr81ULy5twu2jF_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5734",
        "priceCny": 1.5,
        "stock": 69949
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01XWw2ZE1ULy0CFkhVv_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3565",
        "priceCny": 1.2,
        "stock": 980100
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01c9vrnR1ULy0BL8dYj_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3566",
        "priceCny": 1.2,
        "stock": 983101
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01UrBNxq1ULy0AxZNhF_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3567",
        "priceCny": 1.1,
        "stock": 977625
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01e78klR1ULy09kGVIG_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3568",
        "priceCny": 1.5,
        "stock": 985460
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ET9vNH1ULy09yzve5_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3569",
        "priceCny": 1.5,
        "stock": 984620
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WcVJxq1ULy0AeAIxp_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3570",
        "priceCny": 0.65,
        "stock": 449726
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01v9ZtQi1ULy0Akh9gq_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3571",
        "priceCny": 1.1,
        "stock": 976736
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01HrJmFf1ULy0BNj9jD_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3572",
        "priceCny": 0.65,
        "stock": 973793
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01DTKrdD1ULy08qbFTl_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3573",
        "priceCny": 1.1,
        "stock": 969960
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01xP4tUi1ULy0AkeGsZ_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3574",
        "priceCny": 1.2,
        "stock": 984133
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01fdH8Vc1ULy0Ae6x3O_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3575",
        "priceCny": 0.9,
        "stock": 955374
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WVL65j1ULy09ztb60_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3576",
        "priceCny": 0.95,
        "stock": 969316
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qiuPos1ULy0Ae6Lcz_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3577",
        "priceCny": 1.3,
        "stock": 975118
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01CoRWBc1ULy09z0jY2_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3578",
        "priceCny": 0.9,
        "stock": 980529
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01CjRBCJ1ULy0AkgYJB_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3579",
        "priceCny": 1.2,
        "stock": 977081
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN017rjyXJ1ULy0CFjYp1_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3580",
        "priceCny": 1.2,
        "stock": 977406
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN017LprSJ1ULy088rHJH_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3581",
        "priceCny": 1.2,
        "stock": 977990
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01vfdhG11ULy0AkhpHL_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3582",
        "priceCny": 1.2,
        "stock": 977645
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01NjpkYg1ULy0BNjMD4_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3583",
        "priceCny": 0.65,
        "stock": 977538
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0116yCUL1ULy0AAiCE4_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3584",
        "priceCny": 1.2,
        "stock": 960987
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01D12vrj1ULy0AeAEoY_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3585",
        "priceCny": 1.4,
        "stock": 977918
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01lZecGM1ULy0AxZz7L_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3586",
        "priceCny": 1.4,
        "stock": 979343
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01szwTFt1ULy08qcn7e_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3587",
        "priceCny": 1.3,
        "stock": 972219
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01seVWAa1ULy0Ae8czm_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3588",
        "priceCny": 1.7,
        "stock": 982359
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qcVxfw1ULy088orbB_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3589",
        "priceCny": 1.2,
        "stock": 971048
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01hXpAR81ULy0AAiCDA_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3590",
        "priceCny": 1.2,
        "stock": 940564
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01GiW95J1ULy09ztKSc_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3591",
        "priceCny": 1.6,
        "stock": 981178
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01CTtQK71ULy0AAhG1F_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3591-1",
        "priceCny": 1,
        "stock": 973345
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015kSZOe1ULy088rTnI_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3677",
        "priceCny": 0.85,
        "stock": 974305
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01OU88Oq1ULy09yyBYy_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3678",
        "priceCny": 0.65,
        "stock": 179020
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01XCsExf1ULy0AxbzsT_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3679",
        "priceCny": 0.65,
        "stock": 819886
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN012PtVrO1ULy088scU6_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3730",
        "priceCny": 1.1,
        "stock": 917551
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01mhgLub1ULy5ZAI5EG_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5311",
        "priceCny": 0.6,
        "stock": 858173
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01hXvCSr1ULy4J5oyXV_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5310",
        "priceCny": 0.6,
        "stock": 982460
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01CWYv561ULy0AAfFHe_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "4026【会叫唧唧叫】",
        "priceCny": 1.6,
        "stock": 697189
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01dHffWf1ULy1Qd4TGs_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4027(会吱吱叫）",
        "priceCny": 1.8,
        "stock": 696648
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013zo4KY1ULy43X9hIR_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5382",
        "priceCny": 1.8,
        "stock": 977226
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016hzrOx1ULy434DgCK_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5383",
        "priceCny": 1.9,
        "stock": 686351
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01O22lTa1ULy42fs4mP_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5384",
        "priceCny": 1.3,
        "stock": 687155
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Mf5z441ULy43e7sL4_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5385",
        "priceCny": 1.4,
        "stock": 687391
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01MexBHX1ULy43XMFjt_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5387",
        "priceCny": 1.2,
        "stock": 699253
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01rgXWJ11ULy448pHDS_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5388",
        "priceCny": 1.5,
        "stock": 693742
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01QwhuWI1ULy43iohOq_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5389",
        "priceCny": 1.5,
        "stock": 693774
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qiT5IB1ULy4IQE84Y_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5389-1",
        "priceCny": 1.4,
        "stock": 686136
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01JWfnyz1ULy4JgDWjO_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5389-2",
        "priceCny": 1.4,
        "stock": 686059
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN011iEAnV1ULy4J6EAbT_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5389-3",
        "priceCny": 1.5,
        "stock": 685691
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01DpbWeh1ULy4IUUljt_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5389-4",
        "priceCny": 1.5,
        "stock": 686003
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01puq1yp1ULy4cyVZDw_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5455",
        "priceCny": 1.6,
        "stock": 685834
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01wjF5761ULy4b3NbFh_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5435",
        "priceCny": 1.2,
        "stock": 699316
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ikTABy1ULy4JHIvd3_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5402",
        "priceCny": 1.9,
        "stock": 686402
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01gTCXmk1ULy4fkPFBb_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5404",
        "priceCny": 0.99,
        "stock": 699262
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Nhjrnt1ULy4JKCgHH_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5400",
        "priceCny": 1.2,
        "stock": 686438
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN012UlCv61ULy4Jl523G_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5391",
        "priceCny": 0.99,
        "stock": 684998
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01VB2ilD1ULy4IUak9Z_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5392",
        "priceCny": 1.2,
        "stock": 686212
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01utGmLV1ULy4JV7BLn_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5393",
        "priceCny": 1.1,
        "stock": 685790
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qxh11g1ULy4JgNayO_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5394",
        "priceCny": 1.1,
        "stock": 686447
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN014QsDlc1ULy4DojT0C_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5395",
        "priceCny": 1.3,
        "stock": 686349
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01QKR9sQ1ULy4JHSSlL_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5396",
        "priceCny": 0.99,
        "stock": 685909
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01GcB8hT1ULy4J6MIFB_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5397",
        "priceCny": 0.99,
        "stock": 685742
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01lvOirA1ULy4J6MxrT_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5398",
        "priceCny": 0.99,
        "stock": 686286
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01mUdlvN1ULy4J69NxC_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5399",
        "priceCny": 0.99,
        "stock": 685523
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01iUg04j1ULy4J7IDhp_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5355",
        "priceCny": 0.95,
        "stock": 685880
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01AQrYWw1ULy4DonMQN_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5361",
        "priceCny": 1.1,
        "stock": 686013
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01QQF90A1ULy4b3UVqe_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5354",
        "priceCny": 0.95,
        "stock": 698967
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01MQE2z51ULy4goYCby_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5358",
        "priceCny": 0.95,
        "stock": 699420
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01DMmOI91ULy4gDIE3l_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5357",
        "priceCny": 0.95,
        "stock": 699055
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01FALapC1ULy4I7XRgs_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5363",
        "priceCny": 1.3,
        "stock": 699553
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ufumsG1ULy4J6zl3a_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5407",
        "priceCny": 0.99,
        "stock": 684873
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01H52Zei1ULy4J63pgh_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5366",
        "priceCny": 1.3,
        "stock": 686269
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01bR10wN1ULy4JHCHYc_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5365",
        "priceCny": 1.3,
        "stock": 686279
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01vbKnvU1ULy4JUo3C1_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5411",
        "priceCny": 1.1,
        "stock": 685848
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01lfdWZy1ULy4JHCDUc_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5376",
        "priceCny": 1.3,
        "stock": 686352
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ptdRMe1ULy4JUrCiR_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5377",
        "priceCny": 1.3,
        "stock": 686438
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PfX2pN1ULy4J67OC3_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5364",
        "priceCny": 1.3,
        "stock": 686395
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01D5qm6l1ULy4Jg85hh_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5410",
        "priceCny": 1.1,
        "stock": 686072
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01htUUQJ1ULy4Ilsljx_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5408",
        "priceCny": 0.99,
        "stock": 686348
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01cgkqPx1ULy4JHIG1d_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5409",
        "priceCny": 0.99,
        "stock": 69936
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01FBBdzJ1ULy4JgBJKc_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5406",
        "priceCny": 0.99,
        "stock": 858294
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01rTp0rp1ULy1Ktvqk4_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "黄星星珠链(会吱吱叫）",
        "priceCny": 1.25,
        "stock": 969572
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01v5Oa2r1ULy0Ae9pqg_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "4024",
        "priceCny": 1.4,
        "stock": 882969
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01FXmN5v1ULy0AxZaAd_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "4006",
        "priceCny": 1.4,
        "stock": 889846
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01wluwbV1ULy1Sa8jqb_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4270(汉堡）",
        "priceCny": 1.2,
        "stock": 958736
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01YYdm3p1ULy1Rpmq7s_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4271（鸡腿）",
        "priceCny": 1.2,
        "stock": 958303
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01NoYJoe1ULy1PEr4rn_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4272（吐司）",
        "priceCny": 1.2,
        "stock": 962361
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01R2vWvP1ULy1QszD4G_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4273（薯条）",
        "priceCny": 1.2,
        "stock": 950009
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01uveHyG1ULy1QtAYOT_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4049",
        "priceCny": 1.3,
        "stock": 966824
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01e9EvCq1ULy1RpxuaS_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4050",
        "priceCny": 1.4,
        "stock": 978630
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01OYKzI61ULy1RYu2nT_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4051",
        "priceCny": 1.3,
        "stock": 987552
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01kZpn8d1ULy1SaOqcI_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4052",
        "priceCny": 1.3,
        "stock": 980374
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01kiXLWj1ULy1PF0D2e_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4053",
        "priceCny": 1.4,
        "stock": 985357
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01LfgnXN1ULy1VRzD3N_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "小粉蛇",
        "priceCny": 1.2,
        "stock": 975114
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01se71zd1ULy3A9t9CH_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5120",
        "priceCny": 1.1,
        "stock": 969548
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN017W4cNT1ULy3BqN99D_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5121",
        "priceCny": 1.1,
        "stock": 976584
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01kWHg2T1ULy3BQ1Kx6_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5122",
        "priceCny": 1.1,
        "stock": 976402
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qXg8Fr1ULy39iZTKO_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5123",
        "priceCny": 1.1,
        "stock": 973135
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01OjD0hu1ULy3B3C2qw_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5124",
        "priceCny": 1.1,
        "stock": 974379
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01SLGp7p1ULy39ibp3z_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5127",
        "priceCny": 1.3,
        "stock": 976119
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qRs8ks1ULy3BqutDh_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5128",
        "priceCny": 1.3,
        "stock": 980634
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01fwX9xd1ULy39ikcCf_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5125",
        "priceCny": 1.9,
        "stock": 979530
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01c8VNG11ULy5efq8pn_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4025",
        "priceCny": 1.7,
        "stock": 979506
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016cXegx1ULy43mWl41_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5360",
        "priceCny": 0.7,
        "stock": 980133
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01oXW8Qr1ULy3BUahKl_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "5100",
        "priceCny": 1.9,
        "stock": 990612
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01GsBw6G1ULy1RIulcj_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-3939(香蕉）",
        "priceCny": 1.56,
        "stock": 966828
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01KPiPTg1ULy43Ovlq7_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4776",
        "priceCny": 1.9,
        "stock": 698708
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN017fMGsB1ULy2wn3eCj_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4851",
        "priceCny": 1.9,
        "stock": 698962
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01fBjUmo1ULy2vkZQVl_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4852",
        "priceCny": 1.9,
        "stock": 699393
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01zqwHCS1ULy2xYLgbO_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4853",
        "priceCny": 1.9,
        "stock": 698969
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016JeWvW1ULy2vi71n6_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4854",
        "priceCny": 1.9,
        "stock": 699144
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Mw1rlm1ULy1SaseoO_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4503",
        "priceCny": 1.9,
        "stock": 983859
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01zQGtUA1ULy3AAaZwy_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4054",
        "priceCny": 1.66,
        "stock": 985542
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01dsuptQ1ULy3AvlqaQ_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4056",
        "priceCny": 1.66,
        "stock": 986415
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01eIZBl01ULy3B4TsvY_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4057",
        "priceCny": 1.66,
        "stock": 985161
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01gyhiaa1ULy3AAcX14_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4058",
        "priceCny": 1.66,
        "stock": 986716
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01kOen9W1ULy3AkQsZS_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4059",
        "priceCny": 1.66,
        "stock": 699575
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01lM8oGw1ULy08qe8G3_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "4005【钥匙扣】",
        "priceCny": 1.6,
        "stock": 987720
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01vO9Da81ULy1RdmAjY_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4195(黄）",
        "priceCny": 1.9,
        "stock": 963872
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0169PSAv1ULy1REHQMw_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4196（橙）",
        "priceCny": 1.9,
        "stock": 979198
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN014QsP7u1ULy1RdmqPR_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4197（蓝）",
        "priceCny": 1.9,
        "stock": 983990
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01DG538q1ULy1QwMg1E_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4198（粉）",
        "priceCny": 1.9,
        "stock": 977437
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01FEDc9f1ULy1Qv3dbm_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4199（紫）",
        "priceCny": 1.9,
        "stock": 965662
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN010Vhb5Y1ULy1Pla9YF_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4200（绿）",
        "priceCny": 1.9,
        "stock": 982619
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01SCRMAv1ULy1QcwHTh_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "黄星星钥匙扣(会吱吱叫）",
        "priceCny": 1.5,
        "stock": 972770
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01xGqpOk1ULy0BNhgHb_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3911【钥匙扣】",
        "priceCny": 2.5,
        "stock": 952639
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01axZ5971ULy0CFlyYY_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3913【钥匙扣】",
        "priceCny": 2.9,
        "stock": 968572
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Jg1Ko51ULy08jAEOD_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3909【钥匙扣】",
        "priceCny": 2.5,
        "stock": 980289
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01RVm8oK1ULy0CFl2K2_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3914【钥匙扣】",
        "priceCny": 2.9,
        "stock": 954485
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01wEdJv31ULy0AY1wiV_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3912【钥匙扣】",
        "priceCny": 2.2,
        "stock": 973394
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01CSSU391ULy0Ae7gmI_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3505【钥匙扣】",
        "priceCny": 1.7,
        "stock": 927964
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN017Li9IB1ULy0BLCWjt_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3731【钥匙扣】",
        "priceCny": 1.5,
        "stock": 668970
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01vDR2fJ1ULy09yz3cC_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3511【钥匙扣】",
        "priceCny": 1.6,
        "stock": 983073
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN018UIhGM1ULy0Ae9dO1_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3488-A【钥匙扣】",
        "priceCny": 2,
        "stock": 982086
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01fWNxin1ULy0CFk1vJ_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3502【钥匙扣】",
        "priceCny": 1.45,
        "stock": 417972
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01yV4UXh1ULy0AkgotZ_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3504【钥匙扣】",
        "priceCny": 1.5,
        "stock": 6888348
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01uFunkk1ULy03pahQm_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3493【钥匙扣】",
        "priceCny": 1.7,
        "stock": 4945421
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01RVDpwQ1ULy08qdzwk_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3489【钥匙扣】",
        "priceCny": 1.8,
        "stock": 367066
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qjyBIu1ULy0Ae64z8_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3492【钥匙扣】",
        "priceCny": 1.5,
        "stock": 517512
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN011IVBVE1ULy09yxeI0_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3512【钥匙扣】",
        "priceCny": 1.5,
        "stock": 514559
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Of1Co21ULy0CFm2hO_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3497【钥匙扣】",
        "priceCny": 1.7,
        "stock": 334723
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01pQhoAo1ULy0AxZiVj_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3487【钥匙扣】",
        "priceCny": 2,
        "stock": 514761
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015Sjub01ULy088s14k_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3496【钥匙扣】",
        "priceCny": 1.8,
        "stock": 464059
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01poVP5b1ULy0BsIV7q_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3503【钥匙扣】",
        "priceCny": 1.6,
        "stock": 361651
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Z6eHvG1ULy088s9Ob_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3510【钥匙扣】",
        "priceCny": 1.6,
        "stock": 362564
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01apGxmJ1ULy09z1Gpa_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3488【钥匙扣】",
        "priceCny": 2,
        "stock": 677658
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01h0Zk7L1ULy0AxbKKK_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3657【钥匙扣】",
        "priceCny": 2,
        "stock": 626295
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01mqzY0c1ULy0Akh5XR_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3659【钥匙扣】",
        "priceCny": 1.55,
        "stock": 124078
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01zAgolg1ULy08j9h8g_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3658【钥匙扣",
        "priceCny": 2,
        "stock": 746363
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01kCIX7J1ULy5dsUetc_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3495",
        "priceCny": 1.8,
        "stock": 942470
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01kuJbM21ULy0Akf4nS_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3719【钥匙扣】",
        "priceCny": 1.5,
        "stock": 868545
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01D8VJ3z1ULy0Ae7kwH_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3720【钥匙扣】",
        "priceCny": 2,
        "stock": 770875
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01lfG4xN1ULy0AxbGA4_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3721【钥匙扣】",
        "priceCny": 2,
        "stock": 877347
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015UzrUc1ULy09zvoIJ_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3723【钥匙扣】",
        "priceCny": 1.8,
        "stock": 953602
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qXNEe11ULy0CFl2Kj_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3724【钥匙扣】",
        "priceCny": 2,
        "stock": 840070
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01BI58tQ1ULy09z10Cb_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "3725【钥匙扣】",
        "priceCny": 2,
        "stock": 765411
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01UdQJeT1ULy35Pf2wj_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4519",
        "priceCny": 1.7,
        "stock": 687801
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01GFdVq51ULy3BVKoyo_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4521",
        "priceCny": 1.7,
        "stock": 98591
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01uwdGz31ULy1PolSm5_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4710",
        "priceCny": 1.6,
        "stock": 979421
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01SVwdXN1ULy1RKFD3P_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4711",
        "priceCny": 1.6,
        "stock": 979565
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01yOspS31ULy1Pl7tB8_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4306黄背包猫(会吱吱叫）",
        "priceCny": 4.9,
        "stock": 987551
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01spj4VT1ULy1PpVJnE_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4307橙背包猫(会吱吱叫）",
        "priceCny": 4.9,
        "stock": 987780
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PMEY1F1ULy1RaMfqN_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4308红背包猫(会吱吱叫）",
        "priceCny": 4.9,
        "stock": 987790
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01tnW0db1ULy1QhuR46_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-4309白背包猫(会吱吱叫）",
        "priceCny": 4.9,
        "stock": 984524
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01gRBrbN1ULy1QdNfpY_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-3726",
        "priceCny": 2.5,
        "stock": 987998
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01u40WXq1ULy1SbvqNP_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-3727",
        "priceCny": 2.5,
        "stock": 987270
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ATPOD81ULy1RaaMxZ_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-3729",
        "priceCny": 2.9,
        "stock": 986061
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01STr4NN1ULy1dZvZOB_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "小怪兽粉色",
        "priceCny": 2.19,
        "stock": 983651
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01fUmhlM1ULy1g0COWu_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "小怪兽蓝色",
        "priceCny": 2.19,
        "stock": 985559
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WpPhao1ULy1d6FY1T_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "小怪兽紫色",
        "priceCny": 2.19,
        "stock": 982220
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN019jmkFh1ULy1eht4lg_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "小怪兽白色",
        "priceCny": 2.19,
        "stock": 985088
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN0169OKuF1ULy1gIVNB4_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "小怪兽黄色",
        "priceCny": 2.19,
        "stock": 984349
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PysxDO1ULy3AdBUKn_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5156",
        "priceCny": 1.3,
        "stock": 699631
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01KKd17v1ULy3Brrafu_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5157",
        "priceCny": 1.3,
        "stock": 699672
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qbwcSY1ULy3AdDltA_!!2218316842502-0-cib.jpg_sum.jpg",
        "name": "F-5160",
        "priceCny": 1.3,
        "stock": 699635
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "毛绒"
      },
      {
        "name": "填充材质",
        "value": "纤维棉"
      },
      {
        "name": "毛绒分类",
        "value": "超柔短毛绒"
      },
      {
        "name": "是否多功能",
        "value": "否"
      },
      {
        "name": "包装方式",
        "value": "散装"
      },
      {
        "name": "品牌",
        "value": "其它"
      },
      {
        "name": "货号",
        "value": "6666"
      },
      {
        "name": "是否外贸",
        "value": "否"
      },
      {
        "name": "加工方式",
        "value": "来样定制"
      },
      {
        "name": "规格",
        "value": "卡头包装特价款（公仔小款式随机）,混发（款式随机）,精美包装（公仔大款式随机）,纯公仔挂件盲袋【12cm*9cm】,F-5727,F-5728,F-5729,F-5730,F-5731,F-5732,F-5733,F-5734,3565,3566,3567,3568,3569,3570,3571,3572,3573,3574,3575,3576,3577,3578,3579,3580,3581,3582,3583,3584,3585,3586,3587,3588,3589,3590,3591,3591-1,3677,3678,3679,3730,F-5311,F-5310,4026【会叫唧唧叫】,F-4027(会吱吱叫）,F-5382,F-5383,F-5384,F-5385,F-5387,F-5388,F-5389,F-5389-1,F-5389-2,F-5389-3,F-5389-4,F-5455,F-5435,F-5402,F-5404,F-5400,F-5391,F-5392,F-5393,F-5394,F-5395,F-5396,F-5397,F-5398,F-5399,F-5355,F-5361,F-5354,F-5358,F-5357,F-5363,F-5407,F-5366,F-5365,F-5411,F-5376,F-5377,F-5364,F-5410,F-5408,F-5409,F-5406,黄星星珠链(会吱吱叫）,4024,4006,F-4270(汉堡）,F-4271（鸡腿）,F-4272（吐司）,F-4273（薯条）,F-4049,F-4050,F-4051,F-4052,F-4053,小粉蛇,5120,5121,5122,5123,5124,5127,5128,5125,F-4025,5360,5100,F-3939(香蕉）,F-4776,F-4851,F-4852,F-4853,F-4854,F-4503,F-4054,F-4056,F-4057,F-4058,F-4059,4005【钥匙扣】,F-4195(黄）,F-4196（橙）,F-4197（蓝）,F-4198（粉）,F-4199（紫）,F-4200（绿）,黄星星钥匙扣(会吱吱叫）,3911【钥匙扣】,3913【钥匙扣】,3909【钥匙扣】,3914【钥匙扣】,3912【钥匙扣】,3505【钥匙扣】,3731【钥匙扣】,3511【钥匙扣】,3488-A【钥匙扣】,3502【钥匙扣】,3504【钥匙扣】,3493【钥匙扣】,3489【钥匙扣】,3492【钥匙扣】,3512【钥匙扣】,3497【钥匙扣】,3487【钥匙扣】,3496【钥匙扣】,3503【钥匙扣】,3510【钥匙扣】,3488【钥匙扣】,3657【钥匙扣】,3659【钥匙扣】,3658【钥匙扣,3495,3719【钥匙扣】,3720【钥匙扣】,3721【钥匙扣】,3723【钥匙扣】,3724【钥匙扣】,3725【钥匙扣】,F-4519,F-4521,F-4710,F-4711,F-4306黄背包猫(会吱吱叫）,F-4307橙背包猫(会吱吱叫）,F-4308红背包猫(会吱吱叫）,F-4309白背包猫(会吱吱叫）,F-3726,F-3727,F-3729,小怪兽粉色,小怪兽蓝色,小怪兽紫色,小怪兽白色,小怪兽黄色,F-5156,F-5157,F-5160"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "进口地",
        "value": "日韩"
      },
      {
        "name": "造型类别",
        "value": "动物"
      },
      {
        "name": "产地",
        "value": "浙江"
      },
      {
        "name": "系列",
        "value": "其他"
      },
      {
        "name": "形象",
        "value": "其他"
      },
      {
        "name": "是否有导购视频",
        "value": "是"
      },
      {
        "name": "产品尺寸",
        "value": "详情"
      },
      {
        "name": "是否专供外贸",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "主要销售地区",
        "value": "其他"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      },
      {
        "name": "主要下游平台",
        "value": "亚马逊,wish,速卖通,独立站,LAZADA"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "适用性别",
        "value": "男女通用"
      }
    ]
  },
  {
    "id": "1688-919278574701",
    "title": "ins蓝格子方块苹果手机壳链条ccd相机挂绳diy手串珠咕本包包挂件",
    "category": "1688 Imports",
    "description": "Supplier: 义乌如火饰品有限公司\n\n材质: PVC\n货号: A-046\n工艺: 手工\n是否进口: 否\n加工定制: 是\n品牌: 如火\n产品编号: A-046\n样式: 男女通用\n绳带材质: PVC\n绳扣材质: 塑料扣\n是否有挂件: 有\n挂件材质: 压克力(亚克力)\n挂件造型: 卡通人物\n功能: 其它\n包装: 独立包装\n加印LOGO: 不可以\n是否专利货源: 否\n是否跨境出口专供货源: 否\n颜色: 红\n规格: 蓝方格苹果\n上市年份/季节: 通用款\n产地: 通用款\n1: 暗红格子 1个\n种类: 手机挂绳\n\nSource: https://detail.1688.com/offer/919278574701.html",
    "price": 3.67,
    "compare_at_price": 0,
    "cost_per_item": 0.53,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/919278574701/01.webp",
    "images": [
      "assets/1688/919278574701/01.webp",
      "assets/1688/919278574701/02.webp",
      "assets/1688/919278574701/03.webp",
      "assets/1688/919278574701/04.webp",
      "assets/1688/919278574701/05.webp",
      "assets/1688/919278574701/06.webp"
    ],
    "vendor": "义乌如火饰品有限公司",
    "sku": "1688-919278574701",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/919278574701.html",
    "source_currency": "CNY",
    "source_price": 2.13,
    "source_variants": [],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "货号",
        "value": "A-046"
      },
      {
        "name": "工艺",
        "value": "手工"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "是"
      },
      {
        "name": "品牌",
        "value": "如火"
      },
      {
        "name": "产品编号",
        "value": "A-046"
      },
      {
        "name": "样式",
        "value": "男女通用"
      },
      {
        "name": "绳带材质",
        "value": "PVC"
      },
      {
        "name": "绳扣材质",
        "value": "塑料扣"
      },
      {
        "name": "是否有挂件",
        "value": "有"
      },
      {
        "name": "挂件材质",
        "value": "压克力(亚克力)"
      },
      {
        "name": "挂件造型",
        "value": "卡通人物"
      },
      {
        "name": "功能",
        "value": "其它"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "红"
      },
      {
        "name": "规格",
        "value": "蓝方格苹果"
      },
      {
        "name": "上市年份/季节",
        "value": "通用款"
      },
      {
        "name": "产地",
        "value": "通用款"
      },
      {
        "name": "1",
        "value": "暗红格子 1个"
      },
      {
        "name": "种类",
        "value": "手机挂绳"
      }
    ]
  },
  {
    "id": "1688-927922042538",
    "title": "猫猫PAI水晶盲盒萌趣可爱动物公仔摆件天然水晶原石解压摆件批发",
    "category": "1688 Imports",
    "description": "Supplier: 浦江蕊杰工艺品有限公司\n\n材质: 树脂\n类别: 盲盒\n品牌: 唐艺\n风格: 卡通风\n适用节日: 通用,圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节,其他\n货号: qjmh\n包装: 纸盒包装\n是否专利货源: 否\n颜色: 植绒款-情绪开演盲盒【随机一个】,植绒款-情绪开演盲盒【整套6个】,小陪伴日常盲盒【随机一个】,小陪伴日常盲盒【整套6个】,植绒款-情绪盲盒【随机一个】,植绒款-情绪盲盒【整套4个】,猫猫PAI运盲盒【随机一个】,猫猫PAI运盲盒【六个不重复】,乐无忧转转盲盒【随机一个装】,乐无忧转转盲盒【整套6个装】,萌物趣多多【随机一个装】,萌物趣多多【六个装】,猫猫水晶盲盒【随机一个装】,猫猫水晶盲盒【六个装】,水晶动物【随机一个装】,水晶动物【九个装】,福禄葫芦【随机一个】,福禄葫芦【10个装】,十二星座【随机一个】,十二星座【12个装】,贝贝驮水晶盲盒【随机一个装】,贝贝驮水晶盲盒【整套6个装】,猫猫能liangPAI盲盒【随机一个装】,猫猫能liangPAI盲盒【整套4个装】,如沐花间盲盒【随机一个装】,如沐花间盲盒【整套9个装】,幻想蘑菇盲盒【随机一个装】,幻想蘑菇盲盒【整套9个装】,猫猫情绪盲盒【随机一个装】,猫猫情绪盲盒【整套4个装】\n适用送礼场合: 婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他\n送礼用途: 积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他\n是否属于礼品: 是，个人礼品\n是否IP授权: 否\n地图审批号: 123\n外观造型: 动物\n\n植绒款-情绪开演盲盒【随机一个】: CNY 5.70, stock 5000\n植绒款-情绪开演盲盒【整套6个】: CNY 34.20, stock 5000\n小陪伴日常盲盒【随机一个】: CNY 5.70, stock 5000\n小陪伴日常盲盒【整套6个】: CNY 34.20, stock 5000\n植绒款-情绪盲盒【随机一个】: CNY 6.65, stock 5000\n植绒款-情绪盲盒【整套4个】: CNY 26.60, stock 5000\n猫猫PAI运盲盒【随机一个】: CNY 5.70, stock 5000\n猫猫PAI运盲盒【六个不重复】: CNY 34.20, stock 5000\n乐无忧转转盲盒【随机一个装】: CNY 8.08, stock 5000\n乐无忧转转盲盒【整套6个装】: CNY 48.45, stock 5000\n萌物趣多多【随机一个装】: CNY 6.27, stock 5000\n萌物趣多多【六个装】: CNY 37.05, stock 5000\n猫猫水晶盲盒【随机一个装】: CNY 5.70, stock 5000\n猫猫水晶盲盒【六个装】: CNY 34.20, stock 5000\n水晶动物【随机一个装】: CNY 5.70, stock 5000\n水晶动物【九个装】: CNY 51.30, stock 5000\n福禄葫芦【随机一个】: CNY 4.75, stock 5000\n福禄葫芦【10个装】: CNY 47.50, stock 5000\n十二星座【随机一个】: CNY 6.18, stock 5000\n十二星座【12个装】: CNY 75.05, stock 5000\n贝贝驮水晶盲盒【随机一个装】: CNY 5.70, stock 5000\n贝贝驮水晶盲盒【整套6个装】: CNY 34.20, stock 5000\n猫猫能liangPAI盲盒【随机一个装】: CNY 7.22, stock 5000\n猫猫能liangPAI盲盒【整套4个装】: CNY 28.88, stock 5000\n如沐花间盲盒【随机一个装】: CNY 6.18, stock 5000\n如沐花间盲盒【整套9个装】: CNY 55.58, stock 5000\n幻想蘑菇盲盒【随机一个装】: CNY 7.03, stock 5000\n幻想蘑菇盲盒【整套9个装】: CNY 63.27, stock 5000\n猫猫情绪盲盒【随机一个装】: CNY 6.18, stock 5000\n猫猫情绪盲盒【整套4个装】: CNY 24.70, stock 5000\n\nSource: https://detail.1688.com/offer/927922042538.html",
    "price": 8.19,
    "compare_at_price": 0,
    "cost_per_item": 1.19,
    "stock": 2,
    "sales": 0,
    "published": false,
    "image": "assets/1688/927922042538/01.webp",
    "images": [
      "assets/1688/927922042538/01.webp",
      "assets/1688/927922042538/02.webp",
      "assets/1688/927922042538/03.webp",
      "assets/1688/927922042538/04.webp",
      "assets/1688/927922042538/05.webp",
      "assets/1688/927922042538/06.webp",
      "assets/1688/927922042538/07.webp",
      "assets/1688/927922042538/08.webp",
      "assets/1688/927922042538/09.webp",
      "assets/1688/927922042538/10.webp",
      "assets/1688/927922042538/11.webp",
      "assets/1688/927922042538/12.webp",
      "assets/1688/927922042538/13.webp",
      "assets/1688/927922042538/14.webp",
      "assets/1688/927922042538/15.webp",
      "assets/1688/927922042538/16.webp",
      "assets/1688/927922042538/17.webp",
      "assets/1688/927922042538/18.webp",
      "assets/1688/927922042538/19.webp",
      "assets/1688/927922042538/20.webp",
      "assets/1688/927922042538/21.webp",
      "assets/1688/927922042538/22.webp",
      "assets/1688/927922042538/23.webp",
      "assets/1688/927922042538/24.webp",
      "assets/1688/927922042538/25.webp",
      "assets/1688/927922042538/26.webp",
      "assets/1688/927922042538/27.webp",
      "assets/1688/927922042538/28.webp",
      "assets/1688/927922042538/29.webp",
      "assets/1688/927922042538/30.webp",
      "assets/1688/927922042538/31.webp",
      "assets/1688/927922042538/32.webp",
      "assets/1688/927922042538/33.webp",
      "assets/1688/927922042538/34.webp",
      "assets/1688/927922042538/35.webp",
      "assets/1688/927922042538/36.webp",
      "assets/1688/927922042538/37.webp",
      "assets/1688/927922042538/38.webp",
      "assets/1688/927922042538/39.webp",
      "assets/1688/927922042538/40.webp",
      "assets/1688/927922042538/41.webp",
      "assets/1688/927922042538/42.webp",
      "assets/1688/927922042538/43.webp",
      "assets/1688/927922042538/44.webp",
      "assets/1688/927922042538/45.webp",
      "assets/1688/927922042538/46.webp",
      "assets/1688/927922042538/47.webp",
      "assets/1688/927922042538/48.webp",
      "assets/1688/927922042538/49.webp",
      "assets/1688/927922042538/50.webp",
      "assets/1688/927922042538/51.webp",
      "assets/1688/927922042538/52.webp",
      "assets/1688/927922042538/53.webp",
      "assets/1688/927922042538/54.webp",
      "assets/1688/927922042538/55.webp",
      "assets/1688/927922042538/56.webp",
      "assets/1688/927922042538/57.webp",
      "assets/1688/927922042538/58.webp",
      "assets/1688/927922042538/59.webp",
      "assets/1688/927922042538/60.webp",
      "assets/1688/927922042538/61.webp",
      "assets/1688/927922042538/62.webp"
    ],
    "vendor": "浦江蕊杰工艺品有限公司",
    "sku": "1688-927922042538",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/927922042538.html",
    "source_currency": "CNY",
    "source_price": 4.75,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01yOUqUs2IgKSkBTtLC_!!935639315-0-cib.jpg_sum.jpg",
        "name": "植绒款-情绪开演盲盒【随机一个】",
        "priceCny": 5.7,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01tRmrkT2IgKSkBXB7f_!!935639315-0-cib.jpg_sum.jpg",
        "name": "植绒款-情绪开演盲盒【整套6个】",
        "priceCny": 34.2,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01O0mTaJ2IgKSjVhTfx_!!935639315-0-cib.jpg_sum.jpg",
        "name": "小陪伴日常盲盒【随机一个】",
        "priceCny": 5.7,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01esiKCM2IgKSj9q59r_!!935639315-0-cib.jpg_sum.jpg",
        "name": "小陪伴日常盲盒【整套6个】",
        "priceCny": 34.2,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01rT1i142IgKSTfOfCU_!!935639315-0-cib.jpg_sum.jpg",
        "name": "植绒款-情绪盲盒【随机一个】",
        "priceCny": 6.65,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN012Nn0FT2IgKSTm17mQ_!!935639315-0-cib.jpg_sum.jpg",
        "name": "植绒款-情绪盲盒【整套4个】",
        "priceCny": 26.6,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01AlNShW2IgKS0KIVRc_!!935639315-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI运盲盒【随机一个】",
        "priceCny": 5.7,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01pSIdVe2IgKS19nDyy_!!935639315-0-cib.jpg_sum.jpg",
        "name": "猫猫PAI运盲盒【六个不重复】",
        "priceCny": 34.2,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Duue8N2IgKU3I0uM8_!!935639315-0-cib.jpg_sum.jpg",
        "name": "乐无忧转转盲盒【随机一个装】",
        "priceCny": 8.08,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Duue8N2IgKU3I0uM8_!!935639315-0-cib.jpg_sum.jpg",
        "name": "乐无忧转转盲盒【整套6个装】",
        "priceCny": 48.45,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Sw0W5n2IgKPGLwU2S_!!935639315-0-cib.jpg_sum.jpg",
        "name": "萌物趣多多【随机一个装】",
        "priceCny": 6.27,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01nWNmcW2IgKPIm3Qv2_!!935639315-0-cib.jpg_sum.jpg",
        "name": "萌物趣多多【六个装】",
        "priceCny": 37.05,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN016kf9eE2IgKPIjcqhl_!!935639315-0-cib.jpg_sum.jpg",
        "name": "猫猫水晶盲盒【随机一个装】",
        "priceCny": 5.7,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IYvq8q2IgKPHZOcb1_!!935639315-0-cib.jpg_sum.jpg",
        "name": "猫猫水晶盲盒【六个装】",
        "priceCny": 34.2,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN013muVXB2IgKPWWxXsM_!!935639315-0-cib.jpg_sum.jpg",
        "name": "水晶动物【随机一个装】",
        "priceCny": 5.7,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01W11wYp2IgKPWkFgMf_!!935639315-0-cib.jpg_sum.jpg",
        "name": "水晶动物【九个装】",
        "priceCny": 51.3,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01olD0C52IgKPXNoHsx_!!935639315-0-cib.jpg_sum.jpg",
        "name": "福禄葫芦【随机一个】",
        "priceCny": 4.75,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015k6NZN2IgKPWnognk_!!935639315-0-cib.jpg_sum.jpg",
        "name": "福禄葫芦【10个装】",
        "priceCny": 47.5,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01tI4n862IgKQ5zI21X_!!935639315-0-cib.jpg_sum.jpg",
        "name": "十二星座【随机一个】",
        "priceCny": 6.18,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN011dR0XP2IgKQ6RQJmn_!!935639315-0-cib.jpg_sum.jpg",
        "name": "十二星座【12个装】",
        "priceCny": 75.05,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01w7EqVu2IgKQY5ICgo_!!935639315-0-cib.jpg_sum.jpg",
        "name": "贝贝驮水晶盲盒【随机一个装】",
        "priceCny": 5.7,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01RLdmcA2IgKQddLqoS_!!935639315-0-cib.jpg_sum.jpg",
        "name": "贝贝驮水晶盲盒【整套6个装】",
        "priceCny": 34.2,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN011a5B9C2IgKQo0OhVv_!!935639315-0-cib.jpg_sum.jpg",
        "name": "猫猫能liangPAI盲盒【随机一个装】",
        "priceCny": 7.22,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Yt8fIj2IgKQv8hg4l_!!935639315-0-cib.jpg_sum.jpg",
        "name": "猫猫能liangPAI盲盒【整套4个装】",
        "priceCny": 28.88,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ZwuEI52IgKQuuG6Py_!!935639315-0-cib.jpg_sum.jpg",
        "name": "如沐花间盲盒【随机一个装】",
        "priceCny": 6.18,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01j55UO72IgKQsnFGGj_!!935639315-0-cib.jpg_sum.jpg",
        "name": "如沐花间盲盒【整套9个装】",
        "priceCny": 55.58,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01D5WZ2d2IgKU2rkyDh_!!935639315-0-cib.jpg_sum.jpg",
        "name": "幻想蘑菇盲盒【随机一个装】",
        "priceCny": 7.03,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Wlx9Cv2IgKU3IOjqP_!!935639315-0-cib.jpg_sum.jpg",
        "name": "幻想蘑菇盲盒【整套9个装】",
        "priceCny": 63.27,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01a7OZne2IgKRfBCQkE_!!935639315-0-cib.jpg_sum.jpg",
        "name": "猫猫情绪盲盒【随机一个装】",
        "priceCny": 6.18,
        "stock": 5000
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qC144b2IgKRYRvfcX_!!935639315-0-cib.jpg_sum.jpg",
        "name": "猫猫情绪盲盒【整套4个装】",
        "priceCny": 24.7,
        "stock": 5000
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "树脂"
      },
      {
        "name": "类别",
        "value": "盲盒"
      },
      {
        "name": "品牌",
        "value": "唐艺"
      },
      {
        "name": "风格",
        "value": "卡通风"
      },
      {
        "name": "适用节日",
        "value": "通用,圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节,其他"
      },
      {
        "name": "货号",
        "value": "qjmh"
      },
      {
        "name": "包装",
        "value": "纸盒包装"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "植绒款-情绪开演盲盒【随机一个】,植绒款-情绪开演盲盒【整套6个】,小陪伴日常盲盒【随机一个】,小陪伴日常盲盒【整套6个】,植绒款-情绪盲盒【随机一个】,植绒款-情绪盲盒【整套4个】,猫猫PAI运盲盒【随机一个】,猫猫PAI运盲盒【六个不重复】,乐无忧转转盲盒【随机一个装】,乐无忧转转盲盒【整套6个装】,萌物趣多多【随机一个装】,萌物趣多多【六个装】,猫猫水晶盲盒【随机一个装】,猫猫水晶盲盒【六个装】,水晶动物【随机一个装】,水晶动物【九个装】,福禄葫芦【随机一个】,福禄葫芦【10个装】,十二星座【随机一个】,十二星座【12个装】,贝贝驮水晶盲盒【随机一个装】,贝贝驮水晶盲盒【整套6个装】,猫猫能liangPAI盲盒【随机一个装】,猫猫能liangPAI盲盒【整套4个装】,如沐花间盲盒【随机一个装】,如沐花间盲盒【整套9个装】,幻想蘑菇盲盒【随机一个装】,幻想蘑菇盲盒【整套9个装】,猫猫情绪盲盒【随机一个装】,猫猫情绪盲盒【整套4个装】"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他"
      },
      {
        "name": "送礼用途",
        "value": "积分换购礼品,商务礼品,广告礼品,促销赠品,会议礼品,福利礼品,节庆礼品,嘉奖纪念,公关礼品,其他"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "地图审批号",
        "value": "123"
      },
      {
        "name": "外观造型",
        "value": "动物"
      }
    ]
  },
  {
    "id": "1688-941432090250",
    "title": "ins甜辣风粉黑配色y2k日韩串珠手机链相机挂件女学生礼物包包配饰",
    "category": "1688 Imports",
    "description": "Supplier: 义乌如火饰品有限公司\n\n材质: PVC\n货号: A-059\n工艺: 其它\n是否进口: 否\n加工定制: 否\n品牌: 如火\n产品编号: A-059\n样式: 男女通用\n绳带材质: 尼龙\n绳扣材质: 塑料扣\n是否有挂件: 无\n包装: 散装\n加印LOGO: 不可以\n是否专利货源: 否\n主要下游平台: 其他\n主要销售地区: 其他\n有可授权的自有品牌: 是\n是否跨境出口专供货源: 是\n颜色: 黑紫\n规格: 黑粉配色挂绳\n种类: 手机挂绳\n\nSource: https://detail.1688.com/offer/941432090250.html",
    "price": 3.21,
    "compare_at_price": 0,
    "cost_per_item": 0.47,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/941432090250/01.webp",
    "images": [
      "assets/1688/941432090250/01.webp",
      "assets/1688/941432090250/02.webp",
      "assets/1688/941432090250/03.webp",
      "assets/1688/941432090250/04.webp",
      "assets/1688/941432090250/05.webp",
      "assets/1688/941432090250/06.webp"
    ],
    "vendor": "义乌如火饰品有限公司",
    "sku": "1688-941432090250",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/941432090250.html",
    "source_currency": "CNY",
    "source_price": 1.86,
    "source_variants": [],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "货号",
        "value": "A-059"
      },
      {
        "name": "工艺",
        "value": "其它"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "品牌",
        "value": "如火"
      },
      {
        "name": "产品编号",
        "value": "A-059"
      },
      {
        "name": "样式",
        "value": "男女通用"
      },
      {
        "name": "绳带材质",
        "value": "尼龙"
      },
      {
        "name": "绳扣材质",
        "value": "塑料扣"
      },
      {
        "name": "是否有挂件",
        "value": "无"
      },
      {
        "name": "包装",
        "value": "散装"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "主要下游平台",
        "value": "其他"
      },
      {
        "name": "主要销售地区",
        "value": "其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "是"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "颜色",
        "value": "黑紫"
      },
      {
        "name": "规格",
        "value": "黑粉配色挂绳"
      },
      {
        "name": "种类",
        "value": "手机挂绳"
      }
    ]
  },
  {
    "id": "1688-946706943426",
    "title": "大猩猩折叠屏钢化膜适用三星ZFold7细边防指纹华为MateX2防窥全屏",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市福田区鑫膜电子商行\n\n材质: 钢化玻璃\n适用机型: 三星\n贴膜类型: 前膜\n贴膜特点: 镜面,高清,防爆,防尘,防指纹,防摔,全屏,防偷窥\n品牌: WELEMENT\n产地: 深圳\n颜色: 大猩猩折叠屏【裸膜】高清,大猩猩折叠屏【裸膜】防窥,大猩猩折叠屏【简装】高清,大猩猩折叠屏【简装】防窥,大猩猩折叠屏【精装】高清,大猩猩折叠屏【精装】防窥,大猩猩折叠屏【独立装】高清,大猩猩折叠屏【独立装】防窥,大猩猩折叠屏【十片装】高清,大猩猩折叠屏【十片装】防窥\n尺寸: 华为MATE X2,OPPO Find N3,OPPO Find N5,三星W21,三星W22,三星W25,三星Z Fold 2,三星Z Fold 3,三星Z Fold 5,三星Z Fold 6,三星Z Fold 7,三星Z Flip 5 小屏,三星Z Flip 6 小屏,三星Z Flip 7 小屏,三星W22 皮套版,三星W23 皮套版,三星W24 皮套版,三星W25 皮套版,三星Z Fold 2 皮套版,三星Z Fold 3 皮套版,三星Z Fold 4 皮套版,三星Z Fold 5 皮套版,三星Z Fold 6 皮套版,华为Puar X 小屏,三星W23,三星W24,三星Z Fold 4\n适用品牌: 点赞猩猩\n大猩猩钢化膜: 苹果钢化膜，苹果手机膜，防指纹钢化膜，防偷窥膜\n\n华为MATE X2: CNY 2.38, stock 986425\nOPPO Find N3: CNY 2.38, stock 986552\nOPPO Find N5: CNY 2.38, stock 986531\n三星W21: CNY 2.38, stock 986565\n三星W22: CNY 2.38, stock 986560\n三星W25: CNY 2.38, stock 986443\n三星Z Fold 2: CNY 2.38, stock 986571\n三星Z Fold 3: CNY 2.38, stock 986562\n三星Z Fold 5: CNY 2.38, stock 986476\n三星Z Fold 6: CNY 2.38, stock 986387\n三星Z Fold 7: CNY 2.38, stock 986168\n三星Z Flip 5 小屏: CNY 2.38, stock 986551\n三星Z Flip 6 小屏: CNY 2.38, stock 986551\n三星Z Flip 7 小屏: CNY 2.38, stock 986552\n三星W22 皮套版: CNY 2.38, stock 986572\n三星W23 皮套版: CNY 2.38, stock 986569\n三星W24 皮套版: CNY 2.38, stock 986570\n三星W25 皮套版: CNY 2.38, stock 986570\n三星Z Fold 2 皮套版: CNY 2.38, stock 986572\n三星Z Fold 3 皮套版: CNY 2.38, stock 986572\n三星Z Fold 4 皮套版: CNY 2.38, stock 986567\n三星Z Fold 5 皮套版: CNY 2.38, stock 986566\n三星Z Fold 6 皮套版: CNY 2.38, stock 986570\n华为Puar X 小屏: CNY 2.38, stock 986547\n\nSource: https://detail.1688.com/offer/946706943426.html",
    "price": 4.11,
    "compare_at_price": 0,
    "cost_per_item": 0.6,
    "stock": 8,
    "sales": 0,
    "published": false,
    "image": "assets/1688/946706943426/01.webp",
    "images": [
      "assets/1688/946706943426/01.webp",
      "assets/1688/946706943426/02.webp",
      "assets/1688/946706943426/03.webp",
      "assets/1688/946706943426/04.webp",
      "assets/1688/946706943426/05.webp",
      "assets/1688/946706943426/06.webp",
      "assets/1688/946706943426/07.webp",
      "assets/1688/946706943426/08.webp",
      "assets/1688/946706943426/09.webp",
      "assets/1688/946706943426/10.webp",
      "assets/1688/946706943426/11.webp",
      "assets/1688/946706943426/12.webp",
      "assets/1688/946706943426/13.webp",
      "assets/1688/946706943426/14.webp",
      "assets/1688/946706943426/15.webp"
    ],
    "vendor": "深圳市福田区鑫膜电子商行",
    "sku": "1688-946706943426",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/946706943426.html",
    "source_currency": "CNY",
    "source_price": 2.38,
    "source_variants": [
      {
        "image": "",
        "name": "华为MATE X2",
        "priceCny": 2.38,
        "stock": 986425
      },
      {
        "image": "",
        "name": "OPPO Find N3",
        "priceCny": 2.38,
        "stock": 986552
      },
      {
        "image": "",
        "name": "OPPO Find N5",
        "priceCny": 2.38,
        "stock": 986531
      },
      {
        "image": "",
        "name": "三星W21",
        "priceCny": 2.38,
        "stock": 986565
      },
      {
        "image": "",
        "name": "三星W22",
        "priceCny": 2.38,
        "stock": 986560
      },
      {
        "image": "",
        "name": "三星W25",
        "priceCny": 2.38,
        "stock": 986443
      },
      {
        "image": "",
        "name": "三星Z Fold 2",
        "priceCny": 2.38,
        "stock": 986571
      },
      {
        "image": "",
        "name": "三星Z Fold 3",
        "priceCny": 2.38,
        "stock": 986562
      },
      {
        "image": "",
        "name": "三星Z Fold 5",
        "priceCny": 2.38,
        "stock": 986476
      },
      {
        "image": "",
        "name": "三星Z Fold 6",
        "priceCny": 2.38,
        "stock": 986387
      },
      {
        "image": "",
        "name": "三星Z Fold 7",
        "priceCny": 2.38,
        "stock": 986168
      },
      {
        "image": "",
        "name": "三星Z Flip 5 小屏",
        "priceCny": 2.38,
        "stock": 986551
      },
      {
        "image": "",
        "name": "三星Z Flip 6 小屏",
        "priceCny": 2.38,
        "stock": 986551
      },
      {
        "image": "",
        "name": "三星Z Flip 7 小屏",
        "priceCny": 2.38,
        "stock": 986552
      },
      {
        "image": "",
        "name": "三星W22 皮套版",
        "priceCny": 2.38,
        "stock": 986572
      },
      {
        "image": "",
        "name": "三星W23 皮套版",
        "priceCny": 2.38,
        "stock": 986569
      },
      {
        "image": "",
        "name": "三星W24 皮套版",
        "priceCny": 2.38,
        "stock": 986570
      },
      {
        "image": "",
        "name": "三星W25 皮套版",
        "priceCny": 2.38,
        "stock": 986570
      },
      {
        "image": "",
        "name": "三星Z Fold 2 皮套版",
        "priceCny": 2.38,
        "stock": 986572
      },
      {
        "image": "",
        "name": "三星Z Fold 3 皮套版",
        "priceCny": 2.38,
        "stock": 986572
      },
      {
        "image": "",
        "name": "三星Z Fold 4 皮套版",
        "priceCny": 2.38,
        "stock": 986567
      },
      {
        "image": "",
        "name": "三星Z Fold 5 皮套版",
        "priceCny": 2.38,
        "stock": 986566
      },
      {
        "image": "",
        "name": "三星Z Fold 6 皮套版",
        "priceCny": 2.38,
        "stock": 986570
      },
      {
        "image": "",
        "name": "华为Puar X 小屏",
        "priceCny": 2.38,
        "stock": 986547
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "钢化玻璃"
      },
      {
        "name": "适用机型",
        "value": "三星"
      },
      {
        "name": "贴膜类型",
        "value": "前膜"
      },
      {
        "name": "贴膜特点",
        "value": "镜面,高清,防爆,防尘,防指纹,防摔,全屏,防偷窥"
      },
      {
        "name": "品牌",
        "value": "WELEMENT"
      },
      {
        "name": "产地",
        "value": "深圳"
      },
      {
        "name": "颜色",
        "value": "大猩猩折叠屏【裸膜】高清,大猩猩折叠屏【裸膜】防窥,大猩猩折叠屏【简装】高清,大猩猩折叠屏【简装】防窥,大猩猩折叠屏【精装】高清,大猩猩折叠屏【精装】防窥,大猩猩折叠屏【独立装】高清,大猩猩折叠屏【独立装】防窥,大猩猩折叠屏【十片装】高清,大猩猩折叠屏【十片装】防窥"
      },
      {
        "name": "尺寸",
        "value": "华为MATE X2,OPPO Find N3,OPPO Find N5,三星W21,三星W22,三星W25,三星Z Fold 2,三星Z Fold 3,三星Z Fold 5,三星Z Fold 6,三星Z Fold 7,三星Z Flip 5 小屏,三星Z Flip 6 小屏,三星Z Flip 7 小屏,三星W22 皮套版,三星W23 皮套版,三星W24 皮套版,三星W25 皮套版,三星Z Fold 2 皮套版,三星Z Fold 3 皮套版,三星Z Fold 4 皮套版,三星Z Fold 5 皮套版,三星Z Fold 6 皮套版,华为Puar X 小屏,三星W23,三星W24,三星Z Fold 4"
      },
      {
        "name": "适用品牌",
        "value": "点赞猩猩"
      },
      {
        "name": "大猩猩钢化膜",
        "value": "苹果钢化膜，苹果手机膜，防指纹钢化膜，防偷窥膜"
      }
    ]
  },
  {
    "id": "1688-958785172103",
    "title": "流沙星星海螺创意钥匙扣女生挂饰儿童包包挂件小礼品汽车配饰批发",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市静冬工艺品有限公司\n\n材质: 亚克力\n钥匙配饰分类: 钥匙扣\n风格: 东南亚\n品牌: 饰琪漫\n货号: 555999\n包装: 普通包装\n适用送礼场合: 其他\n是否专利货源: 否\n颜色: 粉色星星海螺,紫色星星海螺,绿色星星海螺,蓝色星星海螺\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,孩子,同学,其他\n送礼用途: 其他\n是否属于礼品: 是，个人礼品\n是否IP授权: 否\n适用节日: 其他\n\n粉色星星海螺: CNY 3.18, stock 75\n紫色星星海螺: CNY 3.18, stock 16\n绿色星星海螺: CNY 3.18, stock 98\n蓝色星星海螺: CNY 3.18, stock 89\n\nSource: https://detail.1688.com/offer/958785172103.html",
    "price": 5.49,
    "compare_at_price": 0,
    "cost_per_item": 0.8,
    "stock": 12,
    "sales": 0,
    "published": false,
    "image": "assets/1688/958785172103/01.webp",
    "images": [
      "assets/1688/958785172103/01.webp",
      "assets/1688/958785172103/02.webp",
      "assets/1688/958785172103/03.webp",
      "assets/1688/958785172103/04.webp",
      "assets/1688/958785172103/05.webp",
      "assets/1688/958785172103/06.webp",
      "assets/1688/958785172103/07.webp",
      "assets/1688/958785172103/08.webp",
      "assets/1688/958785172103/09.webp",
      "assets/1688/958785172103/10.webp"
    ],
    "vendor": "义乌市静冬工艺品有限公司",
    "sku": "1688-958785172103",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/958785172103.html",
    "source_currency": "CNY",
    "source_price": 3.18,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01MquD0V1GJIy91nUs4_!!2216627330601-0-cib.jpg_sum.jpg",
        "name": "粉色星星海螺",
        "priceCny": 3.18,
        "stock": 75
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01nHjb6q1GJIy5NXCoc_!!2216627330601-0-cib.jpg_sum.jpg",
        "name": "紫色星星海螺",
        "priceCny": 3.18,
        "stock": 16
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015z1Vvc1GJIy3AleEQ_!!2216627330601-0-cib.jpg_sum.jpg",
        "name": "绿色星星海螺",
        "priceCny": 3.18,
        "stock": 98
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN015Lr0Ao1GJIy6CHnSb_!!2216627330601-0-cib.jpg_sum.jpg",
        "name": "蓝色星星海螺",
        "priceCny": 3.18,
        "stock": 89
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "亚克力"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣"
      },
      {
        "name": "风格",
        "value": "东南亚"
      },
      {
        "name": "品牌",
        "value": "饰琪漫"
      },
      {
        "name": "货号",
        "value": "555999"
      },
      {
        "name": "包装",
        "value": "普通包装"
      },
      {
        "name": "适用送礼场合",
        "value": "其他"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "粉色星星海螺,紫色星星海螺,绿色星星海螺,蓝色星星海螺"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,孩子,同学,其他"
      },
      {
        "name": "送礼用途",
        "value": "其他"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "其他"
      }
    ]
  },
  {
    "id": "1688-960273333140",
    "title": "小红书爆款夏日海豚手机链条简约ccd挂绳小清新相机耳机配饰短款",
    "category": "1688 Imports",
    "description": "Supplier: 义乌如火饰品有限公司\n\n材质: 尼龙\n货号: A-090\n工艺: 手工\n是否进口: 否\n加工定制: 否\n品牌: 如火\n产品编号: A-090\n样式: 男女通用\n绳带材质: 尼龙\n绳扣材质: 塑料扣\n是否有挂件: 无\n包装: 独立包装\n加印LOGO: 不可以\n是否专利货源: 否\n是否跨境出口专供货源: 否\n颜色: 蓝色\n规格: 蓝色海豚海星\n种类: 手机挂绳\n\nSource: https://detail.1688.com/offer/960273333140.html",
    "price": 4.17,
    "compare_at_price": 0,
    "cost_per_item": 0.61,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/960273333140/01.webp",
    "images": [
      "assets/1688/960273333140/01.webp",
      "assets/1688/960273333140/02.webp",
      "assets/1688/960273333140/03.webp",
      "assets/1688/960273333140/04.webp",
      "assets/1688/960273333140/05.webp",
      "assets/1688/960273333140/06.webp"
    ],
    "vendor": "义乌如火饰品有限公司",
    "sku": "1688-960273333140",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/960273333140.html",
    "source_currency": "CNY",
    "source_price": 2.42,
    "source_variants": [],
    "source_attributes": [
      {
        "name": "材质",
        "value": "尼龙"
      },
      {
        "name": "货号",
        "value": "A-090"
      },
      {
        "name": "工艺",
        "value": "手工"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "品牌",
        "value": "如火"
      },
      {
        "name": "产品编号",
        "value": "A-090"
      },
      {
        "name": "样式",
        "value": "男女通用"
      },
      {
        "name": "绳带材质",
        "value": "尼龙"
      },
      {
        "name": "绳扣材质",
        "value": "塑料扣"
      },
      {
        "name": "是否有挂件",
        "value": "无"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "蓝色"
      },
      {
        "name": "规格",
        "value": "蓝色海豚海星"
      },
      {
        "name": "种类",
        "value": "手机挂绳"
      }
    ]
  },
  {
    "id": "1688-965013269622",
    "title": "手机超级快充typec线适用华为mate70荣耀专用6A原快充电器数据线",
    "category": "1688 Imports",
    "description": "Supplier: 深圳市小溪电子商务有限公司\n\n材质: PVC\n接口: TYPE-C\n分线接头数量: 单头\n品牌: 三昕\n最大输出功率: 120\n特性: 快充\n长度: 0.5m(不含)~1m(含)\n型号: Type-C充电线120W快充【 USB接口*1盒】,Type-C充电线120W快充【 USB接口*5盒】,Type-C充电线120W快充【 USB接口*200盒】\n3C证书编号: 2025260907000010\n颜色分类: 白色\n\nType-C充电线120W快充【 USB接口*1盒】: CNY 1.40, stock 63806\nType-C充电线120W快充【 USB接口*5盒】: CNY 7.00, stock 55635\nType-C充电线120W快充【 USB接口*200盒】: CNY 280.00, stock 79489\n\nSource: https://detail.1688.com/offer/965013269622.html",
    "price": 2.42,
    "compare_at_price": 0,
    "cost_per_item": 0.35,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/965013269622/01.webp",
    "images": [
      "assets/1688/965013269622/01.webp",
      "assets/1688/965013269622/02.webp",
      "assets/1688/965013269622/03.webp",
      "assets/1688/965013269622/04.webp",
      "assets/1688/965013269622/05.webp",
      "assets/1688/965013269622/06.webp",
      "assets/1688/965013269622/07.webp"
    ],
    "vendor": "深圳市小溪电子商务有限公司",
    "sku": "1688-965013269622",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/965013269622.html",
    "source_currency": "CNY",
    "source_price": 1.4,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WApLO22Gx9kuVXOZc_!!2210970839081-0-cib.jpg_sum.jpg",
        "name": "Type-C充电线120W快充【 USB接口*1盒】",
        "priceCny": 1.4,
        "stock": 63806
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WApLO22Gx9kuVXOZc_!!2210970839081-0-cib.jpg_sum.jpg",
        "name": "Type-C充电线120W快充【 USB接口*5盒】",
        "priceCny": 7,
        "stock": 55635
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WApLO22Gx9kuVXOZc_!!2210970839081-0-cib.jpg_sum.jpg",
        "name": "Type-C充电线120W快充【 USB接口*200盒】",
        "priceCny": 280,
        "stock": 79489
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "接口",
        "value": "TYPE-C"
      },
      {
        "name": "分线接头数量",
        "value": "单头"
      },
      {
        "name": "品牌",
        "value": "三昕"
      },
      {
        "name": "最大输出功率",
        "value": "120"
      },
      {
        "name": "特性",
        "value": "快充"
      },
      {
        "name": "长度",
        "value": "0.5m(不含)~1m(含)"
      },
      {
        "name": "型号",
        "value": "Type-C充电线120W快充【 USB接口*1盒】,Type-C充电线120W快充【 USB接口*5盒】,Type-C充电线120W快充【 USB接口*200盒】"
      },
      {
        "name": "3C证书编号",
        "value": "2025260907000010"
      },
      {
        "name": "颜色分类",
        "value": "白色"
      }
    ]
  },
  {
    "id": "1688-968106247721",
    "title": "手机链条DIY清新绿色手机链手机挂绳郁金香花ins风ccd相机挂件挂",
    "category": "1688 Imports",
    "description": "Supplier: 义乌如火饰品有限公司\n\n材质: PVC\n货号: B-027\n工艺: 手工\n是否进口: 否\n加工定制: 否\n品牌: 如火\n产品编号: B-027\n样式: 男女通用\n绳带材质: PVC\n绳扣材质: 塑料扣\n是否有挂件: 无\n包装: 独立包装\n加印LOGO: 不可以\n是否专利货源: 否\n是否跨境出口专供货源: 否\n颜色: 绿色\n规格: 绿苹果小鱼,大爱心红格子苹果kt猫\n种类: 手机挂绳\n\nSource: https://detail.1688.com/offer/968106247721.html",
    "price": 4.88,
    "compare_at_price": 0,
    "cost_per_item": 0.71,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/968106247721/01.webp",
    "images": [
      "assets/1688/968106247721/01.webp",
      "assets/1688/968106247721/02.webp",
      "assets/1688/968106247721/03.webp",
      "assets/1688/968106247721/04.webp",
      "assets/1688/968106247721/05.webp",
      "assets/1688/968106247721/06.webp",
      "assets/1688/968106247721/07.webp"
    ],
    "vendor": "义乌如火饰品有限公司",
    "sku": "1688-968106247721",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/968106247721.html",
    "source_currency": "CNY",
    "source_price": 2.83,
    "source_variants": [],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "货号",
        "value": "B-027"
      },
      {
        "name": "工艺",
        "value": "手工"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "品牌",
        "value": "如火"
      },
      {
        "name": "产品编号",
        "value": "B-027"
      },
      {
        "name": "样式",
        "value": "男女通用"
      },
      {
        "name": "绳带材质",
        "value": "PVC"
      },
      {
        "name": "绳扣材质",
        "value": "塑料扣"
      },
      {
        "name": "是否有挂件",
        "value": "无"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "绿色"
      },
      {
        "name": "规格",
        "value": "绿苹果小鱼,大爱心红格子苹果kt猫"
      },
      {
        "name": "种类",
        "value": "手机挂绳"
      }
    ]
  },
  {
    "id": "1688-977334898643",
    "title": "澳规PD20W手机充电头 适用于苹果手机充电器iphone手机快充充电器",
    "category": "1688 Imports",
    "description": "Supplier: 深圳欣福胜电子有限公司\n\n品牌: 欣福胜\n类型: 直充\n指示功能: 无指示功能\n接口: typec\n产品认证: CE认证\n3C证书编号: 2024010907685575\n适用型号: PD20W【澳规】,PD20W【欧规】,PD20W【美规】,PD20W【英规】\n是否跨境出口专供货源: 否\n是否专利货源: 否\n颜色: 不配包装,配包装\n充电器适用: 苹果充电器\n是否数显: 否\n输出功电流总功率: 20W\n\n不配包装: CNY 10.99, stock 0\n\nSource: https://detail.1688.com/offer/977334898643.html",
    "price": 18.96,
    "compare_at_price": 0,
    "cost_per_item": 2.75,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/977334898643/01.webp",
    "images": [
      "assets/1688/977334898643/01.webp",
      "assets/1688/977334898643/02.webp",
      "assets/1688/977334898643/03.webp",
      "assets/1688/977334898643/04.webp",
      "assets/1688/977334898643/05.webp",
      "assets/1688/977334898643/06.webp",
      "assets/1688/977334898643/07.webp",
      "assets/1688/977334898643/08.webp",
      "assets/1688/977334898643/09.webp"
    ],
    "vendor": "深圳欣福胜电子有限公司",
    "sku": "1688-977334898643",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/977334898643.html",
    "source_currency": "CNY",
    "source_price": 10.99,
    "source_variants": [
      {
        "image": "",
        "name": "不配包装",
        "priceCny": 10.99,
        "stock": 0
      }
    ],
    "source_attributes": [
      {
        "name": "品牌",
        "value": "欣福胜"
      },
      {
        "name": "类型",
        "value": "直充"
      },
      {
        "name": "指示功能",
        "value": "无指示功能"
      },
      {
        "name": "接口",
        "value": "typec"
      },
      {
        "name": "产品认证",
        "value": "CE认证"
      },
      {
        "name": "3C证书编号",
        "value": "2024010907685575"
      },
      {
        "name": "适用型号",
        "value": "PD20W【澳规】,PD20W【欧规】,PD20W【美规】,PD20W【英规】"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "不配包装,配包装"
      },
      {
        "name": "充电器适用",
        "value": "苹果充电器"
      },
      {
        "name": "是否数显",
        "value": "否"
      },
      {
        "name": "输出功电流总功率",
        "value": "20W"
      }
    ]
  },
  {
    "id": "1688-978850522530",
    "title": "可爱卡通疯狂动物狐狸小兔子树懒手办模型桌面烘焙蛋糕装饰品摆件",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市轩烨工艺品有限公司\n\n材质: PVC\n品牌: 轩烨\n产地: 浙江\n规格: 7-9cm\n包装方式: 其它\n是否有动漫形象: 否\n专利及著作权: 实用新型\n专利号或版权登记证号: 其它\n专利及著作权申请时间: 其它\n货号: 可爱卡通疯狂动物狐狸小兔子树懒手办模型\n是否有导购视频: 是\n是否拼装: 否\n是否专供外贸: 否\n3C配置类别: 14岁以上的玩具\n颜色: 单个价格，拍6个发一套\n主要下游平台: 亚马逊,wish,速卖通,独立站,LAZADA,其他\n主要销售地区: 欧洲,南美,东南亚,北美,东北亚,中东,其他\n有可授权的自有品牌: 否\n是否跨境出口专供货源: 是\n适用年龄: 青少年（15-17岁）\n\n单个价格，拍6个发一套: CNY 4.90, stock 9658978\n\nSource: https://detail.1688.com/offer/978850522530.html",
    "price": 8.45,
    "compare_at_price": 0,
    "cost_per_item": 1.23,
    "stock": 12,
    "sales": 0,
    "published": false,
    "image": "assets/1688/978850522530/01.webp",
    "images": [
      "assets/1688/978850522530/01.webp",
      "assets/1688/978850522530/02.webp",
      "assets/1688/978850522530/03.webp",
      "assets/1688/978850522530/04.webp",
      "assets/1688/978850522530/05.webp",
      "assets/1688/978850522530/06.webp",
      "assets/1688/978850522530/07.webp"
    ],
    "vendor": "义乌市轩烨工艺品有限公司",
    "sku": "1688-978850522530",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/978850522530.html",
    "source_currency": "CNY",
    "source_price": 4.9,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IFJUmf1LgjSmygIC9_!!2074831329-0-cib.jpg_sum.jpg",
        "name": "单个价格，拍6个发一套",
        "priceCny": 4.9,
        "stock": 9658978
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "品牌",
        "value": "轩烨"
      },
      {
        "name": "产地",
        "value": "浙江"
      },
      {
        "name": "规格",
        "value": "7-9cm"
      },
      {
        "name": "包装方式",
        "value": "其它"
      },
      {
        "name": "是否有动漫形象",
        "value": "否"
      },
      {
        "name": "专利及著作权",
        "value": "实用新型"
      },
      {
        "name": "专利号或版权登记证号",
        "value": "其它"
      },
      {
        "name": "专利及著作权申请时间",
        "value": "其它"
      },
      {
        "name": "货号",
        "value": "可爱卡通疯狂动物狐狸小兔子树懒手办模型"
      },
      {
        "name": "是否有导购视频",
        "value": "是"
      },
      {
        "name": "是否拼装",
        "value": "否"
      },
      {
        "name": "是否专供外贸",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "颜色",
        "value": "单个价格，拍6个发一套"
      },
      {
        "name": "主要下游平台",
        "value": "亚马逊,wish,速卖通,独立站,LAZADA,其他"
      },
      {
        "name": "主要销售地区",
        "value": "欧洲,南美,东南亚,北美,东北亚,中东,其他"
      },
      {
        "name": "有可授权的自有品牌",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "是"
      },
      {
        "name": "适用年龄",
        "value": "青少年（15-17岁）"
      }
    ]
  },
  {
    "id": "1688-980858162159",
    "title": "黄铜如意聚宝盆摆件聚财风水家居客厅店铺前台客厅旺宅铜工艺品",
    "category": "1688 Imports",
    "description": "Supplier: 东莞市缔鑫工艺品有限公司\n\n材质: 黄铜\n类别: 几何形状\n风格: 中国风\n品牌: 缔鑫\n货号: /\n适用场景: 家居,通用,园林,广场,室内外,娱乐场所,办公场所,宗教庙宇,宾馆/饭店,其他\n包装: 散装\n是否专利货源: 否\n颜色: 19cm金色吉祥如意聚宝盆,15cm金色吉祥如意聚宝盆,14金色吉祥如意聚宝盆,12cm金色吉祥如意聚宝盆,12cm【做旧】吉祥如意聚宝盆,10cm金色吉祥如意聚宝盆,8cm金色吉祥如意聚宝盆,8cm【做旧】吉祥如意聚宝盆,12cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套,15cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套,14cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套,10cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套,8cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套\n适用送礼场合: 婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他\n送礼用途: 商务礼品,广告礼品,促销赠品\n是否属于礼品: 是，个人礼品\n外观造型: 抽象\n适用节日: 通用,圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节,其他\n是否IP授权: 否\n\n19cm金色吉祥如意聚宝盆: CNY 328.00, stock 599\n15cm金色吉祥如意聚宝盆: CNY 145.70, stock 598\n14金色吉祥如意聚宝盆: CNY 109.00, stock 599\n12cm金色吉祥如意聚宝盆: CNY 72.00, stock 595\n12cm【做旧】吉祥如意聚宝盆: CNY 72.00, stock 599\n10cm金色吉祥如意聚宝盆: CNY 53.00, stock 499\n8cm金色吉祥如意聚宝盆: CNY 36.00, stock 596\n8cm【做旧】吉祥如意聚宝盆: CNY 36.00, stock 599\n12cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套: CNY 88.00, stock 599\n15cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套: CNY 161.00, stock 599\n14cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套: CNY 126.00, stock 599\n10cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套: CNY 69.90, stock 599\n8cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套: CNY 54.00, stock 599\n\nSource: https://detail.1688.com/offer/980858162159.html",
    "price": 62.1,
    "compare_at_price": 0,
    "cost_per_item": 9,
    "stock": 1,
    "sales": 0,
    "published": false,
    "image": "assets/1688/980858162159/01.webp",
    "images": [
      "assets/1688/980858162159/01.webp",
      "assets/1688/980858162159/02.webp",
      "assets/1688/980858162159/03.webp",
      "assets/1688/980858162159/04.webp",
      "assets/1688/980858162159/05.webp",
      "assets/1688/980858162159/06.webp",
      "assets/1688/980858162159/07.webp",
      "assets/1688/980858162159/08.webp",
      "assets/1688/980858162159/09.webp",
      "assets/1688/980858162159/10.webp",
      "assets/1688/980858162159/11.webp",
      "assets/1688/980858162159/12.webp",
      "assets/1688/980858162159/13.webp",
      "assets/1688/980858162159/14.webp",
      "assets/1688/980858162159/15.webp",
      "assets/1688/980858162159/16.webp",
      "assets/1688/980858162159/17.webp",
      "assets/1688/980858162159/18.webp",
      "assets/1688/980858162159/19.webp",
      "assets/1688/980858162159/20.webp",
      "assets/1688/980858162159/21.webp",
      "assets/1688/980858162159/22.webp",
      "assets/1688/980858162159/23.webp",
      "assets/1688/980858162159/24.webp",
      "assets/1688/980858162159/25.webp",
      "assets/1688/980858162159/26.webp",
      "assets/1688/980858162159/27.webp"
    ],
    "vendor": "东莞市缔鑫工艺品有限公司",
    "sku": "1688-980858162159",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/980858162159.html",
    "source_currency": "CNY",
    "source_price": 36,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ACrv6D1lHhrF49sFg_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "19cm金色吉祥如意聚宝盆",
        "priceCny": 328,
        "stock": 599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Tb5RvT1lHhpgxzbAn_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "15cm金色吉祥如意聚宝盆",
        "priceCny": 145.7,
        "stock": 598
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01WYVjdY1lHhtL7GwZK_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "14金色吉祥如意聚宝盆",
        "priceCny": 109,
        "stock": 599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01ZdNyvd1lHhpgCk6NA_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "12cm金色吉祥如意聚宝盆",
        "priceCny": 72,
        "stock": 595
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01qBSZPs1lHhphBNC01_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "12cm【做旧】吉祥如意聚宝盆",
        "priceCny": 72,
        "stock": 599
      },
      {
        "image": "",
        "name": "10cm金色吉祥如意聚宝盆",
        "priceCny": 53,
        "stock": 499
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01mvC0KU1lHhq1d5QZs_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "8cm金色吉祥如意聚宝盆",
        "priceCny": 36,
        "stock": 596
      },
      {
        "image": "",
        "name": "8cm【做旧】吉祥如意聚宝盆",
        "priceCny": 36,
        "stock": 599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01aKiOqi1lHhtSnh3Gn_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "12cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套",
        "priceCny": 88,
        "stock": 599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01PbZsr71lHhtSnn1W5_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "15cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套",
        "priceCny": 161,
        "stock": 599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01KgYsIg1lHhtSIJyBl_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "14cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套",
        "priceCny": 126,
        "stock": 599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01IyO5QJ1lHhtShuS7i_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "10cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套",
        "priceCny": 69.9,
        "stock": 599
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN011cEZH61lHhtOBh4fa_!!2217185664794-0-cib.jpg_sum.jpg",
        "name": "8cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套",
        "priceCny": 54,
        "stock": 599
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "黄铜"
      },
      {
        "name": "类别",
        "value": "几何形状"
      },
      {
        "name": "风格",
        "value": "中国风"
      },
      {
        "name": "品牌",
        "value": "缔鑫"
      },
      {
        "name": "货号",
        "value": "/"
      },
      {
        "name": "适用场景",
        "value": "家居,通用,园林,广场,室内外,娱乐场所,办公场所,宗教庙宇,宾馆/饭店,其他"
      },
      {
        "name": "包装",
        "value": "散装"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "19cm金色吉祥如意聚宝盆,15cm金色吉祥如意聚宝盆,14金色吉祥如意聚宝盆,12cm金色吉祥如意聚宝盆,12cm【做旧】吉祥如意聚宝盆,10cm金色吉祥如意聚宝盆,8cm金色吉祥如意聚宝盆,8cm【做旧】吉祥如意聚宝盆,12cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套,15cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套,14cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套,10cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套,8cm金色吉祥如意聚宝盆+招财貔貅一对+五帝钱一套"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,满月,旅游纪念,毕业,乔迁,派对聚会,探病慰问,其他"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,长辈,孩子,同学,恩师,其他"
      },
      {
        "name": "送礼用途",
        "value": "商务礼品,广告礼品,促销赠品"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "外观造型",
        "value": "抽象"
      },
      {
        "name": "适用节日",
        "value": "通用,圣诞节,情人节,春节,父亲节,母亲节,教师节,元旦,七夕,万圣节,复活节,国庆节,儿童节,妇女节,其他"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      }
    ]
  },
  {
    "id": "1688-985172114704",
    "title": "新款情侣一二布布磁吸钥匙扣情侣挂件书包挂件一对可爱周边桌面",
    "category": "1688 Imports",
    "description": "Supplier: 鹿泉区昊一宇百货商行\n\n材质: PVC\n钥匙配饰分类: 钥匙扣挂件\n品牌: 其他\n风格: 卡通\n货号: 345678vh\n颜色: 一二1个,布布1个,一二+布布/1套\n是否IP授权: 否\n是否属于礼品: 是，个人礼品\n适用送礼关系: 情侣,夫妻\n是否专利货源: 否\n适用节日: 通用,春节,元旦,七夕\n送礼用途: 其他\n适用送礼场合: 婚庆,生日,派对聚会,其他\n\n一二1个: CNY 1.10, stock 996622\n布布1个: CNY 1.10, stock 996731\n一二+布布/1套: CNY 2.20, stock 929482\n\nSource: https://detail.1688.com/offer/985172114704.html",
    "price": 1.9,
    "compare_at_price": 0,
    "cost_per_item": 0.28,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/985172114704/01.webp",
    "images": [
      "assets/1688/985172114704/01.webp",
      "assets/1688/985172114704/02.webp",
      "assets/1688/985172114704/03.webp",
      "assets/1688/985172114704/04.webp",
      "assets/1688/985172114704/05.webp"
    ],
    "vendor": "鹿泉区昊一宇百货商行",
    "sku": "1688-985172114704",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/985172114704.html",
    "source_currency": "CNY",
    "source_price": 1.1,
    "source_variants": [
      {
        "image": "",
        "name": "一二1个",
        "priceCny": 1.1,
        "stock": 996622
      },
      {
        "image": "",
        "name": "布布1个",
        "priceCny": 1.1,
        "stock": 996731
      },
      {
        "image": "",
        "name": "一二+布布/1套",
        "priceCny": 2.2,
        "stock": 929482
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣挂件"
      },
      {
        "name": "品牌",
        "value": "其他"
      },
      {
        "name": "风格",
        "value": "卡通"
      },
      {
        "name": "货号",
        "value": "345678vh"
      },
      {
        "name": "颜色",
        "value": "一二1个,布布1个,一二+布布/1套"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "适用送礼关系",
        "value": "情侣,夫妻"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "通用,春节,元旦,七夕"
      },
      {
        "name": "送礼用途",
        "value": "其他"
      },
      {
        "name": "适用送礼场合",
        "value": "婚庆,生日,派对聚会,其他"
      }
    ]
  },
  {
    "id": "1688-985967755398",
    "title": "【绿野仙踪】小众ins挂链链条串珠通用包包挂绳爱心挂件相机挂饰",
    "category": "1688 Imports",
    "description": "Supplier: 义乌如火饰品有限公司\n\n材质: PVC\n货号: C-014\n工艺: 手工\n是否进口: 否\n加工定制: 否\n品牌: 如火\n样式: 男女通用\n绳带材质: PVC\n绳扣材质: 金属扣\n是否有挂件: 无\n包装: 独立包装\n加印LOGO: 不可以\n是否专利货源: 否\n是否跨境出口专供货源: 否\n颜色: 绿色\n规格: 【绿野仙踪】挂绳\n种类: 手机挂绳\n\nSource: https://detail.1688.com/offer/985967755398.html",
    "price": 4.88,
    "compare_at_price": 0,
    "cost_per_item": 0.71,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/985967755398/01.webp",
    "images": [
      "assets/1688/985967755398/01.webp",
      "assets/1688/985967755398/02.webp",
      "assets/1688/985967755398/03.webp",
      "assets/1688/985967755398/04.webp",
      "assets/1688/985967755398/05.webp",
      "assets/1688/985967755398/06.webp",
      "assets/1688/985967755398/07.webp"
    ],
    "vendor": "义乌如火饰品有限公司",
    "sku": "1688-985967755398",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/985967755398.html",
    "source_currency": "CNY",
    "source_price": 2.83,
    "source_variants": [],
    "source_attributes": [
      {
        "name": "材质",
        "value": "PVC"
      },
      {
        "name": "货号",
        "value": "C-014"
      },
      {
        "name": "工艺",
        "value": "手工"
      },
      {
        "name": "是否进口",
        "value": "否"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "品牌",
        "value": "如火"
      },
      {
        "name": "样式",
        "value": "男女通用"
      },
      {
        "name": "绳带材质",
        "value": "PVC"
      },
      {
        "name": "绳扣材质",
        "value": "金属扣"
      },
      {
        "name": "是否有挂件",
        "value": "无"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "加印LOGO",
        "value": "不可以"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "是否跨境出口专供货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "绿色"
      },
      {
        "name": "规格",
        "value": "【绿野仙踪】挂绳"
      },
      {
        "name": "种类",
        "value": "手机挂绳"
      }
    ]
  },
  {
    "id": "1688-989766978708",
    "title": "可爱治愈小浣熊安抚巾豆袋毛绒公仔柔软挂件儿童解压手帕材料包",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市尊翔贸易有限公司\n\n填充材质: PP棉\n品牌: 尊享\n造型类别: 熊猫\n毛绒分类: 优质毛绒\n所属分类: 毛绒公仔\n造型是否卡通、动漫: 否\n包装方式: 网袋\n是否多功能: 否\n货号: 1\n加工定制: 否\n专利及著作权: 实用新型\n是否有导购视频: 是\n产地: 中国\n是否外贸: 是\n是否专供外贸: 否\n3C配置类别: 14岁以上的玩具\n颜色: 小浣熊材料包\n高度: 15cm\n适用年龄: 青年（15-35岁）\n\n15cm: CNY 4.56, stock 19899\n\nSource: https://detail.1688.com/offer/989766978708.html",
    "price": 7.87,
    "compare_at_price": 0,
    "cost_per_item": 1.14,
    "stock": 5,
    "sales": 0,
    "published": false,
    "image": "assets/1688/989766978708/01.webp",
    "images": [
      "assets/1688/989766978708/01.webp",
      "assets/1688/989766978708/02.webp",
      "assets/1688/989766978708/03.webp",
      "assets/1688/989766978708/04.webp"
    ],
    "vendor": "义乌市尊翔贸易有限公司",
    "sku": "1688-989766978708",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/989766978708.html",
    "source_currency": "CNY",
    "source_price": 4.56,
    "source_variants": [
      {
        "image": "",
        "name": "15cm",
        "priceCny": 4.56,
        "stock": 19899
      }
    ],
    "source_attributes": [
      {
        "name": "填充材质",
        "value": "PP棉"
      },
      {
        "name": "品牌",
        "value": "尊享"
      },
      {
        "name": "造型类别",
        "value": "熊猫"
      },
      {
        "name": "毛绒分类",
        "value": "优质毛绒"
      },
      {
        "name": "所属分类",
        "value": "毛绒公仔"
      },
      {
        "name": "造型是否卡通、动漫",
        "value": "否"
      },
      {
        "name": "包装方式",
        "value": "网袋"
      },
      {
        "name": "是否多功能",
        "value": "否"
      },
      {
        "name": "货号",
        "value": "1"
      },
      {
        "name": "加工定制",
        "value": "否"
      },
      {
        "name": "专利及著作权",
        "value": "实用新型"
      },
      {
        "name": "是否有导购视频",
        "value": "是"
      },
      {
        "name": "产地",
        "value": "中国"
      },
      {
        "name": "是否外贸",
        "value": "是"
      },
      {
        "name": "是否专供外贸",
        "value": "否"
      },
      {
        "name": "3C配置类别",
        "value": "14岁以上的玩具"
      },
      {
        "name": "颜色",
        "value": "小浣熊材料包"
      },
      {
        "name": "高度",
        "value": "15cm"
      },
      {
        "name": "适用年龄",
        "value": "青年（15-35岁）"
      }
    ]
  },
  {
    "id": "1688-990324493594",
    "title": "可爱小香蝴蝶结毛绒小熊钥匙扣挂件卡通挎包公仔创意包包挂饰女款",
    "category": "1688 Imports",
    "description": "Supplier: 义乌市恋希饰品有限公司\n\n材质: 毛绒\n钥匙配饰分类: 钥匙扣\n风格: 卡通\n品牌: 恋希\n货号: LX2241\n包装: 独立包装\n适用送礼场合: 生日,派对聚会,其他\n是否专利货源: 否\n颜色: 白色,黑色,灰色\n适用送礼关系: 晚辈,情侣,夫妻,同事,朋友,孩子,同学,其他\n送礼用途: 积分换购礼品,广告礼品,促销赠品,其他\n是否属于礼品: 是，个人礼品\n是否IP授权: 否\n适用节日: 通用\n\n白色: CNY 18.05, stock 4663\n黑色: CNY 18.05, stock 4486\n灰色: CNY 18.05, stock 4440\n\nSource: https://detail.1688.com/offer/990324493594.html",
    "price": 31.14,
    "compare_at_price": 0,
    "cost_per_item": 4.51,
    "stock": 3,
    "sales": 0,
    "published": false,
    "image": "assets/1688/990324493594/01.webp",
    "images": [
      "assets/1688/990324493594/01.webp",
      "assets/1688/990324493594/02.webp",
      "assets/1688/990324493594/03.webp",
      "assets/1688/990324493594/04.webp",
      "assets/1688/990324493594/05.webp",
      "assets/1688/990324493594/06.webp",
      "assets/1688/990324493594/07.webp",
      "assets/1688/990324493594/08.webp",
      "assets/1688/990324493594/09.webp"
    ],
    "vendor": "义乌市恋希饰品有限公司",
    "sku": "1688-990324493594",
    "tags": "1688, imported, draft",
    "source_url": "https://detail.1688.com/offer/990324493594.html",
    "source_currency": "CNY",
    "source_price": 18.05,
    "source_variants": [
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01Nhd2Tz1WQfLqwT0GS_!!2879452783-0-cib.jpg_sum.jpg",
        "name": "白色",
        "priceCny": 18.05,
        "stock": 4663
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01CfTsy51WQfLq0u7Zf_!!2879452783-0-cib.jpg_sum.jpg",
        "name": "黑色",
        "priceCny": 18.05,
        "stock": 4486
      },
      {
        "image": "https://cbu01.alicdn.com/img/ibank/O1CN01u14yIV1WQfLs2Xuqv_!!2879452783-0-cib.jpg_sum.jpg",
        "name": "灰色",
        "priceCny": 18.05,
        "stock": 4440
      }
    ],
    "source_attributes": [
      {
        "name": "材质",
        "value": "毛绒"
      },
      {
        "name": "钥匙配饰分类",
        "value": "钥匙扣"
      },
      {
        "name": "风格",
        "value": "卡通"
      },
      {
        "name": "品牌",
        "value": "恋希"
      },
      {
        "name": "货号",
        "value": "LX2241"
      },
      {
        "name": "包装",
        "value": "独立包装"
      },
      {
        "name": "适用送礼场合",
        "value": "生日,派对聚会,其他"
      },
      {
        "name": "是否专利货源",
        "value": "否"
      },
      {
        "name": "颜色",
        "value": "白色,黑色,灰色"
      },
      {
        "name": "适用送礼关系",
        "value": "晚辈,情侣,夫妻,同事,朋友,孩子,同学,其他"
      },
      {
        "name": "送礼用途",
        "value": "积分换购礼品,广告礼品,促销赠品,其他"
      },
      {
        "name": "是否属于礼品",
        "value": "是，个人礼品"
      },
      {
        "name": "是否IP授权",
        "value": "否"
      },
      {
        "name": "适用节日",
        "value": "通用"
      }
    ]
  }
]
$products$::jsonb) as product(
  id text,
  title text,
  category text,
  description text,
  price numeric,
  compare_at_price numeric,
  cost_per_item numeric,
  stock integer,
  sales integer,
  published boolean,
  image text,
  images jsonb,
  vendor text,
  sku text,
  tags text,
  source_url text,
  source_currency text,
  source_price numeric,
  source_variants jsonb,
  source_attributes jsonb
)
on conflict (id) do update set
  title = excluded.title,
  category = excluded.category,
  description = excluded.description,
  price = excluded.price,
  compare_at_price = excluded.compare_at_price,
  cost_per_item = excluded.cost_per_item,
  stock = excluded.stock,
  image = excluded.image,
  images = excluded.images,
  vendor = excluded.vendor,
  sku = excluded.sku,
  tags = excluded.tags,
  source_url = excluded.source_url,
  source_currency = excluded.source_currency,
  source_price = excluded.source_price,
  source_variants = excluded.source_variants,
  source_attributes = excluded.source_attributes,
  updated_at = now();

commit;
