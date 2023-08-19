class Serializer
  def self.run(data)
    valid = if data.respond_to?(:count)
              data.count > 0
            else
              data.valid?
            end

    res = if valid
            { success: true, data: }
          else
            { success: false, messages: data.errors }
          end

    {
      json: res,
      status: (valid ? :created : :unprocessable_entity)
    }
  end
end
