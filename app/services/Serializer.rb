class Serializer

  def self.run(data)

    res = if data.valid?
      { success: true, data: }
    else
      { success: false, messages: data.errors }
    end

    {
      json: res, 
      status: (data.valid? ? :created : :unprocessable_entity)
    }
  end

end
