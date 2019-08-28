module NoticeHelper
  #表示画像のディスパッチ
  def notice_image_dispacher(info)
    case info.action
    when 1
      if info.sender.avatar.attached?
        image_tag info.sender.avatar, class:'mypage__main__contents__content__image', height: '48px', width: '48px'
      else
        image_tag 'mercari_profile.png', class:'mypage__main__contents__content__image', height: '48px', width: '48px'
      end
    when 2
      image_tag info.trade.product.images.first, class:'mypage__main__contents__content__image', height: '48px', width: '48px'
    when 3
      image_tag info.product.images.first, class:'mypage__main__contents__content__image', height: '48px', width: '48px'
    when 4
      image_tag info.trade.product.images.first, class:'mypage__main__contents__content__image', height: '48px', width: '48px'
    end
  end

end