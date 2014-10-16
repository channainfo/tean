module ApplicationHelper
  def page_title(title)
    content_for(:title) { ENV['APP_NAME'] + " - " + title }
  end

  def page_meta_tags(options={})
    content_for(:meta_tag) do

      meta_tag  = tag(:meta, name: 'description', content: options[:description])
      meta_tag += tag(:meta, name: 'keywords', content: options[:keyword]) 
      #open graph
      meta_tag += tag(:meta, property: 'og:type', content: 'article')
      meta_tag += tag(:meta, property: 'og:title', content: options[:title]) 
      meta_tag += tag(:meta, property: 'og:image', content: image_url(options[:image]))
      meta_tag += tag(:meta, property: 'og:description', content: options[:description])
      meta_tag += tag(:meta, property: 'og:url', content: options[:url])

      #twitter
      meta_tag += tag(:meta, name: 'twitter:card', content: 'summary')
      meta_tag += tag(:meta, name: 'twitter:title', content: options[:title])
      meta_tag += tag(:meta, name: 'twitter:description', content: options[:description])
      meta_tag += tag(:meta, name: 'twitter:image', content: image_url(options[:image]))

      meta_tag
    end

  end

  def page_header(text)
    content_tag 'h1' , text , class: 'content-title'
  end

  def nav_item(title, url, current_item)
    content_tag 'li', class: ('active' if params[:action] == current_item) do
      link_to title, url
    end
  end

  def profile_image(url)
    image_tag(url, class: 'profile-photo', width: 24, height: 24)
  end

  def post_photo(url)
    image_tag(url, class: 'post-photo', width: 640, height: 640)
  end

  def flash_messages
    trans = { 'alert' => 'alert-danger', 'notice' => 'alert alert-success' }
    flash.map do |key, value|
      content_tag 'div', value, class: "alert #{trans[key]}"
    end.join('.').html_safe
  end

  def json_for(target, options = {})
    options[:root]          = false
    options[:scope]       ||= current_user
    options[:url_options] ||= url_options
    target.active_model_serializer.new(target, options).to_json
  end
end
