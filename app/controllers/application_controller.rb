class ApplicationController < Sinatra::Base

#set the content-type header  for all responses
set :default_content_type, 'application/json'


# add routes
  get  '/bakeries' do 
    'Hello World'
    #get all the bakeries from the database 
    bakeries = Bakery.all 
    #send them back as a JSON array 
    bakeries.to_json
  end

  get '/bakeries/:id' do 
    bakeries = Bakery.find(params[:id])
    bakeries.as_json(only: [:name], include: { baked_goods: { only: [:name, :price ]}})
  end
end
