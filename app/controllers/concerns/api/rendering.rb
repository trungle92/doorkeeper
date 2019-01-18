module API::Rendering
  extend ActiveSupport::Concern

  def render_success(options = {}, data = nil)
    render_response(options: options, defaults: APIStatus::SUCCESS, data: data)
  end

  def render_success_without_template(options = {})
    render_success(options, {})
  end

  def render_failure(options = {}, data = nil)
    render_response(options: options, defaults: APIStatus::FAILURE, data: data)
  end

  def render_failure_without_template(options = {})
    render_failure(options, {})
  end

  def render_response(opts = {})
    data = opts[:data]
    defaults = opts[:defaults] || {}
    options = opts[:options] || {}
    template = options[:template] || "#{controller_path}/#{action_name}"
    @status = options[:status] || defaults[:status]
    @status_code = options[:status_code] || defaults[:status_code]
    @message = options[:message]
    @key_message = options[:key_message]
    if @message.present? && @message.is_a?(String) && @key_message.blank?
      @key_message = @message.downcase.gsub(/\s/,'_').gsub(/[^a-z0-9_]/,'')
    end

    if data.nil?
      render template: template
    else
      render plain: data.to_json, layout: 'api/layouts/base.json', content_type: :json
    end
  end
end
