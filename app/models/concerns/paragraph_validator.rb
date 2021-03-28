# frozen_string_literal: true

class ParagraphValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, I18n.t('paragraph_validator.word_count_error')) if value.split(/[^-a-zA-Z]/).size > 50
  end
end
