class InitHomeNews < ActiveRecord::Migration
  def up
    Story.create(:pubdate => "2011-03-01", :title_zh_cn => "获得等离子增强化学气相沉积设备控制软件著作权", :title_en => "Received Copyright certificate of PECVD software controlling system", :path => "/news-company")
    Story.create(:pubdate => "2011-01-01", :title_zh_cn => "等离子体增强型化学气相沉积设备(PECVD)成功下线", :title_en => "Launches PECVD system for tandem junction thin-film solar cell production", :path => "/news-video")
    Story.create(:pubdate => "2010-09-01", :title_zh_cn => "LPCVD获得首份订单", :title_en => "First order of Ideal Energy LPCVD system received", :path => "")
    Story.create(:pubdate => "2010-07-01", :title_zh_cn => "获得LPCVD控制软件著作权", :title_en => "Received “Copyright certificate” of LPCVD software controlling system", :path => "/news-company")
    Story.create(:pubdate => "2010-05-01", :title_zh_cn => "上海市委书记俞正声一行视察理想能源", :title_en => "Zhengsheng Yu, the secretary of Shanghai, visits Ideal Energy", :path => "/news-pics")
    Story.create(:pubdate => "2010-04-01", :title_zh_cn => "理想能源首台LPCVD设备通过功能测试", :title_en => "The first LPCVD system of Ideal Energy successfully passed the functional test", :path => "")
    Story.create(:pubdate => "2009-08-01", :title_zh_cn => "理想能源设备（上海）有限公司成立", :title_en => "Ideal Energy Equipment (Shanghai) Ltd. established", :path => "")
  end

  def down
  end
end
