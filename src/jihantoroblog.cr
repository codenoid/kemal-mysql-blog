require "./jihantoroblog/*"
require "kemal"
require "db"
require "mysql"

db = DB.open "mysql://root:ayam@localhost:3306/project_jb"
at_exit { db.close }

module Jihantoroblog
  get "/" do
    pop = ""
    db.query "select data,url from main_posts where wdyw='1' order by views desc" do |pp|
      pp.each do
        dm = pp.read(String)
        url = pp.read(String)
        pop += dm + "(`,`)" + url + ":`:"
      end
    end
    poppost = pop.split("(`,`)")
    fdata, fdate, furl = db.query_one "select data, date, url from main_posts where wdyw='1' order by rand()", as: {String, Time, String}
    fd = fdata.split("(`,`)")
    db.query "select data, date, url from main_posts where wdyw='1' order by id desc" do |post|
      posts = post
      render "src/views/home.ecr"
    end
  end
  get "/baca/:id" do |env|
    id = env.params.url["id"]
    data, date = db.query_one "select data, date from main_posts where wdyw='1' and url=? limit 1", id, as: {String, Time}
    if !data.nil?
      post = data.split("(`,`)")
      pop = ""
      db.query "select data,url from main_posts where wdyw='1' order by views desc" do |pp|
        pp.each do
          dm = pp.read(String)
          url = pp.read(String)
          pop += dm + "(`,`)" + url + ":`:"
        end
      end
      comments = ""
      db.query "select data,date,id from main_posts where wdyw='2' and url=? order by views desc", id do |comment|
        comment.each do
          dm = comment.read(String)
          date = comment.read(Time)
          aidi = comment.read(Int64)
          comments += dm + "(`,`)" + date.to_s + "(`,`)" + aidi.to_s + ":`:"
        end
      end
      render "src/views/read.ecr"
    end
  end
  post "/baca/:id" do |env|
    id = env.params.url["id"]
    post = {} of String => String
    env.params.body.each do |k, v|
      post[k] = HTML.escape(v)
    end
    # name, email, content
    if post["name"] && post["email"] && post["content"]
      data = post["name"] + "(`,`)" + post["content"] + "(`,`)" + post["email"]
      db.exec "insert into main_posts (wdyw,url,data) values ('2',?,?)", id, data
    end
    env.redirect "/baca/" + id
  end
  get "/kategori/:id" do |env|
    id = env.params.url["id"]
    pop = ""
    db.query "select data,url from main_posts where wdyw='1' order by views desc" do |pp|
      pp.each do
        dm = pp.read(String)
        url = pp.read(String)
        pop += dm + "(`,`)" + url + ":`:"
      end
    end
    db.query "select data, date, url from main_posts where wdyw='1' and cat=? order by id desc", id do |post|
      posts = post
      render "src/views/category.ecr"
    end
  end

  get "/tentang" do
    pop = ""
    db.query "select data,url from main_posts where wdyw='1' order by views desc" do |pp|
      pp.each do
        dm = pp.read(String)
        url = pp.read(String)
        pop += dm + "(`,`)" + url + ":`:"
      end
    end
    render "src/views/about.ecr"
  end

  get "/kontak" do
    pop = ""
    db.query "select data,url from main_posts where wdyw='1' order by views desc" do |pp|
      pp.each do
        dm = pp.read(String)
        url = pp.read(String)
        pop += dm + "(`,`)" + url + ":`:"
      end
    end
    render "src/views/contact.ecr"
  end

  post "/search" do |env|
    id = env.params.body["what"]
    pop = ""
    db.query "select data,url from main_posts where wdyw='1' order by views desc" do |pp|
      pp.each do
        dm = pp.read(String)
        url = pp.read(String)
        pop += dm + "(`,`)" + url + ":`:"
      end
    end
    db.query "select data, date, url from main_posts where wdyw='1' and url like '%" + HTML.escape(id) + "%' order by id desc" do |post|
      posts = post
      render "src/views/search.ecr"
    end
  end
end

Kemal.config.env = "production"
Kemal.config.port = 3000
Kemal.run
