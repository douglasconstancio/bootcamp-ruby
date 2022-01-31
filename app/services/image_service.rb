module ImageService
  class << self
    def create(image_params)
      image = Image.new(image_params)

      return false unless image.save

      process_colorama(image.id)

      true
    end

    def update(image_params)
      id = image_params[:id]

      return false unless Image.update(id, image_params)

      process_colorama(id)

      true
    end

    private

    def process_colorama(image_id)
      ImageProcessWorker.perform_async(image_id)
    end
  end
end
