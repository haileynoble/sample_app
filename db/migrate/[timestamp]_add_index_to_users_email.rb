class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
	def change
		add_index :users, :email, uniqe: true
	end
end

