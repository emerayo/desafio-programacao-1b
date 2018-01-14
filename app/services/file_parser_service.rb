class FileParserService
  def self.call(file, header = false, divisor = "\t")
    lines = []
    File.open(file).each do |line|
      lines << line.delete("\n").split(divisor)
    end

    header ? lines : lines[1..lines.size]
  end
end
