module CurrentCategory

  class Generator < Jekyll::Generator
    safe true
    priority :low  # we want do this after all pages have been generated

    def generate(site)
      for page in site.pages
        if not page.data.key? 'current_category'
          cats = page.data['category'] || page.data['categories']
          if cats.kind_of?(Array)
            page.data['current_category'] = cats[0]
          elsif cats != ''
            page.data['current_category'] = cats
          else
            page.data['current_category'] = site.data['standard_category']
          end
        end
      end

      for post in site.posts.docs
        if not post.data.key? 'current_category'
          cats = post.data['category'] || post.data['categories']
          if cats.kind_of?(Array)
            post.data['current_category'] = cats[0]
          elsif cats != ''
            post.data['current_category'] = cats
          else
            post.data['current_category'] = site.data['standard_category']
          end
        end
      end
    end
  end

end
