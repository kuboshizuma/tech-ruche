class FeedsController < ApplicationController

  def index
    @feeds = Feed.where('started_at >= ?', Time.now.beginning_of_day).order("updated_at DESC")
    @favorites = Favorite.where(user_id: @user_id).pluck(:feed_id)
  end

  def recent
    @feeds = Feed.where('started_at >= ?', Time.now.beginning_of_day).order("started_at ASC")
    @favorites = Favorite.where(user_id: @user_id).pluck(:feed_id)
  end

  def favorite
    user = User.find(@user_id)
    @feeds = user.feeds
    @favorites = Favorite.where(user_id: @user_id).pluck(:feed_id)
  end

  def old
    @feeds = Feed.where('started_at < ?', Time.now.beginning_of_day).order("updated_at DESC")
    @favorites = Favorite.where(user_id: @user_id).pluck(:feed_id)
  end


  def new
  end

  def create
    case params[:type].to_i
    when 0 then
      if DotsScraping.get_dots_event params[:link]
        redirect_to root_path, flash: { notice: "新着イベントを登録しました" }
      else
        flash[:alert] = "登録に失敗しました"
        render 'new'
      end
    when 1 then
      link_ele = params[:link].split('/')
      if link_ele[2].include?("connpass.com") && link_ele[3] == "event"
        connpass_events = HTTParty.get('http://connpass.com/api/v1/event/?event_id=' + link_ele[4])
        connpass_event = connpass_events.parsed_response["events"][0]
        if ConnpassApi.save_connpass_event connpass_event
          redirect_to root_path, flash: { notice: "新着イベントを登録しました" }
        else
        flash[:alert] = "登録に失敗しました"
        render 'new'
        end
      else
        flash[:alert] = "URLを間違えています"
        render 'new'
      end
    else
      flash[:alert] = "登録に失敗しました"
      render 'new'
    end
  end

end
