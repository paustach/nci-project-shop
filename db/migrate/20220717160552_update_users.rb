class UpdateUsers < ActiveRecord::Migration[7.0]
  def change
    @u = User.find_by( email: 'admin@admin.com' )
    # if there is no user with the email admin@admin.com
    # in the users table the above find_by() method will return nil
    # nil shows there is no record in the table with that email
    if @u != nil
      @u.update_attribute :admin, true
    end
  end
end
