# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

admin = Administrator.create(
	email: "junwako@gmail.com", 
	password: '11111111'
)

Municipality.create(:name => "千代田区")
Municipality.create(:name => "中央区")
Municipality.create(:name => "港区")
Municipality.create(:name => "新宿区")
Municipality.create(:name => "文京区")
Municipality.create(:name => "台東区")
Municipality.create(:name => "墨田区")
Municipality.create(:name => "江東区")
Municipality.create(:name => "品川区")
Municipality.create(:name => "目黒区")
Municipality.create(:name => "大田区")
Municipality.create(:name => "世田谷区")
Municipality.create(:name => "渋谷区")
Municipality.create(:name => "中野区")
Municipality.create(:name => "杉並区")
Municipality.create(:name => "豊島区")
Municipality.create(:name => "北区")
Municipality.create(:name => "荒川区")
Municipality.create(:name => "板橋区")
Municipality.create(:name => "練馬区")
Municipality.create(:name => "足立区")
Municipality.create(:name => "葛飾区")
Municipality.create(:name => "江戸川区")
Municipality.create(:name => "八王子市")
Municipality.create(:name => "立川市")
Municipality.create(:name => "武蔵野市")
Municipality.create(:name => "三鷹市")
Municipality.create(:name => "青梅市")
Municipality.create(:name => "府中市")
Municipality.create(:name => "昭島市")
Municipality.create(:name => "調布市")
Municipality.create(:name => "町田市")
Municipality.create(:name => "小金井市")
Municipality.create(:name => "小平市")
Municipality.create(:name => "日野市")
Municipality.create(:name => "東村山市")
Municipality.create(:name => "国分寺市")
Municipality.create(:name => "国立市")
Municipality.create(:name => "福生市")
Municipality.create(:name => "狛江市")
Municipality.create(:name => "東大和市")
Municipality.create(:name => "清瀬市")
Municipality.create(:name => "東久留米市")
Municipality.create(:name => "武蔵村山市")
Municipality.create(:name => "多摩市")
Municipality.create(:name => "稲城市")
Municipality.create(:name => "羽村市")
Municipality.create(:name => "あきる野市")
Municipality.create(:name => "西東京市")

c = Category.create(:title => "育児")

i = c.indicators.create(:title => "幼稚園数")
is = i.indicator_sources.create(
	:title			=> "学校基本調査報告", 
	:sub_title	=> "2.幼稚園, 2-1.区市町村、設置者別園数及び学級数",
	:year				=> 2013, 
	:url				=> "http://www.toukei.metro.tokyo.jp/gakkou/2013/gk13qg10000.htm",
	:authority	=> "東京都総務局"
	)


