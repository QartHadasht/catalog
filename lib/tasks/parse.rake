namespace :parse do
  desc "parse new cats"
  "task :cats => :environment do
    require 'nokogiri'
    require 'open-uri'
    url = 'http://oldclever.ru/'
    doc = Nokogiri::HTML(open(url))
    pid = {0 => 0}
    doc.css('.leftbar .content > div:eq(3) div').each do |div|
      arr = {}
      a = div.css('a')
      arr[:fold] = div.attr('class').gsub(/cat/,'').to_i - 1
      arr[:name] = a.text
      arr[:oid] = a.attr('href').value.gsub(/(c1_)|(\.php)/,'').to_i
      arr[:cat_id] = pid[arr[:fold]]
      if arr[:oid] != 0
        nw = Cat.new(arr)
        nw.save
        pid[(arr[:fold].to_i+1)] = nw.id
      end
    end 

  end
  "


  desc "parse goods"
  task :goods => :environment do
    require 'nokogiri'
    require 'open-uri'
    baseurl = 'http://oldclever.ru/'
    cats = Cat.all.order("fold desc")
    cats.each do |cat|
      url = baseurl + 'c1_' + ('0'*(4-cat.oid.to_s.length)) + cat.oid.to_s + '.php'
      puts url
      doc = Nokogiri::HTML(open(url))
      doc.css('.cat5').each do |one|
        begin
          pic = one.css('.highslide').attr('href').value 
        rescue Exception => e
          puts e
          next
        end
        picurl = baseurl + pic
        arr = {}
        arr[:cat_id] = cat.id
        arr[:oid] = pic.gsub /(pics\/1_)|(.jpg)/, ''
        arr[:name] = one.css('b div b').first.text
        arr[:description] = one.css('.op-main').text
        arr[:art] = one.css('b:eq(2)').text
        arr[:price] = one.css('b font b').text.to_i
        if !Tovar.where(:oid => arr[:oid]).present?
          tovar = Tovar.new(arr)
          tovar.save
          Pic.create({:tovar_id => tovar.id, :image => URI.parse(picurl)})
          #puts arr
        end
      end
    end
  end
end

