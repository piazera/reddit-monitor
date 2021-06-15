require 'sinatra'
require 'haml'
require 'json'
require 'rufus-scheduler'
require './lib/reddit_synthesizer.rb'

scheduler = Rufus::Scheduler.new
data_store = MemoryDataStore.new
synthesizer = RedditSynthesizer.new(data_store)

scheduler.every '10s' do
  synthesizer.process
end

get '/' do
  redirect to('/ui/html/index.html')
end

get '/data' do
  { :last_updated => data_store.last_totals_created, :totals => data_store.last_totals }.to_json
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