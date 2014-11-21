def pages
  sitemap.resources
    .select { |resource|
      resource && resource.data && resource.data.name
    }
    .sort_by { |resource|
      resource.data.name
    }
end