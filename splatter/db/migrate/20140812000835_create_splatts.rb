class CreateSplatts < ActiveRecord::Migration
  def change
    create_table :splatts do |t|
    
      validates :body, presence: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
