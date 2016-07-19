module Jekyll
  module Maps
    class GoogleMapApi
      HEAD_END_TAG = %r!</.*head.*>!

      class << self
        def prepend_api_code(doc)
          if doc.output =~ HEAD_END_TAG
            # Insert API code before header's end if this document has one.
            doc.output.gsub!(HEAD_END_TAG, %(#{api_code}#{Regexp.last_match}))
          else
            doc.output.prepend(api_code)
          end
        end

        private
        def api_code
          <<HTML
<script type='text/javascript'>
  #{js_lib_contents}
</script>
<script async defer src='https://maps.googleapis.com/maps/api/js?callback=jekyllMaps.initializeMap'></script>
<script async defer src='https://cdn.rawgit.com/googlemaps/js-marker-clusterer/gh-pages/src/markerclusterer.js'
        onload='jekyllMaps.initializeCluster()'></script>
HTML
        end

        private
        def js_lib_contents
          @js_lib_contents ||= begin
            File.read(js_lib_path)
          end
        end

        private
        def js_lib_path
          @js_lib_path ||= begin
            File.expand_path("./google_map_api.js", File.dirname(__FILE__))
          end
        end
      end
    end
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  if doc.output =~ %r!#{Jekyll::Maps::GoogleMapTag::JS_LIB_NAME}!
    Jekyll::Maps::GoogleMapApi.prepend_api_code(doc)
  end
end
