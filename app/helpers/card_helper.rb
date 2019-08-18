module CardHelper
  # ブランドイメージ表示
  def show_brand(brand)
    case brand
    when "Visa"
      image_tag 'common/visa.svg', class:'credit-card',width:'49px',height:'20px'
    when "MasterCard"
      image_tag 'common/master-card.svg', class:'credit-card',width:'34px',height:'20px'
    when "JCB"
      image_tag 'common/jcb.svg', class:'credit-card',width:'32px',height:'20px'
    when "American Express"
      image_tag 'common/american_express.svg', class:'credit-card',width:'21px',height:'20px'
    when "Diners Club"
      image_tag 'common/dinersclub.svg', class:'credit-card',width:'32px',height:'20px'
    when "Discover"
      image_tag 'common/discover.svg', class:'credit-card',width:'32px',height:'20px'
    end
  end
end