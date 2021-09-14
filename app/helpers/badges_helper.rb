module BadgesHelper
  def badge_attribute_rules
    Hash[Badge::RULES.map { |key, value| [I18n.t("activerecord.attributes.badge.rule_type.#{key}"), key] }]
  end
end
