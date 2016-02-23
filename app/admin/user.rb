ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
permit_params :email, :username, :name, :password, :phone

 form do |f|
    inputs 'Details' do
      input :email
      input :username
      input :name
      input :password
      input :phone
     
    end
    panel 'Markup' do
      "The form can be used to add/edit User detail..."
    end
    
    para "Press cancel to return to the list without saving."
    actions
  end
end
