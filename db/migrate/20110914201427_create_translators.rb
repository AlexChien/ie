class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.string :name
      t.timestamps
    end
    
    Translator.create(:name=>"zh_cn")
    Translator.create(:name=>"en")
  end
end
