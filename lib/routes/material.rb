class Routes < Urns::Base

  get "/product/material/materials/?" do
    auth_admin
    @material = Material.all
    erb :"/product/material/materials"
  end

  get "/product/material/new/?" do
    auth_admin
    @material = Material.new
    erb :"/product/material/material_edit" 
  end

  post "/product/material/new/?" do
    auth_admin
    material = Material.create(
      :material_type  => params[:material_type],
      :description    => params[:description],
      :woodtype_id     => params[:woodtypeid]
  )
    redirect "/product/material/materials"
  end

  get "/product/material/:id/?" do
    auth_admin
    @material = Material[params[:id]]
    erb :"/product/material/material_edit"
  end

  get "/product/material/:id/edit/?" do
    auth_admin
    @material = Material[params[:id]]
    erb :"/product/material/material_edit"
  end

  post "/product/material/:id/edit/?" do
    auth_admin
    material = Material[params[:id]]
    material.update(
      :material_type  => params[:material_type],
      :description    => params[:description],
      :woodtype_id     => params[:woodtypeid]
    )
    redirect "/product/material/materials"
  end

  get "/product/material/:id/delete/?" do
    auth_admin
    material = Material[params[:id]]
    material.destroy
    redirect "/product/material/materials"
  end 
  
end      