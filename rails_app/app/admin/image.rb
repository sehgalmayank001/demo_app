ActiveAdmin.register Image do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name , :image, :user_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.inputs "New Image" do
    f.input :user_id, :as => :select, :collection => User.all.map{|u| ["#{u.email}", u.id]} , :prompt => "--select user--"
    f.input :name
    f.input :image
  end
  f.actions
end

end
