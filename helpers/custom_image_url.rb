def custom_image_url(path)

  if environment == :build
    @images_path + path
  else
    asset_path :images, path
  end

end

def image_width(path)
  
  if !path.include? '://'
    path = 'source/__assets/images/' + path
  end
  
  sizes = FastImage.size(path)
  
  if sizes
    sizes.first
  else
    0
  end
end