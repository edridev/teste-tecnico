class BaseInteractor
  include Interactor

  private

  def success_response(data, sts)
    status_code = sts == :ok ? 200 : 201
    {
      success: true,
      status: {
        code: status_code,
        description: Rack::Utils::HTTP_STATUS_CODES[status_code]
      },
      data:
    }
  end

  def invalidated_response(data)
    {
      success: false,
      status: {
        code: 422,
        description: Rack::Utils::HTTP_STATUS_CODES[422]
      },
      error: { messages: data.errors }
    }
  end

end
