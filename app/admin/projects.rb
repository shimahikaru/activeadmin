ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
actions :all
permit_params :admin_user_id, :name
# permit_params :list, :of, :attributes, :on, :model
#
  index do
    id_column
    column :name
    column :admin_user
    column :created_at
    column :updated_at
  end

  show do
    attributes_table do
      row(:admin_user) { link_to( 'ユーザーページへ', admin_admin_user_path(id: project.admin_user_id)) }
      row :name

      row(:created_at)
      row(:updated_at)
    end

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
      f.input :admin_user_id
      f.input :name, as: :text
    end

    f.actions
  end

  action_item(:show, only: :show) do
      link_to 'パース画像の追加', new_admin_project_image_path(project_id: resource.id)
  end

  action_item(:show, only: :show) do
    if !resource.open? && resource.project_images.present?
      link_to 'デザインを公開する', { action: :open_project }
    end
  end

  member_action :open_project do

    resource.progress

    # AdminActionMailer.open_design(resource.id).deliver_later

    redirect_to admin_project_path(id: resource.id)
  end

end
