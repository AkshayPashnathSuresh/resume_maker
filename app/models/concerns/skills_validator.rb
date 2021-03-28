# frozen_string_literal: true

class SkillsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, I18n.t('skills_validator.line_count_error')) if value.lines.count > 5
  end
end
