class FeedsController < ApplicationController

  def index
  end

  def new
  end

  def create
    case params[:type].to_i
    when 0 then
      if DotsScraping.get_dots_event params[:link]
        redirect_to root_path, flash: { alert: "新着イベントを登録しました" }
      else
        flash[:alert] = "登録に失敗しました"
        render 'new'
      end
    when 1 then
      redirect_to root_path, flash: { alert: "テストです" }
    else
      render 'new'
    end
  end
end
