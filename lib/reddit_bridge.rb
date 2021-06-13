require "httparty"
require "json"

class RedditBridge
    def search(q, after = nil)
        query = {
            "q" => q,
            "limit" => "100"
        }
        headers = { 'User-Agent' => 'magrathea challenge bot' }
        response = HTTParty.get('http://www.reddit.com/search.json', :query => query, :headers => headers)
        results = JSON.parse(response.body)
        return [] if results == []
        output = results['data']['children'].map do |item|
            data = item['data']
            {
                "subreddit" => data['subreddit'],
                "author_fullname" => data['author_fullname'],
                "title" => data['title'],
                "subreddit_name_prefixed" => data['subreddit_name_prefixed'],
                "name" => data['name'],
                "subreddit_type" => data['subreddit_type'],
                "subreddit_id" => data['subreddit_id'],
                "id" => data['id'],
                "author" => data['author'],
                "num_comments" => data['num_comments'],
                "url" => data['url'],
                "subreddit_subscribers" => data['subreddit_subscribers'],
                "created_utc" => data['created_utc'],
                "num_crossposts" => data['num_crossposts'],
                "media" => data['media'],
                "is_video" => data['is_video']
            }
        end
				output
    end
end
