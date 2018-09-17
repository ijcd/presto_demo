defmodule PrestoDemoWeb.LayoutView do
  use PrestoDemoWeb, :view

  use Taggart.HTML
  use UIKit

  def render("nested.html", assigns) do
    uk_container(:center) do
      Phoenix.View.render(assigns[:view_module], assigns[:view_template], assigns)
    end
  end
end
