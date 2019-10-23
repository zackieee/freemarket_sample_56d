class Rating < ApplicationRecord
  belongs_to :rated_user, class_name: 'User', foreign_key: 'rated_user_id'
  belongs_to :rater_user, class_name: 'User', foreign_key: 'rater_user_id'
  belongs_to :trade

  attr_accessor :all_count

  @all_count ||= 3

  #enumを設置してみる
  enum rate: { good: true, bad: false  }

  #scopeを定義してみる
  scope :recent,      ->              { order( created_at: :DESC ) }
  scope :my_ratings,  ->  ( user_id ) { where( rated_user_id: user_id ) }
  scope :rating_type, ->  ( rate )    { where( rate: rate ) }

  #評価種別ごとにカウント取得
  def self.count_rating(user_id)
    rating_count = {}

    #全件取得
    rating_count[:all] = Rating.my_ratings(user_id).count

    #カウンタを回して、種別ごとのカウントを取得
    Rating.rates.each_with_index do | rate , index |
      binding.pry
      rating_count[(rate[0]).to_sym] = Rating.my_ratings(user_id).rating_type(rate[1]).count
      @all_count += rating_count[(rate[0]).to_sym]
    end
    #取得した値をコールバックする
    rating_count
  end

end
