def custom_image_url(path)

  if environment == :build
    @images_path + path
  else
    asset_path :images, path
  end

end