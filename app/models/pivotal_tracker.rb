class PivotalTracker
  def initialize
    @conn = Faraday.new(:url => 'https://www.pivotaltracker.com')
  end

  def projects(token)
    response = @conn.get do |req|
      req.url "/services/v5/projects"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def stories(token, project)
    response = @conn.get do |req|
      req.url "/services/v5/project/#{project.id}/stories"
      req.headers['Content-Type'] = 'application/json'
      req.headers['X-TrackerToken'] = token
    end
      JSON.parse(response.body, symbolize_names: true)
  end
end
