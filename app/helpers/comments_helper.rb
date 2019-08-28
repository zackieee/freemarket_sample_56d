module CommentsHelper
  def comment_baloon(comments)

    comment = comments.collect do | come |
      if come.user.id == current_user.id
        right_baloon(come)
      else
        left_baloon(come)
      end
    end.join

    %{<ul>#{comment}</ul>}.html_safe

  end

  def right_baloon(come)

    if come.user.avatar.attached?
      src = url_for(come.user.avatar)
    else
      src = '/assets/common/member_photo_noimage_thumb-224a733c50d48aba6d9fdaded809788bbeb5ea5f6d6b8368adaebb95e58bcf53.png'
    end

    comment = %{<li class="trade-comment-right">
                  <div class="trade-comment-right__comment">
                    <p class="trade-comment-right__comment__nickname">#{come.user.nickname}</p>
                    <div class="trade-comment-right__comment__content">
                      <p class="trade-comment-right__comment__content__text">#{simple_format(come.text)}</p>
                      <div class="trade-comment-right__comment__content__time">
                        <i class="far fa-lg fa-clock"></i>
                        <p>#{time_ago_in_words(come.created_at) + '前'}</p>
                      </div>
                    </div>
                  </div>
                  <img src="#{src}" width="48px" height="48px">
                </li>
              }
  end

  def left_baloon(come)
    if come.user.avatar.attached?
      src = url_for(come.user.avatar)
    else
      src = '/assets/common/member_photo_noimage_thumb-224a733c50d48aba6d9fdaded809788bbeb5ea5f6d6b8368adaebb95e58bcf53.png'
    end

    comment = %{<li class="trade-comment-left">
                  <img src="#{src}" width="48px" height="48px">
                  <div class="trade-comment-left__comment">
                    <p class="trade-comment-left__comment__nickname">#{come.user.nickname}</p>
                    <div class="trade-comment-left__comment__content">
                      <p class="trade-comment-left__comment__content__text">#{simple_format(come.text)}</p>
                      <div class="trade-comment-left__comment__content__time">
                        <i class="far fa-lg fa-clock"></i>
                        <p>#{time_ago_in_words(come.created_at) + '前'}</p>
                      </div>
                    </div>
                  </div>
                </li>
  }
end
end
