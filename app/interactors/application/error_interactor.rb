class Application::ErrorInteractor
  include Interactor

  def call
    context.error = {
      success: false,
      status: {
        code: 500,
        description: Rack::Utils::HTTP_STATUS_CODES[500]
      },
      error: { messages: context.param }
    }
    context.fail!
  end
end
