class CreateSmsLoggers < ActiveRecord::Migration
  def change
    create_table :sms_loggers do |t|
      t.string :body
      t.string :from

      t.timestamps
    end
  end
end
