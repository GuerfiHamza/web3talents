ActiveAdmin.register Job do

  permit_params :user_id, :title, :company, :twitter_link, :discord_invite, :os_link, :description, :chain, :slug

  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :title, :company, :twitter_link, :discord_invite, :os_link, :description, :chain, :slug
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :title, :company, :twitter_link, :discord_invite, :os_link, :description, :chain, :slug]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
