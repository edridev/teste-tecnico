class BaseInteractor
  include Interactor

  private

  def build_response(data)
    data.valid? ? { success: true, data: } : { success: false, messages: data.errors }
  end
end
