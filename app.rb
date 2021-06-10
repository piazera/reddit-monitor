require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

__END__
@@ index
%html{lang: "en"}
  %head
    %meta{charset: "UTF-8"}
    %script{src: "https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"}
    %script{src: "https://cdn.jsdelivr.net/npm/vue-funnel-graph-js/dist/vue-funnel-graph.min.js"}

  %body
    #demo11
    %h1 reddit monitor
    %h3 {{sub_title | uppercase}}
    - $type = [ 'bolsonaro', 'lula', 'luiza maria trajano' ]