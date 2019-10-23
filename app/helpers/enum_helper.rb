module EnumHelper
  def options_for_select_from_enum(klass,column)
    #該当クラスのEnum型リストをハッシュで取得
    enum_list = klass.send(column.to_s.pluralize)
    #Enum型のハッシュリストに対して、名前定義と日本語化文字列の配列を取得（valueは使わないため_)
    enum_list.map do | name , _value |
      [ t("enums.#{klass.to_s.downcase}.#{column}.#{name}") , name ]
    end
  end
end