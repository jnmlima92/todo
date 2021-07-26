module ApplicationHelper
  def translated_enum_options(model_name, enum_array)
    enum_array.map do |key|
      [I18n.t("activerecord.attributes.#{model_name}.#{key}"), key]
    end
  end

  def render_button(label, path)
    link_to t("helpers.button.#{label}"), path
  end
end
