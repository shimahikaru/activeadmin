ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
actions :all
permit_params :admin_user_id, :name
# permit_params :list, :of, :attributes, :on, :model
#
  index do
    selectable_column
    id_column
    column :name
    column :admin_user_id
    column :created_at
    column :updated_at
  end

# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  form do |f|
    f.inputs do
      f.input :admin_user_id, input_html: { disabled: true,  value: current_admin_user.id }
      f.input :name, as: :text
    end

    f.actions
  end

end
