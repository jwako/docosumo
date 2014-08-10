# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

admin = Admin.create(
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

c1 = Category.create(:title => "出産")
c2 = Category.create(:title => "育児")
c3 = Category.create(:title => "教育")
c4 = Category.create(:title => "生活")
c5 = Category.create(:title => "医療")
c6 = Category.create(:title => "安心・安全")

i11 = c1.indicators.create(:title => "産婦人科医師数")

i21 = c2.indicators.create(:title => "保育園数")
i22 = c2.indicators.create(:title => "幼稚園数")
i23 = c2.indicators.create(:title => "待機児童数")

is22 = i22.indicator_sources.create(
	:title			=> "学校基本調査報告", 
	:sub_title	=> "2.幼稚園, 2-1.区市町村、設置者別園数及び学級数",
	:year				=> 2013, 
	:url				=> "http://www.toukei.metro.tokyo.jp/gakkou/2013/gk13qg10000.htm",
	:authority	=> "東京都総務局"
	)

i31 = c3.indicators.create(:title => "小学校数")
is31 = i31.indicator_sources.create(
	:title			=> "学校基本調査報告", 
	:sub_title	=> "3.小学校, 3-1.区市町村、学級数別学校数（総数）",
	:year				=> 2013, 
	:url				=> "http://www.toukei.metro.tokyo.jp/gakkou/2013/gk13qg10000.htm",
	:authority	=> "東京都総務局"
	)

i41 = c4.indicators.create(:title => "図書館数")
i42 = c4.indicators.create(:title => "公園数")

i51 = c5.indicators.create(:title => "一般病院総数")
i52 = c5.indicators.create(:title => "小児科医師数")

i61 = c6.indicators.create(:title => "刑法犯罪認知件数")
i62 = c6.indicators.create(:title => "交通事故発生件数")

# OpenDatum.all.each do |data|
# 	data.deviation_value = data.deviation
# 	data.save!
# end
