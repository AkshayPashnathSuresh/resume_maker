class ParagraphValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.split(/[^-a-zA-Z]/).size > 50
      record.errors.add(attribute, I18n.t('paragraph_validator.word_count_error'))
    end
  end
end