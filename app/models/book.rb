class Book
  # プロパティの設定
  attr_accessor :title, :image_url, :url, :author, :date, :sales_rank, :total_results, :total_pages

  def initialize(title, image_url, url, author, date, sales_rank)
    @title = title
    @image_url = image_url
    @url = url
    @author = author
    @date = date
    @sales_rank = sales_rank
  end
end
