def pages
  sitemap.resources
    .select { |resource|
      resource.template? \
      && resource.path != "index.html"
    }
end