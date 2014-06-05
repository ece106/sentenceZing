json.array!(@microposts) do |micropost|
  json.extract! micropost, :STORY, :sent1, :sent2, :sent3, :sent4, :sent5, :sent6, :sent7, :sent8, :sent9, :sent10, :sent11, :sent12
  json.url micropost_url(micropost, format: :json)
end