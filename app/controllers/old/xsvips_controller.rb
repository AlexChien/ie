class XsvipsController < ApplicationController

  def index
    @xsvip = Xsvip.new
  end

  def create
    @xsvip = Xsvip.new(params[:xsvip])
    @xsvip.user = current_user
    if @xsvip.save
      flash[:notice]="您的提交成功,稍后我们会核实您所填写的信息,感谢您的参与!"
    else
      flash[:error]="提交发生错误，请重新尝试！"
    end
    redirect_to xsvips_path
  end

end
