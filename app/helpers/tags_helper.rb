module TagsHelper
  def tag_cloud(tags, classes)
    max, min = 0, 0
    tags.each do |tag|
      count = tag.count.to_i
      max = count if count > max
      min = count if count < min
    end

    divisor = ((max - min) / classes.size) + 1

    tags.each do |tag|
      yield tag, classes[(tag.count.to_i - min) / divisor]
    end
  end
end
