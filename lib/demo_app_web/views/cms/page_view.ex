defmodule DemoAppWeb.CMS.PageView do
  use DemoAppWeb, :view

  def author_name(%DemoApp.CMS.Page{author: author}) do
      author.user.name
  end
end
