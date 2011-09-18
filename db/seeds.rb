# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

t_default=Template.create(:name=>"default",
                          :layout=>'<!DOCTYPE html>
<html lang="<%= I18n.locale %>">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- <r:meta:language />  -->
	<title><%= t(:site_name) %></title>

	<%= include_stylesheets "base" %>
	<%= include_javascripts "base" %>

	<%= yield :header %>
</head>
<body id="bg2j">
	<div id="idea">
		<div class="sides"><img src="/images/2j01.blue.png" /></div>
		<div class="idea">

			<%= render :partial => "shared/search_box" %>
			<%= render :partial => "shared/nav" %>

			<div class="picture"><img src="/images/2j03.blue.jpg" /></div>
			<div class="content2j">
				<%= yield %>
			</div>

			<%= render :partial => "shared/footer" %>

		</div>
		<div class="sides"><img src="/images/2j02.blue.png" /></div>
	</div>

	<%= render :partial => "shared/ga" %>
</body>
</html>')

t_home=Template.create(:name=>"home",
                  :layout=>'<!DOCTYPE html>
<html lang="<%= I18n.locale %>">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<!-- <r:meta:language />  -->
	<title><%= t(:site_name) %></title>

	<%= include_stylesheets "base" %>
	<%= include_javascripts "base" %>

	<%= yield :header %>
	<style type="text/css" media="screen">
		.footernav a {color:#FFF; font-weight:bold;}
		.copyright {color:#FFF;}
	</style>
</head>

<body id="bg">
	<div id="idea">
		<div class="sides"><img style="margin-top:65px;" src="/images/idea01.blue.png" /></div>
		<div class="idea">

			<%= render :partial => "shared/search_box" %>

			<%= render :partial => "shared/nav" %>

			<div class="flash" id="hero">
				<script type="text/javascript" src="/javascripts/swfobject.js"></script> 
				<script type="text/javascript">
				var so = new SWFObject("/swf/flash1.swf", "gallery", "944", "286", "6", "#ffffff");
				so.addParam("quality", "high");
				so.addParam("wmode", "transparent");
				so.write("hero");
				</script>
			</div>

			<div class="content">

				<%=render :partial=>"/home/products"%>

				<%=render :partial=>"/home/news"%>

				<div class="blank0"></div>

			</div>
			<div><img src="/images/contentbg.gif"></div>

			<%= render :partial => "shared/footer" %>

		</div>
		<div class="sides"><img style="margin-top:65px;" src="/images/idea02.blue.png" /></div>
	</div>

	<%= render :partial => "shared/ga" %>
</body>
</html>')


p=Page.create(:name_en=>"Home",:name_zh_cn=>"首页",:template=>t_home,:path=>"/")

p=Page.create(:name_en=>"About us",:name_zh_cn=>"关于我们",:template=>t_default,:path=>"/about")
Page.create(:name_en=>"About Ideal Energy",:name_zh_cn=>"关于理想能源",:parent=>p,:template=>t_default,:path=>"/about-us")
Page.create(:name_en=>"Management Team",:name_zh_cn=>"管理团队",:parent=>p,:template=>t_default,:path=>"/team")
Page.create(:name_en=>"Company Milestones",:name_zh_cn=>"大事记",:parent=>p,:template=>t_default,:path=>"/about-history")

p=Page.create(:name_en=>"Products & Technologies",:name_zh_cn=>"产品与技术",:template=>t_default,:path=>"/products-technologies")
p1=Page.create(:name_en=>"Solar",:name_zh_cn=>"太阳能电池设备",:parent=>p,:template=>t_default,:path=>"/solar")
p2=Page.create(:name_en=>"LED",:name_zh_cn=>"LED外延片设备",:parent=>p,:template=>t_default,:path=>"/led")
Page.create(:name_en=>"Understand Solar",:name_zh_cn=>"了解太阳能电池",:parent=>p1,:template=>t_default,:path=>"/get-to-know-solar-power")
Page.create(:name_en=>"LPCVD",:name_zh_cn=>"LPCVD",:parent=>p1,:template=>t_default,:path=>"/lpcvd")
Page.create(:name_en=>"PECVD",:name_zh_cn=>"PECVD",:parent=>p1,:template=>t_default,:path=>"/pecvd")
Page.create(:name_en=>"Understand LED",:name_zh_cn=>"了解LED",:parent=>p2,:template=>t_default,:path=>"/get-to-know-led")
Page.create(:name_en=>"MOCVD",:name_zh_cn=>"MOCVD",:parent=>p2,:template=>t_default,:path=>"/mocvd")

p=Page.create(:name_en=>"Media",:name_zh_cn=>"新闻中心",:template=>t_default,:path=>"/media")
Page.create(:name_en=>"Company News",:name_zh_cn=>"公司新闻",:parent=>p,:template=>t_default,:path=>"/news-company")
Page.create(:name_en=>"Ideal Energy In The News",:name_zh_cn=>"相关报道",:parent=>p,:template=>t_default,:path=>"/news-report")
Page.create(:name_en=>"Pictures",:name_zh_cn=>"图片集锦",:parent=>p,:template=>t_default,:path=>"/news-pics")
Page.create(:name_en=>"Videos",:name_zh_cn=>"视频资料",:parent=>p,:template=>t_default,:path=>"/news-video")

p=Page.create(:name_en=>"Human Resource",:name_zh_cn=>"人力资源",:template=>t_default,:path=>"/human-resource")
Page.create(:name_en=>"Careers",:name_zh_cn=>"职业发展",:parent=>p,:template=>t_default,:path=>"/job-list")

p=Page.create(:name_en=>"Contact us",:name_zh_cn=>"联系我们",:template=>t_default,:path=>"/contactus")