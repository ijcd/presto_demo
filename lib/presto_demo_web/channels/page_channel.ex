defmodule PrestoDemoWeb.PageChannel do
  use PrestoDemoWeb, :channel

  # TODO: turn these into a use macro that pulls this into the channel easily
  def join("page:lobby", payload, socket) do
    %{visitor_id: visitor_id} = socket.assigns

    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
