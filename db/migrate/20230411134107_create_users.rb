class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name,  null: false, comment: "名前"
      t.string :email, null: false, comment: "メールアドレス"
      t.string :password_digest, null: false, comment: "パスワード"

      t.timestamps
      t.index :email, unique: true
    end
  end
end
