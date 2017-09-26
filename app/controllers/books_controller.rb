class BooksController < ApplicationController
  KINDLE_UMLIMITED_BROWSE_NODE_ID = 4486610051

  def search
    if params[:keyword].present?
      #　デバックログ出力するために記述
      Amazon::Ecs.debug = true

      # Amazon::Ecs::Responceオブジェクトの取得
      books = Amazon::Ecs.item_search(
        params[:keyword],
        search_index:  'KindleStore',
        browse_node:  KINDLE_UMLIMITED_BROWSE_NODE_ID,
        response_group: 'ItemAttributes, Images, SalesRank, Small',
        country:  'jp',
        item_page: '1'
      )

      # ページ数取得
      total_pages = books.total_pages

      # 本のタイトル,画像URL, 詳細ページURLの取得
      @books = []
      books.items.each do |item|
        book = Book.new(
          item.get('ItemAttributes/Title'),
          item.get('LargeImage/URL'),
          item.get('DetailPageURL'),
          item.get('ItemAttributes/Author'),
          item.get('ItemAttributes/PublicationDate'),
          item.get('SalesRank')
        )
        @books << book
      end

      # 2.upto(5) do |page|
      #   # Amazon::Ecs::Responceオブジェクトの取得
      #   books = Amazon::Ecs.item_search(
      #     params[:keyword],
      #     search_index:  'KindleStore',
      #     browse_node:  KINDLE_UMLIMITED_BROWSE_NODE_ID,
      #     response_group: 'ItemAttributes, Images, SalesRank, Small',
      #     country:  'jp',
      #     item_page: page
      #   )
      #
      #   books.items.each do |item|
      #     book = Book.new(
      #       item.get('ItemAttributes/Title'),
      #       item.get('LargeImage/URL'),
      #       item.get('DetailPageURL'),
      #       item.get('ItemAttributes/Author'),
      #       item.get('ItemAttributes/PublicationDate'),
      #       item.get('SalesRank')
      #     )
      #     @books << book
      #   end
      # end
    end
  end
end
