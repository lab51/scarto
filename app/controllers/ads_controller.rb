class AdsController < ApplicationController
  require 'rmagick' #to resize images
  layout 'listing'

  #show one ad
  def show
    @ad = Ad.find(params[:id])
  end

  #add new form
  def new
    @ad = Ad.new

    #we need these two to nested forms to work properly
    @ad.build_ad_description
    @ad.build_ad_extra
  end
  
  #create new ad
  def create
    
    @ad = Ad.new(ad_params)
    
    if @ad.save
      #----------------------------------------------
      # user new/current??
      # first, we need to check who is adding an ad - a new user (then create account)
      # or a logged user (then take id)    
      if session[:user_id]==nil
        # new user -> generate password and create account 
        generated_password = ('a'..'z').to_a.shuffle[0,8].join
        user = User.new(email: params[:ad][:email], password: generated_password, password_confirmation: generated_password)
          if user.save
            # user saved -> take an ID
            user_id = user.id
            # TO DO -> send welcome email w/ password
          end                                                 
      elsif session[:user_id]!=nil
        # user exists -> just take an ID from current session
        user_id = session[:user_id]
      end
      #----------------------------------------------

      # we have an ID of user, now we only have to update it in ad (a foreign key)
      @ad.update_attributes(:user_id => user_id)

      # images
      # we have to resize images and add them new names so this all is done here, after an ad is added
      #-----------------------------------------  
      if params[:ad_image]
        images_hash = Hash.new # this will be inserted into table in the end, it will be hash with new names
      
        #for each image from form 
        # we have 9 images in form, so this is a quick fix - an array with names from form
        form_images = Array.new
        form_images = ['image1', 'image2', 'image3', 'image4', 'image5', 'image6', 'image7', 'image8', 'image9']
        
        # now for each image sent through form, check if there is an image,
        # then if there is, upload, resize, change name, add new name to images_hash
        form_images.each do |z|
          img = params["ad_image"][z]
          #check if image was specified in form
          if img 
            # if there is an image, we upload it, ad new name and insert new name to images_hash
            # but first we should check if this is and image we want to upload...
            type = img.content_type
            if(type == 'image/jpeg' or type == 'image/jpg' or type == 'image/gif' or type == 'image/gif')
              upload(img)
              new_name = resize_image(img)
              images_hash[z] = new_name
              #for main image, we want to resize it for listing
              if img == params["ad_image"]["image1"]
                resize_image_for_listing(new_name)
              end
            end
          end
        end
      images_hash['ad_id'] = @ad.id # we have sent images in hash, now it's time to add id of ad
      @images = AdImage.new(images_hash)
      @images.save #save to AdImage table
      end
      #----images end----------------------------  
    else
      render 'new'
    end
  end
  
  def edit
    @ad = Ad.find(params[:id])

    # scenario: user didn't add a description in the first place
    # we need to add this line to show empty description field in form
    if @ad.ad_description == nil
      @ad.build_ad_description
    end
  end
  
  def update
    @ad = Ad.find(params[:id])
    
    if @ad.update_attributes(ad_params)
      # images
      # we updated data for add, it's time to deal with images
      #-----------------------------------------  
      if params[:ad_image]
        images_hash = Hash.new #this will be inserted/updated into table
      
        #for each image from form
        form_images = Array.new
        form_images = ['image1', 'image2', 'image3', 'image4', 'image5', 'image6', 'image7', 'image8', 'image9']
        
        form_images.each do |z|
          img = params["ad_image"][z]
          #check if image was specified in form
          if img 
            # if there is an image, we upload it, ad new name and insert new name to images_hash
            # but first we should check if this is and image we want to upload...
            type = img.content_type
            if(type == 'image/jpeg' or type == 'image/jpg' or type == 'image/gif' or type == 'image/gif')
              upload(img)
              new_name = resize_image(img)
              images_hash[z] = new_name
              if img == params["ad_image"]["image1"]
                resize_image_for_listing(new_name)
              end
            end
          end
        end
      
      # two options - user added images before (we do update)
      # or we need to insert new row beacause user didn't add images for the first time  
      @images = AdImage.find_by_ad_id(@ad.id)
        if @images
          @images.update_attributes(images_hash)        
        else
          images_hash['ad_id'] = @ad.id
          @images = AdImage.new(images_hash)
          @images.save 
        end 
      end
      #----images end----------------------------  
    
      redirect_to @ad
    else
      render 'edit'
    end
  end
  
  #destroy ad
  def destroy
    ad = Ad.find_by_id(params[:id])
    ad.destroy
    redirect_to root_path
  end

  #show page /o-stronie
  def about
  end

  private
  
  def ad_params
    params.require(:ad).permit(:title, :content, :brand_id, :type_id, :production_year, :price, :gearbox, :fuel, :doors, :exterior_type,
     :color, :km, :engine_size, :power, :phone, :email, :user_id, 
     :ad_description_attributes => [:id, :content, :ad_id],
     :ad_extra_attributes => [:id, :clima, :abs, :asr, :eds, :esp, :alu, :alarm, :diff, :gearbox_block, :central_lock, 
     :rain_ind, :electric_mirrors, :electric_windows, :hook, :immobilliser, :gas, :xenons, :heat_seats, :leather_seats, 
     :gps_nav, :fog_lights, :tempomat, :wheel_helper, :t4x4, :ad_id])
  end
  
  def upload(image)
    name =  image.original_filename
    directory = "public/data/img_temp" #images go to temp folder, after resize we put them in proper location
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(image.read) }
  end

  def resize_image(image)
    image = image.original_filename
    img = Magick::Image::read("public/data/img_temp/#{image}")[0]  
    img = img.resize_to_fill(680,510)
    # to random names, we add time in the start of file 
    time = Time.now.to_i
    new_name = "#{time}_#{image.downcase}"
    img.write("public/data/img_ads/#{new_name}")
    # create thumbnail
    img_small = img.resize_to_fill(70,40)
    img_small.write("public/data/img_ads_small/#{new_name}")
    return new_name
  end
  
  # here we create an image for listing (brands, models)
  def resize_image_for_listing(new_name)
    img = Magick::Image::read("public/data/img_ads/#{new_name}")[0]  
    img = img.resize_to_fill(330,210)
    img.write("public/data/img_listings/#{new_name}")
    return new_name  
  end
  
end
