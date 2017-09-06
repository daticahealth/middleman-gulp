activate :directory_indexes

set :relative_links, true
set :haml, { format: :html5 }

# Disable Haml warnings
Haml::TempleEngine.disable_option_validator!

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false
page "/404.html", directory_index: false

set :css_dir, "assets/stylesheets"
set :images_dir, "assets/images"
set :js_dir, "assets/javascripts"

configure :build do
  activate :external_pipeline,
    name: :gulp,
    command: "npm run production",
    source: ".tmp",
    latency: 1

  ignore "assets/javascripts/all.js"
  ignore "assets/stylesheets/site"

  activate :gzip

  activate :minify_html do |html|
    html.remove_quotes = false
    html.remove_intertag_spaces = true
  end
end

# Contentful configuration
activate :contentful do |f|
    f.space = { site: "189dvqdsjh46"}
    f.access_token = "9abdf5de79abc1e1cdc2cf25f3280641fd845a2f3fd5bad8222d1b457f20ba2d"
    # f.use_preview_api = false
    # f.all_entries = true
    # f.all_entries_page_size = 10
    f.content_types = {
        # academy: "academy",
        # blog: "blog",
        # cta: "cta",
        # caseStudy: "caseStudy",
        # customers: "customers",
        # discover: "discover",
        # guides: "guides",
        # leadershipGallery: "leadershipGallery",
        # person: "person",
        # podcastEntry: "podcastEntry",
        # pressReleases: "pressReleases",
        # products: "products",
        # spotlights: "spotlights",
        # quotes: "quotes",
        # tags: "tags",
        whitepapers: "whitepapers"
    }
end
