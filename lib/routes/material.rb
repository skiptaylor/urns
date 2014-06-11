class Routes < Urns::Base

  get "/product/material/materials/?" do
    @material = Material.all
    erb :"/product/material/materials"
  end

  get "/product/material/new/?" do
    @material = Material.new
    erb :"/product/material/material_edit" 
  end

  post "/product/material/new/?" do
    material = Material.create(
      :material_type  => params[:material_type],
      :description    => params[:description],
      :woodtype_id     => params[:woodtypeid]
  )
    redirect "/product/material/materials"
  end

  get "/product/material/:id/?" do
    @material = Material[params[:id]]
    erb :"/product/material/material_edit"
  end

  get "/product/material/:id/edit/?" do
    @material = Material[params[:id]]
    erb :"/product/material/material_edit"
  end

  post "/product/material/:id/edit/?" do
    material = Material[params[:id]]
    material.update(
      :material_type  => params[:material_type],
      :description    => params[:description],
      :woodtype_id     => params[:woodtypeid]
    )
    redirect "/product/material/materials"
  end

  get "/product/material/:id/delete/?" do
    material = Material[params[:id]]
    material.destroy
    redirect "/product/material/materials"
  end 
  
end      