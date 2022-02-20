defmodule WebsockexDemoWeb.SfoxDataLive do
  use WebsockexDemoWeb, :live_view
  alias WebsockexDemo.Sfox

  def mount(_params, _session, socket) do
    if connected?(socket), do: Sfox.subscribe()
    socket = assign(socket, :coins, [])
    {:ok, socket}
  end

  def render(assigns) do
    ~L'''
      <h1 class="text-red-500 text-5xl font-bold text-center">Sfox Live</h1>
      <div class="flex flex-col">
        <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
          <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
            <div class="overflow-hidden">
              <table class="min-w-full">
                <thead class="bg-white border-b">
                  <tr>
                    <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                      #
                    </th>
                    <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                      Exchange
                    </th>
                    <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                      High
                    </th>
                    <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                      Last
                    </th>
                    <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                      Low
                    </th>
                    <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                      Volume
                    </th>
                    <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                      Amount
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <%= @coins |> Enum.with_index |> Enum.map(fn({coin, index}) ->  %>
                    <tr class="<%= if rem(index, 2) == 0 do "bg-gray-100" else "bg-white" end %> border-b">
                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                      <%= index+1 %>
                      </td>
                      <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                        <%= coin["payload"]["exchange"] %>
                      </td>
                      <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                        <%= coin["payload"]["high"] %>
                      </td>
                      <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                        <%= coin["payload"]["last"] %>
                      </td>
                      <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                        <%= coin["payload"]["low"] %>
                      </td>
                      <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                        <%= coin["payload"]["volume"] %>
                      </td>
                      <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                        <%= coin["payload"]["amount"] %>
                      </td>
                    </tr>
                  <% end) %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    '''
  end

  def handle_info({:fetched_crypto, coin}, socket) do
    socket = update(socket, :coins, fn coins -> [coin | coins] end)
    {:noreply, socket}
  end

end
