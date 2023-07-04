ActiveAdmin.register User do

  permit_params :headline, :profile_picture, :cover_picture, :summary, :job, :website, :twitter, :discord, :slug, :admin

  index do
    selectable_column
    id_column
    column :headline
    column :summary
    column :job
    column :website
    column :twitter
    column :discord
    column :slug
    column :admin
    column :created_at
    actions
  end

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
  # permit_params :username, :eth_address, :eth_nonce, :headline, :profile_picture, :cover_picture, :summary, :job, :website, :twitter, :discord, :salt, :remember_me_token, :remember_me_token_expires_at, :slug, :admin
  #
  # or
  #
  # permit_params do
  #   permitted = [:username, :eth_address, :eth_nonce, :headline, :profile_picture, :cover_picture, :summary, :job, :website, :twitter, :discord, :salt, :remember_me_token, :remember_me_token_expires_at, :slug, :admin]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
