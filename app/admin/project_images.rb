ActiveAdmin.register ProjectImage do
  permit_params :project_id, :image
  menu label: 'プロジェクト画像', parent: 'プロジェクト'
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
  show do |design_image|
      attributes_table_for design_image do
        row(:project_id) { |design_image| link_to('デザインへ', admin_project_path(id: design_image.project_id)) }
        row(:image) { |design_image| design_image.image.attached? ? image_tag(design_image.image, style: 'max-width: 500px') : '' }
    end

  end
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  # show do |design_image|
  #     attributes_table_for design_image do
  #       row(:project_design_id) { |design_image| link_to('デザインへ', maison_project_design_path(id: design_image.project_design.id)) }
  #       row(:image) { |design_image| design_image.image.attached? ? image_tag(design_image.image, style: 'max-width: 500px') : '' }
  #   end

  #   active_admin_comments
  # end

  form do |f|
    f.inputs do
      f.input :project_id, input_html: { disabled: true,  value: params[:project_id] || resource.project_id }
      f.input :project_id, input_html: { value: params[:project_id] || resource.project.id }, as: :hidden
      f.input :image, as: :file, hint: f.object.new_record? || !f.object.image.attached? ? '' : image_tag(f.object.image)
    end

    f.actions
  end

end
