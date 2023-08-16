class BaseInteractor
  include Interactor

  private

  def build_response(data)
    if data.respond_to? :count
      { success: true, data: }
    else
      data.valid? ? { success: true, data: } : { success: false, error: { messages: data.errors } }
    end
  end
end
