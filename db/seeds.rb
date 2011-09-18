# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

p=Page.create(:name_en=>"Home",:name_zh_cn=>"首页")

p=Page.create(:name_en=>"About us",:name_zh_cn=>"关于我们")
Page.create(:name_en=>"About Ideal Energy",:name_zh_cn=>"关于理想能源",:parent=>p)
Page.create(:name_en=>"Management Team",:name_zh_cn=>"管理团队",:parent=>p)
Page.create(:name_en=>"Company Milestones",:name_zh_cn=>"大事记",:parent=>p)

p=Page.create(:name_en=>"Products & Technologies",:name_zh_cn=>"产品与技术")
p1=Page.create(:name_en=>"Solar",:name_zh_cn=>"太阳能电池设备",:parent=>p)
p2=Page.create(:name_en=>"LED",:name_zh_cn=>"LED外延片设备",:parent=>p)
Page.create(:name_en=>"Understand Solar",:name_zh_cn=>"了解太阳能电池",:parent=>p1)
Page.create(:name_en=>"LPCVD",:name_zh_cn=>"LPCVD",:parent=>p1)
Page.create(:name_en=>"PECVD",:name_zh_cn=>"PECVD",:parent=>p1)
Page.create(:name_en=>"Understand LED",:name_zh_cn=>"了解LED",:parent=>p2)
Page.create(:name_en=>"MOCVD",:name_zh_cn=>"MOCVD",:parent=>p2)

p=Page.create(:name_en=>"Media",:name_zh_cn=>"新闻中心")
Page.create(:name_en=>"Company News",:name_zh_cn=>"公司新闻",:parent=>p)
Page.create(:name_en=>"Ideal Energy In The News",:name_zh_cn=>"相关报道",:parent=>p)
Page.create(:name_en=>"Pictures",:name_zh_cn=>"图片集锦",:parent=>p)
Page.create(:name_en=>"Videos",:name_zh_cn=>"视频资料",:parent=>p)

p=Page.create(:name_en=>"Human Resource",:name_zh_cn=>"人力资源")
Page.create(:name_en=>"Careers",:name_zh_cn=>"职业发展",:parent=>p)

p=Page.create(:name_en=>"Contact us",:name_zh_cn=>"联系我们")