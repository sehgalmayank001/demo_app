ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :email, :password, :password_confirmation
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
  selectable_column
  id_column
  column :email
  column :current_sign_in_at
  column :sign_in_count
  column :created_at
  actions
end

form do |f|
  f.inputs "User Details" do
    f.input :email
    f.input :password
    f.input :password_confirmation
  end
  f.actions
end
end
