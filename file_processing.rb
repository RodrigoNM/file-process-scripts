module FileProcessing
  def process_file_data(file_path)
    line = File.open(file_path, 'r') do |file|
      file.each_line do |line|
        # p line.split
        line_hash = line_to_hash line
        updated_smallest_difference line_hash
      end
    end
  end

  def remove_special_characters(value)
    return '' unless value

    value.gsub(/[^\d.]/, '')
  end

  private

  def updated_smallest_difference(line_hash)
    raise NotImplementedError, 'Including class must implement this method'
  end
end

