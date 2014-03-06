class MetricsController < ApplicationController
  def host
  end

  def metrics_by_uuid
    uuid = params[:uuid]
    mongo_host = APP_CONFIG['mongodb_host']
    mongo_port = APP_CONFIG['mongodb_port']
    mongo_db = APP_CONFIG['mongodb_db']
    connection = Mongo::Connection.new(mongo_host,mongo_port)
    db = connection.db(mongo_db)
    stats = db.collection(uuid).find().to_a
    render :json => stats.to_json
  end
end
