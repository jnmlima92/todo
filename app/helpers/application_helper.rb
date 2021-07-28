module ApplicationHelper
  def translated_enum_options(model_name, enum_array)
    enum_array.map do |key|
      [I18n.t("activerecord.attributes.#{model_name}.#{key}"), key]
    end
  end

  def render_button(label, path)
    style = case label
    when *['new', 'create', 'edit']
      'btn btn-primary text-white btn-sm'
    else
      'btn btn-secondary text-white btn-sm'
    end
    
    link_to t("helpers.button.#{label}"), path, class: style, type: 'button'
  end
end
