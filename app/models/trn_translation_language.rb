class TrnTranslationLanguage < ActiveRecord::Base
  self.table_name = 'trn_translation_language'
  self.primary_key = :numeric_language_id

end
