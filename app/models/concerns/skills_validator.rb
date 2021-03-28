class SkillsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.lines.count > 5
      record.errors.add(attribute, I18n.t('skills_validator.line_count_error'))
    end
  end
end