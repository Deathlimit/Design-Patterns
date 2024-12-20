class File_strategy
    def self.read(file_path)
      raise NotImplementedError, 'Метод должен быть определён в подклассе'
    end
    def self.write(file_path, data)
      raise NotImplementedError, 'Метод должен быть определён в подклассе'
    end
  end