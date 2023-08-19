class Domain::Response
  include Interactor

  def call
    context.parent ||= context.data
    context.body = if context.parent.valid?
                     { success: true,
                       data: context.data }
                   else
                     { success: false, messages: context.parent.errors }
                   end
    context.fail! if context.parent.valid?
  end
end
